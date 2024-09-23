@implementation EKUIListViewAllDayEventCell

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewAllDayEventCell;
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
  v5.super_class = (Class)EKUIListViewAllDayEventCell;
  v2 = -[EKUIListViewCell initForDragPreview](&v5, sel_initForDragPreview);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_commonInit");
  return v3;
}

- (EKUIListViewAllDayEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIListViewAllDayEventCell *v4;
  EKUIListViewAllDayEventCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewAllDayEventCell;
  v4 = -[EKUIListViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[EKUIListViewAllDayEventCell _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  void *v3;
  EKUIListViewCellBackground *v4;
  EKUIListViewCellBackground *backgroundView;
  void *v6;
  UILabel *v7;
  UILabel *dateField;
  UILabel *v9;
  void *v10;
  double v11;
  void *v12;
  UIImageView *v13;
  UIImageView *imageView;
  double v15;
  double v16;
  void *v17;
  UILabel *v18;
  UILabel *titleField;
  double v20;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  double v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *titleLeadingConstraint;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  void *v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  double v45;
  void *v46;
  NSLayoutConstraint *v47;
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
  _QWORD v84[14];

  v84[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__adjustNumberOfLines, *MEMORY[0x1E0DC48E8], 0);

  v4 = -[EKUIListViewCellBackground initWithCornerRadius:]([EKUIListViewCellBackground alloc], "initWithCornerRadius:", 0.0);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  -[EKUIListViewCellBackground setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_backgroundView);

  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  dateField = self->_dateField;
  self->_dateField = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_dateField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = self->_dateField;
  -[EKUIListViewAllDayEventCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v9, "setFont:", v10);

  LODWORD(v11) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_dateField, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_dateField);

  v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  imageView = self->_imageView;
  self->_imageView = v13;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v15) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  LODWORD(v16) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_imageView);

  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleField = self->_titleField;
  self->_titleField = v18;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v20) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleField, "setContentCompressionResistancePriority:forAxis:", 1, v20);
  v21 = self->_titleField;
  -[EKUIListViewAllDayEventCell _titleFont](self, "_titleFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v21, "setFont:", v22);

  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_titleField);

  -[UILabel leadingAnchor](self->_titleField, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[EKUIListViewCell carplayMode](self, "carplayMode");
  v27 = 4.5;
  if (v26)
    v27 = 3.5;
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, v27);
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLeadingConstraint = self->_titleLeadingConstraint;
  self->_titleLeadingConstraint = v28;

  v71 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIListViewCellBackground leadingAnchor](self->_backgroundView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v30;
  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v31 = objc_claimAutoreleasedReturnValue();
  v81 = (void *)v31;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v32 = 0.0;
  else
    v32 = 12.0;
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v32);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v80;
  -[EKUIListViewCellBackground trailingAnchor](self->_backgroundView, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v33;
  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v34 = objc_claimAutoreleasedReturnValue();
  v77 = (void *)v34;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v35 = 0.0;
  else
    v35 = 12.0;
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, -v35);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v76;
  -[EKUIListViewCellBackground topAnchor](self->_backgroundView, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v36;
  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topAnchor");
  v37 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v37;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v38 = 0.0;
  else
    v38 = 4.0;
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v38);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v72;
  -[EKUIListViewCellBackground bottomAnchor](self->_backgroundView, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v39;
  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v40 = objc_claimAutoreleasedReturnValue();
  v68 = (void *)v40;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v41 = 0.0;
  else
    v41 = 4.0;
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -v41);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v67;
  -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](self->_titleField, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v64;
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground leadingAnchor](self->_backgroundView, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 6.5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v61;
  -[UILabel topAnchor](self->_titleField, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground topAnchor](self->_backgroundView, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 8.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v84[6] = v58;
  -[UILabel bottomAnchor](self->_titleField, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground bottomAnchor](self->_backgroundView, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, -8.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v84[7] = v55;
  -[UILabel trailingAnchor](self->_titleField, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_dateField, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[EKUIListViewCell carplayMode](self, "carplayMode");
  v45 = 6.0;
  if (v44)
    v45 = 5.0;
  objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:constant:", v43, -v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = self->_titleLeadingConstraint;
  v84[8] = v46;
  v84[9] = v47;
  -[UILabel firstBaselineAnchor](self->_dateField, "firstBaselineAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_titleField, "firstBaselineAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v84[10] = v50;
  -[UILabel trailingAnchor](self->_dateField, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground trailingAnchor](self->_backgroundView, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -8.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v84[11] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 12);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "activateConstraints:", v54);

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKUIListViewAllDayEventCell;
  -[EKUITableViewCell layoutSubviews](&v9, sel_layoutSubviews);
  -[EKUIListViewAllDayEventCell layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    v6 = -[EKUIListViewCell carplayMode](self, "carplayMode");

    if (!v6)
      return;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    -[EKUIListViewAllDayEventCell layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v3, "setFrame:");

    -[EKUIListViewAllDayEventCell layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMask:", v3);
  }

}

- (void)_adjustNumberOfLines
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *titleLeadingConstraint;

  -[EKUIListViewAllDayEventCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = EKUIUsesLargeTextLayout(v4);

  -[UIImageView setHidden:](self->_imageView, "setHidden:", v5);
  -[UILabel setNumberOfLines:](self->_dateField, "setNumberOfLines:", v5 ^ 1);
  -[UILabel setNumberOfLines:](self->_titleField, "setNumberOfLines:", v5 ^ 1);
  -[NSLayoutConstraint setActive:](self->_titleLeadingConstraint, "setActive:", 0);
  -[UILabel leadingAnchor](self->_titleField, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EKUIListViewCell carplayMode](self, "carplayMode");
    v8 = 4.5;
    if (v9)
      v8 = 3.5;
  }
  else
  {
    -[EKUIListViewCellBackground leadingAnchor](self->_backgroundView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 8.0;
  }
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, v8);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLeadingConstraint = self->_titleLeadingConstraint;
  self->_titleLeadingConstraint = v10;

  -[NSLayoutConstraint setActive:](self->_titleLeadingConstraint, "setActive:", 1);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewAllDayEventCell;
  -[EKUIListViewAllDayEventCell setHighlighted:animated:](&v5, sel_setHighlighted_animated_, a3, a4);
  -[EKUIListViewAllDayEventCell _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
  -[EKUIListViewAllDayEventCell _updateColors](self, "_updateColors");
}

- (void)updateWithEvent:(id)a3 dimmed:(BOOL)a4
{
  id v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKUIListViewAllDayEventCell setEvent:](self, "setEvent:", v6);
  -[EKUIListViewAllDayEventCell _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
  if (v6)
  {
    self->_dimmed = a4;
    if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
      -[EKUIListViewAllDayEventCell setSelectionStyle:](self, "setSelectionStyle:", 0);
    v7 = objc_msgSend(v6, "status");
    v8 = CUIKEventDisplaysAsDeclined();
    if (v7 == 3)
      v9 = 1;
    else
      v9 = v8;
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    CUIKDisplayedTitleForEvent();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DC11A8];
    v35 = *MEMORY[0x1E0DC11A8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v14);
    -[UILabel setAttributedText:](self->_titleField, "setAttributedText:", v15);

    v16 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v6, "CUIK_symbolName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemImageNamed:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v18);

    if (-[EKUIListViewCell dragPreview](self, "dragPreview"))
    {
      v19 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v19, "setDateStyle:", 1);
      -[EKUIListViewAllDayEventCell event](self, "event");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTimeStyle:", objc_msgSend(v20, "isAllDay") ^ 1);

      -[EKUIListViewAllDayEventCell event](self, "event");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_alloc(MEMORY[0x1E0CB3498]);
      v33 = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v25;
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v34;
      v28 = &v33;
    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3498]);
      EventKitUIBundle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("all-day"), &stru_1E601DFA8, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v25;
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v32;
      v28 = &v31;
    }
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v24, "initWithString:attributes:", v23, v29);
    -[UILabel setAttributedText:](self->_dateField, "setAttributedText:", v30);

    -[EKUIListViewAllDayEventCell _updateColors](self, "_updateColors");
  }

}

- (void)_updateColors
{
  void *v3;
  _QWORD v4[5];

  -[EKUIListViewAllDayEventCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__EKUIListViewAllDayEventCell__updateColors__block_invoke;
  v4[3] = &unk_1E6018688;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

void __44__EKUIListViewAllDayEventCell__updateColors__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
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
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1128))
  {
    objc_msgSend(v6, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E0D0CA68]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationWithPaletteColors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(*(id *)(a1 + 32), "_titleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pointSize");
  objc_msgSend(v12, "configurationWithPointSize:weight:scale:", 4, 2, v14 + 3.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationByApplyingConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setPreferredSymbolConfiguration:", v16);

  objc_msgSend(*(id *)(a1 + 32), "_updateTextAndIconColors");
  v17 = *(_QWORD **)(a1 + 32);
  v18 = (void *)v17[138];
  objc_msgSend(v17, "event");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateBackgroundColorForEvent:highlighted:dimmed:carplayMode:dragPreview:", v19, objc_msgSend(*(id *)(a1 + 32), "isHighlighted"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1128), objc_msgSend(*(id *)(a1 + 32), "carplayMode"), objc_msgSend(*(id *)(a1 + 32), "dragPreview"));

}

- (int64_t)_userInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[EKUIListViewAllDayEventCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
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
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  if (-[EKUIListViewCell carplayMode](self, "carplayMode")
    && -[EKUIListViewAllDayEventCell isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKUIListViewAllDayEventCell event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "status");

    -[EKUIListViewAllDayEventCell event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CUIKEventDisplaysAsDeclined();

    if (v5 == 3 || v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[EKUIListViewCell dragPreview](self, "dragPreview"))
      {
        -[EKUIListViewAllDayEventCell _userInterfaceStyle](self, "_userInterfaceStyle");
        -[EKUIListViewAllDayEventCell event](self, "event");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "calendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CUIKTextColorForCalendarColorForStyle();
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v11 = v13;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = (void *)v3;
LABEL_11:
  if (self->_dimmed)
  {
    v14 = v11;
    objc_msgSend(v11, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E0D0CA68]);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v15 = v11;
  -[UILabel setTextColor:](self->_titleField, "setTextColor:", v11);
  -[UILabel setTextColor:](self->_dateField, "setTextColor:", v15);

}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
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
  -[EKUIListViewAllDayEventCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:](EKUIConstrainedFontUtilities, "constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateAppEntityAnnotationIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (CalendarLinkLibraryCore())
  {
    -[EKUIListViewAllDayEventCell event](self, "event");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isNew"))
    {

    }
    else
    {
      -[EKUIListViewAllDayEventCell event](self, "event");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isBirthday");

      if ((v4 & 1) == 0)
      {
        -[EKUIListViewAllDayEventCell event](self, "event");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIListViewAllDayEventCell Cal_annotateWithEvent:](self, "Cal_annotateWithEvent:", v5);

        -[EKUIListViewAllDayEventCell Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:](self, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", -[EKUIListViewAllDayEventCell isSelected](self, "isSelected"), -[EKUIListViewAllDayEventCell isHighlighted](self, "isHighlighted"), 0, 0, 0, 0);
      }
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewAllDayEventCell;
  -[EKUIListViewAllDayEventCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[EKUIListViewAllDayEventCell _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  CGRect v5;

  v5 = CGRectInset(a3, 12.0, 4.0);
  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height, CGRectGetHeight(v5) * 0.5);
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
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_dateField, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleField, 0);
}

@end

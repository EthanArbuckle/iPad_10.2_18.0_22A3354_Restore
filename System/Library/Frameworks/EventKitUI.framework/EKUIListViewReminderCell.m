@implementation EKUIListViewReminderCell

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewReminderCell;
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
  v5.super_class = (Class)EKUIListViewReminderCell;
  v2 = -[EKUIListViewCell initForDragPreview](&v5, sel_initForDragPreview);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_commonInit");
  return v3;
}

- (EKUIListViewReminderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIListViewReminderCell *v4;
  EKUIListViewReminderCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewReminderCell;
  v4 = -[EKUIListViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[EKUIListViewReminderCell _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  void *v3;
  EKUIViewWithCornerRadius *v4;
  EKUIViewWithCornerRadius *backgroundView;
  void *v6;
  UILabel *v7;
  UILabel *timeField;
  double v9;
  void *v10;
  UIImageView *v11;
  UIImageView *circleIcon;
  double v13;
  double v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *titleField;
  double v19;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  uint64_t v36;
  _BOOL4 v37;
  double v38;
  void *v39;
  uint64_t v40;
  _BOOL4 v41;
  double v42;
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
  _QWORD v85[14];

  v85[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__adjustNumberOfLines, *MEMORY[0x1E0DC48E8], 0);

  v4 = objc_alloc_init(EKUIViewWithCornerRadius);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  -[EKUIViewWithCornerRadius setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKUIListViewReminderCell _updateBackgroundColor](self, "_updateBackgroundColor");
  -[EKUIListViewReminderCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_backgroundView);

  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  timeField = self->_timeField;
  self->_timeField = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timeField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_timeField, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  -[EKUIListViewReminderCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_timeField);

  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  circleIcon = self->_circleIcon;
  self->_circleIcon = v11;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_circleIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_circleIcon, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_circleIcon, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  -[EKUIListViewReminderCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_circleIcon);

  if (!-[EKUIListViewCell carplayMode](self, "carplayMode"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__circleButtonPressed);
    -[UIImageView setUserInteractionEnabled:](self->_circleIcon, "setUserInteractionEnabled:", 1);
    -[UIImageView addGestureRecognizer:](self->_circleIcon, "addGestureRecognizer:", v16);

  }
  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleField = self->_titleField;
  self->_titleField = v17;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v19) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleField, "setContentCompressionResistancePriority:forAxis:", 1, v19);
  v20 = self->_titleField;
  -[EKUIListViewReminderCell _titleFont](self, "_titleFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v20, "setFont:", v21);

  -[EKUIListViewReminderCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", self->_titleField);

  v71 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIViewWithCornerRadius leadingAnchor](self->_backgroundView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v23;
  -[EKUIListViewReminderCell contentView](self, "contentView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v24 = objc_claimAutoreleasedReturnValue();
  v82 = (void *)v24;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v25 = 0.0;
  else
    v25 = 12.0;
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, v25);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v81;
  -[EKUIViewWithCornerRadius trailingAnchor](self->_backgroundView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v26;
  -[EKUIListViewReminderCell contentView](self, "contentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v27 = objc_claimAutoreleasedReturnValue();
  v78 = (void *)v27;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v28 = 0.0;
  else
    v28 = 12.0;
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -v28);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v77;
  -[EKUIViewWithCornerRadius topAnchor](self->_backgroundView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v29;
  -[EKUIListViewReminderCell contentView](self, "contentView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v30 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v30;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v31 = 0.0;
  else
    v31 = 4.0;
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, v31);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v73;
  -[EKUIViewWithCornerRadius bottomAnchor](self->_backgroundView, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v32;
  -[EKUIListViewReminderCell contentView](self, "contentView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "bottomAnchor");
  v33 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v33;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v34 = 0.0;
  else
    v34 = 4.0;
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -v34);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v68;
  -[UIImageView centerYAnchor](self->_circleIcon, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](self->_titleField, "centerYAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v65;
  -[UIImageView leadingAnchor](self->_circleIcon, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIViewWithCornerRadius leadingAnchor](self->_backgroundView, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 6.5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v62;
  -[UILabel topAnchor](self->_titleField, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIViewWithCornerRadius topAnchor](self->_backgroundView, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, 8.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v59;
  -[UILabel leadingAnchor](self->_titleField, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v35;
  -[UIImageView trailingAnchor](self->_circleIcon, "trailingAnchor");
  v36 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v36;
  v37 = -[EKUIListViewCell carplayMode](self, "carplayMode");
  v38 = 4.5;
  if (v37)
    v38 = 3.5;
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v38);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v56;
  -[UILabel trailingAnchor](self->_titleField, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v39;
  -[UILabel leadingAnchor](self->_timeField, "leadingAnchor");
  v40 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v40;
  v41 = -[EKUIListViewCell carplayMode](self, "carplayMode");
  v42 = 6.0;
  if (v41)
    v42 = 5.0;
  objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:constant:", v40, -v42);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v85[8] = v53;
  -[UILabel bottomAnchor](self->_titleField, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIViewWithCornerRadius bottomAnchor](self->_backgroundView, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -8.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v85[9] = v45;
  -[UILabel firstBaselineAnchor](self->_timeField, "firstBaselineAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_titleField, "firstBaselineAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v85[10] = v48;
  -[UILabel trailingAnchor](self->_timeField, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIViewWithCornerRadius trailingAnchor](self->_backgroundView, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -8.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v85[11] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 12);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "activateConstraints:", v52);

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
  v9.super_class = (Class)EKUIListViewReminderCell;
  -[EKUITableViewCell layoutSubviews](&v9, sel_layoutSubviews);
  -[EKUIListViewReminderCell layer](self, "layer");
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

    -[EKUIListViewReminderCell layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v3, "setFrame:");

    -[EKUIListViewReminderCell layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMask:", v3);
  }

}

- (void)_adjustNumberOfLines
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  -[EKUIListViewReminderCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !EKUIUsesLargeTextLayout(v4);

  -[UILabel setNumberOfLines:](self->_timeField, "setNumberOfLines:", v5);
  -[UILabel setNumberOfLines:](self->_titleField, "setNumberOfLines:", v5);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewReminderCell;
  -[EKUIListViewReminderCell setHighlighted:animated:](&v5, sel_setHighlighted_animated_, a3, a4);
  -[EKUIListViewReminderCell _updateColors](self, "_updateColors");
}

- (void)_circleButtonPressed
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[EKUIListViewReminderCell event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CUIK_reminderShouldBeEditable");

  if (v4)
  {
    -[EKUIListViewReminderCell delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventIconButtonPressed:", self);

    -[EKUIListViewReminderCell event](self, "event");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewReminderCell updateWithEvent:dimmed:](self, "updateWithEvent:dimmed:", v6, self->_dimmed);

  }
}

- (void)updateWithEvent:(id)a3 dimmed:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
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
  int v32;
  double v33;
  _QWORD v34[5];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKUIListViewReminderCell setEvent:](self, "setEvent:", v6);
  if (!v6)
    goto LABEL_14;
  self->_dimmed = a4;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    -[EKUIListViewReminderCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleField, "setText:", v7);

  v8 = (void *)MEMORY[0x1E0DC3870];
  -[EKUIListViewReminderCell event](self, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CUIK_symbolName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemImageNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_circleIcon, "setImage:", v11);

  -[EKUIListViewReminderCell traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __51__EKUIListViewReminderCell_updateWithEvent_dimmed___block_invoke;
  v34[3] = &unk_1E6018688;
  v34[4] = self;
  objc_msgSend(v12, "performAsCurrentTraitCollection:", v34);

  if (-[EKUIListViewCell dragPreview](self, "dragPreview"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v13, "setDateStyle:", 1);
    -[EKUIListViewReminderCell event](self, "event");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimeStyle:", objc_msgSend(v14, "isAllDay") ^ 1);

    -[EKUIListViewReminderCell event](self, "event");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_timeField, "setText:", v17);
  }
  else
  {
    -[EKUIListViewReminderCell event](self, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isAllDay");

    if (!v19)
    {
      v25 = (void *)MEMORY[0x1E0D0CE30];
      -[EKUIListViewReminderCell event](self, "event");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKCalendar();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIListViewReminderCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeAttributedTextWithDate:calendar:font:options:", v27, v28, v29, 16);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_timeField, "setAttributedText:", v30);

      goto LABEL_10;
    }
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    EventKitUIBundle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("all-day"), &stru_1E601DFA8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x1E0DC1138];
    -[EKUIListViewReminderCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v20, "initWithString:attributes:", v21, v23);
    -[UILabel setAttributedText:](self->_timeField, "setAttributedText:", v24);

  }
LABEL_10:
  -[EKUIListViewReminderCell event](self, "event");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isAllDay");

  v33 = 8.0;
  if (v32)
    v33 = 0.0;
  -[EKUIViewWithCornerRadius setCornerRadius:](self->_backgroundView, "setCornerRadius:", v33);
  -[EKUIListViewReminderCell _updateColors](self, "_updateColors");
  if (CalendarLinkLibraryCore())
    -[EKUIListViewReminderCell Cal_annotateWithEvent:](self, "Cal_annotateWithEvent:", v6);
LABEL_14:

}

void __51__EKUIListViewReminderCell_updateWithEvent_dimmed___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(*(id *)(a1 + 32), "_titleFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v2, "configurationWithPointSize:weight:scale:", 7, 2, v3 + 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setPreferredSymbolConfiguration:", v4);

}

- (void)_updateColors
{
  void *v3;
  _QWORD v4[5];

  -[EKUIListViewReminderCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__EKUIListViewReminderCell__updateColors__block_invoke;
  v4[3] = &unk_1E6018688;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

void __41__EKUIListViewReminderCell__updateColors__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  if (objc_msgSend(*(id *)(a1 + 32), "carplayMode")
    && objc_msgSend(*(id *)(a1 + 32), "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusPrimaryColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "event");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "CUIK_reminderShouldBeEditable");

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "event");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "CUIK_symbolColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v9;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v2;
LABEL_8:
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 1128))
  {
    v10 = v6;
    objc_msgSend(v6, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E0D0CA68]);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 32);
    v6 = (void *)v8;
  }
  v11 = v6;
  objc_msgSend(*(id *)(v7 + 1112), "setTintColor:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_updateTextAndIconColors");
  objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundColor");

}

- (void)_updateBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewReminderCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceStyle");
  CUIKAdjustedColorForColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIListViewReminderCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfaceStyle");
  CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[EKUIListViewCell carplayMode](self, "carplayMode"))
  {
    if (!-[EKUIListViewCell dragPreview](self, "dragPreview"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (!-[EKUIListViewReminderCell isHighlighted](self, "isHighlighted"))
  {
LABEL_5:
    v7 = v6;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = v7;
  -[EKUIViewWithCornerRadius setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v7);

}

- (void)_updateTextAndIconColors
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  if (-[EKUIListViewCell carplayMode](self, "carplayMode")
    && -[EKUIListViewReminderCell isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKUIListViewReminderCell event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "completed");

    if (!v5)
    {
      -[EKUIListViewReminderCell event](self, "event");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "CUIK_reminderShouldBeEditable") & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v9;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v3;
LABEL_11:
  if (self->_dimmed)
  {
    v10 = v6;
    objc_msgSend(v6, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E0D0CA68]);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v11 = v6;
  -[UILabel setTextColor:](self->_titleField, "setTextColor:", v6);
  -[UILabel setTextColor:](self->_timeField, "setTextColor:", v11);

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
  -[EKUIListViewReminderCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:](EKUIConstrainedFontUtilities, "constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  _BOOL4 v4;
  double x;
  double y;
  double width;
  double height;
  double v9;
  CGRect v11;

  v4 = a4;
  v11 = CGRectInset(a3, 12.0, 4.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v9 = 8.0;
  if (v4)
    v9 = CGRectGetHeight(v11) * 0.5;
  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v9);
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

- (EKUIListViewReminderCellDelegate)delegate
{
  return (EKUIListViewReminderCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeField, 0);
  objc_storeStrong((id *)&self->_circleIcon, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleField, 0);
}

@end

@implementation EKDateTimeCell

- (EKDateTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKDateTimeCell *v4;
  id v5;
  uint64_t v6;
  UILabel *titleLabel;
  void *v8;
  double v9;
  void *v10;
  UIDatePicker *v11;
  UIDatePicker *datePicker;
  double v13;
  void *v14;
  uint64_t v15;
  UITapGestureRecognizer *gestureRecognizer;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EKDateTimeCell;
  v4 = -[EKDateTimeCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v6;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    -[EKDateTimeCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_titleLabel);

    v11 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    datePicker = v4->_datePicker;
    v4->_datePicker = v11;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v4->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v13) = 1148846080;
    -[UIDatePicker setContentHuggingPriority:forAxis:](v4->_datePicker, "setContentHuggingPriority:forAxis:", 0, v13);
    -[UIDatePicker setPreferredDatePickerStyle:](v4->_datePicker, "setPreferredDatePickerStyle:", 2);
    -[UIDatePicker setDatePickerMode:](v4->_datePicker, "setDatePickerMode:", 2);
    -[UIDatePicker _setCompactStyleDelegate:](v4->_datePicker, "_setCompactStyleDelegate:", v4);
    -[UIDatePicker addTarget:action:forControlEvents:](v4->_datePicker, "addTarget:action:forControlEvents:", v4, sel_datePickerChanged_, 4096);
    -[UIDatePicker addTarget:action:forControlEvents:](v4->_datePicker, "addTarget:action:forControlEvents:", v4, sel_datePickerBeganEditing_, 0x10000);
    -[UIDatePicker addTarget:action:forControlEvents:](v4->_datePicker, "addTarget:action:forControlEvents:", v4, sel_datePickerEndedEditing_, 0x40000);
    -[EKDateTimeCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_datePicker);

    -[EKDateTimeCell _updateConstraints](v4, "_updateConstraints");
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_handleTap);
    gestureRecognizer = v4->_gestureRecognizer;
    v4->_gestureRecognizer = (UITapGestureRecognizer *)v15;

    -[EKDateTimeCell addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_gestureRecognizer);
  }
  return v4;
}

- (void)contentSizeCategoryChanged
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  -[EKDateTimeCell _updateConstraints](self, "_updateConstraints");
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
    -[UIDatePicker _compactStyleSetActiveComponent:](self->_datePicker, "_compactStyleSetActiveComponent:", self->_currentVisibleComponent);
}

- (void)didMoveToWindow
{
  void *v3;

  -[EKDateTimeCell window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[EKDateTimeCell _updateConstraints](self, "_updateConstraints");
}

- (BOOL)usingMultiLineLayout
{
  return self->_usingMultiLineLayout;
}

- (void)_updateConstraints
{
  void *v3;
  UILabel *v4;
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  UIDatePicker *v9;
  void *v10;
  void *v11;
  void *v12;
  UIDatePicker *v13;
  void *v14;
  void *v15;
  void *v16;
  UIDatePicker *v17;
  void *currentConstraints;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  BOOL v22;
  void *v23;
  UILabel *titleLabel;
  void *v25;
  UILabel *v26;
  void *v27;
  UIDatePicker *datePicker;
  void *v29;
  UIDatePicker *v30;
  NSArray *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[7];

  v37[6] = *MEMORY[0x1E0C80C00];
  if (self->_currentConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  if ((EKUICatalyst() & 1) != 0
    || !EKUIUsesLargeTextLayout(0) && EKUICurrentWindowWidthWithViewHierarchy(self) >= 375.0)
  {
    -[UIDatePicker setContentHorizontalAlignment:](self->_datePicker, "setContentHorizontalAlignment:", 5);
    v23 = (void *)MEMORY[0x1E0CB3718];
    titleLabel = self->_titleLabel;
    -[EKDateTimeCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", titleLabel, 5, 0, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v34;
    v25 = (void *)MEMORY[0x1E0CB3718];
    v26 = self->_titleLabel;
    -[EKDateTimeCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 10, 0, 1.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v32;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_datePicker, 5, 1, self->_titleLabel, 6, 1.0, 8.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v7;
    v27 = (void *)MEMORY[0x1E0CB3718];
    datePicker = self->_datePicker;
    -[EKDateTimeCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", datePicker, 10, 0, v10, 10, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v11;
    v29 = (void *)MEMORY[0x1E0CB3718];
    v30 = self->_datePicker;
    -[EKDateTimeCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 6, 0, v14, 18, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 5);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    currentConstraints = self->_currentConstraints;
    self->_currentConstraints = v31;
  }
  else
  {
    -[UIDatePicker setContentHorizontalAlignment:](self->_datePicker, "setContentHorizontalAlignment:", 4);
    v3 = (void *)MEMORY[0x1E0CB3718];
    v4 = self->_titleLabel;
    -[EKDateTimeCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 5, 0, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v34;
    v5 = (void *)MEMORY[0x1E0CB3718];
    v6 = self->_titleLabel;
    -[EKDateTimeCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 3, 0, 1.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v32;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_datePicker, 3, 0, self->_titleLabel, 4, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v7;
    v8 = (void *)MEMORY[0x1E0CB3718];
    v9 = self->_datePicker;
    -[EKDateTimeCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 5, 0, v10, 17, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v11;
    v12 = (void *)MEMORY[0x1E0CB3718];
    v13 = self->_datePicker;
    -[EKDateTimeCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 6, -1, v14, 18, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v15;
    v16 = (void *)MEMORY[0x1E0CB3718];
    v17 = self->_datePicker;
    -[EKDateTimeCell contentView](self, "contentView");
    currentConstraints = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, 0, currentConstraints, 16, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v21 = self->_currentConstraints;
    self->_currentConstraints = v20;

    v22 = 1;
  }

  self->_usingMultiLineLayout = v22;
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_currentConstraints);
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)updateWithDate:(id)a3 timeZone:(id)a4 allDay:(BOOL)a5 needsStrikethrough:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v9;
  UIDatePicker *datePicker;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v6 = a6;
  v19[1] = *MEMORY[0x1E0C80C00];
  if (a5)
    v9 = 1;
  else
    v9 = 2;
  datePicker = self->_datePicker;
  v11 = a4;
  v12 = a3;
  -[UIDatePicker setDatePickerMode:](datePicker, "setDatePickerMode:", v9);
  v18 = *MEMORY[0x1E0DC11A8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker _setOverrideCompactTextAttributes:](self->_datePicker, "_setOverrideCompactTextAttributes:", v14);

  v15 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v15, "setTimeZone:", v11);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateFromComponents:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDatePicker setDate:animated:](self->_datePicker, "setDate:animated:", v17, 0);
  -[UIDatePicker _setDisplaysTimeZone:](self->_datePicker, "_setDisplaysTimeZone:", v11 != 0);
  -[UIDatePicker setTimeZone:](self->_datePicker, "setTimeZone:", v11);

}

- (void)resetDatePickerSelection
{
  self->_currentVisibleComponent = 0;
  -[UIDatePicker _compactStyleSetActiveComponent:](self->_datePicker, "_compactStyleSetActiveComponent:", 0);
}

- (void)replaceControlsWithPicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKDateTimeCell addSubview:](self, "addSubview:", v4);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, self, 10, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 6, 0, self, 6, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setActive:", 1);
  -[UIDatePicker setHidden:](self->_datePicker, "setHidden:", 1);
}

- (void)handleTap
{
  UITapGestureRecognizer *gestureRecognizer;
  void *v4;
  double v5;
  double v6;
  CGFloat MaxX;
  uint64_t v8;
  int64_t currentVisibleComponent;
  uint64_t v10;
  CGRect v11;

  gestureRecognizer = self->_gestureRecognizer;
  -[EKDateTimeCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer locationInView:](gestureRecognizer, "locationInView:", v4);
  v6 = v5;

  -[UIDatePicker frame](self->_datePicker, "frame");
  MaxX = CGRectGetMaxX(v11);
  v8 = 2;
  if (v6 <= MaxX)
    v8 = 1;
  currentVisibleComponent = self->_currentVisibleComponent;
  if (v8 == currentVisibleComponent)
    v10 = 0;
  else
    v10 = v8;
  if (v10 != currentVisibleComponent)
  {
    -[EKDateTimeCell _datePicker:didSelectComponent:](self, "_datePicker:didSelectComponent:", self->_datePicker, v10);
    -[UIDatePicker _compactStyleSetActiveComponent:](self->_datePicker, "_compactStyleSetActiveComponent:", v10);
  }
}

- (void)datePickerChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsInTimeZone:fromDate:", v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTimeZone:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKDateTimeCell dateTimeDelegate](self, "dateTimeDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateTimeCell:dateChanged:", self, v10);

}

- (void)datePickerBeganEditing:(id)a3
{
  id v4;

  self->_isEditing = 1;
  -[EKDateTimeCell dateTimeDelegate](self, "dateTimeDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTimeCellBeganEditing:", self);

}

- (void)datePickerEndedEditing:(id)a3
{
  id v4;

  self->_isEditing = 0;
  -[EKDateTimeCell dateTimeDelegate](self, "dateTimeDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTimeCellEndedEditing:", self);

}

- (void)_datePicker:(id)a3 didSelectComponent:(int64_t)a4
{
  BOOL v6;
  int64_t currentVisibleComponent;
  void *v8;

  if (self->_currentVisibleComponent)
    v6 = a4 == 0;
  else
    v6 = 0;
  if (v6)
    currentVisibleComponent = self->_currentVisibleComponent;
  else
    currentVisibleComponent = a4;
  if (!self->_isEditing && (EKUICatalyst() & 1) == 0)
  {
    if (currentVisibleComponent == 2)
    {
      -[EKDateTimeCell dateTimeDelegate](self, "dateTimeDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateTimeCellTimeTapped:", self);
      goto LABEL_13;
    }
    if (currentVisibleComponent == 1)
    {
      -[EKDateTimeCell dateTimeDelegate](self, "dateTimeDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateTimeCellDateTapped:", self);
LABEL_13:

    }
  }
  self->_currentVisibleComponent = a4;
}

- (EKDateTimeCellDelegate)dateTimeDelegate
{
  return self->_dateTimeDelegate;
}

- (void)setDateTimeDelegate:(id)a3
{
  self->_dateTimeDelegate = (EKDateTimeCellDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

@implementation EKReminderDateDetailCell

- (EKReminderDateDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  EKReminderDateDetailCell *v10;
  UILabel *v11;
  UILabel *line;
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
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  objc_super v49;
  _QWORD v50[6];

  v5 = a5;
  v50[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)EKReminderDateDetailCell;
  v10 = -[EKReminderDetailCell initWithEvent:reminder:editable:](&v49, sel_initWithEvent_reminder_editable_, v8, v9, v5);
  if (v10)
  {
    v47 = v9;
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    line = v10->_line;
    v10->_line = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_line, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v10->_line, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4B10], 0x10000);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_line, "setFont:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10->_line, "setTextColor:", v14);

    -[EKReminderDateDetailCell contentView](v10, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v10->_line);

    v38 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v10->_line, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderDateDetailCell contentView](v10, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "layoutMarginsGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 6.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v42;
    -[UILabel trailingAnchor](v10->_line, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderDateDetailCell contentView](v10, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37, -6.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v36;
    -[UILabel topAnchor](v10->_line, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderDateDetailCell contentView](v10, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v17, 5.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v18;
    -[UILabel bottomAnchor](v10->_line, "bottomAnchor");
    v48 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderDateDetailCell contentView](v10, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -15.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v23);

    v8 = v48;
    v24 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v24, "setDateStyle:", 4);
    if (objc_msgSend(v48, "completed"))
    {
      objc_msgSend(v24, "setTimeStyle:", 1);
      v9 = v47;
      objc_msgSend(v47, "completionDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = v25;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v27;

      v30 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Completed: %@"), &stru_1E601DFA8, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringFromDate:", v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringWithFormat:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v10->_line, "setText:", v33);

    }
    else
    {
      objc_msgSend(v24, "setTimeStyle:", 0);
      objc_msgSend(v48, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringFromDate:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v10->_line, "setText:", v29);
      v9 = v47;
    }

  }
  return v10;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = !self->_hideBottomCellSeparator;
  v4.receiver = self;
  v4.super_class = (Class)EKReminderDateDetailCell;
  -[EKReminderDateDetailCell setSeparatorStyle:](&v4, sel_setSeparatorStyle_, v3);
}

- (BOOL)hideBottomCellSeparator
{
  return self->_hideBottomCellSeparator;
}

- (void)setHideBottomCellSeparator:(BOOL)a3
{
  self->_hideBottomCellSeparator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line, 0);
}

@end

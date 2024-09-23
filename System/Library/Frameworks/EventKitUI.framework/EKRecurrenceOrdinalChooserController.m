@implementation EKRecurrenceOrdinalChooserController

- (EKRecurrenceOrdinalChooserController)initWithDate:(id)a3
{
  EKRecurrenceOrdinalChooserController *v3;
  EKRecurrenceOrdinalPickerViewController *v4;
  EKRecurrenceOrdinalPickerViewController *pickerViewController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKRecurrenceOrdinalChooserController;
  v3 = -[EKRecurrenceChooserController initWithDate:](&v7, sel_initWithDate_, a3);
  if (v3)
  {
    v4 = (EKRecurrenceOrdinalPickerViewController *)objc_opt_new();
    -[EKRecurrenceOrdinalPickerViewController setDelegate:](v4, "setDelegate:", v3);
    pickerViewController = v3->_pickerViewController;
    v3->_pickerViewController = v4;

  }
  return v3;
}

- (int64_t)frequency
{
  return 2;
}

- (int64_t)numberOfRows
{
  return 1;
}

- (double)heightForRow:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[EKRecurrenceOrdinalPickerViewController view](self->_pickerViewController, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v5 = v4;

  return v5;
}

- (id)cellForRow:(int64_t)a3
{
  UITableViewCell *cell;
  void *v5;
  void *v6;
  void *v7;
  EKUITableViewCell *v8;
  UITableViewCell *v9;
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
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  cell = self->_cell;
  if (!cell)
  {
    -[EKRecurrenceOrdinalPickerViewController view](self->_pickerViewController, "view", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKRecurrenceChooserController backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EKRecurrenceChooserController backgroundColor](self, "backgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v7);

    }
    v8 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v9 = self->_cell;
    self->_cell = &v8->super;

    -[UITableViewCell contentView](self->_cell, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5);

    -[UITableViewCell contentView](self->_cell, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3718];
    -[UITableViewCell contentView](self->_cell, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 9, 0, v5, 9, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraint:", v14);

    -[UITableViewCell contentView](self->_cell, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[UITableViewCell contentView](self->_cell, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, v17, 7, 1.0, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addConstraint:", v18);

    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UITableViewCell contentView](self->_cell, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 8, 1, v5, 8, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v22) = 1148829696;
    objc_msgSend(v21, "setPriority:", v22);
    v23 = (void *)MEMORY[0x1E0CB3718];
    -[UITableViewCell contentView](self->_cell, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 3, 0, v5, 3, 1.0, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITableViewCell contentView](self->_cell, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v21;
    v29[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addConstraints:", v27);

    cell = self->_cell;
  }
  return cell;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  -[EKRecurrenceOrdinalPickerViewController updateRecurrenceRuleBuilder:](self->_pickerViewController, "updateRecurrenceRuleBuilder:", a3);
}

- (void)updateFromRecurrenceRule:(id)a3
{
  -[EKRecurrenceOrdinalPickerViewController updateFromRecurrenceRule:](self->_pickerViewController, "updateFromRecurrenceRule:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end

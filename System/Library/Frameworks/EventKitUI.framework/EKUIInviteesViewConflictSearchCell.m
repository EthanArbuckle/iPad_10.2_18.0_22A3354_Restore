@implementation EKUIInviteesViewConflictSearchCell

- (EKUIInviteesViewConflictSearchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIInviteesViewConflictSearchCell *v4;
  EKUIInviteesViewConflictSearchCell *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EKUIInviteesViewConflictSearchCell;
  v4 = -[EKUIInviteesViewConflictSearchCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUIInviteesViewConflictSearchCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v7, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell setOriginalLabelFontColor:](v5, "setOriginalLabelFontColor:", v8);

    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "_labelFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v9);

    objc_msgSend((id)objc_opt_class(), "_showMoreLocalizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v10);

    objc_msgSend(v6, "addSubview:", v7);
    -[EKUIInviteesViewConflictSearchCell setLabel:](v5, "setLabel:", v7);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    objc_msgSend(v11, "setHidden:", 1);
    objc_msgSend(v6, "addSubview:", v11);
    -[EKUIInviteesViewConflictSearchCell setSpinner:](v5, "setSpinner:", v11);
    -[EKUIInviteesViewConflictSearchCell setLeftInset:](v5, "setLeftInset:", 66.0);
    -[EKUIInviteesViewConflictSearchCell leftInset](v5, "leftInset");
    -[EKUIInviteesViewConflictSearchCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, v16, 0.0, 0.0);
    -[EKUIInviteesViewConflictSearchCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");

  }
  return v5;
}

- (void)updateConstraints
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  -[EKUIInviteesViewConflictSearchCell persistentConstraints](self, "persistentConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewConflictSearchCell label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell leftInset](self, "leftInset");
    objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, v7, 5, 1.0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    v10 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewConflictSearchCell label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 6, 0, v12, 6, 1.0, -47.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    v14 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewConflictSearchCell label](self, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_labelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_scaledValueForValue:", 28.0);
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 12, 0, v16, 3, 1.0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    v20 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell label](self, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_labelFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_scaledValueForValue:", 16.0);
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 4, 0, v22, 11, 1.0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v25);

    v26 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewConflictSearchCell spinner](self, "spinner");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 2, 0, v28, 2, 1.0, -16.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    v30 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewConflictSearchCell spinner](self, "spinner");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 10, 0, v32, 10, 1.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v33);

    v34 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 8, 1, 0, 0, 1.0, 44.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v36);

    -[EKUIInviteesViewConflictSearchCell contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addConstraints:", v4);

    -[EKUIInviteesViewConflictSearchCell setPersistentConstraints:](self, "setPersistentConstraints:", v4);
  }
  v38.receiver = self;
  v38.super_class = (Class)EKUIInviteesViewConflictSearchCell;
  -[EKUIInviteesViewConflictSearchCell updateConstraints](&v38, sel_updateConstraints);
}

- (void)setInitialSearchInProgressState
{
  void *v3;
  void *v4;
  id v5;

  EventKitUIBundle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Searching available times…"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewConflictSearchCell originalLabelFontColor](self, "originalLabelFontColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewConflictSearchCell _setText:textColor:spinnerEnabled:](self, "_setText:textColor:spinnerEnabled:", v3, v4, 1);

}

- (void)setNoAvailableTimesStateWithNumberOfExistingTimes:(unint64_t)a3 hasError:(BOOL)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v9;
  id v10;

  if (a4)
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Connection error");
  }
  else
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3)
      v7 = CFSTR("No more available times");
    else
      v7 = CFSTR("No available times");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E601DFA8, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_grayTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewConflictSearchCell _setText:textColor:spinnerEnabled:](self, "_setText:textColor:spinnerEnabled:", v10, v9, 0);

}

- (void)setShowMoreState
{
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "_showMoreLocalizedString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewConflictSearchCell originalLabelFontColor](self, "originalLabelFontColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewConflictSearchCell _setText:textColor:spinnerEnabled:](self, "_setText:textColor:spinnerEnabled:", v4, v3, 0);

}

- (void)setAvailabilityRequestInProgressState
{
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "_showMoreLocalizedString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewConflictSearchCell originalLabelFontColor](self, "originalLabelFontColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewConflictSearchCell _setText:textColor:spinnerEnabled:](self, "_setText:textColor:spinnerEnabled:", v4, v3, 1);

}

- (void)_setText:(id)a3 textColor:(id)a4 spinnerEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[EKUIInviteesViewConflictSearchCell label](self, "label");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v9);

  objc_msgSend(v13, "setTextColor:", v8);
  objc_msgSend(v13, "setLineBreakMode:", 0);
  objc_msgSend(v13, "setNumberOfLines:", 0);
  -[EKUIInviteesViewConflictSearchCell spinner](self, "spinner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    objc_msgSend(v10, "setHidden:", 0);

    -[EKUIInviteesViewConflictSearchCell spinner](self, "spinner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startAnimating");
  }
  else
  {
    objc_msgSend(v10, "stopAnimating");

    -[EKUIInviteesViewConflictSearchCell spinner](self, "spinner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);
  }

}

+ (id)_grayTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.498039216, 0.498039216, 0.498039216, 1.0);
}

+ (id)_labelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)_showMoreLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Show More…"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSArray)persistentConstraints
{
  return self->_persistentConstraints;
}

- (void)setPersistentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_persistentConstraints, a3);
}

- (double)leftInset
{
  return self->_leftInset;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UIColor)originalLabelFontColor
{
  return self->_originalLabelFontColor;
}

- (void)setOriginalLabelFontColor:(id)a3
{
  objc_storeStrong((id *)&self->_originalLabelFontColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLabelFontColor, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_persistentConstraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

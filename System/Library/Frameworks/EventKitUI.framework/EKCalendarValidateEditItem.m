@implementation EKCalendarValidateEditItem

- (EKCalendarValidateEditItem)init
{
  EKCalendarValidateEditItem *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarValidateEditItem;
  v2 = -[EKCalendarValidateEditItem init](&v6, sel_init);
  if (v2)
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Subscribe"), &stru_1E601DFA8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarValidateEditItem setButtonTitle:](v2, "setButtonTitle:", v4);

  }
  return v2;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  UITableViewCell *v5;
  UITableViewCell *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  UIActivityIndicatorView *v10;
  UIActivityIndicatorView *spinner;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *buttonTextLabel;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  cell = self->_cell;
  if (!cell)
  {
    v5 = (UITableViewCell *)objc_alloc_init(MEMORY[0x1E0DC3D50]);
    v6 = self->_cell;
    self->_cell = v5;

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[UILabel setText:](v7, "setText:", self->_buttonTitle);
    -[UITableViewCell contentView](self->_cell, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

    v10 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E0DC3438]);
    spinner = self->_spinner;
    self->_spinner = v10;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableViewCell contentView](self->_cell, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_spinner);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel centerXAnchor](v7, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell contentView](self->_cell, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v27;
    -[UILabel centerYAnchor](v7, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell contentView](self->_cell, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v22;
    -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v7, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v15;
    -[UIActivityIndicatorView leadingAnchor](self->_spinner, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v7, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v17, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v19);

    buttonTextLabel = self->_buttonTextLabel;
    self->_buttonTextLabel = v7;

    cell = self->_cell;
  }
  return cell;
}

- (void)setButtonTitle:(id)a3
{
  NSString **p_buttonTitle;
  id v6;

  p_buttonTitle = &self->_buttonTitle;
  objc_storeStrong((id *)&self->_buttonTitle, a3);
  v6 = a3;
  -[UILabel setText:](self->_buttonTextLabel, "setText:", *p_buttonTitle);

}

- (void)setAnimateSpinner:(BOOL)a3
{
  UIActivityIndicatorView *spinner;

  self->_animateSpinner = a3;
  spinner = self->_spinner;
  if (a3)
    -[UIActivityIndicatorView startAnimating](spinner, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](spinner, "stopAnimating");
}

- (void)setURLIsSpam:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  if (self->_URLIsSpam != a3)
  {
    v3 = a3;
    self->_URLIsSpam = a3;
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      v7 = CFSTR("Subscribe Anyway");
    else
      v7 = CFSTR("Subscribe");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E601DFA8, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[EKCalendarValidateEditItem setButtonTitle:](self, "setButtonTitle:", v8);
  }
}

- (id)footerTitle
{
  void *v2;
  void *v3;

  if (self->_showError)
  {
    EventKitUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Validation failed. Please edit the URL and try again."), &stru_1E601DFA8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)showError
{
  return self->_showError;
}

- (void)setShowError:(BOOL)a3
{
  self->_showError = a3;
}

- (BOOL)animateSpinner
{
  return self->_animateSpinner;
}

- (BOOL)URLIsSpam
{
  return self->_URLIsSpam;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end

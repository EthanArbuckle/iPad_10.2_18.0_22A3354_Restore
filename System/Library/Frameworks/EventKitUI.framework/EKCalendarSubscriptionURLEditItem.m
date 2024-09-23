@implementation EKCalendarSubscriptionURLEditItem

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  UITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 editable;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSString *urlString;
  NSString *v23;
  NSString *v24;
  void *v25;
  UITableViewCell *v26;

  cell = self->_cell;
  if (!cell)
  {
    v5 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1000, 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](v5, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("example.com/cal.ics"), &stru_1E601DFA8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setPlaceHolderValue:](v5, "setPlaceHolderValue:", v9);

    -[UITableViewCell setTextFieldOffset:](v5, "setTextFieldOffset:", 0.0);
    -[UITableViewCell editableTextField](v5, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClearButtonMode:", 1);

    -[UITableViewCell editableTextField](v5, "editableTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeyboardType:", 3);

    -[UITableViewCell editableTextField](v5, "editableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutocorrectionType:", 1);

    -[UITableViewCell editableTextField](v5, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAutocapitalizationType:", 0);

    editable = self->_editable;
    -[UITableViewCell editableTextField](v5, "editableTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", editable);

    -[EKCalendarSubscriptionURLEditItem _textFieldColorForEditable:](self, "_textFieldColorForEditable:", self->_editable);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](v5, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v16);

    -[UITableViewCell setSelectionStyle:](v5, "setSelectionStyle:", -[EKCalendarSubscriptionURLEditItem _cellSelectionStyleForEditable:](self, "_cellSelectionStyleForEditable:", self->_editable));
    -[UITableViewCell editableTextField](v5, "editableTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0DC54D0];
    -[UITableViewCell editableTextField](v5, "editableTextField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__textFieldChanged, v20, v21);

    urlString = self->_urlString;
    if (urlString
      || (-[EKCalendar subcalURL](self->super._calendar, "subcalURL"),
          v23 = (NSString *)objc_claimAutoreleasedReturnValue(),
          v24 = self->_urlString,
          self->_urlString = v23,
          v24,
          (urlString = self->_urlString) != 0))
    {
      -[UITableViewCell editableTextField](v5, "editableTextField");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", urlString);

    }
    v26 = self->_cell;
    self->_cell = v5;

    cell = self->_cell;
  }
  return cell;
}

- (id)_textFieldColorForEditable:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_cellSelectionStyleForEditable:(BOOL)a3
{
  if (a3)
    return 0;
  else
    return 3;
}

- (NSString)urlString
{
  UITableViewCell *cell;
  void *v4;
  NSString *v5;
  NSString *urlString;

  cell = self->_cell;
  if (cell)
  {
    -[UITableViewCell editableTextField](cell, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    urlString = self->_urlString;
    self->_urlString = v5;

  }
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  UITableViewCell *cell;
  NSString *urlString;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_urlString, a3);
  cell = self->_cell;
  if (cell)
  {
    urlString = self->_urlString;
    -[UITableViewCell editableTextField](cell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", urlString);

  }
}

- (void)setEditable:(BOOL)a3
{
  UITableViewCell *cell;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;

  self->_editable = a3;
  cell = self->_cell;
  if (cell)
  {
    v5 = a3;
    -[UITableViewCell editableTextField](cell, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v5);

    -[EKCalendarSubscriptionURLEditItem _textFieldColorForEditable:](self, "_textFieldColorForEditable:", self->_editable);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[UITableViewCell setSelectionStyle:](self->_cell, "setSelectionStyle:", -[EKCalendarSubscriptionURLEditItem _cellSelectionStyleForEditable:](self, "_cellSelectionStyleForEditable:", self->_editable));
  }
}

- (BOOL)becomeFirstResponder
{
  void *v2;

  -[UITableViewCell editableTextField](self->_cell, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

  return 1;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKCalendarSubscriptionURLEditItem urlString](self, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubcalURL:", v5);

  return 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  if (EKUIUnscaledCatalyst())
    return EKUIUnscaledCatalystTableRowHeightDefault();
  else
    return 45.0;
}

- (id)headerTitle
{
  _BOOL4 editable;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  editable = self->_editable;
  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (editable)
    v5 = CFSTR("Subscription URL");
  else
    v5 = CFSTR("Subscribed to");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UITableViewCell *cell;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0D96D28]);
  -[EKCalendarSubscriptionURLEditItem urlString](self, "urlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v7, 0);

  cell = self->_cell;
  objc_msgSend(v8, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourceView:", cell);

  -[UITableViewCell bounds](self->_cell, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

  -[EKCalendarEditItem delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "owningNavigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)textFieldDidEndEditing:(id)a3
{
  if (_os_feature_enabled_impl())
    -[EKCalendarSubscriptionURLEditItem _notifyDelegateThatURLStringChangedIfNeeded](self, "_notifyDelegateThatURLStringChangedIfNeeded");
}

- (void)_textFieldChanged
{
  if (_os_feature_enabled_impl())
  {
    if (self->_inWaitPeriodSinceLastChange)
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__waitPeriodElapsedSinceLastTextFieldChange, 0);
    self->_inWaitPeriodSinceLastChange = 1;
    -[EKCalendarSubscriptionURLEditItem performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__waitPeriodElapsedSinceLastTextFieldChange, 0, 0.2);
  }
}

- (void)_waitPeriodElapsedSinceLastTextFieldChange
{
  self->_inWaitPeriodSinceLastChange = 0;
  -[EKCalendarSubscriptionURLEditItem _notifyDelegateThatURLStringChangedIfNeeded](self, "_notifyDelegateThatURLStringChangedIfNeeded");
}

- (void)_notifyDelegateThatURLStringChangedIfNeeded
{
  void *v3;
  void *v4;
  NSString *lastNotifiedURLString;
  void *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  id v10;

  -[EKCalendarSubscriptionURLEditItem urlEditItemDelegate](self, "urlEditItemDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    lastNotifiedURLString = self->_lastNotifiedURLString;
    if (lastNotifiedURLString)
    {
      -[EKCalendarSubscriptionURLEditItem urlString](self, "urlString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](lastNotifiedURLString, "isEqualToString:", v6);

      if (v7)
        return;
    }
    else
    {

    }
    -[EKCalendarSubscriptionURLEditItem urlString](self, "urlString");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_lastNotifiedURLString;
    self->_lastNotifiedURLString = v8;

    -[EKCalendarSubscriptionURLEditItem urlEditItemDelegate](self, "urlEditItemDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLEditItemDidChangeURLString:", self);

  }
}

- (BOOL)editable
{
  return self->_editable;
}

- (EKCalendarSubscriptionURLEditItemDelegate)urlEditItemDelegate
{
  return (EKCalendarSubscriptionURLEditItemDelegate *)objc_loadWeakRetained((id *)&self->_urlEditItemDelegate);
}

- (void)setUrlEditItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_urlEditItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_urlEditItemDelegate);
  objc_storeStrong((id *)&self->_lastNotifiedURLString, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end

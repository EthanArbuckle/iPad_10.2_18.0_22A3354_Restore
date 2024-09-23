@implementation EKCalendarTitleEditItem

- (void)reset
{
  UITableViewCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v4;
  UITableViewCell *cell;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  if (!self->_cell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1000, 0);
    cell = self->_cell;
    self->_cell = &v4->super;

    if (-[EKCalendar isImmutable](self->super._calendar, "isImmutable"))
      v6 = 0;
    else
      v6 = -[EKCalendar isSubscribedHolidayCalendar](self->super._calendar, "isSubscribedHolidayCalendar") ^ 1;
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("calendar-title-field"));

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    EventKitUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Calendar Name"), &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlaceholder:", v12);

    -[EKCalendar title](self->super._calendar, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", &stru_1E601DFA8);
    if ((v15 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      CUIKDisplayedTitleForCalendar();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    if ((v15 & 1) == 0)
    -[EKCalendarTitleEditItem prefillTitle](self, "prefillTitle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[UITableViewCell editableTextField](self->_cell, "editableTextField");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "text");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (!v22)
      {
        -[EKCalendarTitleEditItem prefillTitle](self, "prefillTitle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell editableTextField](self->_cell, "editableTextField");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", v23);

      }
    }
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAutocapitalizationType:", 2);

    -[UITableViewCell setTextFieldOffset:](self->_cell, "setTextFieldOffset:", 0.0);
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClearButtonMode:", 1);

    -[UITableViewCell setSelectionStyle:](self->_cell, "setSelectionStyle:", 0);
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setEnabled:", v6);

    if ((_DWORD)v6)
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGrayTextColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextColor:", v28);

  }
  return self->_cell;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[UITableViewCell editableTextField](self->_cell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;
  if (!v6)
  {
LABEL_8:

    goto LABEL_9;
  }
  v8 = (void *)v6;
  -[UITableViewCell editableTextField](self->_cell, "editableTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnabled");

  if (v10)
  {
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", &stru_1E601DFA8) & 1) != 0)
    {
      EventKitUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Untitled Calendar"), &stru_1E601DFA8, 0);
    }
    else
    {
      -[UITableViewCell editableTextField](self->_cell, "editableTextField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v13);

    goto LABEL_8;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)becomeFirstResponder
{
  void *v2;

  -[UITableViewCell editableTextField](self->_cell, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

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
  void *v2;
  void *v3;
  objc_super v5;

  if (self->_showHeader)
  {
    EventKitUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Title in calendar editor"), CFSTR("Title"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)EKCalendarTitleEditItem;
    -[EKCalendarEditItem headerTitle](&v5, sel_headerTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  void *v6;
  char v7;
  void *v8;

  -[EKCalendarEditItem delegate](self, "delegate", a3, a4.location, a4.length, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[EKCalendarEditItem delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarItemStartedEditing:", self);

  }
  return 1;
}

- (BOOL)showHeader
{
  return self->_showHeader;
}

- (void)setShowHeader:(BOOL)a3
{
  self->_showHeader = a3;
}

- (NSString)prefillTitle
{
  return self->_prefillTitle;
}

- (void)setPrefillTitle:(id)a3
{
  objc_storeStrong((id *)&self->_prefillTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefillTitle, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end

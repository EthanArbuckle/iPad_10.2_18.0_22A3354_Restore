@implementation EKCalendarPublishingEditItem

- (void)reset
{
  UIActivityIndicatorView *spinner;

  spinner = self->_spinner;
  self->_spinner = 0;

}

- (id)footerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Allow anyone to subscribe to a read-only version of this calendar."), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)configureWithCalendar:(id)a3
{
  id v4;

  v4 = a3;
  -[EKCalendarPublishingEditItem setPublished:](self, "setPublished:", objc_msgSend(v4, "isPublished"));
  LOBYTE(self) = objc_msgSend(v4, "canBePublished");

  return (char)self;
}

- (unint64_t)numberOfSubitems
{
  void *v3;
  unint64_t v4;

  if (!-[EKCalendar isPublished](self->super._calendar, "isPublished"))
    return 1;
  -[EKCalendar publishURL](self->super._calendar, "publishURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  if (EKUIUnscaledCatalyst())
    return EKUIUnscaledCatalystTableRowHeightDefault();
  else
    return 45.0;
}

- (void)_publishChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  EKCalendar *calendar;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[EKCalendarPublishingEditItem setPublished:](self, "setPublished:", objc_msgSend(v4, "isOn"));
    v5 = objc_msgSend(v4, "isOn");

    -[EKCalendar setIsPublished:](self->super._calendar, "setIsPublished:", v5);
    -[EKCalendarEditItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editorForCalendarEditItem:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    calendar = self->super._calendar;
    v18 = 0;
    v9 = objc_msgSend(v7, "saveCalendar:error:", calendar, &v18);
    v10 = v18;
    if ((v9 & 1) == 0)
    {
      v11 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Error Publishing Calendar: %@", buf, 0xCu);
      }
    }
    -[EKCalendarEditItem delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "calendarItemStartedEditing:", self);

    -[EKCalendarPublishingEditItem reset](self, "reset");
    -[EKCalendarEditItem delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB36B8];
    -[EKCalendarEditItem delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexSetWithIndex:", (int)objc_msgSend(v16, "sectionForCalendarEditItem:", self));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadSections:withRowAnimation:", v17, 100);

  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v4;
  EKUITableViewCell *v5;
  void (**v6)(_QWORD);
  void *v7;
  EKUITableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  UIActivityIndicatorView *v13;
  UIActivityIndicatorView *spinner;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  EKCalendarPublishingEditItem *v23;
  EKUITableViewCell *v24;

  if (a3 == 1)
  {
    v8 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("ShareCell"));
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Share Link…"), &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell textLabel](v8, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    return v8;
  }
  else if (a3)
  {
    return 0;
  }
  else
  {
    v4 = objc_alloc_init(EKUITableViewCell);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __54__EKCalendarPublishingEditItem_cellForSubitemAtIndex___block_invoke;
    v22 = &unk_1E6018EC0;
    v23 = self;
    v5 = v4;
    v24 = v5;
    v6 = (void (**)(_QWORD))_Block_copy(&v19);
    if (-[EKCalendar isPublished](self->super._calendar, "isPublished", v19, v20, v21, v22, v23)
      && (-[EKCalendar publishURL](self->super._calendar, "publishURL"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      v13 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      spinner = self->_spinner;
      self->_spinner = v13;

      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
      -[EKUITableViewCell setAccessoryView:](v5, "setAccessoryView:", self->_spinner);
      v15 = dispatch_time(0, 5000000000);
      dispatch_after(v15, MEMORY[0x1E0C80D38], v6);
    }
    else
    {
      v6[2](v6);
    }
    EventKitUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Public Calendar"), &stru_1E601DFA8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell textLabel](v5, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    -[EKUITableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    return v5;
  }
}

void __54__EKCalendarPublishingEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
  objc_msgSend(v2, "setOn:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__publishChanged_, 4096);
  objc_msgSend(*(id *)(a1 + 40), "setAccessoryView:", v2);

}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6;
  CalendarPublishingActivityViewController *v7;
  void *v8;
  void *v9;
  CalendarPublishingActivityViewController *v10;
  void *v11;
  void *v12;
  _BOOL4 IsRegular;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 1)
  {
    v7 = [CalendarPublishingActivityViewController alloc];
    -[EKCalendarPublishingEditItem pubishURL](self, "pubishURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CalendarPublishingActivityViewController initWithActivityItems:applicationActivities:](v7, "initWithActivityItems:applicationActivities:", v9, 0);

    -[CalendarPublishingActivityViewController setActivityDelegate:](v10, "setActivityDelegate:", self);
    objc_msgSend(v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v11))
    {
      objc_msgSend(v6, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IsRegular = EKUICurrentHeightSizeClassIsRegular(v12);

      if (IsRegular)
      {
        -[CalendarPublishingActivityViewController setAllowsCustomPresentationStyle:](v10, "setAllowsCustomPresentationStyle:", 1);
        -[CalendarPublishingActivityViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 3);
      }
    }
    else
    {

    }
    -[EKCalendarEditItem delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "owningNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentModalViewController:withTransition:", v10, 8);

  }
}

- (id)calendarTitle
{
  return -[EKCalendar title](self->super._calendar, "title");
}

- (id)pubishURL
{
  void *v2;
  void *v3;

  -[EKCalendar publishURL](self->super._calendar, "publishURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)published
{
  return self->_published;
}

- (void)setPublished:(BOOL)a3
{
  self->_published = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end

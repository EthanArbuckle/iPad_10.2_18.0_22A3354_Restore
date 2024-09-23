@implementation EKCalendarRemoveExtraInfoEditItem

- (unint64_t)numberOfSubitems
{
  return 2;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = objc_alloc_init(EKUITableViewCell);
  -[EKUITableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  if (a3 == 1)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v6, "setOn:", -[EKCalendar stripAttachments](self->super._calendar, "stripAttachments"));
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__stripAttachmentsChanged_, 4096);
    -[EKUITableViewCell setAccessoryView:](v5, "setAccessoryView:", v6);
    -[EKUITableViewCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 0);

    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Remove Attachments");
    goto LABEL_5;
  }
  if (!a3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v6, "setOn:", -[EKCalendar stripAlarms](self->super._calendar, "stripAlarms"));
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__stripAlertsChanged_, 4096);
    -[EKUITableViewCell setAccessoryView:](v5, "setAccessoryView:", v6);
    -[EKUITableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Remove Alerts");
LABEL_5:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell textLabel](v5, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
  return v5;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Remove Extra Items"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Strip alerts or attachments from data added to the subscription calendar by the data provider. Default alerts will still apply according to your settings."), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_stripAlertsChanged:(id)a3
{
  id v4;

  -[EKCalendar setStripAlarms:](self->super._calendar, "setStripAlarms:", objc_msgSend(a3, "isOn"));
  -[EKCalendarEditItem delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarItemStartedEditing:", self);

}

- (void)_stripAttachmentsChanged:(id)a3
{
  id v4;

  -[EKCalendar setStripAttachments:](self->super._calendar, "setStripAttachments:", objc_msgSend(a3, "isOn"));
  -[EKCalendarEditItem delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarItemStartedEditing:", self);

}

@end

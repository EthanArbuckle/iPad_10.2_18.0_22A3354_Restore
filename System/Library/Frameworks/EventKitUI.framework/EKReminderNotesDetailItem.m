@implementation EKReminderNotesDetailItem

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[REMReminder notes](self->super.super.super._reminder, "notes", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[REMReminder notes](self->super.super.super._reminder, "notes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CUIKShouldDisplayNotes();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)titleForCell
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTES-reminder-detail"), CFSTR("NOTES"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)allowDataDetector
{
  return 1;
}

+ (id)textFromEventAndReminderBlock
{
  return &__block_literal_global_26;
}

id __58__EKReminderNotesDetailItem_textFromEventAndReminderBlock__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "notes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

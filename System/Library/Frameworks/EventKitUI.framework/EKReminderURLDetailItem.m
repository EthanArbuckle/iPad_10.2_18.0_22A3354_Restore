@implementation EKReminderURLDetailItem

- (id)urlAttributedText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMReminder attachmentContext](self->super.super.super._reminder, "attachmentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      CUIKGetAttributedStringForEventDetailWithURL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  void *v4;
  BOOL v5;

  -[EKReminderURLDetailItem urlAttributedText](self, "urlAttributedText", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

+ (id)titleForCell
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("URL-reminder-detail"), CFSTR("URL"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_createEventDetailCell
{
  EKReminderDetailTextCell *v3;
  EKEvent *event;
  REMReminder *reminder;
  _BOOL8 v6;
  void *v7;
  void *v8;
  EKReminderDetailTextCell *v9;

  v3 = [EKReminderDetailTextCell alloc];
  event = self->super.super.super._event;
  reminder = self->super.super.super._reminder;
  v6 = -[EKReminderTextDetailItem showExtraSpaceAtBottom](self, "showExtraSpaceAtBottom");
  objc_msgSend((id)objc_opt_class(), "titleForCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderURLDetailItem urlAttributedText](self, "urlAttributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKReminderDetailTextCell initWithEvent:reminder:editable:showExtraSpaceAtBottom:title:attributedText:](v3, "initWithEvent:reminder:editable:showExtraSpaceAtBottom:title:attributedText:", event, reminder, 0, v6, v7, v8);

  return v9;
}

@end

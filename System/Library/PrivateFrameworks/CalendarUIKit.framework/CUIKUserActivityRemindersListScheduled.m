@implementation CUIKUserActivityRemindersListScheduled

- (CUIKUserActivityRemindersListScheduled)init
{
  CUIKUserActivityRemindersListScheduled *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKUserActivityRemindersListScheduled;
  v2 = -[CUIKUserActivity initWithType:](&v6, sel_initWithType_, 2);
  if (v2)
  {
    CUIKBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Scheduled Reminders"), &stru_1E6EBAE30, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUserActivity setActivityTitle:](v2, "setActivityTitle:", v4);

    -[CUIKUserActivity setActivitySubtitle:](v2, "setActivitySubtitle:", &stru_1E6EBAE30);
  }
  return v2;
}

@end

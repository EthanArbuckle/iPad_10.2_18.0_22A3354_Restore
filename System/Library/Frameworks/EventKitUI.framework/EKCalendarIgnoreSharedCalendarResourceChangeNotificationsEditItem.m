@implementation EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem

- (BOOL)configureWithCalendar:(id)a3
{
  id v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem;
  v3 = a3;
  -[EKCalendarEditItem configureWithCalendar:](&v6, sel_configureWithCalendar_, v3);
  v4 = objc_msgSend(v3, "allowsIgnoringSharedEventChangeNotifications", v6.receiver, v6.super_class);

  return v4;
}

- (void)setUnderlyingCalendarState:(BOOL)a3
{
  -[EKCalendar setIsIgnoringSharedCalendarNotifications:](self->super.super._calendar, "setIsIgnoringSharedCalendarNotifications:", !a3);
}

- (BOOL)underlyingCalendarState
{
  return -[EKCalendar isIgnoringSharedCalendarNotifications](self->super.super._calendar, "isIgnoringSharedCalendarNotifications") ^ 1;
}

- (id)cellText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Show Changes"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionLabelText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Display messages when shared events on this calendar are added, modified, or deleted by other people."), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Shared Events"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

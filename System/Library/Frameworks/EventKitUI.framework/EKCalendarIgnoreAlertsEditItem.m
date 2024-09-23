@implementation EKCalendarIgnoreAlertsEditItem

- (void)setUnderlyingCalendarState:(BOOL)a3
{
  -[EKCalendar setIsIgnoringEventAlerts:](self->super.super._calendar, "setIsIgnoringEventAlerts:", !a3);
}

- (BOOL)underlyingCalendarState
{
  return -[EKCalendar isIgnoringEventAlerts](self->super.super._calendar, "isIgnoringEventAlerts") ^ 1;
}

- (id)cellText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Event Alerts"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionLabelText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Allow events on this calendar to display alerts."), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Notifications"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)cellWrapsLongText
{
  return 1;
}

@end

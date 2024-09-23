@implementation EKCalendarIsAffectingAvailabilityEditItem

+ (BOOL)shouldDisplayForCalendar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "syncs"))
  {
    objc_msgSend(v4, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "supportsAvailabilityRequests")
      && (!objc_msgSend(v4, "isDelegate") || objc_msgSend(v3, "allowsContentModifications"))
      && (objc_msgSend(v3, "isSubscribed") & 1) == 0)
    {
      v6 = objc_msgSend(v3, "isSuggestedEventCalendar") ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)configureWithCalendar:(id)a3
{
  id v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarIsAffectingAvailabilityEditItem;
  v3 = a3;
  -[EKCalendarEditItem configureWithCalendar:](&v6, sel_configureWithCalendar_, v3);
  v4 = objc_msgSend((id)objc_opt_class(), "shouldDisplayForCalendar:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setUnderlyingCalendarState:(BOOL)a3
{
  -[EKCalendar setIsAffectingAvailability:](self->super.super._calendar, "setIsAffectingAvailability:", a3);
}

- (BOOL)underlyingCalendarState
{
  return -[EKCalendar isAffectingAvailability](self->super.super._calendar, "isAffectingAvailability");
}

- (id)cellText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Events Affect Availability"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionLabelText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Events on this calendar will affect your availability for scheduling."), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Availability"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)cellWrapsLongText
{
  return 1;
}

@end

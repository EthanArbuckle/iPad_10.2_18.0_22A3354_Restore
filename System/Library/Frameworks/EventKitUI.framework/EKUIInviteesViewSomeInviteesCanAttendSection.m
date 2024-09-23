@implementation EKUIInviteesViewSomeInviteesCanAttendSection

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Some Invitees Can Attend"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)initialNumberOfTimeSlotsToShow
{
  return 3;
}

- (id)searcherTimeSlots
{
  void *v2;
  void *v3;

  -[EKUIInviteesViewAlternativeTimeSection availabilitySearcher](self, "availabilitySearcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timesWhenSomeAttendeesCanAttend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)customTimeCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)searchingForMoreTimes
{
  void *v2;
  char v3;

  -[EKUIInviteesViewAlternativeTimeSection availabilitySearcher](self, "availabilitySearcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "searchingForMoreTimesWhenSomeAttendeesCanAttend");

  return v3;
}

- (void)searchForMoreTimes
{
  id v2;

  -[EKUIInviteesViewAlternativeTimeSection availabilitySearcher](self, "availabilitySearcher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchForMoreTimesWhenSomeAttendeesCanAttend");

}

@end

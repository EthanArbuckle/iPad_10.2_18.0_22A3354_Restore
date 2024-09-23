@implementation EKEventStore(CUIKCalendarListSorter)

- (id)sortedSourcesEnabledForEntityType:()CUIKCalendarListSorter
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "sourcesEnabledForEntityType:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKCalendarListSorter ekSourceComparator](CUIKCalendarListSorter, "ekSourceComparator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingComparator:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "calendarsForEntityType:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKCalendarListSorter ekCalendarComparator](CUIKCalendarListSorter, "ekCalendarComparator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingComparator:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter passingTest:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a1, "calendarsForEntityType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CalFilter:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKCalendarListSorter ekCalendarComparator](CUIKCalendarListSorter, "ekCalendarComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

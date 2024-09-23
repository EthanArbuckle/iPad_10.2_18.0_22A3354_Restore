@implementation EKSource(CUIKCalendarListSorter)

- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "calendarsForEntityType:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKCalendarListSorter ekCalendarComparator](CUIKCalendarListSorter, "ekCalendarComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter passingTest:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a1, "calendarsForEntityType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CalFilter:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKCalendarListSorter ekCalendarComparator](CUIKCalendarListSorter, "ekCalendarComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

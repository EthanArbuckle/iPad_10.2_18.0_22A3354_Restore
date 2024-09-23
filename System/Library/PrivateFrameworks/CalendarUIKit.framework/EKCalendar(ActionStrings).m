@implementation EKCalendar(ActionStrings)

+ (id)actionStringsDisplayName
{
  void *v0;
  void *v1;

  CUIKBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Calendar"), CFSTR("Calendar"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)actionStringsPluralDisplayName
{
  void *v0;
  void *v1;

  CUIKBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Calendars"), CFSTR("Calendars"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end

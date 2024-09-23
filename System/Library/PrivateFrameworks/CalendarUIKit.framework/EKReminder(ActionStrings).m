@implementation EKReminder(ActionStrings)

+ (id)actionStringsDisplayName
{
  void *v0;
  void *v1;

  CUIKBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Reminder"), CFSTR("Reminder"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)actionStringsPluralDisplayName
{
  void *v0;
  void *v1;

  CUIKBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Reminders"), CFSTR("Reminders"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end

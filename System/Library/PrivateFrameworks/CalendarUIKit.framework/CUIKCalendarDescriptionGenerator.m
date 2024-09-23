@implementation CUIKCalendarDescriptionGenerator

+ (id)localCalendarsGroupTitle
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("On My Mac"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

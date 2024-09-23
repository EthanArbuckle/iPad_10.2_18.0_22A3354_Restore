@implementation CUIKSplashScreenStrings

+ (id)title
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("What’s New in Calendar"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)continueButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)configurationText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("You can configure Calendar features in Settings."), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reminderIntegrationTitle
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Scheduled Reminders"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reminderIntegrationText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("View and create scheduled reminders in calendar. View your day with all the things you need to get done."), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reminderIntegrationIcon
{
  return CFSTR("checklist");
}

+ (id)monthViewScaleTitle
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Customizable Month View"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)monthViewScaleText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Pinch to customize your view on month view to make it easier to see your month at a glance."), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)monthViewScaleIcon
{
  return CFSTR("calendar");
}

+ (id)suggestedEventsTitleText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Suggested Events and Locations"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)suggestedEventsFeatureText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Add events like hotel bookings found in Mail, Messages, and Safari. Calendar will also suggest locations based on your past events."), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)suggestedEventsIcon
{
  return CFSTR("envelope");
}

+ (id)timeToLeaveAndAutomaticGeocodingTitleText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Location"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)timeToLeaveAndAutomaticGeocodingFeatureText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Calendar uses your location to suggest nearby locations and update travel time accuracy."), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)timeToLeaveAndAutomaticGeocodingIcon
{
  return CFSTR("location");
}

@end

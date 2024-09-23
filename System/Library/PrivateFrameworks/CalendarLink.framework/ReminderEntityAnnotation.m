@implementation ReminderEntityAnnotation

+ (id)reminderEntityAnnotationForIntegrationEvent:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (!CalendarUIKitInternalLibraryCore_frameworkLibrary)
    CalendarUIKitInternalLibraryCore_frameworkLibrary = _sl_dlopen();
  if (CalendarUIKitInternalLibraryCore_frameworkLibrary)
  {
    objc_msgSend(v3, "CUIK_reminderEntityAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)reminderEntityIdentifierForIntegrationEvent:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (!CalendarUIKitInternalLibraryCore_frameworkLibrary)
    CalendarUIKitInternalLibraryCore_frameworkLibrary = _sl_dlopen();
  if (CalendarUIKitInternalLibraryCore_frameworkLibrary)
  {
    objc_msgSend(v3, "CUIK_reminderEntityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end

@implementation EKEvent(ReminderEntityAnnotation)

- (CUIKReminderEntityAnnotation)CUIK_reminderEntityAnnotation
{
  return +[CUIKReminderEntityAnnotation annotationWithReminderIntegrationEvent:](CUIKReminderEntityAnnotation, "annotationWithReminderIntegrationEvent:", a1);
}

- (id)CUIK_reminderEntityIdentifier
{
  return +[CUIKReminderEntityAnnotation entityIdentifierForReminderIntegrationEvent:](CUIKReminderEntityAnnotation, "entityIdentifierForReminderIntegrationEvent:", a1);
}

@end

@implementation AEConcreteSystemNotificationPrimitives

- (id)observeAssessmentStateChangeOnQueue:(id)a3 withHandler:(id)a4
{
  return +[AESystemNotificationObservation observationWithNotificationName:queue:notificationHandler:](AESystemNotificationObservation, "observationWithNotificationName:queue:notificationHandler:", CFSTR("AssessmentStateDidChange"), a3, a4);
}

@end

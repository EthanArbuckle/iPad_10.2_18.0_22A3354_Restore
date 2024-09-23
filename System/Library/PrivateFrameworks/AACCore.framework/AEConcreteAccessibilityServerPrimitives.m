@implementation AEConcreteAccessibilityServerPrimitives

- (BOOL)isRestrictedForAAC
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestrictedForAAC");

  return v3;
}

- (id)observeGuidedAccessActiveStateChangeOnQueue:(id)a3 withHandler:(id)a4
{
  return +[AESystemNotificationObservation observationWithNotificationName:queue:notificationHandler:](AESystemNotificationObservation, "observationWithNotificationName:queue:notificationHandler:", *MEMORY[0x24BE000F8], a3, a4);
}

@end

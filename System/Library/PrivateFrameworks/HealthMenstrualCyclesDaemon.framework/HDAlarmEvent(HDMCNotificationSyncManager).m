@implementation HDAlarmEvent(HDMCNotificationSyncManager)

- (id)hdmc_notificationHoldInstruction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "hdmc_categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentDueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D88]), "initWithAction:categoryIdentifier:expirationDate:", 2, v2, v4);
  return v5;
}

@end

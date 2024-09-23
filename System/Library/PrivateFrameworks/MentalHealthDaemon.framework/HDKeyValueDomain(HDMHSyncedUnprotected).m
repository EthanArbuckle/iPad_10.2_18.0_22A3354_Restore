@implementation HDKeyValueDomain(HDMHSyncedUnprotected)

- (uint64_t)hdmh_setUpdatedPeriodicPromptedAssessmentNotificationFireDate:()HDMHSyncedUnprotected error:
{
  return objc_msgSend(a1, "setDate:forKey:error:", a3, *MEMORY[0x24BE65D90], a4);
}

- (uint64_t)hdmh_updatedPeriodicPromptedAssessmentNotificationFireDateWithError:()HDMHSyncedUnprotected
{
  return objc_msgSend(a1, "dateForKey:error:", *MEMORY[0x24BE65D90], a3);
}

@end

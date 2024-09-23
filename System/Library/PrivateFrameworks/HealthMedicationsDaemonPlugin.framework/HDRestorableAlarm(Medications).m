@implementation HDRestorableAlarm(Medications)

- (id)medicationNotificationEventWithScheduleItem:()Medications dueDate:isFollowUp:isCritical:medicationsCount:
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v12 = a4;
  objc_msgSend(a3, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "longValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@%@%li%@%@%@%li"), CFSTR("scheduleItemId"), CFSTR(":"), v13, CFSTR(","), CFSTR("isFollowUp"), CFSTR(":"), v15, CFSTR(","), CFSTR("isCritical"), CFSTR(":"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "eventWithIdentifier:dueDate:eventOptions:clientOptions:", v18, v12, 0, a7 > 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (uint64_t)medicationExpirationEventWithScheduleItemIdentifier:()Medications dueDate:
{
  return objc_msgSend(a1, "eventWithIdentifier:dueDate:eventOptions:", a3, a4, 0);
}

@end

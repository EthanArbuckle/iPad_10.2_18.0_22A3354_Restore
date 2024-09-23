@implementation UNNotificationRequest(HKMedications)

+ (id)hkmd_requestForNotification:()HKMedications
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[UNNotificationRequest _requestIDForNotification:](a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UNNotificationRequest _contentForNotification:](a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hkmd_requestForTimeZoneNotification
{
  void *v0;
  void *v1;

  +[UNNotificationRequest _timeZoneContent]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", CFSTR("MedicationTimeZoneNotificationIdentifier"), v0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)isNotMissedCategory:()HKMedications
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissed")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissed.Singular")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp.Singular"));
  }

  return v4;
}

@end

@implementation UNNotificationRequest(HKMentalHealth)

+ (id)hkmh_requestForCategoryIdentifier:()HKMentalHealth
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_contentForCategoryIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_contentForCategoryIdentifier:()HKMentalHealth
{
  id v3;
  id v4;
  id v5;
  __CFString *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDF8800]);
  v5 = v3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MentalHealthAppPlugin.CustomReminder")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("MentalHealthAppPlugin.MiddayReminder")) & 1) != 0)
  {
    v6 = CFSTR("NOTIFICATION_STATE_OF_MIND_MOMENTARY_TITLE");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MentalHealthAppPlugin.EndOfDayReminder")) & 1) != 0)
  {
    v6 = CFSTR("NOTIFICATION_STATE_OF_MIND_DAILY_TITLE");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("MentalHealthAppPlugin.PeriodicPromptedAssessmentReminder")))
    {
      v7 = 0;
      goto LABEL_5;
    }
    v6 = CFSTR("NOTIFICATION_PERIODIC_PROMPTED_ASSESSMENTS_TITLE");
  }
  HKMHLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  objc_msgSend(v4, "setTitle:", v7);
  v8 = v5;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MentalHealthAppPlugin.CustomReminder")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("MentalHealthAppPlugin.MiddayReminder")) & 1) != 0)
  {
    v9 = CFSTR("NOTIFICATION_STATE_OF_MIND_MOMENTARY_BODY");
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MentalHealthAppPlugin.EndOfDayReminder")) & 1) != 0)
  {
    v9 = CFSTR("NOTIFICATION_STATE_OF_MIND_DAILY_BODY");
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("MentalHealthAppPlugin.PeriodicPromptedAssessmentReminder")))
    {
      v10 = 0;
      goto LABEL_9;
    }
    v9 = CFSTR("NOTIFICATION_PERIODIC_PROMPTED_ASSESSMENTS_BODY_IOS");
  }
  HKMHLocalizedString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  objc_msgSend(v4, "setBody:", v10);
  objc_msgSend(v4, "setCategoryIdentifier:", v8);
  objc_msgSend(MEMORY[0x24BDF8870], "defaultSound");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSound:", v11);

  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_2511A1408, *MEMORY[0x24BDD46A8]);
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setUserInfo:", v14);

  return v4;
}

@end

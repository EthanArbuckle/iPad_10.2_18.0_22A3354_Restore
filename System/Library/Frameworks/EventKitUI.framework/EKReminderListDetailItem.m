@implementation EKReminderListDetailItem

+ (id)titleForCell
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LIST-reminder-detail"), CFSTR("LIST"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)allowDataDetector
{
  return 0;
}

+ (id)textFromEventAndReminderBlock
{
  return &__block_literal_global_69;
}

id __57__EKReminderListDetailItem_textFromEventAndReminderBlock__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D0C320];
  objc_msgSend(a3, "list");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitleForTitle:isSuggestedEventCalendar:isBirthdayCalendar:allowsReminders:isIntegrationCalendar:", v5, 0, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

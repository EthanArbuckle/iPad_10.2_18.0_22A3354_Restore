@implementation CALNTriggeredEventNotificationActionUtilities

+ (CALNNotificationAction)snoozeAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnoozeActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeFor5MinutesAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze for 5 minutes"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnooze5MinutesActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeFor15MinutesAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze for 15 minutes"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnooze15MinutesActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeFor30MinutesAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze for 30 minutes"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnooze30MinutesActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeFor1HourAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze for 1 hour"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnooze1HourActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeUntil30MinutesBeforeAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze until 30 minutes before"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnoozeUntil30MinutesBeforeActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeUntil15MinutesBeforeAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze until 15 minutes before"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnoozeUntil15MinutesBeforeActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeUntil5MinutesBeforeAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze until 5 minutes before"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnoozeUntil5MinutesBeforeActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeUntilStartTimeAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze until start time"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnoozeUntilStartActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)snoozeUntilEndTimeAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Snooze until end time"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNTriggeredEventNotificationSnoozeUntilEndActionIdentifier"), v3, CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)directionsAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Directions"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationDirectionsAction"), v3, CFSTR("mappin.and.ellipse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)conferenceCallAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Join Meeting"), &stru_24D4856D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationConferenceCallAction"), v3, CFSTR("person.2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

+ (CALNNotificationAction)mailOrganizerAction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EventNotificationEmailSenderButton"), CFSTR("Email Sender"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("Mail_identifier"), v3, CFSTR("person.crop.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALNNotificationAction *)v4;
}

@end

@implementation CALNUNNotificationSoundMapper

+ (id)unNotificationSoundFromCALNNotificationSound:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDF8870];
  v4 = a3;
  objc_msgSend(v3, "soundWithAlertType:", objc_msgSend(v4, "alertType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "alertTopic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlertTopic:", v7);
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

+ (id)calnNotificationSoundFromUNNotificationSound:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "alertType");
  objc_msgSend(v3, "alertTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNMutableNotificationSound, "soundWithAlertType:alertTopic:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

@implementation CALNResourceChangedLaunchUtils

+ (void)setResourceChangedEventURLForCalendarNotification:(id)a3 onNotificationContent:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(a3, "startDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("calshow:%.0f"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfoValue:forKey:", v8, CFSTR("kCALNResourceChangedShowEventURLKey"));

}

@end

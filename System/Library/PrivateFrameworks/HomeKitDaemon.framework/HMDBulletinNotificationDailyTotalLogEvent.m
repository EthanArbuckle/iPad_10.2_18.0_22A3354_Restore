@implementation HMDBulletinNotificationDailyTotalLogEvent

- (HMDBulletinNotificationDailyTotalLogEvent)initWithTopic:(id)a3 countForTopic:(unint64_t)a4 userNotificationSettings:(id)a5
{
  id v9;
  id v10;
  HMDBulletinNotificationDailyTotalLogEvent *v11;
  HMDBulletinNotificationDailyTotalLogEvent *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  objc_super v22;

  v9 = a3;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDBulletinNotificationDailyTotalLogEvent;
  v11 = -[HMMLogEvent init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_topic, a3);
    v12->_topicCount = a4;
    v13 = v10;
    v14 = objc_msgSend(v13, "authorizationStatus");
    v15 = objc_msgSend(v13, "lockScreenSetting");
    v16 = objc_msgSend(v13, "notificationCenterSetting");
    v17 = objc_msgSend(v13, "criticalAlertSetting");
    v18 = objc_msgSend(v13, "timeSensitiveSetting");

    v19 = v16 == 2 || v15 == 2;
    v20 = 3;
    if (!v19)
      v20 = 1;
    if (v17 == 2)
      v20 |= 4uLL;
    if (v18 == 2)
      v20 |= 8uLL;
    if (v14 != 2)
      v20 = 0;
    v12->_bulletinNotificationSettings = v20;
  }

  return v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.daemon.bulletinNotificationDailyTotal");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("topic");
  -[HMDBulletinNotificationDailyTotalLogEvent topic](self, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("topicCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDBulletinNotificationDailyTotalLogEvent topicCount](self, "topicCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("bulletinNotificationSettings");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDBulletinNotificationDailyTotalLogEvent bulletinNotificationSettings](self, "bulletinNotificationSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)topicCount
{
  return self->_topicCount;
}

- (unint64_t)bulletinNotificationSettings
{
  return self->_bulletinNotificationSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

@end

@implementation FCCAchievementNotificationContent

- (FCCAchievementNotificationContent)initWithAchievement:(id)a3
{
  id v5;
  FCCAchievementNotificationContent *v6;
  FCCAchievementNotificationContent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCAchievementNotificationContent;
  v6 = -[FCCAchievementNotificationContent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_achievement, a3);

  return v7;
}

- (FCCAchievementNotificationContent)initWithTransportData:(id)a3
{
  id v4;
  FCCAchievementNotificationContentProtobuf *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FCCAchievementNotificationContent *v10;

  v4 = a3;
  v5 = -[FCCAchievementNotificationContentProtobuf initWithData:]([FCCAchievementNotificationContentProtobuf alloc], "initWithData:", v4);

  v6 = objc_alloc(MEMORY[0x1E0CF5008]);
  -[FCCAchievementNotificationContentProtobuf achievementData](v5, "achievementData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF4FE0]), "initWithCodable:", v8);
  v10 = -[FCCAchievementNotificationContent initWithAchievement:](self, "initWithAchievement:", v9);

  return v10;
}

- (id)transportData
{
  FCCAchievementNotificationContentProtobuf *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(FCCAchievementNotificationContentProtobuf);
  ACHCodableFromAchievement();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCAchievementNotificationContentProtobuf setAchievementData:](v2, "setAchievementData:", v4);

  -[FCCAchievementNotificationContentProtobuf data](v2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievement, 0);
}

@end

@implementation ATXNotificationRankingSection

- (ATXNotificationRankingSection)initWithUserNotifications:(id)a3 featureSet:(id)a4
{
  id v7;
  id v8;
  ATXNotificationRankingSection *v9;
  ATXNotificationRankingSection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationRankingSection;
  v9 = -[ATXNotificationRankingSection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userNotifications, a3);
    objc_storeStrong((id *)&v10->_featureSet, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXNotificationRankingFeatureSet *featureSet;
  id v5;

  featureSet = self->_featureSet;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", featureSet, CFSTR("featureSet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userNotifications, CFSTR("userNotifications"));

}

- (ATXNotificationRankingSection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXNotificationRankingSection *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_categorization();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("userNotifications"), v4, 1, CFSTR("ATXNotificationRankingSectionError"), -1, v9, v16[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureSet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v12 = 0;
    }
    else
    {
      self = -[ATXNotificationRankingSection initWithUserNotifications:featureSet:](self, "initWithUserNotifications:featureSet:", v10, v13);
      v12 = self;
    }

  }
  return v12;
}

- (NSArray)userNotifications
{
  return self->_userNotifications;
}

- (ATXNotificationRankingFeatureSet)featureSet
{
  return self->_featureSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_userNotifications, 0);
}

@end

@implementation ATXNotificationRankingResult

- (ATXNotificationRankingResult)initWithnotificationRankingSections:(id)a3
{
  id v5;
  ATXNotificationRankingResult *v6;
  ATXNotificationRankingResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationRankingResult;
  v6 = -[ATXNotificationRankingResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationRankingSections, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_notificationRankingSections, CFSTR("notificationRankingSections"));
}

- (ATXNotificationRankingResult)initWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXNotificationRankingResult *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_categorization();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("notificationRankingSections"), v6, 1, CFSTR("error"), -1, v9, v14[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[ATXNotificationRankingResult initWithnotificationRankingSections:](self, "initWithnotificationRankingSections:", v10);
    v12 = self;
  }

  return v12;
}

- (NSArray)notificationRankingSections
{
  return self->_notificationRankingSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRankingSections, 0);
}

@end

@implementation ATXNotificationRankingRequest

- (ATXNotificationRankingRequest)initWithUserNotifications:(id)a3 useLLM:(BOOL)a4
{
  id v6;
  ATXNotificationRankingRequest *v7;
  uint64_t v8;
  NSArray *userNotifications;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationRankingRequest;
  v7 = -[ATXNotificationRankingRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    userNotifications = v7->_userNotifications;
    v7->_userNotifications = (NSArray *)v8;

    v7->_useLLM = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *userNotifications;
  id v5;

  userNotifications = self->_userNotifications;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userNotifications, CFSTR("userNotifications"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useLLM, CFSTR("useLLM"));

}

- (ATXNotificationRankingRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXNotificationRankingRequest *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_categorization();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("userNotifications"), v4, 1, CFSTR("ATXNotificationRankingRequestErrorDomain"), -1, v9, v14[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[ATXNotificationRankingRequest initWithUserNotifications:useLLM:](self, "initWithUserNotifications:useLLM:", v10, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLLM")));
    v12 = self;
  }

  return v12;
}

- (NSArray)userNotifications
{
  return self->_userNotifications;
}

- (BOOL)useLLM
{
  return self->_useLLM;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotifications, 0);
}

@end

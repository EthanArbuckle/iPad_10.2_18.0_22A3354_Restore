@implementation NEAppPushProvider

- (void)stopWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  (*((void (**)(void *))completionHandler + 2))(completionHandler);
}

- (void)reportIncomingCallWithUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NEAppPushProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = userInfo;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: reporting incoming call", (uint8_t *)&v7, 0xCu);
  }

  -[NEProvider context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportIncomingCall:", v4);

}

- (void)reportPushToTalkMessageWithUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NEAppPushProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = userInfo;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: reporting PushToTalk message", (uint8_t *)&v7, 0xCu);
  }

  -[NEProvider context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportPushToTalkMessage:", v4);

}

- (NEAppPushProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEAppPushProvider;
  return -[NEProvider init](&v3, sel_init);
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProviderConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
}

@end

@implementation AMSPushConfiguration

- (NSSet)enabledActionTypes
{
  return self->_enabledActionTypes;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)engagementPushTopic
{
  return self->_engagementPushTopic;
}

- (void)setUserNotificationExtensionId:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationExtensionId, a3);
}

- (void)setEnabledActionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_enabledActionTypes, a3);
}

- (AMSPushConfiguration)initWithEnabledActionTypes:(id)a3
{
  id v5;
  AMSPushConfiguration *v6;
  AMSPushConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPushConfiguration;
  v6 = -[AMSPushConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_enabledActionTypes, a3);

  return v7;
}

- (void)setEngagementPushTopic:(id)a3
{
  objc_storeStrong((id *)&self->_engagementPushTopic, a3);
}

- (NSString)userNotificationExtensionId
{
  return self->_userNotificationExtensionId;
}

- (AMSPushHandlerDelegate)delegate
{
  return (AMSPushHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enabledActionTypes, 0);
  objc_storeStrong((id *)&self->_userNotificationExtensionId, 0);
  objc_storeStrong((id *)&self->_engagementPushTopic, 0);
}

@end

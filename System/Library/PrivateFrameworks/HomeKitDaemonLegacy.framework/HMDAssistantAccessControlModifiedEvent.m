@implementation HMDAssistantAccessControlModifiedEvent

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)areActivityNotificationsEnabledForPersonalRequests
{
  return self->_areActivityNotificationsEnabledForPersonalRequests;
}

- (void)setAreActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  self->_areActivityNotificationsEnabledForPersonalRequests = a3;
}

- (unint64_t)numEnabledAccessories
{
  return self->_numEnabledAccessories;
}

- (void)setNumEnabledAccessories:(unint64_t)a3
{
  self->_numEnabledAccessories = a3;
}

- (unint64_t)numCapableAccessories
{
  return self->_numCapableAccessories;
}

- (void)setNumCapableAccessories:(unint64_t)a3
{
  self->_numCapableAccessories = a3;
}

+ (id)eventWithIsEnabled:(BOOL)a3 options:(unint64_t)a4 areActivityNotificationsEnabledForPersonalRequests:(BOOL)a5 numEnabledAccessories:(unint64_t)a6 numCapableAccessories:(unint64_t)a7
{
  _BOOL8 v9;
  _BOOL8 v11;
  HMDAssistantAccessControlModifiedEvent *v12;

  v9 = a5;
  v11 = a3;
  v12 = objc_alloc_init(HMDAssistantAccessControlModifiedEvent);
  -[HMDAssistantAccessControlModifiedEvent setIsEnabled:](v12, "setIsEnabled:", v11);
  -[HMDAssistantAccessControlModifiedEvent setOptions:](v12, "setOptions:", a4);
  -[HMDAssistantAccessControlModifiedEvent setAreActivityNotificationsEnabledForPersonalRequests:](v12, "setAreActivityNotificationsEnabledForPersonalRequests:", v9);
  -[HMDAssistantAccessControlModifiedEvent setNumEnabledAccessories:](v12, "setNumEnabledAccessories:", a6);
  -[HMDAssistantAccessControlModifiedEvent setNumCapableAccessories:](v12, "setNumCapableAccessories:", a7);
  return v12;
}

@end

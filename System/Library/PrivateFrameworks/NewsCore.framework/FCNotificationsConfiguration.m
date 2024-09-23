@implementation FCNotificationsConfiguration

- (FCNotificationsConfiguration)initWithPresubscribedChannelIDs:(id)a3 recommendedNotificationChannelIDs:(id)a4
{
  id v6;
  id v7;
  FCNotificationsConfiguration *v8;
  uint64_t v9;
  NSArray *preSubscribedNotificationsChannelIDs;
  uint64_t v11;
  NSArray *recommendedNotificationChannelIDs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCNotificationsConfiguration;
  v8 = -[FCNotificationsConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    preSubscribedNotificationsChannelIDs = v8->_preSubscribedNotificationsChannelIDs;
    v8->_preSubscribedNotificationsChannelIDs = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    recommendedNotificationChannelIDs = v8->_recommendedNotificationChannelIDs;
    v8->_recommendedNotificationChannelIDs = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)preSubscribedNotificationsChannelIDs
{
  return self->_preSubscribedNotificationsChannelIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedNotificationChannelIDs, 0);
  objc_storeStrong((id *)&self->_preSubscribedNotificationsChannelIDs, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6
    && objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", self->_preSubscribedNotificationsChannelIDs, v6[1]))
  {
    v7 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", self->_recommendedNotificationChannelIDs, v6[2]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_preSubscribedNotificationsChannelIDs, "hash");
  return -[NSArray hash](self->_recommendedNotificationChannelIDs, "hash") ^ v3;
}

- (NSArray)recommendedNotificationChannelIDs
{
  return self->_recommendedNotificationChannelIDs;
}

@end

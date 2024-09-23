@implementation IDSCKNotification

+ (Class)__class
{
  if (qword_1EE40B170 != -1)
    dispatch_once(&qword_1EE40B170, &unk_1E3C1BD90);
  return (Class)(id)qword_1EE40B168;
}

+ (id)notificationFromRemoteNotificationDictionary:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  v3 = a3;
  v4 = (void *)CUTWeakLinkClass();
  objc_msgSend_notificationFromRemoteNotificationDictionary_(v4, v5, (uint64_t)v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

@end

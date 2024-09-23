@implementation HMDRemoteMessageNotifications

- (HMDRemoteMessageNotifications)init
{
  HMDRemoteMessageNotifications *v2;
  HMDRemoteMessageNotifications *v3;
  uint64_t v4;
  NSMapTable *sessionNotificationPayloads;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteMessageNotifications;
  v2 = -[HMDRemoteMessageNotifications init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock.lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    sessionNotificationPayloads = v3->_sessionNotificationPayloads;
    v3->_sessionNotificationPayloads = (NSMapTable *)v4;

  }
  return v3;
}

- (id)_notificationPayloadsForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDRemoteMessageNotifications sessionNotificationPayloads](self, "sessionNotificationPayloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessageNotifications sessionNotificationPayloads](self, "sessionNotificationPayloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (void)addNotificationPayload:(id)a3 identifier:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  hmf_unfair_data_lock_s *p_lock;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDRemoteMessageNotifications _notificationPayloadsForDevice:](self, "_notificationPayloadsForDevice:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v8);

  os_unfair_lock_unlock(&p_lock->lock);
}

- (void)removeNotificationPayloadWithIdentifier:(id)a3 device:(id)a4
{
  id v6;
  hmf_unfair_data_lock_s *p_lock;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDRemoteMessageNotifications _notificationPayloadsForDevice:](self, "_notificationPayloadsForDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(&p_lock->lock);
}

- (id)notificationPayloadWithIdentifier:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  hmf_unfair_data_lock_s *p_lock;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDRemoteMessageNotifications _notificationPayloadsForDevice:](self, "_notificationPayloadsForDevice:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&p_lock->lock);
  return v10;
}

- (void)clearNotificationsForDevice:(id)a3
{
  hmf_unfair_data_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDRemoteMessageNotifications sessionNotificationPayloads](self, "sessionNotificationPayloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  os_unfair_lock_unlock(&p_lock->lock);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDRemoteMessageNotifications sessionNotificationPayloads](self, "sessionNotificationPayloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Session notifications: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMapTable)sessionNotificationPayloads
{
  return self->_sessionNotificationPayloads;
}

- (void)setSessionNotificationPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_sessionNotificationPayloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionNotificationPayloads, 0);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("kCharacteristicWriteRequestKey");
  v4[1] = CFSTR("kCharacteristicReadRequestKey");
  v4[2] = CFSTR("kMultipleCharacteristicWriteRequestKey");
  v4[3] = CFSTR("kMultipleCharacteristicReadRequestKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_messagesWithNotificationResponses;
  _messagesWithNotificationResponses = v2;

}

+ (id)messagesWithNotificationResponses
{
  return (id)_messagesWithNotificationResponses;
}

+ (BOOL)messageExpectsNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "messagesWithNotificationResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

@end

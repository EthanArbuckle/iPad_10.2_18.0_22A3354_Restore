@implementation EDUserNotificationFilter

- (EDUserNotificationFilter)initWithBlockedSenderReader:(id)a3 vipReader:(id)a4
{
  id v7;
  id v8;
  EDUserNotificationFilter *v9;
  EDUserNotificationFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDUserNotificationFilter;
  v9 = -[EDUserNotificationFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_blockedSenderReader, a3);
    objc_storeStrong((id *)&v10->_vipReader, a4);
  }

  return v10;
}

- (id)messagesNeedingNotification:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__EDUserNotificationFilter_messagesNeedingNotification___block_invoke;
  v4[3] = &unk_1E949D590;
  v4[4] = self;
  objc_msgSend(a3, "ef_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__EDUserNotificationFilter_messagesNeedingNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_messageNeedsNotification:", a2);
}

- (BOOL)_messageNeedsNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  BOOL v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "flags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conversationFlags");
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isServerSearchResult"))
  {
    EDUserNotificationCenterLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "remoteID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v11;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is a server search result.", (uint8_t *)&v28, 0xCu);

    }
  }
  else if (objc_msgSend(v5, "read"))
  {
    EDUserNotificationCenterLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "remoteID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is marked as read.", (uint8_t *)&v28, 0xCu);

    }
  }
  else
  {
    -[EDUserNotificationFilter blockedSenderReader](self, "blockedSenderReader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senders");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEmailAddressBlocked:", v15);

    if (!v16)
    {
      if (v6 == 4)
      {
        -[EDUserNotificationFilter vipReader](self, "vipReader");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "senders");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isVIPAddress:", v20);

        if ((v21 & 1) == 0)
        {
          EDUserNotificationCenterLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "remoteID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138543362;
            v29 = v22;
            _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is in a muted conversation.", (uint8_t *)&v28, 0xCu);

          }
          goto LABEL_17;
        }
      }
      else
      {
        objc_msgSend(v4, "displayDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "ef_isEarlierThanDate:", v9);

        if (v24)
        {
          EDUserNotificationCenterLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "remoteID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138543362;
            v29 = v25;
            _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message %{public}@ because it is more than a week old", (uint8_t *)&v28, 0xCu);

          }
          goto LABEL_17;
        }
      }
      v26 = 1;
      goto LABEL_18;
    }
    EDUserNotificationCenterLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "remoteID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v17;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is from a blocked sender.", (uint8_t *)&v28, 0xCu);

    }
  }
LABEL_17:

  v26 = 0;
LABEL_18:

  return v26;
}

- (EMBlockedSenderReader)blockedSenderReader
{
  return self->_blockedSenderReader;
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipReader, 0);
  objc_storeStrong((id *)&self->_blockedSenderReader, 0);
}

@end

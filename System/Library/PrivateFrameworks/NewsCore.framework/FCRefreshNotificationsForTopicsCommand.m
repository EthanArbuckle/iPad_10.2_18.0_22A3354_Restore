@implementation FCRefreshNotificationsForTopicsCommand

- (FCRefreshNotificationsForTopicsCommand)initWithTopicsIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  FCRefreshNotificationsForTopicsCommand *v20;
  FCRefreshNotificationsForTopicsCommand *v21;
  FCRefreshNotificationsForTopicsCommand *v22;
  id obj;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v16 = a6;
  v17 = a7;
  obj = a8;
  v18 = a8;
  v19 = v18;
  v20 = 0;
  if (v16 && v17 && v18)
  {
    v28.receiver = self;
    v28.super_class = (Class)FCRefreshNotificationsForTopicsCommand;
    v21 = -[FCRefreshNotificationsForTopicsCommand init](&v28, sel_init);
    v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_topicIDs, a3);
      objc_storeStrong((id *)&v22->_topicGroupingID, a4);
      objc_storeStrong((id *)&v22->_channelID, a5);
      objc_storeStrong((id *)&v22->_userID, a6);
      objc_storeStrong((id *)&v22->_deviceToken, a7);
      objc_storeStrong((id *)&v22->_storefrontID, obj);
      v22->_deviceDigestMode = a9;
    }
    self = v22;
    v20 = self;
  }

  return v20;
}

- (FCRefreshNotificationsForTopicsCommand)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  FCRefreshNotificationsForTopicsCommand *v15;
  uint64_t v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("TopicIDsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TopicGroupingID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FromChannelIDKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceTokenKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StorefrontIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("DigestModeKey"));

  LODWORD(v17) = v14;
  v15 = -[FCRefreshNotificationsForTopicsCommand initWithTopicsIDs:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:](self, "initWithTopicsIDs:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:", v8, v9, v10, v11, v12, v13, v17);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[FCRefreshNotificationsForTopicsCommand topicIDs](self, "topicIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("TopicIDsKey"));

  -[FCRefreshNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("TopicGroupingID"));

  -[FCRefreshNotificationsForTopicsCommand channelID](self, "channelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("FromChannelIDKey"));

  -[FCRefreshNotificationsForTopicsCommand userID](self, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("UserIDKey"));

  -[FCRefreshNotificationsForTopicsCommand deviceToken](self, "deviceToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("DeviceTokenKey"));

  -[FCRefreshNotificationsForTopicsCommand storefrontID](self, "storefrontID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("StorefrontIDKey"));

  objc_msgSend(v10, "encodeInt:forKey:", -[FCRefreshNotificationsForTopicsCommand deviceDigestMode](self, "deviceDigestMode"), CFSTR("DigestModeKey"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a4;
  v8 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[FCRefreshNotificationsForTopicsCommand topicIDs](self, "topicIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRefreshNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: executing command topicIDs: %{public}@ groupingID: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v7, "notificationsEndpointConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForTopicsCommand topicIDs](self, "topicIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForTopicsCommand channelID](self, "channelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForTopicsCommand userID](self, "userID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForTopicsCommand deviceToken](self, "deviceToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForTopicsCommand storefrontID](self, "storefrontID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  v19 = -[FCRefreshNotificationsForTopicsCommand deviceDigestMode](self, "deviceDigestMode");
  dispatch_get_global_queue(-2, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __87__FCRefreshNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v25[3] = &unk_1E463BC78;
  v25[4] = self;
  v26 = v24;
  v21 = v24;
  LODWORD(v22) = v19;
  objc_msgSend(v12, "refreshNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:", v13, v14, v15, v16, v17, v18, v22, v20, v25);

}

void __87__FCRefreshNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = FCPushNotificationsLog;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "topicGroupingID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: succeeded refreshing topics for groupID: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "refreshNotificationsCommand: failed to refresh notifications with error: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v12 = 1;
    }
    else
    {
      v13 = objc_msgSend(v5, "fc_shouldRetry");
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      if (v13)
        v12 = 2;
      else
        v12 = 3;
    }
  }
  objc_msgSend(v10, "command:didFinishWithStatus:", v11, v12);

}

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)topicGroupingID
{
  return self->_topicGroupingID;
}

- (void)setTopicGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setDeviceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)deviceDigestMode
{
  return self->_deviceDigestMode;
}

- (void)setDeviceDigestMode:(int)a3
{
  self->_deviceDigestMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_topicGroupingID, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
}

@end

@implementation FCRefreshNotificationsForChannelsCommand

- (FCRefreshNotificationsForChannelsCommand)initWithChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  FCRefreshNotificationsForChannelsCommand *v18;
  FCRefreshNotificationsForChannelsCommand *v19;
  FCRefreshNotificationsForChannelsCommand *v20;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  v18 = 0;
  if (v14 && v15 && v16)
  {
    v25.receiver = self;
    v25.super_class = (Class)FCRefreshNotificationsForChannelsCommand;
    v19 = -[FCRefreshNotificationsForChannelsCommand init](&v25, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_channelIDs, a3);
      objc_storeStrong((id *)&v20->_paidChannelIDs, a4);
      objc_storeStrong((id *)&v20->_userID, a5);
      objc_storeStrong((id *)&v20->_deviceToken, a6);
      objc_storeStrong((id *)&v20->_storefrontID, a7);
      v20->_deviceDigestMode = a8;
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (FCRefreshNotificationsForChannelsCommand)initWithCoder:(id)a3
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
  uint64_t v13;
  FCRefreshNotificationsForChannelsCommand *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ChannelIDsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("PaidChannelIDsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserIDKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceTokenKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StorefrontIDKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("DigestModeKey"));

  v14 = -[FCRefreshNotificationsForChannelsCommand initWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:](self, "initWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:", v8, v9, v10, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FCRefreshNotificationsForChannelsCommand channelIDs](self, "channelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("ChannelIDsKey"));

  -[FCRefreshNotificationsForChannelsCommand paidChannelIDs](self, "paidChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("PaidChannelIDsKey"));

  -[FCRefreshNotificationsForChannelsCommand userID](self, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("UserIDKey"));

  -[FCRefreshNotificationsForChannelsCommand deviceToken](self, "deviceToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("DeviceTokenKey"));

  -[FCRefreshNotificationsForChannelsCommand storefrontID](self, "storefrontID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("StorefrontIDKey"));

  objc_msgSend(v9, "encodeInt:forKey:", -[FCRefreshNotificationsForChannelsCommand deviceDigestMode](self, "deviceDigestMode"), CFSTR("DigestModeKey"));
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
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  FCRefreshNotificationsForChannelsCommand *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = a4;
  v8 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[FCRefreshNotificationsForChannelsCommand channelIDs](self, "channelIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRefreshNotificationsForChannelsCommand paidChannelIDs](self, "paidChannelIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: executing command channelIDs: %{public}@ paidChannelIDs: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v7, "notificationsEndpointConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForChannelsCommand channelIDs](self, "channelIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForChannelsCommand paidChannelIDs](self, "paidChannelIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForChannelsCommand userID](self, "userID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForChannelsCommand deviceToken](self, "deviceToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRefreshNotificationsForChannelsCommand storefrontID](self, "storefrontID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FCRefreshNotificationsForChannelsCommand deviceDigestMode](self, "deviceDigestMode");
  dispatch_get_global_queue(-2, 0);
  v19 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __89__FCRefreshNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v23[3] = &unk_1E463BC78;
  v24 = v22;
  v25 = self;
  v21 = v22;
  objc_msgSend(v12, "refreshNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:", v13, v14, v15, v16, v17, v18, v20, v23);

}

void __89__FCRefreshNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = FCPushNotificationsLog;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: succeeded refreshing channels", (uint8_t *)&v11, 2u);
    }
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "refreshNotificationsCommand: failed to refresh notifications with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 1;
    }
    else
    {
      v10 = objc_msgSend(v5, "fc_shouldRetry");
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      if (v10)
        v9 = 2;
      else
        v9 = 3;
    }
  }
  objc_msgSend(v7, "command:didFinishWithStatus:", v8, v9);

}

- (NSArray)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)paidChannelIDs
{
  return self->_paidChannelIDs;
}

- (void)setPaidChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setDeviceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_paidChannelIDs, 0);
  objc_storeStrong((id *)&self->_channelIDs, 0);
}

@end

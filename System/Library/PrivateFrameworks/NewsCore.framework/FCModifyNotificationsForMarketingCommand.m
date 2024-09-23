@implementation FCModifyNotificationsForMarketingCommand

- (FCModifyNotificationsForMarketingCommand)initWithType:(int)a3 action:(int)a4 iTunesDSID:(id)a5
{
  id v8;
  FCModifyNotificationsForMarketingCommand *v9;
  uint64_t v10;
  NSString *dsid;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FCModifyNotificationsForMarketingCommand;
  v9 = -[FCModifyNotificationsForMarketingCommand init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    dsid = v9->_dsid;
    v9->_dsid = (NSString *)v10;

    v9->_type = a3;
    v9->_action = a4;
  }

  return v9;
}

- (FCModifyNotificationsForMarketingCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  FCModifyNotificationsForMarketingCommand *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("com.apple.news.modify_notifications_for_marketing_type_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("com.apple.news.modify_notifications_for_marketing_action_key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("com.apple.news.modify_notifications_for_marketing_dsid_key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FCModifyNotificationsForMarketingCommand initWithType:action:iTunesDSID:](self, "initWithType:action:iTunesDSID:", v6, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInt:", -[FCModifyNotificationsForMarketingCommand type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("com.apple.news.modify_notifications_for_marketing_type_key"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FCModifyNotificationsForMarketingCommand action](self, "action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("com.apple.news.modify_notifications_for_marketing_action_key"));

  -[FCModifyNotificationsForMarketingCommand dsid](self, "dsid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("com.apple.news.modify_notifications_for_marketing_dsid_key"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  FCModifyNotificationsForMarketingCommand *v21;
  _QWORD *v22;
  uint8_t *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[3];
  char v35;

  v7 = a3;
  v18 = a4;
  v8 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForMarketingCommand: executing command", buf, 2u);
  }
  v9 = dispatch_group_create();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 1;
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__75;
  v32 = __Block_byref_object_dispose__75;
  v33 = 0;
  dispatch_group_enter(v9);
  objc_msgSend(v7, "notificationsEndpointConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCModifyNotificationsForMarketingCommand type](self, "type");
  v12 = -[FCModifyNotificationsForMarketingCommand action](self, "action");
  -[FCModifyNotificationsForMarketingCommand dsid](self, "dsid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v24[3] = &unk_1E463F7E8;
  v26 = v34;
  v27 = buf;
  v16 = v9;
  v25 = v16;
  objc_msgSend(v10, "modifyMarketingSubscriptionWithType:action:dsid:callbackQueue:completion:", v11, v12, v13, v14, v24);

  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke_7;
  block[3] = &unk_1E4649E58;
  v20 = v18;
  v21 = self;
  v22 = v34;
  v23 = buf;
  v17 = v18;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v34, 8);

}

void __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsCommand: failed to modify Marketing Subscription with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint8_t v8[16];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForMarketingCommand: succeeded opt in/out", v8, 2u);
    }
    return objc_msgSend(*(id *)(a1 + 32), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fc_isNetworkUnavailableError"))
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 1;
    }
    else
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fc_shouldRetry");
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      if (v7)
        v6 = 2;
      else
        v6 = 3;
    }
    return objc_msgSend(v4, "command:didFinishWithStatus:", v5, v6);
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end

@implementation FCModifyNotificationsForTopicsCommand

- (FCModifyNotificationsForTopicsCommand)initWithTopicIDsToAdd:(id)a3 topicIDsToRemove:(id)a4 withTopicGroupingID:(id)a5 fromChannelID:(id)a6 userID:(id)a7 deviceToken:(id)a8 storefrontID:(id)a9 deviceDigestMode:(int)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FCModifyNotificationsForTopicsCommand *v22;
  uint64_t v23;
  FCModifyNotificationsForTopicsCommand *v24;
  FCModifyNotificationsForTopicsCommand *v25;
  id obj;
  id v28;
  id v29;
  id v30;
  void *v31;
  objc_super v32;

  v17 = a3;
  v18 = a4;
  v30 = a5;
  v29 = a6;
  obj = a7;
  v19 = a7;
  v28 = a8;
  v20 = a8;
  v21 = a9;
  v31 = v17;
  if (objc_msgSend(v17, "count"))
  {
    if (!v19)
    {
      v22 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v23 = objc_msgSend(v18, "count");
    v22 = 0;
    if (!v19 || !v23)
      goto LABEL_11;
  }
  v22 = 0;
  if (v20 && v21)
  {
    v32.receiver = self;
    v32.super_class = (Class)FCModifyNotificationsForTopicsCommand;
    v24 = -[FCModifyNotificationsForTopicsCommand init](&v32, sel_init);
    v25 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_topicIDsToAdd, a3);
      objc_storeStrong((id *)&v25->_topicIDsToRemove, a4);
      objc_storeStrong((id *)&v25->_topicGroupingID, a5);
      objc_storeStrong((id *)&v25->_channelID, a6);
      objc_storeStrong((id *)&v25->_userID, obj);
      objc_storeStrong((id *)&v25->_deviceToken, v28);
      objc_storeStrong((id *)&v25->_storefrontID, a9);
      v25->_deviceDigestMode = a10;
    }
    self = v25;
    v22 = self;
  }
LABEL_11:

  return v22;
}

- (FCModifyNotificationsForTopicsCommand)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  FCModifyNotificationsForTopicsCommand *v15;
  uint64_t v17;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("TopicIDsToAddKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("TopicIDsToRemoveKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TopicGroupingID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FromChannelIDKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceTokenKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StorefrontIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("DigestModeKey"));

  LODWORD(v17) = v14;
  v15 = -[FCModifyNotificationsForTopicsCommand initWithTopicIDsToAdd:topicIDsToRemove:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:](self, "initWithTopicIDsToAdd:topicIDsToRemove:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:", v7, v8, v9, v10, v11, v12, v13, v17);

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
  void *v10;
  id v11;

  v11 = a3;
  -[FCModifyNotificationsForTopicsCommand topicIDsToAdd](self, "topicIDsToAdd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("TopicIDsToAddKey"));

  -[FCModifyNotificationsForTopicsCommand topicIDsToRemove](self, "topicIDsToRemove");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("TopicIDsToRemoveKey"));

  -[FCModifyNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("TopicGroupingID"));

  -[FCModifyNotificationsForTopicsCommand channelID](self, "channelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("FromChannelIDKey"));

  -[FCModifyNotificationsForTopicsCommand userID](self, "userID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("UserIDKey"));

  -[FCModifyNotificationsForTopicsCommand deviceToken](self, "deviceToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("DeviceTokenKey"));

  -[FCModifyNotificationsForTopicsCommand storefrontID](self, "storefrontID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("StorefrontIDKey"));

  objc_msgSend(v11, "encodeInt:forKey:", -[FCModifyNotificationsForTopicsCommand deviceDigestMode](self, "deviceDigestMode"), CFSTR("DigestModeKey"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  id v42;
  NSObject *group;
  _QWORD block[4];
  id v45;
  FCModifyNotificationsForTopicsCommand *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint8_t *v49;
  _QWORD *v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD v55[4];
  NSObject *v56;
  _QWORD *v57;
  uint8_t *v58;
  _QWORD v59[5];
  id v60;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _QWORD v67[3];
  char v68;
  _QWORD v69[3];
  char v70;
  uint8_t v71[4];
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v41 = a4;
  v7 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: executing command", buf, 2u);
  }
  -[FCModifyNotificationsForTopicsCommand topicIDsToAdd](self, "topicIDsToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

LABEL_6:
    group = dispatch_group_create();
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2020000000;
    v70 = 1;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    v68 = 1;
    *(_QWORD *)buf = 0;
    v62 = buf;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__76;
    v65 = __Block_byref_object_dispose__76;
    v66 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x3032000000;
    v59[3] = __Block_byref_object_copy__76;
    v59[4] = __Block_byref_object_dispose__76;
    v60 = 0;
    -[FCModifyNotificationsForTopicsCommand topicIDsToAdd](self, "topicIDsToAdd");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") == 0;

    if (!v12)
    {
      v13 = (id)FCPushNotificationsLog;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[FCModifyNotificationsForTopicsCommand topicIDsToAdd](self, "topicIDsToAdd");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCModifyNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v71 = 138543618;
        v72 = v14;
        v73 = 2114;
        v74 = v15;
        _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: adding topicIDs: %{public}@ groupingID: %{public}@", v71, 0x16u);

      }
      dispatch_group_enter(group);
      objc_msgSend(v42, "notificationsEndpointConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand topicIDsToAdd](self, "topicIDsToAdd");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand channelID](self, "channelID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand userID](self, "userID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand deviceToken](self, "deviceToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand storefrontID](self, "storefrontID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[FCModifyNotificationsForTopicsCommand deviceDigestMode](self, "deviceDigestMode");
      dispatch_get_global_queue(-2, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
      v55[3] = &unk_1E463F7E8;
      v57 = v69;
      v58 = buf;
      v56 = group;
      LODWORD(v40) = v23;
      objc_msgSend(v16, "subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:", v17, v18, v19, v20, v21, v22, v40, v24, v55);

    }
    -[FCModifyNotificationsForTopicsCommand topicIDsToRemove](self, "topicIDsToRemove");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count") == 0;

    if (!v26)
    {
      v27 = (id)FCPushNotificationsLog;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[FCModifyNotificationsForTopicsCommand topicIDsToRemove](self, "topicIDsToRemove");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCModifyNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v71 = 138543618;
        v72 = v28;
        v73 = 2114;
        v74 = v29;
        _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: removing topicIDs: %{public}@ groupingID: %{public}@", v71, 0x16u);

      }
      dispatch_group_enter(group);
      objc_msgSend(v42, "notificationsEndpointConnection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand topicIDsToRemove](self, "topicIDsToRemove");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand topicGroupingID](self, "topicGroupingID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand channelID](self, "channelID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand userID](self, "userID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand deviceToken](self, "deviceToken");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForTopicsCommand storefrontID](self, "storefrontID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[FCModifyNotificationsForTopicsCommand deviceDigestMode](self, "deviceDigestMode");
      dispatch_get_global_queue(-2, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_18;
      v51[3] = &unk_1E463F7E8;
      v53 = v67;
      v54 = v59;
      v52 = group;
      LODWORD(v40) = v37;
      objc_msgSend(v30, "unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:", v31, v32, v33, v34, v35, v36, v40, v38, v51);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_19;
    block[3] = &unk_1E463F810;
    v47 = v69;
    v48 = v67;
    v45 = v41;
    v46 = self;
    v49 = buf;
    v50 = v59;
    dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v69, 8);

    goto LABEL_15;
  }
  -[FCModifyNotificationsForTopicsCommand topicIDsToRemove](self, "topicIDsToRemove");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;

  if (!v10)
    goto LABEL_6;
  v39 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v39, OS_LOG_TYPE_INFO, "modifyNotificationsForTopicsCommand: no topics to add or remove", buf, 2u);
  }
  objc_msgSend(v41, "command:didFinishWithStatus:", self, 0);
LABEL_15:

}

void __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, char a2, void *a3)
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
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForTopicsCommand: failed to add topics with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_18(uint64_t a1, char a2, void *a3)
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
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForTopicsCommand: failed to remove topics with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: succeeded adding/removing topics", v7, 2u);
    }
    return objc_msgSend(*(id *)(a1 + 32), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "fc_isNetworkUnavailableError") & 1) != 0
      || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "fc_isNetworkUnavailableError"))
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 1;
    }
    else if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "fc_shouldRetry") & 1) != 0
           || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "fc_shouldRetry"))
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 2;
    }
    else
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 3;
    }
    return objc_msgSend(v4, "command:didFinishWithStatus:", v5, v6);
  }
}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
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
    v7 = v5;
    -[FCModifyNotificationsForTopicsCommand channelID](self, "channelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "channelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)coalesceWithCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForTopicsCommand topicIDsToAdd](self, "topicIDsToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend(v6, "topicIDsToAdd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForTopicsCommand topicIDsToRemove](self, "topicIDsToRemove");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  objc_msgSend(v6, "topicIDsToRemove");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = (void *)objc_msgSend(v10, "copy", 0);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v18))
        {
          objc_msgSend(v7, "removeObject:", v18);
          objc_msgSend(v10, "removeObject:", v18);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  objc_msgSend(v7, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForTopicsCommand setTopicIDsToAdd:](self, "setTopicIDsToAdd:", v19);

  objc_msgSend(v10, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForTopicsCommand setTopicIDsToRemove:](self, "setTopicIDsToRemove:", v20);

}

- (NSArray)topicIDsToAdd
{
  return self->_topicIDsToAdd;
}

- (void)setTopicIDsToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)topicIDsToRemove
{
  return self->_topicIDsToRemove;
}

- (void)setTopicIDsToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)topicGroupingID
{
  return self->_topicGroupingID;
}

- (void)setTopicGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setDeviceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_storeStrong((id *)&self->_topicIDsToRemove, 0);
  objc_storeStrong((id *)&self->_topicIDsToAdd, 0);
}

@end

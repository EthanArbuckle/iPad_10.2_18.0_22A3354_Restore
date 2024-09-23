@implementation FCModifyNotificationsForChannelsCommand

- (FCModifyNotificationsForChannelsCommand)initWithChannelIDsToAdd:(id)a3 paidChannelIDsToAdd:(id)a4 channelIDsToRemove:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  FCModifyNotificationsForChannelsCommand *v20;
  FCModifyNotificationsForChannelsCommand *v21;
  FCModifyNotificationsForChannelsCommand *v22;
  uint64_t v24;
  id obj;
  void *v26;
  id v27;
  id v28;
  objc_super v29;

  v16 = a3;
  v28 = a4;
  v27 = a5;
  v17 = a6;
  v18 = a7;
  obj = a8;
  v19 = a8;
  v26 = v16;
  if (objc_msgSend(v16, "count") || objc_msgSend(v28, "count"))
  {
    if (!v17)
    {
      v20 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v24 = objc_msgSend(v27, "count");
    v20 = 0;
    if (!v17 || !v24)
      goto LABEL_10;
  }
  v20 = 0;
  if (v18 && v19)
  {
    v29.receiver = self;
    v29.super_class = (Class)FCModifyNotificationsForChannelsCommand;
    v21 = -[FCModifyNotificationsForChannelsCommand init](&v29, sel_init);
    v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_channelIDsToAdd, a3);
      objc_storeStrong((id *)&v22->_paidChannelIDsToAdd, a4);
      objc_storeStrong((id *)&v22->_channelIDsToRemove, a5);
      objc_storeStrong((id *)&v22->_userID, a6);
      objc_storeStrong((id *)&v22->_deviceToken, a7);
      objc_storeStrong((id *)&v22->_storefrontID, obj);
      v22->_deviceDigestMode = a9;
    }
    self = v22;
    v20 = self;
  }
LABEL_10:

  return v20;
}

- (FCModifyNotificationsForChannelsCommand)initWithCoder:(id)a3
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
  FCModifyNotificationsForChannelsCommand *v15;
  uint64_t v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ChannelIDsToAddKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("PaidChannelIDsToAddKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ChannelIDsToRemoveKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceTokenKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StorefrontIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("DigestModeKey"));

  LODWORD(v17) = v14;
  v15 = -[FCModifyNotificationsForChannelsCommand initWithChannelIDsToAdd:paidChannelIDsToAdd:channelIDsToRemove:userID:deviceToken:storefrontID:deviceDigestMode:](self, "initWithChannelIDsToAdd:paidChannelIDsToAdd:channelIDsToRemove:userID:deviceToken:storefrontID:deviceDigestMode:", v8, v9, v10, v11, v12, v13, v17);

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
  -[FCModifyNotificationsForChannelsCommand channelIDsToAdd](self, "channelIDsToAdd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("ChannelIDsToAddKey"));

  -[FCModifyNotificationsForChannelsCommand paidChannelIDsToAdd](self, "paidChannelIDsToAdd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("PaidChannelIDsToAddKey"));

  -[FCModifyNotificationsForChannelsCommand channelIDsToRemove](self, "channelIDsToRemove");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("ChannelIDsToRemoveKey"));

  -[FCModifyNotificationsForChannelsCommand userID](self, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("UserIDKey"));

  -[FCModifyNotificationsForChannelsCommand deviceToken](self, "deviceToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("DeviceTokenKey"));

  -[FCModifyNotificationsForChannelsCommand storefrontID](self, "storefrontID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("StorefrontIDKey"));

  objc_msgSend(v10, "encodeInt:forKey:", -[FCModifyNotificationsForChannelsCommand deviceDigestMode](self, "deviceDigestMode"), CFSTR("DigestModeKey"));
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
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  uint64_t v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  NSObject *v38;
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  FCModifyNotificationsForChannelsCommand *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint8_t *v46;
  _QWORD *v47;
  _QWORD v48[4];
  NSObject *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD v52[4];
  NSObject *v53;
  _QWORD *v54;
  uint8_t *v55;
  _QWORD v56[5];
  id v57;
  uint8_t buf[8];
  uint8_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[3];
  char v65;
  _QWORD v66[3];
  char v67;
  uint8_t v68[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v39 = a4;
  v7 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: executing command", buf, 2u);
  }
  -[FCModifyNotificationsForChannelsCommand channelIDsToAdd](self, "channelIDsToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    goto LABEL_6;
  -[FCModifyNotificationsForChannelsCommand paidChannelIDsToAdd](self, "paidChannelIDsToAdd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

LABEL_6:
    goto LABEL_7;
  }
  -[FCModifyNotificationsForChannelsCommand channelIDsToRemove](self, "channelIDsToRemove");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count") == 0;

  if (!v37)
  {
LABEL_7:
    v10 = dispatch_group_create();
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    v67 = 1;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    v65 = 1;
    *(_QWORD *)buf = 0;
    v59 = buf;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__23;
    v62 = __Block_byref_object_dispose__23;
    v63 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__23;
    v56[4] = __Block_byref_object_dispose__23;
    v57 = 0;
    -[FCModifyNotificationsForChannelsCommand channelIDsToAdd](self, "channelIDsToAdd");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {

    }
    else
    {
      -[FCModifyNotificationsForChannelsCommand paidChannelIDsToAdd](self, "paidChannelIDsToAdd");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count") == 0;

      if (v13)
      {
LABEL_13:
        -[FCModifyNotificationsForChannelsCommand channelIDsToRemove](self, "channelIDsToRemove");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count") == 0;

        if (!v26)
        {
          v27 = (id)FCPushNotificationsLog;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            -[FCModifyNotificationsForChannelsCommand channelIDsToRemove](self, "channelIDsToRemove");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v68 = 138543362;
            v69 = v28;
            _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: removing channelIDs: %{public}@", v68, 0xCu);

          }
          dispatch_group_enter(v10);
          objc_msgSend(v40, "notificationsEndpointConnection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCModifyNotificationsForChannelsCommand channelIDsToRemove](self, "channelIDsToRemove");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCModifyNotificationsForChannelsCommand userID](self, "userID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCModifyNotificationsForChannelsCommand deviceToken](self, "deviceToken");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCModifyNotificationsForChannelsCommand storefrontID](self, "storefrontID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[FCModifyNotificationsForChannelsCommand deviceDigestMode](self, "deviceDigestMode");
          dispatch_get_global_queue(-2, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = 0x1A1CD6000;
          v48[3] = &unk_1E463F7E8;
          v50 = v64;
          v51 = v56;
          v49 = v10;
          objc_msgSend(v29, "unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:", v30, v31, v32, v33, v34, v35, v48);

        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke_17;
        block[3] = &unk_1E463F810;
        v44 = v66;
        v45 = v64;
        v42 = v39;
        v43 = self;
        v46 = buf;
        v47 = v56;
        dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

        _Block_object_dispose(v56, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(v64, 8);
        _Block_object_dispose(v66, 8);

        goto LABEL_18;
      }
    }
    v14 = (id)FCPushNotificationsLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[FCModifyNotificationsForChannelsCommand channelIDsToAdd](self, "channelIDsToAdd");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCModifyNotificationsForChannelsCommand paidChannelIDsToAdd](self, "paidChannelIDsToAdd");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v68 = 138543618;
      v69 = v15;
      v70 = 2114;
      v71 = v16;
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: adding channelIDs: %{public}@ paidChannelIDs: %{public}@", v68, 0x16u);

    }
    dispatch_group_enter(v10);
    objc_msgSend(v40, "notificationsEndpointConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyNotificationsForChannelsCommand channelIDsToAdd](self, "channelIDsToAdd");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyNotificationsForChannelsCommand paidChannelIDsToAdd](self, "paidChannelIDsToAdd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyNotificationsForChannelsCommand userID](self, "userID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyNotificationsForChannelsCommand deviceToken](self, "deviceToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyNotificationsForChannelsCommand storefrontID](self, "storefrontID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FCModifyNotificationsForChannelsCommand deviceDigestMode](self, "deviceDigestMode");
    dispatch_get_global_queue(-2, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
    v52[3] = &unk_1E463F7E8;
    v54 = v66;
    v55 = buf;
    v53 = v10;
    objc_msgSend(v17, "subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:", v18, v19, v20, v21, v22, v23, v24, v52);

    goto LABEL_13;
  }
  v38 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v38, OS_LOG_TYPE_INFO, "modifyNotificationsForChannelsCommand: no channels to add or remove", buf, 2u);
  }
  objc_msgSend(v39, "command:didFinishWithStatus:", self, 0);
LABEL_18:

}

void __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, char a2, void *a3)
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
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForChannelsCommand: failed to add channels with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke_16(uint64_t a1, char a2, void *a3)
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
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForChannelsCommand: failed to remove channels with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke_17(uint64_t a1)
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
      _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: succeeded adding/removing channels", v7, 2u);
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
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
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
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v25 = v4;
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
  -[FCModifyNotificationsForChannelsCommand channelIDsToAdd](self, "channelIDsToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend(v6, "channelIDsToAdd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForChannelsCommand paidChannelIDsToAdd](self, "paidChannelIDsToAdd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  objc_msgSend(v6, "paidChannelIDsToAdd");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForChannelsCommand channelIDsToRemove](self, "channelIDsToRemove");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v14);

  objc_msgSend(v6, "channelIDsToRemove");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = (void *)objc_msgSend(v13, "copy");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v21))
        {
          objc_msgSend(v7, "removeObject:", v21);
          objc_msgSend(v13, "removeObject:", v21);
        }
        if (objc_msgSend(v10, "containsObject:", v21))
        {
          objc_msgSend(v10, "removeObject:", v21);
          objc_msgSend(v13, "removeObject:", v21);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

  objc_msgSend(v7, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForChannelsCommand setChannelIDsToAdd:](self, "setChannelIDsToAdd:", v22);

  objc_msgSend(v10, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForChannelsCommand setPaidChannelIDsToAdd:](self, "setPaidChannelIDsToAdd:", v23);

  objc_msgSend(v13, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyNotificationsForChannelsCommand setChannelIDsToRemove:](self, "setChannelIDsToRemove:", v24);

}

- (NSArray)channelIDsToAdd
{
  return self->_channelIDsToAdd;
}

- (void)setChannelIDsToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)paidChannelIDsToAdd
{
  return self->_paidChannelIDsToAdd;
}

- (void)setPaidChannelIDsToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)channelIDsToRemove
{
  return self->_channelIDsToRemove;
}

- (void)setChannelIDsToRemove:(id)a3
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
  objc_storeStrong((id *)&self->_channelIDsToRemove, 0);
  objc_storeStrong((id *)&self->_paidChannelIDsToAdd, 0);
  objc_storeStrong((id *)&self->_channelIDsToAdd, 0);
}

@end

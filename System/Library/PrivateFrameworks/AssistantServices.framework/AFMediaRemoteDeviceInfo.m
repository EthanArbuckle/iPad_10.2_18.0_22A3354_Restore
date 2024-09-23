@implementation AFMediaRemoteDeviceInfo

- (AFMediaRemoteDeviceInfo)init
{
  AFMediaRemoteDeviceInfo *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  uint64_t v7;
  AFInstanceContext *instanceContext;
  void *v9;
  NSObject *v10;
  void *v12;
  void *v13;
  _QWORD block[4];
  AFMediaRemoteDeviceInfo *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AFMediaRemoteDeviceInfo;
  v2 = -[AFMediaRemoteDeviceInfo init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.assistant.MediaRemoteDeviceInfo", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
    v7 = objc_claimAutoreleasedReturnValue();
    instanceContext = v2->_instanceContext;
    v2->_instanceContext = (AFInstanceContext *)v7;

    if (!v2->_instanceContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[AFMediaRemoteDeviceInfo init]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("AFMediaRemoteDeviceInfo.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_instanceContext != nil"));

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__activeDeviceInfoChanged_, *MEMORY[0x1E0D4C698], 0);

    MRMediaRemoteRegisterWantsSystemAppDidSkipTrackNotifications();
    v10 = v2->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__AFMediaRemoteDeviceInfo_init__block_invoke;
    block[3] = &unk_1E3A36F30;
    v15 = v2;
    dispatch_async(v10, block);

  }
  return v2;
}

- (void)_activeDeviceInfoChanged:(id)a3
{
  NSObject *v4;
  NSObject *serialQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[AFMediaRemoteDeviceInfo _activeDeviceInfoChanged:]";
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AFMediaRemoteDeviceInfo__activeDeviceInfoChanged___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_updateWithRouteIdentifier:(id)a3 groupIdentifier:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *routeIdentifier;
  int v9;
  NSString *groupIdentifier;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSObject *v24;
  NSString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  routeIdentifier = self->_routeIdentifier;
  if (routeIdentifier == v6 || -[NSString isEqualToString:](routeIdentifier, "isEqualToString:", v6))
  {
    v9 = 0;
  }
  else
  {
    v18 = (NSString *)-[NSString copy](v6, "copy");
    v19 = self->_routeIdentifier;
    self->_routeIdentifier = v18;

    v20 = AFSiriLogContextConnection;
    v9 = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v21 = self->_routeIdentifier;
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFMediaRemoteDeviceInfo _updateWithRouteIdentifier:groupIdentifier:]";
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_19AF50000, v20, OS_LOG_TYPE_INFO, "%s Local route identifier: %@", buf, 0x16u);
    }
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier == v7 || -[NSString isEqualToString:](groupIdentifier, "isEqualToString:", v7))
  {
    v11 = 0;
  }
  else
  {
    v22 = (NSString *)-[NSString copy](v7, "copy");
    v23 = self->_groupIdentifier;
    self->_groupIdentifier = v22;

    v24 = AFSiriLogContextConnection;
    v11 = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v25 = self->_groupIdentifier;
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFMediaRemoteDeviceInfo _updateWithRouteIdentifier:groupIdentifier:]";
      v32 = 2112;
      v33 = v25;
      _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s Local group identifier: %@", buf, 0x16u);
    }
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("identifier");
    v13 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("AFMediaRemoteDeviceInfoRouteIdentifierDidChangeNotification"), self, v14);

    if (!v6)
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("identifier");
    v16 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("AFMediaRemoteDeviceInfoGroupIdentifierDidChangeNotification"), self, v17);

    if (!v7)
  }

}

- (void)_getMRDeviceInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__AFMediaRemoteDeviceInfo__getMRDeviceInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E3A30670;
  v5 = v4;
  v11 = v5;
  v6 = (void *)MEMORY[0x1A1AC0C3C](v10);
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[AFMediaRemoteDeviceInfo _getMRDeviceInfoWithCompletion:]";
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Retrieving MRDeviceInfo for local origin.", buf, 0xCu);
  }
  v8 = (void *)MEMORY[0x1E0D4C550];
  objc_msgSend(MEMORY[0x1E0D4C5B8], "localOrigin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceInfoForOrigin:queue:completion:", v9, self->_serialQueue, v6);

}

- (void)getRouteIdentifierWithCompletion:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

- (void)getGroupIdentifierWithCompletion:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

void __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke_2;
  v2[3] = &unk_1E3A30698;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_getMRDeviceInfoWithCompletion:", v2);

}

void __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "groupUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315395;
    v6 = "-[AFMediaRemoteDeviceInfo getGroupIdentifierWithCompletion:]_block_invoke_2";
    v7 = 2113;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Retrieved groupId: %{private}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateWithRouteIdentifier:groupIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke_2;
  v2[3] = &unk_1E3A30698;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_getMRDeviceInfoWithCompletion:", v2);

}

void __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  objc_msgSend(v4, "deviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315395;
    v8 = "-[AFMediaRemoteDeviceInfo getRouteIdentifierWithCompletion:]_block_invoke_2";
    v9 = 2113;
    v10 = v5;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Retrieved routeId: %{private}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateWithRouteIdentifier:groupIdentifier:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __58__AFMediaRemoteDeviceInfo__getMRDeviceInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[AFMediaRemoteDeviceInfo _getMRDeviceInfoWithCompletion:]_block_invoke";
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Error retrieving MRDeviceInfo: %@", (uint8_t *)&v9, 0x16u);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

uint64_t __52__AFMediaRemoteDeviceInfo__activeDeviceInfoChanged___block_invoke()
{
  MRMediaRemoteGetLocalOrigin();
  return MRMediaRemoteGetDeviceInfo();
}

void __52__AFMediaRemoteDeviceInfo__activeDeviceInfoChanged___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[AFMediaRemoteDeviceInfo _activeDeviceInfoChanged:]_block_invoke";
      v11 = 2112;
      v12 = a3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Unable to fetch local route identifier: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v6 = (void *)MRPairedDeviceCopyLocalReceiverPairingIdentity();
    v7 = (void *)MRPairedDeviceCopyGroupUID();
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315650;
      v10 = "-[AFMediaRemoteDeviceInfo _activeDeviceInfoChanged:]_block_invoke_2";
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Successfully fetched local route identifier: %@, group identifier: %@", (uint8_t *)&v9, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateWithRouteIdentifier:groupIdentifier:", v6, v7);

  }
}

uint64_t __31__AFMediaRemoteDeviceInfo_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activeDeviceInfoChanged:", 0);
}

+ (id)localDeviceInfo
{
  if (localDeviceInfo_onceToken != -1)
    dispatch_once(&localDeviceInfo_onceToken, &__block_literal_global_14863);
  return (id)localDeviceInfo_localDeviceInfo;
}

void __42__AFMediaRemoteDeviceInfo_localDeviceInfo__block_invoke()
{
  AFMediaRemoteDeviceInfo *v0;
  void *v1;

  v0 = objc_alloc_init(AFMediaRemoteDeviceInfo);
  v1 = (void *)localDeviceInfo_localDeviceInfo;
  localDeviceInfo_localDeviceInfo = (uint64_t)v0;

}

@end

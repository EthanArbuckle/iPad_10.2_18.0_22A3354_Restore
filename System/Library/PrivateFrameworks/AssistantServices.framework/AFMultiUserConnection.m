@implementation AFMultiUserConnection

- (AFMultiUserConnection)initWithConnectionFactory:(id)a3
{
  id v4;
  AFMultiUserConnection *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *targetQueue;
  AFInstanceContext *v9;
  AFInstanceContext *instanceContext;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFMultiUserConnection;
  v5 = -[AFMultiUserConnection init](&v12, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.assistant.multiuser.connection", v6);

    targetQueue = v5->_targetQueue;
    v5->_targetQueue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      v9 = (AFInstanceContext *)v4;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v9 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;

  }
  return v5;
}

- (AFMultiUserConnection)init
{
  void *v3;
  AFMultiUserConnection *v4;

  +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFMultiUserConnection initWithConnectionFactory:](self, "initWithConnectionFactory:", v3);

  return v4;
}

- (void)_clearConnection
{
  NSObject *v3;
  NSXPCConnection *connection;
  int v5;
  const char *v6;
  __int16 v7;
  AFMultiUserConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection _clearConnection]";
    v7 = 2048;
    v8 = self;
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](self->_instanceContext, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.multiuser.service"), 0);
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_targetQueue);
    objc_initWeak(&location, self);
    v6 = self->_connection;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __36__AFMultiUserConnection__connection__block_invoke;
    v13 = &unk_1E3A35AE0;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", &v10);
    v7 = self->_connection;
    AFMultiUserServiceXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8, v10, v11, v12, v13);

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFMultiUserConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFMultiUserConnection dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  -[AFMultiUserConnection _clearConnection](self, "_clearConnection");
  v4.receiver = self;
  v4.super_class = (Class)AFMultiUserConnection;
  -[AFMultiUserConnection dealloc](&v4, sel_dealloc);
}

- (id)_multiUserServiceWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_connection)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = "-[AFMultiUserConnection _multiUserServiceWithErrorHandler:]";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s No connection.", (uint8_t *)&v9, 0xCu);
    }
  }
  -[AFMultiUserConnection _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMultiUserConnection getHomeUserIdForSharedUserId:completion:]";
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(targetQueue, block);

}

- (void)getMultiUserAudioAppSignalsForSharedUserID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFMultiUserConnection getMultiUserAudioAppSignalsForSharedUserID:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Getting music preference data for shared user id %@", buf, 0x16u);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(targetQueue, block);

}

- (void)getFirstNameForSharedUserId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMultiUserConnection getFirstNameForSharedUserId:completion:]";
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(targetQueue, block);

}

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMultiUserConnection getSharedUserIdForHomeUserId:completion:]";
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(targetQueue, block);

}

- (void)getSharedUserProfileLimitWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[AFMultiUserConnection getSharedUserProfileLimitWithCompletion:]";
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    v3[2](v3, 6, 0);
LABEL_4:

}

- (void)getConformingSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getConformingSharedUserIdForHomeUserId:completion:]";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke;
    block[3] = &unk_1E3A36E10;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(targetQueue, block);

  }
}

- (void)getConformingSharedUserIds:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *targetQueue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection getConformingSharedUserIds:]";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(targetQueue, v7);

  }
}

- (void)getRecognizableUsersConfromingSharedUserIds:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *targetQueue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection getRecognizableUsersConfromingSharedUserIds:]";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(targetQueue, v7);

  }
}

- (void)getMultiUserSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getMultiUserSettingsForSharedUserID:completion:]";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke;
    block[3] = &unk_1E3A36E10;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(targetQueue, block);

  }
}

- (void)getMultiUserSettingsForRecognizedUserWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *targetQueue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection getMultiUserSettingsForRecognizedUserWithCompletion:]";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(targetQueue, v7);

  }
}

- (void)getHomeUserIdOfRecognizedUserWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *targetQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(targetQueue, v7);

  }
}

- (void)getiCloudAltDSIDOfRecognizedUserWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *targetQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(targetQueue, v7);

  }
}

- (void)getPreferredMediaUserHomeUserIDWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *targetQueue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFMultiUserConnection getPreferredMediaUserHomeUserIDWithCompletion:]";
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(targetQueue, v7);

  }
LABEL_4:

}

- (void)homeUserIdToNames:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *targetQueue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection homeUserIdToNames:]";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__AFMultiUserConnection_homeUserIdToNames___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(targetQueue, v7);

  }
}

- (void)getSharedUserInfoForSharedUserID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getSharedUserInfoForSharedUserID:completion:]";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke;
    block[3] = &unk_1E3A36E10;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(targetQueue, block);

  }
}

- (void)getSharedUserInfoForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getSharedUserInfoForiCloudAltDSID:completion:]";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke;
    block[3] = &unk_1E3A36E10;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(targetQueue, block);

  }
}

- (void)getUserAgentStringForSharedUserID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *targetQueue;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getUserAgentStringForSharedUserID:completion:]";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke;
    block[3] = &unk_1E3A36E10;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(targetQueue, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getUserAgentStringForSharedUserID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getUserAgentStringForSharedUserID:completion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getUserAgentStringForSharedUserID:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getSharedUserInfoForiCloudAltDSID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getSharedUserInfoForiCloudAltDSID:completion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getSharedUserInfoForiCloudAltDSID:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getSharedUserInfoForSharedUserID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getSharedUserInfoForSharedUserID:completion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getSharedUserInfoForSharedUserID:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __43__AFMultiUserConnection_homeUserIdToNames___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AFMultiUserConnection_homeUserIdToNames___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeUserIdToNames:", *(_QWORD *)(a1 + 40));

}

void __43__AFMultiUserConnection_homeUserIdToNames___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection homeUserIdToNames:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in homeUserIdToNames:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPreferredMediaUserHomeUserIDWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getPreferredMediaUserHomeUserIDWithCompletion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getPreferredMediaUserHomeUserIDWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getiCloudAltDSIDOfRecognizedUserWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getiCloudAltDSIDOfRecognizedUserWithCompletion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getiCloudAltDSIDOfRecognizedUserWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getHomeUserIdOfRecognizedUserWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getHomeUserIdOfRecognizedUserWithCompletion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getHomeUserIdOfRecognizedUserWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getMultiUserSettingsForRecognizedUserWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getMultiUserSettingsForRecognizedUserWithCompletion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getMultiUserSettingsForRecognizedUserWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getMultiUserSettingsForSharedUserID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[AFMultiUserConnection getMultiUserSettingsForSharedUserID:completion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s ErrorABCD:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getRecognizableUsersConfromingSharedUserIds:", *(_QWORD *)(a1 + 40));

}

uint64_t __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getConformingSharedUserIds:", *(_QWORD *)(a1 + 40));

}

uint64_t __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getConformingSharedUserIdForHomeUserId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getSharedUserIdForHomeUserId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getFirstNameForSharedUserId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getMultiUserAudioAppSignalsForSharedUserID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_multiUserServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getHomeUserIdForSharedUserId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __36__AFMultiUserConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AFMultiUserConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_38953 != -1)
    dispatch_once(&sharedInstance_onceToken_38953, block);
  return (id)sharedInstance_singleton_38954;
}

void __39__AFMultiUserConnection_sharedInstance__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[AFMultiUserConnection sharedInstance]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedInstance_singleton_38954;
  sharedInstance_singleton_38954 = (uint64_t)v3;

}

@end

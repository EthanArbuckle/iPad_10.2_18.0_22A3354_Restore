@implementation AFUserNotificationAnnouncementSpeakingStateObserver

- (AFUserNotificationAnnouncementSpeakingStateObserver)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  AFUserNotificationAnnouncementSpeakingStateObserver *v9;
  AFUserNotificationAnnouncementSpeakingStateObserver *v10;
  uint64_t v11;
  NSMutableSet *observingNotifications;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserNotificationAnnouncementSpeakingStateObserver;
  v9 = -[AFUserNotificationAnnouncementSpeakingStateObserver init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    observingNotifications = v10->_observingNotifications;
    v10->_observingNotifications = (NSMutableSet *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[AFUserNotificationAnnouncementSpeakingStateObserver _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)AFUserNotificationAnnouncementSpeakingStateObserver;
  -[AFUserNotificationAnnouncementSpeakingStateObserver dealloc](&v3, sel_dealloc);
}

- (void)startObservingNotificationWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __103__AFUserNotificationAnnouncementSpeakingStateObserver_startObservingNotificationWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E3A36FC8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

- (void)stopObservingNotificationWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __102__AFUserNotificationAnnouncementSpeakingStateObserver_stopObservingNotificationWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E3A36FC8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AFUserNotificationAnnouncementSpeakingStateObserver_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speakingStateDidChange:(int64_t)a3 forIdentifiers:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__AFUserNotificationAnnouncementSpeakingStateObserver_speakingStateDidChange_forIdentifiers___block_invoke;
  block[3] = &unk_1E3A353E8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_startObservingNotificationWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_observingNotifications, "containsObject:", v4))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _startObservingNotificationWithRequestIdentifier:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Already observing notification request identifier %@, ignoring.", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v6 = -[NSMutableSet count](self->_observingNotifications, "count");
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _startObservingNotificationWithRequestIdentifier:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Adding speaking state observer for notification request identifier %@", (uint8_t *)&v9, 0x16u);
    }
    -[NSMutableSet addObject:](self->_observingNotifications, "addObject:", v4);
    if (!v6)
    {
      -[AFUserNotificationAnnouncementSpeakingStateObserver _currentConnection](self, "_currentConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginObserving");

    }
  }

}

- (void)_removeObserverForNotificationRequestIdentifier:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_observingNotifications, "containsObject:", v4);
  v6 = AFSiriLogContextConnection;
  v7 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      v9 = 136315394;
      v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _removeObserverForNotificationRequestIdentifier:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Removing speaking state observer for notification request identifier %@", (uint8_t *)&v9, 0x16u);
    }
    -[NSMutableSet removeObject:](self->_observingNotifications, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_observingNotifications, "count"))
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v9 = 136315138;
        v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _removeObserverForNotificationRequestIdentifier:]";
        _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s No longer observing any notifications. Closing connection.", (uint8_t *)&v9, 0xCu);
      }
      -[AFUserNotificationAnnouncementSpeakingStateObserver _cleanUpConnection](self, "_cleanUpConnection");
    }
  }
  else if (v7)
  {
    v9 = 136315394;
    v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _removeObserverForNotificationRequestIdentifier:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Not currently observing for notification request identifier %@, ignoring.", (uint8_t *)&v9, 0x16u);
  }

}

- (void)_speakingStateDidChange:(int64_t)a3 forIdentifiers:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  id WeakRetained;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[NSMutableSet count](self->_observingNotifications, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectSet:", self->_observingNotifications);
    v8 = objc_msgSend(v7, "count");
    v9 = AFSiriLogContextConnection;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        if ((unint64_t)a3 > 5)
          v11 = CFSTR("(unknown)");
        else
          v11 = off_1E3A2E2A0[a3];
        v13 = v11;
        v16 = 136315650;
        v17 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _speakingStateDidChange:forIdentifiers:]";
        v18 = 2112;
        v19 = v13;
        v20 = 2112;
        v21 = v7;

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "notificationAnnouncementObserver:announcementSpeakingStateDidUpdate:forNotificationRequestIdentifiers:", self, a3, v15);

    }
    else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _speakingStateDidChange:forIdentifiers:]";
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Received a notification for speaking state changes, but we're not observing any of them.", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _speakingStateDidChange:forIdentifiers:]";
      _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Received a notification for speaking state changes, but no observers.", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  id v7;
  NSXPCConnection *v8;
  id v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assistant.announcement_state.service"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v6 = self->_connection;
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EF00);
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    v8 = self->_connection;
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4324F8);
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    objc_initWeak(&location, self);
    v10 = self->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke;
    v16[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v16);
    v12 = self->_connection;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke_2;
    v14[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v14);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (id)_currentConnection
{
  void *v2;
  void *v3;

  -[AFUserNotificationAnnouncementSpeakingStateObserver _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_25583);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_notifyObserverOfFailureForAllObservingNotifications
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  NSMutableSet *observingNotifications;
  int v7;
  const char *v8;
  __int16 v9;
  NSMutableSet *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_observingNotifications, "count"))
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      observingNotifications = self->_observingNotifications;
      v7 = 136315394;
      v8 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _notifyObserverOfFailureForAllObservingNotifications]";
      v9 = 2112;
      v10 = observingNotifications;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Notifying all identifiers as failed. %@", (uint8_t *)&v7, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSMutableSet allObjects](self->_observingNotifications, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "notificationAnnouncementObserver:announcementSpeakingStateDidUpdate:forNotificationRequestIdentifiers:", self, 4, v5);

    -[NSMutableSet removeAllObjects](self->_observingNotifications, "removeAllObjects");
  }
}

- (void)_tearDown
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _tearDown]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[NSMutableSet removeAllObjects](self->_observingNotifications, "removeAllObjects");
  -[AFUserNotificationAnnouncementSpeakingStateObserver _cleanUpConnection](self, "_cleanUpConnection");
}

- (void)connectionInvalidated
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFUserNotificationAnnouncementSpeakingStateObserver connectionInvalidated]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInvalidated__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connectionInterrupted
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFUserNotificationAnnouncementSpeakingStateObserver connectionInterrupted]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInterrupted__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cleanUpConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AFUserNotificationAnnouncementSpeakingStateObserver_cleanUpConnection__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cleanUpConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observingNotifications, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __72__AFUserNotificationAnnouncementSpeakingStateObserver_cleanUpConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnection");
}

uint64_t __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnection");
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserverOfFailureForAllObservingNotifications");
}

uint64_t __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnection");
}

void __73__AFUserNotificationAnnouncementSpeakingStateObserver__currentConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _currentConnection]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

void __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInterrupted");

}

uint64_t __93__AFUserNotificationAnnouncementSpeakingStateObserver_speakingStateDidChange_forIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speakingStateDidChange:forIdentifiers:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __65__AFUserNotificationAnnouncementSpeakingStateObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDown");
}

uint64_t __102__AFUserNotificationAnnouncementSpeakingStateObserver_stopObservingNotificationWithRequestIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserverForNotificationRequestIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __103__AFUserNotificationAnnouncementSpeakingStateObserver_startObservingNotificationWithRequestIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObservingNotificationWithRequestIdentifier:", *(_QWORD *)(a1 + 40));
}

@end

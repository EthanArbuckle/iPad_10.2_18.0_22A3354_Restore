@implementation AFHomeAnnouncementObserver

- (AFHomeAnnouncementObserver)init
{
  void *v3;
  AFHomeAnnouncementObserver *v4;

  +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFHomeAnnouncementObserver initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (AFHomeAnnouncementObserver)initWithInstanceContext:(id)a3
{
  id v4;
  AFHomeAnnouncementObserver *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  AFInstanceContext *v10;
  AFInstanceContext *instanceContext;
  uint64_t v12;
  NSHashTable *listeners;
  dispatch_group_t v14;
  OS_dispatch_group *snapshotGroup;
  NSObject *v16;
  _QWORD block[4];
  AFHomeAnnouncementObserver *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFHomeAnnouncementObserver;
  v5 = -[AFHomeAnnouncementObserver init](&v20, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("com.apple.assistant.home-announcement-observer", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    if (v4)
    {
      v10 = (AFInstanceContext *)v4;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v10 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v12;

    v5->_groupingDepth = 0;
    v14 = dispatch_group_create();
    snapshotGroup = v5->_snapshotGroup;
    v5->_snapshotGroup = (OS_dispatch_group *)v14;

    v16 = v5->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke;
    block[3] = &unk_1E3A36F30;
    v19 = v5;
    dispatch_async(v16, block);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AFHomeAnnouncementObserver _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)AFHomeAnnouncementObserver;
  -[AFHomeAnnouncementObserver dealloc](&v3, sel_dealloc);
}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__AFHomeAnnouncementObserver_addListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__AFHomeAnnouncementObserver_removeListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__AFHomeAnnouncementObserver_getStateWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AFHomeAnnouncementObserver_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  _QWORD v5[5];

  if (self->_notifyObserver == a3)
  {
    -[AFHomeAnnouncementObserver _beginGrouping](self, "_beginGrouping");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__AFHomeAnnouncementObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke;
    v5[3] = &unk_1E3A356A8;
    v5[4] = self;
    -[AFHomeAnnouncementObserver _fetchStateAndLastPlayedAnnouncementForReason:completion:](self, "_fetchStateAndLastPlayedAnnouncementForReason:completion:", CFSTR("notification"), v5);
  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  if (self->_notifyObserver == a3)
    -[AFHomeAnnouncementObserver _handleNotifyStateChangeFrom:to:](self, "_handleNotifyStateChangeFrom:to:", a4, a5);
}

- (void)connectionInterrupted
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AFHomeAnnouncementObserver_connectionInterrupted__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AFHomeAnnouncementObserver_connectionInvalidated__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setUp
{
  NSObject *v3;
  void *v4;
  AFNotifyObserver *v5;
  AFNotifyObserver *notifyObserver;
  NSObject *v7;
  id v8;
  AFInstanceContext *instanceContext;
  int v10;
  const char *v11;
  __int16 v12;
  AFInstanceContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[AFHomeAnnouncementObserver _setUp]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  getkANAnnounceStateNotificationKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[AFNotifyObserver initWithName:options:queue:delegate:]([AFNotifyObserver alloc], "initWithName:options:queue:delegate:", v4, 1, self->_queue, self);
    notifyObserver = self->_notifyObserver;
    self->_notifyObserver = v5;

  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      instanceContext = self->_instanceContext;
      v10 = 136315394;
      v11 = "-[AFHomeAnnouncementObserver _setUp]";
      v12 = 2112;
      v13 = instanceContext;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get the notification name for Announce state. (instanceContext = %@)", (uint8_t *)&v10, 0x16u);
    }
  }
  v8 = -[AFHomeAnnouncementObserver _localPlaybackSession:](self, "_localPlaybackSession:", 1);

}

- (void)_tearDown
{
  NSObject *v3;
  AFNotifyObserver *notifyObserver;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AFHomeAnnouncementObserver _tearDown]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[AFNotifyObserver invalidate](self->_notifyObserver, "invalidate");
  notifyObserver = self->_notifyObserver;
  self->_notifyObserver = 0;

  -[AFHomeAnnouncementObserver _invalidateLocalPlaybackSession](self, "_invalidateLocalPlaybackSession");
}

- (id)_localPlaybackSession:(BOOL)a3
{
  ANLocalPlaybackSession *localPlaybackSession;
  BOOL v5;
  ANLocalPlaybackSession *v6;
  ANLocalPlaybackSession *v7;

  localPlaybackSession = self->_localPlaybackSession;
  if (localPlaybackSession)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (ANLocalPlaybackSession *)objc_alloc_init((Class)getANLocalPlaybackSessionClass());
    v7 = self->_localPlaybackSession;
    self->_localPlaybackSession = v6;

    -[ANLocalPlaybackSession setDelegate:](self->_localPlaybackSession, "setDelegate:", self);
    localPlaybackSession = self->_localPlaybackSession;
  }
  return localPlaybackSession;
}

- (void)_invalidateLocalPlaybackSession
{
  ANLocalPlaybackSession *localPlaybackSession;

  -[ANLocalPlaybackSession setDelegate:](self->_localPlaybackSession, "setDelegate:", 0);
  localPlaybackSession = self->_localPlaybackSession;
  self->_localPlaybackSession = 0;

}

- (void)_fetchStateAndLastPlayedAnnouncementForReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFHomeAnnouncementObserver _fetchStateAndLastPlayedAnnouncementForReason:completion:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  -[AFHomeAnnouncementObserver _localPlaybackSession:](self, "_localPlaybackSession:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke;
  v11[3] = &unk_1E3A35720;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "lastPlayedAnnouncementInfoWithCompletion:", v11);

}

- (void)_handleNotifyStateChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[AFHomeAnnouncementObserver _handleNotifyStateChangeFrom:to:]";
    v10 = 2048;
    v11 = a3;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s fromState = %llu, toState = %llu", (uint8_t *)&v8, 0x20u);
  }
  -[AFHomeAnnouncementObserver _updateState:](self, "_updateState:", a4 == 1);
}

- (void)_updateState:(unint64_t)a3
{
  void *v5;
  unint64_t state;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _QWORD v11[7];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    -[AFHomeAnnouncementObserver _beginGrouping](self, "_beginGrouping");
    v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      state = self->_state;
      v7 = v5;
      AFHomeAnnouncementStateGetNames(state);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AFHomeAnnouncementStateGetNames(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v13 = "-[AFHomeAnnouncementObserver _updateState:]";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s state: %@ -> %@", buf, 0x20u);

    }
    v10 = self->_state;
    self->_state = a3;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__AFHomeAnnouncementObserver__updateState___block_invoke;
    v11[3] = &unk_1E3A35748;
    v11[4] = self;
    v11[5] = v10;
    v11[6] = a3;
    -[AFHomeAnnouncementObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v11);
    -[AFHomeAnnouncementObserver _endGrouping](self, "_endGrouping");
  }
}

- (void)_updateLastPlayedAnnouncement:(id)a3
{
  AFHomeAnnouncement *v4;
  AFHomeAnnouncement *lastPlayedAnnouncement;
  NSObject *v6;
  AFHomeAnnouncement *v7;
  AFHomeAnnouncement *v8;
  AFHomeAnnouncement *v9;
  int v10;
  const char *v11;
  __int16 v12;
  AFHomeAnnouncement *v13;
  __int16 v14;
  AFHomeAnnouncement *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (AFHomeAnnouncement *)a3;
  lastPlayedAnnouncement = self->_lastPlayedAnnouncement;
  if (lastPlayedAnnouncement != v4 && !-[AFHomeAnnouncement isEqual:](lastPlayedAnnouncement, "isEqual:", v4))
  {
    -[AFHomeAnnouncementObserver _beginGrouping](self, "_beginGrouping");
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = self->_lastPlayedAnnouncement;
      v10 = 136315650;
      v11 = "-[AFHomeAnnouncementObserver _updateLastPlayedAnnouncement:]";
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s lastPlayedAnnouncement: %@ -> %@", (uint8_t *)&v10, 0x20u);
    }
    v8 = (AFHomeAnnouncement *)-[AFHomeAnnouncement copy](v4, "copy");
    v9 = self->_lastPlayedAnnouncement;
    self->_lastPlayedAnnouncement = v8;

    -[AFHomeAnnouncementObserver _endGrouping](self, "_endGrouping");
  }

}

- (void)_updateSnapshot:(id)a3
{
  AFHomeAnnouncementSnapshot *v4;
  AFHomeAnnouncementSnapshot *snapshot;
  NSObject *v6;
  AFHomeAnnouncementSnapshot *v7;
  AFHomeAnnouncementSnapshot *v8;
  AFHomeAnnouncementSnapshot *v9;
  AFHomeAnnouncementSnapshot *v10;
  AFHomeAnnouncementSnapshot *v11;
  AFHomeAnnouncementSnapshot *v12;
  AFHomeAnnouncementSnapshot *v13;
  _QWORD v14[5];
  AFHomeAnnouncementSnapshot *v15;
  AFHomeAnnouncementSnapshot *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  AFHomeAnnouncementSnapshot *v20;
  __int16 v21;
  AFHomeAnnouncementSnapshot *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (AFHomeAnnouncementSnapshot *)a3;
  snapshot = self->_snapshot;
  if (snapshot != v4 && !-[AFHomeAnnouncementSnapshot isEqual:](snapshot, "isEqual:", v4))
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = self->_snapshot;
      *(_DWORD *)buf = 136315650;
      v18 = "-[AFHomeAnnouncementObserver _updateSnapshot:]";
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s snapshot: %@ -> %@", buf, 0x20u);
    }
    v8 = self->_snapshot;
    v9 = v4;
    v10 = (AFHomeAnnouncementSnapshot *)-[AFHomeAnnouncementSnapshot copy](v9, "copy");
    v11 = self->_snapshot;
    self->_snapshot = v10;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__AFHomeAnnouncementObserver__updateSnapshot___block_invoke;
    v14[3] = &unk_1E3A35770;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v12 = v9;
    v13 = v8;
    -[AFHomeAnnouncementObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v14);

  }
}

- (void)_beginGrouping
{
  dispatch_group_enter((dispatch_group_t)self->_snapshotGroup);
  ++self->_groupingDepth;
}

- (void)_endGrouping
{
  int64_t groupingDepth;
  AFHomeAnnouncementSnapshot *v4;
  BOOL v5;
  int64_t v6;

  groupingDepth = self->_groupingDepth;
  if (groupingDepth == 1)
  {
    v4 = -[AFHomeAnnouncementSnapshot initWithState:lastPlayedAnnouncement:]([AFHomeAnnouncementSnapshot alloc], "initWithState:lastPlayedAnnouncement:", self->_state, self->_lastPlayedAnnouncement);
    -[AFHomeAnnouncementObserver _updateSnapshot:](self, "_updateSnapshot:", v4);

    groupingDepth = self->_groupingDepth;
  }
  v5 = groupingDepth < 1;
  v6 = groupingDepth - 1;
  if (!v5)
  {
    self->_groupingDepth = v6;
    dispatch_group_leave((dispatch_group_t)self->_snapshotGroup);
  }
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_listeners;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_lastPlayedAnnouncement, 0);
  objc_storeStrong((id *)&self->_snapshotGroup, 0);
  objc_storeStrong((id *)&self->_localPlaybackSession, 0);
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __46__AFHomeAnnouncementObserver__updateSnapshot___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "homeAnnouncementObserver:snapshotDidUpdateFrom:to:", a1[4], a1[5], a1[6]);
}

uint64_t __43__AFHomeAnnouncementObserver__updateState___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "homeAnnouncementObserver:stateDidUpdateFrom:to:", a1[4], a1[5], a1[6]);
}

void __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[AFHomeAnnouncementObserver _fetchStateAndLastPlayedAnnouncementForReason:completion:]_block_invoke";
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s lastPlayedAnnouncementInfo = %@", buf, 0x16u);
  }
  getANAnnouncementInfoPlaybackIsActiveKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  getANAnnouncementInfoAnnouncementIDKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_13;
    v19[3] = &unk_1E3A356D0;
    v20 = v9;
    v21 = v3;
    v11 = +[AFHomeAnnouncement newWithBuilder:](AFHomeAnnouncement, "newWithBuilder:", v19);

  }
  else
  {
    v11 = 0;
  }
  v12 = *(void **)(a1 + 40);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_2;
  block[3] = &unk_1E3A356F8;
  v18 = v7;
  v16 = v11;
  v17 = v12;
  v14 = v11;
  dispatch_async(v13, block);

}

void __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  v5 = *(void **)(a1 + 40);
  getANAnnouncementInfoPlaybackStartMachTimeKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartedHostTime:", objc_msgSend(v7, "unsignedLongLongValue"));

  v8 = *(void **)(a1 + 40);
  getANAnnouncementInfoPlaybackFinishedMachTimeKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFinishedHostTime:", objc_msgSend(v10, "unsignedLongLongValue"));

  v11 = *(void **)(a1 + 40);
  getANAnnouncementInfoPlaybackStartDateKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartedDate:", v13);

  v14 = *(void **)(a1 + 40);
  getANAnnouncementInfoPlaybackFinishedDateKey();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFinishedDate:", v15);

}

uint64_t __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFHomeAnnouncementObserver _fetchStateAndLastPlayedAnnouncementForReason:completion:]_block_invoke_2";
    v8 = 1024;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s isPlaying = %d, lastPlayedAnnouncement = %@", (uint8_t *)&v6, 0x1Cu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __51__AFHomeAnnouncementObserver_connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLocalPlaybackSession");
}

uint64_t __51__AFHomeAnnouncementObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLocalPlaybackSession");
}

uint64_t __77__AFHomeAnnouncementObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_updateState:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_updateLastPlayedAnnouncement:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "_endGrouping");
}

uint64_t __40__AFHomeAnnouncementObserver_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_tearDown");
}

void __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD v10[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (!v2[10])
  {
    objc_msgSend(v2, "_beginGrouping");
    v4 = *(void **)(a1 + 32);
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_2;
    v10[3] = &unk_1E3A356A8;
    v10[4] = v4;
    objc_msgSend(v4, "_fetchStateAndLastPlayedAnnouncementForReason:completion:", CFSTR("client request without cache"), v10);
    v2 = *(_QWORD **)(a1 + 32);
  }
  if ((uint64_t)v2[6] < 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2[10]);
  }
  else
  {
    v5 = v2[7];
    v6 = v2[1];
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_3;
    block[3] = &unk_1E3A36FA0;
    v7 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    dispatch_group_notify(v5, v6, block);

  }
}

uint64_t __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_updateState:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_updateLastPlayedAnnouncement:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "_endGrouping");
}

uint64_t __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

uint64_t __53__AFHomeAnnouncementObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __45__AFHomeAnnouncementObserver_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__AFHomeAnnouncementObserver_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

void __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_setUp");
  objc_msgSend(*(id *)(a1 + 32), "_beginGrouping");
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke_2;
  v3[3] = &unk_1E3A356A8;
  v4 = v2;
  objc_msgSend(v4, "_fetchStateAndLastPlayedAnnouncementForReason:completion:", CFSTR("initial"), v3);

}

uint64_t __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_updateState:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_updateLastPlayedAnnouncement:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "_endGrouping");
}

@end

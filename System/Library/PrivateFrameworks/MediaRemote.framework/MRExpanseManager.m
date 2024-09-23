@implementation MRExpanseManager

+ (MRExpanseManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_20);
  return (MRExpanseManager *)(id)sharedManager___manager;
}

- (BOOL)expanseSessionHasScreenSharingActivity
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MRExpanseManager activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySessions");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "state") == 1)
        {
          _MRLogForCategory(2uLL);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Local activity found.", v15, 2u);
          }

          objc_msgSend(v8, "activity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isScreenSharingActivity");

          if (v11)
          {
            _MRLogForCategory(2uLL);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v15 = 0;
              _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Local screen sharing activity found.", v15, 2u);
            }

            v12 = 1;
            goto LABEL_18;
          }
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }

  _MRLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] No screen sharing activity found.", v15, 2u);
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)activeConversation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MRExpanseManager conversationManager](self, "conversationManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "state") == 3)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

void __33__MRExpanseManager_sharedManager__block_invoke()
{
  MRExpanseManager *v0;
  dispatch_queue_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v0 = [MRExpanseManager alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.amp.MediaRemote.MRExpanseManager.shared", v4);
  v2 = -[MRExpanseManager initWithQueue:](v0, "initWithQueue:", v1);
  v3 = (void *)sharedManager___manager;
  sharedManager___manager = v2;

}

- (MRExpanseManager)initWithQueue:(id)a3
{
  id v5;
  MRExpanseManager *v6;
  MRExpanseManager *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *notifyQueue;
  uint64_t v11;
  NSHashTable *observers;
  uint64_t v13;
  TUConversationManager *conversationManager;
  uint64_t v15;
  TUNeighborhoodActivityConduit *conduit;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRExpanseManager;
  v6 = -[MRExpanseManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.amp.MediaRemote.MRExpanseManager.notifyQueue", v8);
    notifyQueue = v7->_notifyQueue;
    v7->_notifyQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v11;

    getTUConversationManagerClass[0]();
    v13 = objc_opt_new();
    conversationManager = v7->_conversationManager;
    v7->_conversationManager = (TUConversationManager *)v13;

    -[TUConversationManager addDelegate:queue:](v7->_conversationManager, "addDelegate:queue:", v7, v7->_queue);
    v15 = objc_msgSend(objc_alloc((Class)getTUNeighborhoodActivityConduitClass[0]()), "initWithConversationManager:", v7->_conversationManager);
    conduit = v7->_conduit;
    v7->_conduit = (TUNeighborhoodActivityConduit *)v15;

    -[TUNeighborhoodActivityConduit addDelegate:queue:](v7->_conduit, "addDelegate:queue:", v7, v7->_queue);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MRExpanseManager conduit](self, "conduit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDelegate:", self);

  -[MRExpanseManager conversationManager](self, "conversationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDelegate:", self);

  v5.receiver = self;
  v5.super_class = (Class)MRExpanseManager;
  -[MRExpanseManager dealloc](&v5, sel_dealloc);
}

- (BOOL)activeActivityExistsForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MRExpanseManager activeConversation](self, "activeConversation", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activitySessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "state") == 1 || objc_msgSend(v10, "state") == 4)
        {
          objc_msgSend(v10, "activity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
          {
            _MRLogForCategory(2uLL);
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v20 = v4;
              _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Found active activity for %{private}@", buf, 0xCu);
            }

            LOBYTE(v7) = 1;
            goto LABEL_15;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v7;
}

- (NSString)activeTelevisionRouteID
{
  void *v2;
  void *v3;
  void *v4;

  -[MRExpanseManager conduit](self, "conduit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSplitSessionTV");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)deviceIsActiveTelevision:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  char v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRExpanseManager activeTelevisionRouteID](self, "activeTelevisionRouteID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v4, "deviceSubtype") != 15)
    {
      objc_msgSend(v4, "uid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "isEqualToString:", v5);

      goto LABEL_15;
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "clusterComposition", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "uid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v5);

          if ((v12 & 1) != 0)
          {

            v13 = 1;
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)expanseHandoffSupported
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MRExpanseManager activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySessions");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "activity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "supportsContinuationOnTV");

        if (v10)
        {
          _MRLogForCategory(2uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Found activity to continue on TV.", v14, 2u);
          }

          v11 = 1;
          goto LABEL_15;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }

  _MRLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Found no activity to continue on TV.", v14, 2u);
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)errorIsTelevisionCapabilitiesError:(id)a3
{
  return objc_msgSend(a3, "code") == 21;
}

- (BOOL)expanseSessionActive
{
  void *v2;
  BOOL v3;

  -[MRExpanseManager activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)expanseSessionHasActiveActivity
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MRExpanseManager activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySessions");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "state") == 1)
        {
          _MRLogForCategory(2uLL);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Local activity found.", v11, 2u);
          }

          v8 = 1;
          goto LABEL_15;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  _MRLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] No local activity found.", v11, 2u);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)expanseSessionHasRemoteActivity
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MRExpanseManager activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySessions");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "state") == 4)
        {
          _MRLogForCategory(2uLL);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Remote activity found.", v11, 2u);
          }

          v8 = 1;
          goto LABEL_15;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  _MRLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] No remote activity found.", v11, 2u);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (void)addTelevisionWithRouteIdentifierToSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MRExpanseManager activeConversation](self, "activeConversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(2uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Adding television with route ID: %@ to conversation %@", buf, 0x16u);

  }
  v11 = (void *)objc_msgSend(objc_alloc(getTUNearbyDeviceHandleClass()), "initWithType:identifier:name:", 1, v6, 0);
  -[MRExpanseManager conduit](self, "conduit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__MRExpanseManager_addTelevisionWithRouteIdentifierToSession_completion___block_invoke;
  v15[3] = &unk_1E30C7488;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v12, "inviteTVDevice:toConversation:completion:", v11, v13, v15);

}

void __73__MRExpanseManager_addTelevisionWithRouteIdentifierToSession_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MRLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138477827;
    v8 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television add completed with error: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);

}

- (void)removeTelevisionWithRouteIdentifierFromSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _MRLogForCategory(2uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Removing television with route ID: %@", buf, 0xCu);
  }

  v9 = (void *)objc_msgSend(objc_alloc(getTUNearbyDeviceHandleClass()), "initWithType:identifier:name:", 1, v6, 0);
  -[MRExpanseManager conduit](self, "conduit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__MRExpanseManager_removeTelevisionWithRouteIdentifierFromSession_completion___block_invoke;
  v12[3] = &unk_1E30C7488;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "disconnectTVDevice:completion:", v9, v12);

}

void __78__MRExpanseManager_removeTelevisionWithRouteIdentifierFromSession_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MRLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138477827;
    v8 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television removal completed with error: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);

}

- (void)addObserver:(id)a3
{
  id v4;
  MRExpanseManager *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[MRExpanseManager observers](v5, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  MRExpanseManager *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[MRExpanseManager observers](v5, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (void)_notifyObserversThatTelevisionJoinedSession
{
  MRExpanseManager *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MRExpanseManager observers](v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[MRExpanseManager notifyQueue](v2, "notifyQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __63__MRExpanseManager__notifyObserversThatTelevisionJoinedSession__block_invoke;
          v9[3] = &unk_1E30C5F40;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __63__MRExpanseManager__notifyObserversThatTelevisionJoinedSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "expanseManagerTelevisionDidJoinSession:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversThatTelevisionLeftSession
{
  MRExpanseManager *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MRExpanseManager observers](v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[MRExpanseManager notifyQueue](v2, "notifyQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __61__MRExpanseManager__notifyObserversThatTelevisionLeftSession__block_invoke;
          v9[3] = &unk_1E30C5F40;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __61__MRExpanseManager__notifyObserversThatTelevisionLeftSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "expanseManagerTelevisionDidLeaveSession:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversThatExpanseSessionJoined
{
  MRExpanseManager *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MRExpanseManager observers](v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[MRExpanseManager notifyQueue](v2, "notifyQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __60__MRExpanseManager__notifyObserversThatExpanseSessionJoined__block_invoke;
          v9[3] = &unk_1E30C5F40;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __60__MRExpanseManager__notifyObserversThatExpanseSessionJoined__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "expanseManagerDidJoinExpanseSession:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversThatExpanseSessionLeft
{
  MRExpanseManager *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MRExpanseManager observers](v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[MRExpanseManager notifyQueue](v2, "notifyQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __58__MRExpanseManager__notifyObserversThatExpanseSessionLeft__block_invoke;
          v9[3] = &unk_1E30C5F40;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __58__MRExpanseManager__notifyObserversThatExpanseSessionLeft__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "expanseManagerDidLeaveExpanseSession:", *(_QWORD *)(a1 + 40));
}

- (void)_handleExpanseSessionJoined
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRExpanseManager] Failed to set category for audio session, route picking likely to malfunction. Error: %{private}@.", (uint8_t *)&v2, 0xCu);
}

- (void)_handleExpanseSessionLeft
{
  void *v2;
  MRExpanseManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MRExpanseManager auxiliaryPlaybackAudioSession](obj, "auxiliaryPlaybackAudioSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[MRExpanseManager setAuxiliaryPlaybackAudioSession:](obj, "setAuxiliaryPlaybackAudioSession:", 0);
    -[MRExpanseManager _notifyObserversThatExpanseSessionLeft](obj, "_notifyObserversThatExpanseSessionLeft");
  }
  objc_sync_exit(obj);

}

- (void)_handleConversationStateChanged
{
  if (-[MRExpanseManager expanseSessionActive](self, "expanseSessionActive"))
    -[MRExpanseManager _handleExpanseSessionJoined](self, "_handleExpanseSessionJoined");
  else
    -[MRExpanseManager _handleExpanseSessionLeft](self, "_handleExpanseSessionLeft");
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _MRLogForCategory(2uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = objc_msgSend(v5, "state");
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Conversation %@ state changed to %ld", (uint8_t *)&v8, 0x16u);

  }
  -[MRExpanseManager _handleConversationStateChanged](self, "_handleConversationStateChanged");

}

- (void)serverDisconnectedForConversationManager:(id)a3
{
  NSObject *v4;

  _MRLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[MRExpanseManager serverDisconnectedForConversationManager:].cold.1(v4);

  -[MRExpanseManager _handleConversationStateChanged](self, "_handleConversationStateChanged");
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _MRLogForCategory(2uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138478083;
    v8 = v5;
    v9 = 1024;
    v10 = -[MRExpanseManager expanseSessionHasRemoteActivity](self, "expanseSessionHasRemoteActivity");
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television joined split session: %{private}@, remoteActivity: %{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  -[MRExpanseManager _notifyObserversThatTelevisionJoinedSession](self, "_notifyObserversThatTelevisionJoinedSession");
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _MRLogForCategory(2uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138478083;
    v8 = v5;
    v9 = 1024;
    v10 = -[MRExpanseManager expanseSessionHasActiveActivity](self, "expanseSessionHasActiveActivity");
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television left split session: %{private}@, localActivity: %{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  -[MRExpanseManager _notifyObserversThatTelevisionLeftSession](self, "_notifyObserversThatTelevisionLeftSession");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (TUNeighborhoodActivityConduit)conduit
{
  return self->_conduit;
}

- (AVAudioSession)auxiliaryPlaybackAudioSession
{
  return self->_auxiliaryPlaybackAudioSession;
}

- (void)setAuxiliaryPlaybackAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryPlaybackAudioSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryPlaybackAudioSession, 0);
  objc_storeStrong((id *)&self->_conduit, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)serverDisconnectedForConversationManager:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193827000, log, OS_LOG_TYPE_DEBUG, "[MRExpanseManager] Conversation manager lost connection.", v1, 2u);
}

@end

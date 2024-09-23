@implementation MapsSuggestionsDestinationdTrigger

- (MapsSuggestionsDestinationdTrigger)init
{
  return -[MapsSuggestionsDestinationdTrigger initWithName:](self, "initWithName:", CFSTR("MapsSuggestionsDestinationdTrigger"));
}

- (MapsSuggestionsDestinationdTrigger)initWithName:(id)a3
{
  id v4;
  id v5;
  MapsSuggestionsDestinationdTrigger *v6;
  uint64_t v7;
  NSSet *ignoredPeerIdentifiers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsDestinationdTrigger;
  v5 = -[MapsSuggestionsBaseTrigger initWithName:](&v10, sel_initWithName_, v4);
  v6 = (MapsSuggestionsDestinationdTrigger *)v5;
  if (v5)
  {
    std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)v5 + 4, 0);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    ignoredPeerIdentifiers = v6->_ignoredPeerIdentifiers;
    v6->_ignoredPeerIdentifiers = (NSSet *)v7;

  }
  return v6;
}

- (void)addIgnoredClientProcess:(id)a3
{
  id v4;
  void *v5;
  MapsSuggestionsDestinationdTrigger *v6;
  uint64_t v7;
  NSSet *ignoredPeerIdentifiers;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A859CDD8]();
    v6 = self;
    objc_sync_enter(v6);
    -[NSSet setByAddingObject:](v6->_ignoredPeerIdentifiers, "setByAddingObject:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    ignoredPeerIdentifiers = v6->_ignoredPeerIdentifiers;
    v6->_ignoredPeerIdentifiers = (NSSet *)v7;

    objc_sync_exit(v6);
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsIPC.mm";
      v12 = 1024;
      v13 = 168;
      v14 = 2082;
      v15 = "-[MapsSuggestionsDestinationdTrigger addIgnoredClientProcess:]";
      v16 = 2082;
      v17 = "nil == (clientProcessName)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a process name", (uint8_t *)&v10, 0x26u);
    }

  }
}

- (void)didAddFirstObserver
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD aBlock[4];
  id v8;
  id location;
  void *__p[2];
  char v11;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MapsSuggestionsDestinationdTrigger_didAddFirstObserver__block_invoke;
  aBlock[3] = &unk_1E4BDF590;
  objc_copyWeak(&v8, &location);
  v5 = _Block_copy(aBlock);
  v6 = operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, "com.apple.maps.destinationd.launched");
  MSg::NotificationReceiver::NotificationReceiver(v6, (__int128 *)__p, v4, v5);
  if (v11 < 0)
    operator delete(__p[0]);
  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_notificationReceiver, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__MapsSuggestionsDestinationdTrigger_didAddFirstObserver__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  uint8_t v20[4];
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v11 = *(_QWORD *)(a2 + 32);
          if (v11 == MapsSuggestionsIPCPayloadForNSString(v10))
          {
            GEOFindOrCreateLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v10;
              _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "Ignoring wake-ups from peerIdentifier '%@'", buf, 0xCu);
            }

            objc_sync_exit(v5);
            GEOFindOrCreateLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v20 = 0;
              _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "Not firing because this client process is being ignored.", v20, 2u);
            }
            goto LABEL_18;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_sync_exit(v5);
    objc_msgSend(v5, "triggerMyObservers", (_QWORD)v14);
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 136446722;
      v21 = "MapsSuggestionsIPC.mm";
      v22 = 1026;
      v23 = 201;
      v24 = 2082;
      v25 = "-[MapsSuggestionsDestinationdTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v20, 0x1Cu);
    }

LABEL_18:
  }

}

- (void)didRemoveLastObserver
{
  NSObject *v3;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_notificationReceiver, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredPeerIdentifiers, 0);
  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_notificationReceiver, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

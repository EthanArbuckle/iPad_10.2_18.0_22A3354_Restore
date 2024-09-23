@implementation NSFileWatcher

uint64_t __26__NSFileWatcher_watchItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v5;

  if ((objc_msgSend((id)objc_msgSend(a2, "stringByDeletingLastPathComponent"), "isEqualToString:", CFSTR("/")) & 1) != 0)
    return 0;
  v5 = (void *)objc_msgSend(a2, "lastPathComponent");
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "stringByAppendingPathComponent:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

uint64_t __26__NSFileWatcher_watchItem__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  void *v9;
  int v10;
  uintptr_t v11;
  dispatch_source_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v22[7];
  _QWORD v23[10];
  int v24;
  _QWORD handler[7];
  _QWORD v26[2];
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  uint64_t v29;
  uint64_t v30;
  statfs buf;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v27 = __26__NSFileWatcher_watchItem__block_invoke_2;
  v28 = &unk_1E0F551A8;
  v7 = a1[5];
  v29 = a3;
  v30 = v7;
  v8 = +[_NSFileWatcherFileHandleInfo openFileWithPath:](_NSFileWatcherFileHandleInfo, "openFileWithPath:", a2);
  if (!v8)
    return v27((uint64_t)v26, a2);
  v9 = v8;
  v10 = v8[2];
  if (a3)
  {
    v11 = 32;
    goto LABEL_4;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v8, "isDirectory");
  v16 = a1[4];
  v17 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)&buf.f_bsize = *(_OWORD *)(v16 + 16);
  *(_OWORD *)&buf.f_bfree = v17;
  if ((objc_msgSend(v9, "verifyAccessByAuditToken:", &buf) & 1) == 0)
  {
    v19 = _NSFCFSEventsLog();
    v18 = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138477827;
      *(_QWORD *)&buf.f_iosize = a2;
      _os_log_impl(&dword_1817D9000, v19, OS_LOG_TYPE_DEFAULT, "Refused to register file watcher for file at path %{private}@ on behalf of an NSFilePresenter because the requesting process does not have access to it", (uint8_t *)&buf, 0xCu);
      v18 = 0;
    }
LABEL_12:
    v20 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_error_impl(&dword_1817D9000, v20, OS_LOG_TYPE_ERROR, "NSFileCoordinator: dispatch_source_create() returned NULL, which is a surprise.", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(v9, "close");
    if ((v18 & 1) == 0)
      return 0;
    return v27((uint64_t)v26, a2);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v11 = 41;
    goto LABEL_4;
  }
  memset(&buf, 0, 512);
  if (!fstatfs(v10, &buf) && (buf.f_flags & 0x1000) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    objc_msgSend(v9, "close");
    return v27((uint64_t)v26, a2);
  }
  v11 = 111;
LABEL_4:
  v12 = dispatch_source_create(MEMORY[0x1E0C80DE8], v10, v11, *(dispatch_queue_t *)(a1[4] + 8));
  if (!v12)
  {
    v18 = 1;
    goto LABEL_12;
  }
  v13 = v12;
  v14 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  *(_QWORD *)&buf.f_bsize = 0;
  buf.f_blocks = (uint64_t)&buf;
  buf.f_bfree = 0x3052000000;
  buf.f_bavail = (uint64_t)__Block_byref_object_copy__66;
  buf.f_files = (uint64_t)__Block_byref_object_dispose__67;
  buf.f_ffree = 0;
  handler[0] = v6;
  handler[1] = 3221225472;
  handler[2] = __26__NSFileWatcher_watchItem__block_invoke_68;
  handler[3] = &unk_1E0F551D0;
  handler[5] = v26;
  handler[6] = &buf;
  handler[4] = a2;
  dispatch_source_set_registration_handler(v13, handler);
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __26__NSFileWatcher_watchItem__block_invoke_2_69;
  v23[3] = &unk_1E0F551F8;
  v23[4] = v13;
  v23[5] = a2;
  v15 = a1[4];
  v24 = v10;
  v23[8] = v26;
  v23[9] = &buf;
  v23[6] = v15;
  v23[7] = a3;
  dispatch_source_set_event_handler(v13, v23);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __26__NSFileWatcher_watchItem__block_invoke_70;
  v22[3] = &unk_1E0F55220;
  v22[4] = v9;
  v22[5] = &buf;
  v22[6] = a1[5];
  dispatch_source_set_cancel_handler(v13, v22);
  dispatch_resume(v13);
  _Block_object_dispose(&buf, 8);
  return (uint64_t)v13;
}

- (NSFileWatcher)initWithQueue:(id)a3 auditToken:(id *)a4
{
  NSFileWatcher *v7;
  NSFileWatcher *v8;
  __int128 v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (initializeFSEvents_predicate != -1)
    dispatch_once(&initializeFSEvents_predicate, &__block_literal_global_119);
  v11.receiver = self;
  v11.super_class = (Class)NSFileWatcher;
  v7 = -[NSFileWatcher init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v9 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v8->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v8->_auditToken.val[4] = v9;
    v8->_lastObservedEventID = -1;
  }
  return v8;
}

- (void)watchItem
{
  NSObject *v3;
  NSObject *eventSource;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSURL *v10;
  NSObject *v11;
  const char *v12;
  NSURL *url;
  NSObject *v14;
  NSURL *v15;
  unint64_t lastObservedEventID;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t v30[4];
  id v31;
  __int16 v32;
  unint64_t v33;
  __int128 v34;
  uint64_t (*v35)(_QWORD);
  uint64_t (*v36)(_QWORD);
  uint64_t (*v37)(_QWORD);
  __int128 buf;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = url;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Starting to watch %{private}@", (uint8_t *)&buf, 0xCu);
  }

  self->_fileReferenceURL = 0;
  self->_formerPath = 0;
  if (self->_eventStream)
  {
    off_1ECD0A860();
    off_1ECD0A868(self->_eventStream);
    off_1ECD0A858(self->_eventStream);
    self->_eventStream = 0;
  }
  eventSource = self->_eventSource;
  if (eventSource)
  {
    dispatch_source_cancel(eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0;
  }
  if (-[NSURL isFileURL](self->_url, "isFileURL"))
  {
    v5 = -[NSURL path](self->_url, "path");
    if (v5)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v39 = 0x3052000000;
      v40 = __Block_byref_object_copy__31;
      v41 = __Block_byref_object_dispose__31;
      v42 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __26__NSFileWatcher_watchItem__block_invoke;
      v17[3] = &unk_1E0F55248;
      v17[4] = self;
      v17[5] = &buf;
      v17[6] = &v26;
      v17[7] = &v22;
      v17[8] = &v18;
      v6 = objc_msgSend(v17, "copy");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v6;
      self->_eventSource = (OS_dispatch_source *)(*(uint64_t (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v5, 0);

      if (*((_BYTE *)v23 + 24))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
        *(_QWORD *)&v34 = 0;
        *((_QWORD *)&v34 + 1) = self;
        v35 = MEMORY[0x1E0C98BD0];
        v36 = MEMORY[0x1E0C98BC0];
        v37 = MEMORY[0x1E0C98350];
        self->_eventStream = (__FSEventStream *)off_1ECD0A870(0, eventStreamCallback, &v34, v7, self->_lastObservedEventID, 19, 0.0);

        if (self->_eventStream)
        {
          v8 = _NSFCFSEventsLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            lastObservedEventID = self->_lastObservedEventID;
            *(_DWORD *)v30 = 138478083;
            v31 = v5;
            v32 = 2048;
            v33 = lastObservedEventID;
            _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "#fsevents Starting stream for %{private}@ with event ID %llx", v30, 0x16u);
          }
          off_1ECD0A878(self->_eventStream, self->_queue);
          if (off_1ECD0A880(self->_eventStream))
          {
            self->_eventsAreAboutDirectory = *((_BYTE *)v27 + 24);
            goto LABEL_20;
          }
          off_1ECD0A858(self->_eventStream);
          self->_eventStream = 0;
          v11 = _NSFCFSEventsLog();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          *(_DWORD *)v30 = 138477827;
          v31 = v5;
          v12 = "#fsevents FSEventStreamStart() returned NO. Path: %{private}@";
        }
        else
        {
          v11 = _NSFCFSEventsLog();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          *(_DWORD *)v30 = 138477827;
          v31 = v5;
          v12 = "#fsevents FSEventStreamCreate() returned NULL. Path: %{private}@";
        }
        _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, v12, v30, 0xCu);
      }
LABEL_20:
      if (*((_BYTE *)v19 + 24))
      {
        v14 = _NSFCFSEventsLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v34) = 138477827;
          *(_QWORD *)((char *)&v34 + 4) = v5;
          _os_log_error_impl(&dword_1817D9000, v14, OS_LOG_TYPE_ERROR, "Using fileReferenceURL for  FSEventStreamCreate() returned NULL. Path: %{private}@", (uint8_t *)&v34, 0xCu);
        }
        CFURLClearResourcePropertyCache((CFURLRef)self->_url);
        v15 = (NSURL *)-[NSURL copy](-[NSURL fileReferenceURL](self->_url, "fileReferenceURL"), "copy");
        self->_fileReferenceURL = v15;
        self->_formerPath = (NSString *)objc_msgSend(-[NSURL path](v15, "path"), "copy");
      }
      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      return;
    }
    v9 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = self->_url;
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_error_impl(&dword_1817D9000, v9, OS_LOG_TYPE_ERROR, "No file watcher could be started. URL: %{private}@", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)start
{
  self->_isWatching = 1;
  -[NSFileWatcher watchItem](self, "watchItem");
}

- (void)setURL:(id)a3
{
  NSURL *v4;
  NSURL *url;
  NSURL *v6;

  v4 = (NSURL *)objc_msgSend(a3, "filePathURL");
  url = self->_url;
  if (v4 != url)
  {
    v6 = v4;
    if (self->_isUnsettled)
    {
      -[NSFileWatcherObservations addAnnouncedMoveToPath:](self->_itemObservations, "addAnnouncedMoveToPath:", -[NSURL path](v4, "path"));
      url = self->_url;
      if (!self->_formerURL)
      {
        self->_formerURL = url;
        url = self->_url;
      }
    }

    self->_url = (NSURL *)-[NSURL copy](v6, "copy");
    if (!self->_isUnsettled && self->_isWatching)
      -[NSFileWatcher watchItem](self, "watchItem");
  }
}

- (void)setObserver:(id)a3
{
  id observer;

  observer = self->_observer;
  if (observer != a3)
  {

    self->_observer = (id)objc_msgSend(a3, "copy");
  }
}

- (void)dealloc
{
  NSObject *v3;
  __FSEventStream *eventStream;
  NSObject *eventSource;
  NSObject *queue;
  objc_super v7;
  uint8_t buf[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isWatching)
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "A file watcher that has been started but not stopped is being deallocated", buf, 2u);
    }
  }

  eventStream = self->_eventStream;
  if (eventStream)
    off_1ECD0A858(eventStream);
  eventSource = self->_eventSource;
  if (eventSource)
    dispatch_release(eventSource);

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v7.receiver = self;
  v7.super_class = (Class)NSFileWatcher;
  -[NSFileWatcher dealloc](&v7, sel_dealloc);
}

- (void)handleFSEventPath:(id)a3 flags:(unsigned int)a4 id:(unint64_t)a5
{
  unsigned int v9;
  NSObject *v10;
  unint64_t lastObservedEventID;
  NSObject *v12;
  NSFileWatcherObservations *v13;
  NSFileWatcherObservations *itemObservations;
  NSURL *url;
  int v16;
  id v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4 & 0xFF80FFFF;
  v10 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138478595;
    v17 = a3;
    v18 = 1024;
    v19 = v9;
    v20 = 1024;
    v21 = a4 & 0x7F0000;
    v22 = 2048;
    v23 = a5;
    _os_log_debug_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEBUG, "#fsevents path: %{private}@, flags: %x (ignored: %x), id: %llx", (uint8_t *)&v16, 0x22u);
  }
  if (self->_isWatching)
  {
    lastObservedEventID = self->_lastObservedEventID;
    if (lastObservedEventID == -1)
    {
      if (!v9)
        return;
    }
    else if (!v9 || (a4 & 0x10) != 0 || lastObservedEventID >= a5)
    {
      return;
    }
    if (!self->_isUnsettled)
    {
      v12 = _NSFCFSEventsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        url = self->_url;
        v16 = 138477827;
        v17 = url;
        _os_log_debug_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEBUG, "Unsettling watcher for %{private}@ in response to event", (uint8_t *)&v16, 0xCu);
      }
      self->_isUnsettled = 1;
    }
    if (self->_eventsAreAboutDirectory)
    {
      v13 = (NSFileWatcherObservations *)-[NSMutableDictionary objectForKey:](self->_subitemObservationsByEventPath, "objectForKey:", a3);
      if (!v13)
      {
        if (!self->_subitemObservationsByEventPath)
        {
          self->_subitemObservationsByEventPath = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          (*((void (**)(void))self->_observer + 2))();
        }
        v13 = -[NSFileWatcherObservations initWithPath:]([NSFileWatcherObservations alloc], "initWithPath:", a3);
        -[NSMutableDictionary setObject:forKey:](self->_subitemObservationsByEventPath, "setObject:forKey:", v13, a3);

      }
      -[NSFileWatcherObservations addContentsChange](v13, "addContentsChange");
    }
    else
    {
      itemObservations = self->_itemObservations;
      if (!itemObservations)
      {
        self->_itemObservations = -[NSFileWatcherObservations initWithPath:]([NSFileWatcherObservations alloc], "initWithPath:", -[NSURL path](self->_url, "path"));
        (*((void (**)(void))self->_observer + 2))();
        itemObservations = self->_itemObservations;
      }
      -[NSFileWatcherObservations addAttributeChange](itemObservations, "addAttributeChange");
    }
    self->_lastObservedEventID = a5;
  }
}

uint64_t __26__NSFileWatcher_watchItem__block_invoke_68(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __26__NSFileWatcher_watchItem__block_invoke_2_69(uint64_t a1)
{
  uintptr_t data;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint8_t v13[4];
  int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uintptr_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138478083;
    v16 = v10;
    v17 = 2048;
    v18 = data;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "#vnode path: %{private}@, flags: %p", buf, 0x16u);
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(v4 + 64))
  {
    if (!*(_BYTE *)(v4 + 97))
    {
      v5 = _NSFCFSEventsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
        *(_DWORD *)buf = 138477827;
        v16 = v11;
        _os_log_debug_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEBUG, "Unsettling watcher for %{private}@ in response to event", buf, 0xCu);
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 48) + 97) = 1;
      v4 = *(_QWORD *)(a1 + 48);
    }
    if (*(_QWORD *)(v4 + 104))
    {
      if ((data & 0x20) == 0)
        goto LABEL_20;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104) = -[NSFileWatcherObservations initWithPath:]([NSFileWatcherObservations alloc], "initWithPath:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "path"));
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 56) + 16))();
      if ((data & 0x20) == 0)
        goto LABEL_20;
    }
    if (fcntl(*(_DWORD *)(a1 + 80), 50, buf) != -1)
    {
      v6 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", buf);
      v7 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v7)
      {
        dispatch_source_cancel(v7);
        dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v8 = (uint64_t)v6;
      if (*(_QWORD *)(a1 + 56))
        v8 = -[NSString stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "addDetectedMoveToPath:", v8);

      if ((data & 8) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
    v9 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = *__error();
      *(_DWORD *)v13 = 67109120;
      v14 = v12;
      _os_log_error_impl(&dword_1817D9000, v9, OS_LOG_TYPE_ERROR, "A presented file was moved but its new name couldn't be gotten. Error: %i", v13, 8u);
      if ((data & 8) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
LABEL_20:
    if ((data & 8) == 0)
    {
LABEL_22:
      if ((data & 6) != 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "addContentsChange");
      if ((data & 1) != 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "addDeletion");
      return;
    }
LABEL_21:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "addAttributeChange");
    goto LABEL_22;
  }
}

void __26__NSFileWatcher_watchItem__block_invoke_70(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "close");
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }

}

- (void)setLastObservedEventID:(unint64_t)a3
{
  self->_lastObservedEventID = a3;
}

- (void)unsettle
{
  NSObject *v3;
  NSURL *url;
  int v5;
  NSURL *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    v5 = 138477827;
    v6 = url;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Manually unsettling watcher for %{private}@", (uint8_t *)&v5, 0xCu);
  }
  self->_isUnsettled = 1;
  if (!self->_itemObservations)
  {
    self->_itemObservations = -[NSFileWatcherObservations initWithPath:]([NSFileWatcherObservations alloc], "initWithPath:", -[NSURL path](self->_url, "path"));
    (*((void (**)(void))self->_observer + 2))();
  }
}

- (void)_coalesceSubitemObservations
{
  NSMutableDictionary *subitemObservationsByEventPath;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__66;
  v9 = __Block_byref_object_dispose__67;
  v10 = 0;
  subitemObservationsByEventPath = self->_subitemObservationsByEventPath;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__NSFileWatcher__coalesceSubitemObservations__block_invoke;
  v4[3] = &unk_1E0F55270;
  v4[4] = self;
  v4[5] = &v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subitemObservationsByEventPath, "enumerateKeysAndObjectsUsingBlock:", v4);
  if (v6[5])
  {
    -[NSMutableDictionary setDictionary:](self->_subitemObservationsByEventPath, "setDictionary:");

  }
  _Block_object_dispose(&v5, 8);
}

void __45__NSFileWatcher__coalesceSubitemObservations__block_invoke(uint64_t a1, const __CFString *a2)
{
  CFURLRef v3;
  CFURLRef v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = CFURLCreateWithFileSystemPath(0, a2, kCFURLPOSIXPathStyle, 0);
  if (v3)
  {
    v4 = v3;
    if (_CFURLIsItemPromiseAtURL())
    {
      v5 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
      if (v5)
      {
        v6 = v5;
        v7 = objc_msgSend(v5, "path");
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKey:", v7))
        {
          v8 = _NSFCFSEventsLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v10 = 138477827;
            v11 = v7;
            _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "Coalescing observations for both the logical URL %{private}@ and its promise URL", (uint8_t *)&v10, 0xCu);
          }
          v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          if (!v9)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "mutableCopy");
            v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          }
          objc_msgSend(v9, "removeObjectForKey:", v7);
        }
        CFRelease(v6);
      }
    }
    CFRelease(v4);
  }
}

- (void)settle
{
  NSObject *v3;
  NSURL *fileReferenceURL;
  NSString *formerPath;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSFileWatcherObservations *itemObservations;
  uint64_t v10;
  id v11;
  id v12;
  NSMutableDictionary *subitemObservationsByEventPath;
  NSURL *url;
  NSString *v15;
  NSString *v16;
  _QWORD v17[8];
  _QWORD v18[6];
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_isUnsettled)
  {
    v3 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)buf = 138477827;
      v21 = url;
      _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Settling watcher for %{private}@", buf, 0xCu);
    }
    fileReferenceURL = self->_fileReferenceURL;
    if (fileReferenceURL)
    {
      formerPath = self->_formerPath;
      if (!formerPath)
      {
LABEL_15:
        itemObservations = self->_itemObservations;
        v10 = MEMORY[0x1E0C809B0];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __23__NSFileWatcher_settle__block_invoke;
        v18[3] = &unk_1E0F55298;
        v19 = (char)formerPath;
        v18[4] = self;
        v18[5] = CFSTR("/private");
        -[NSFileWatcherObservations notifyObserver:](itemObservations, "notifyObserver:", v18);

        self->_itemObservations = 0;
        -[NSFileWatcher _coalesceSubitemObservations](self, "_coalesceSubitemObservations");
        v11 = -[NSURL path](self->_url, "path");
        v12 = -[NSURL path](self->_formerURL, "path");
        subitemObservationsByEventPath = self->_subitemObservationsByEventPath;
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = __23__NSFileWatcher_settle__block_invoke_78;
        v17[3] = &unk_1E0F552E8;
        v17[4] = v11;
        v17[5] = v12;
        v17[6] = CFSTR("/private");
        v17[7] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subitemObservationsByEventPath, "enumerateKeysAndObjectsUsingBlock:", v17);

        self->_subitemObservationsByEventPath = 0;
        (*((void (**)(void))self->_observer + 2))();

        self->_formerURL = 0;
        self->_isUnsettled = 0;
        return;
      }
      CFURLClearResourcePropertyCache((CFURLRef)fileReferenceURL);
      v6 = -[NSURL path](self->_fileReferenceURL, "path");
      v7 = _NSFCFSEventsLog();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8)
        {
          v15 = self->_formerPath;
          *(_DWORD *)buf = 138478083;
          v21 = v15;
          v22 = 2113;
          v23 = v6;
          _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "#filereference Detected move from %{private}@ to %{private}@", buf, 0x16u);
        }
        if ((objc_msgSend(v6, "isEqualToString:", self->_formerPath) & 1) == 0)
        {
          -[NSFileWatcherObservations addDetectedMoveToPath:](self->_itemObservations, "addDetectedMoveToPath:", v6);
          LOBYTE(formerPath) = 1;
          goto LABEL_15;
        }
      }
      else
      {
        if (v8)
        {
          v16 = self->_formerPath;
          *(_DWORD *)buf = 138477827;
          v21 = v16;
          _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "#filereference Detected deletion of %{private}@", buf, 0xCu);
        }
        -[NSFileWatcherObservations addDeletion](self->_itemObservations, "addDeletion");
      }
    }
    LOBYTE(formerPath) = 0;
    goto LABEL_15;
  }
}

void __23__NSFileWatcher_settle__block_invoke(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    v7 = 0;
  else
    v7 = a2 == 0;
  if (!v7)
  {
    v8 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "Re-watching for new or moved file", (uint8_t *)&v11, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "watchItem");
  }
  v9 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134218243;
    v12 = a3;
    v13 = 2113;
    v14 = a4;
    _os_log_debug_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEBUG, "Notifying the observer. Subitem path: <none>, event kind: %p, event path: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  if (objc_msgSend(a4, "hasPrefix:", *(_QWORD *)(a1 + 40)))
    a4 = (void *)objc_msgSend(a4, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 40), "length"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", a4);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();

}

uint64_t __23__NSFileWatcher_settle__block_invoke_78(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t result;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (void *)a3[4];
  result = objc_msgSend(v5, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32));
  if (result)
  {
    if (!*(_QWORD *)(a1 + 40) || (result = objc_msgSend(v5, "caseInsensitiveCompare:")) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __23__NSFileWatcher_settle__block_invoke_2;
      v7[3] = &unk_1E0F552C0;
      v8 = *(_OWORD *)(a1 + 48);
      return objc_msgSend(a3, "notifyObserver:", v7);
    }
  }
  return result;
}

void __23__NSFileWatcher_settle__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412802;
    v10 = a4;
    v11 = 2048;
    v12 = a3;
    v13 = 2112;
    v14 = a4;
    _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "Notifying the observer. Subitem path: %@, event kind: %p, event path: %@", (uint8_t *)&v9, 0x20u);
  }
  if (objc_msgSend(a4, "hasPrefix:", *(_QWORD *)(a1 + 32)))
    a4 = (void *)objc_msgSend(a4, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "length"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", a4);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) + 16))();

}

- (void)stop
{
  NSObject *v3;
  NSObject *eventSource;
  NSURL *url;
  int v6;
  NSURL *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    v6 = 138477827;
    v7 = url;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Stopping watcher for %{private}@", (uint8_t *)&v6, 0xCu);
  }
  if (self->_isUnsettled)
  {

    self->_itemObservations = 0;
    self->_subitemObservationsByEventPath = 0;
    (*((void (**)(void))self->_observer + 2))();

    self->_formerURL = 0;
    self->_isUnsettled = 0;
  }

  self->_formerPath = 0;
  self->_fileReferenceURL = 0;
  if (self->_eventStream)
  {
    off_1ECD0A860();
    off_1ECD0A868(self->_eventStream);
    off_1ECD0A858(self->_eventStream);
    self->_eventStream = 0;
  }
  eventSource = self->_eventSource;
  if (eventSource)
  {
    dispatch_source_cancel(eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0;
  }
  self->_isWatching = 0;
}

@end

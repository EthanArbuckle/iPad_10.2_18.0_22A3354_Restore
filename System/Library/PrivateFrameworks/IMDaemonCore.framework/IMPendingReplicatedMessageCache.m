@implementation IMPendingReplicatedMessageCache

+ (id)sharedCache
{
  if (qword_1EFC63C58 != -1)
    dispatch_once(&qword_1EFC63C58, &unk_1E92286B0);
  return (id)qword_1EFC63C50;
}

- (IMPendingReplicatedMessageCache)init
{
  IMPendingReplicatedMessageCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *pendingMessages;
  NSCache *v8;
  NSCache *replicatedFallbackHistory;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMPendingReplicatedMessageCache;
  v2 = -[IMPendingReplicatedMessageCache init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.Messages.IMPendingReplicatedMessageCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingMessages = v2->_pendingMessages;
    v2->_pendingMessages = v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    replicatedFallbackHistory = v2->_replicatedFallbackHistory;
    v2->_replicatedFallbackHistory = v8;

    -[NSCache setCountLimit:](v2->_replicatedFallbackHistory, "setCountLimit:", 1024);
  }
  return v2;
}

- (void)addPendingMessageWithGUID:(id)a3 replicatedFallbackGUIDs:(id)a4 releaseBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMPendingReplicatedMessageCache queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1438548;
  block[3] = &unk_1E92286D8;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

- (void)releasePendingMessageWithGUID:(id)a3 serviceName:(id)a4 chat:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[IMPendingReplicatedMessageCache queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1438964;
  block[3] = &unk_1E9228728;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_sync(v14, block);

}

- (void)clearPendingMessageWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[IMPendingReplicatedMessageCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1438C3C;
  block[3] = &unk_1E9228750;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)releasedReplicatedGUIDForGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1D1438D50;
  v16 = sub_1D1438D60;
  v17 = 0;
  -[IMPendingReplicatedMessageCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1438D68;
  block[3] = &unk_1E9228778;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_removePendingMessageWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v4);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "replicatedFallbackGUIDs", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
          -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v9);
    }

    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "replicatedFallbackGUIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v4;
        v28 = 2112;
        v29 = v16;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Removed pending replicated message %@ (fallback GUIDs: %@) from cache", buf, 0x16u);

      }
    }
    -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") == 0;

    if (v18)
    {
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "No more pending messages, invalidating timer for timeout enforcement", buf, 2u);
        }

      }
      -[IMPendingReplicatedMessageCache timeoutTimer](self, "timeoutTimer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "invalidate");

      -[IMPendingReplicatedMessageCache setTimeoutTimer:](self, "setTimeoutTimer:", 0);
    }

  }
}

- (void)_scheduleTimeout
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[IMPendingReplicatedMessageCache timeoutTimer](self, "timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) == 0)
  {
    location = 0;
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = sub_1D1439180;
    v10 = &unk_1E92287C8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v7, 1800.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPendingReplicatedMessageCache setTimeoutTimer:](self, "setTimeoutTimer:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_enforceTimeout
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v25 = objc_msgSend(v4, "count");
      v26 = 2048;
      v27 = 128;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Enforcing cache timeout, has %llu messages (limit %llu)", buf, 0x16u);

    }
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1D14394C8;
  v21[3] = &unk_1E92287F0;
  v7 = v5;
  v22 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v21);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  v11 = v9;
  if (v9)
  {
    v12 = *(_QWORD *)v18;
    *(_QWORD *)&v10 = 138412290;
    v16 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if (IMOSLoggingEnabled(v9))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            v25 = v14;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Timing out message %@", buf, 0xCu);
          }

        }
        v9 = -[IMPendingReplicatedMessageCache _removePendingMessageWithGUID:](self, "_removePendingMessageWithGUID:", v14, v16, (_QWORD)v17);
        ++v13;
      }
      while (v11 != v13);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      v11 = v9;
    }
    while (v9);
  }

  if (objc_msgSend(v8, "count"))
    -[IMPendingReplicatedMessageCache _metricMatchingFailureWithReason:](self, "_metricMatchingFailureWithReason:", CFSTR("Replicated Message Deferral Timeout"));

}

- (void)_enforceCacheLimit
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 0x80)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v22 = objc_msgSend(v7, "count");
        v23 = 2048;
        v24 = 128;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Enforcing cache limit, has %llu messages (limit %llu)", buf, 0x16u);

      }
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 1);
    -[IMPendingReplicatedMessageCache pendingMessages](self, "pendingMessages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    *(_QWORD *)&v14 = 138412290;
    v19 = v14;
    do
    {
      if (v13 >= objc_msgSend(v12, "count", v19))
        break;
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "messageGUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v22 = (uint64_t)v17;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Evicting message %@", buf, 0xCu);

        }
      }
      objc_msgSend(v15, "messageGUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPendingReplicatedMessageCache _removePendingMessageWithGUID:](self, "_removePendingMessageWithGUID:", v18);

      ++v13;
    }
    while (v13 != 25);
    -[IMPendingReplicatedMessageCache _metricMatchingFailureWithReason:](self, "_metricMatchingFailureWithReason:", CFSTR("Replicated Message Cache Overflow"));

  }
}

- (void)_metricMatchingFailureWithReason:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D39958];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceAutoBugCaptureWithSubType:errorPayload:", v4, 0);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMessages, a3);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (NSCache)replicatedFallbackHistory
{
  return self->_replicatedFallbackHistory;
}

- (void)setReplicatedFallbackHistory:(id)a3
{
  objc_storeStrong((id *)&self->_replicatedFallbackHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicatedFallbackHistory, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

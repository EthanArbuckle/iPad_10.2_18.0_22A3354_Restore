@implementation IMDMessageFromStorageController

+ (id)iMessageStorageController
{
  if (qword_1ED935F68 != -1)
    dispatch_once(&qword_1ED935F68, &unk_1E9229AE0);
  objc_msgSend((id)qword_1ED935F60, "setServiceName:", *MEMORY[0x1E0D38F68]);
  return (id)qword_1ED935F60;
}

+ (id)SMSStorageController
{
  if (qword_1ED9360D8 != -1)
    dispatch_once(&qword_1ED9360D8, &unk_1E9229B00);
  objc_msgSend((id)qword_1ED9360E0, "setServiceName:", *MEMORY[0x1E0D38F58]);
  return (id)qword_1ED9360E0;
}

- (IMDMessageFromStorageController)initWithMessageStore:(id)a3
{
  id v5;
  IMDMessageFromStorageController *v6;
  IMDMessageFromStorageController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDMessageFromStorageController;
  v6 = -[IMDMessageFromStorageController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageStore, a3);
    *(_OWORD *)&v7->_storageTimerInterval = xmmword_1D1683080;
  }

  return v7;
}

- (id)broadcaster
{
  void *v2;
  void *v3;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcasterForChatListeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAwaitingStorageTimer
{
  return self->_storageTimer != 0;
}

- (void)noteItemFromStorage:(id)a3
{
  -[IMDMessageFromStorageController noteItemFromStorage:extendsStorageTimer:](self, "noteItemFromStorage:extendsStorageTimer:", a3, 1);
}

- (void)noteItemFromStorage:(id)a3 extendsStorageTimer:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  IMTimingCollection *v13;
  IMTimingCollection *timingComingBackFromStorage;
  NSMutableSet *messagesReceivedDuringStorage;
  NSMutableSet *v16;
  NSMutableSet *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[IMDMessageFromStorageController messageStore](self, "messageStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSuppressDatabaseUpdates:", 1);

    v9 = IMOSLoggingEnabled(v8);
    if ((_DWORD)v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Noting item from storage (%@)", (uint8_t *)&v18, 0xCu);
      }

    }
    if (self->_timingComingBackFromStorage)
    {
      v11 = self->_messagesProcessedComingBackFromStorage + 1;
    }
    else
    {
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "This is the first item from stroage starting timer", (uint8_t *)&v18, 2u);
        }

      }
      v13 = (IMTimingCollection *)objc_alloc_init(MEMORY[0x1E0D36AE8]);
      timingComingBackFromStorage = self->_timingComingBackFromStorage;
      self->_timingComingBackFromStorage = v13;

      -[IMTimingCollection startTimingForKey:](self->_timingComingBackFromStorage, "startTimingForKey:", CFSTR("ProcessingMessagesFromStorage"));
      self->_messagesProcessedComingBackFromStorage = 0;
      v11 = 1;
    }
    self->_messagesProcessedComingBackFromStorage = v11;
    messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    if (!messagesReceivedDuringStorage)
    {
      v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v17 = self->_messagesReceivedDuringStorage;
      self->_messagesReceivedDuringStorage = v16;

      messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    }
    -[NSMutableSet addObject:](messagesReceivedDuringStorage, "addObject:", v6);
    if (a4 || !self->_storageTimer)
    {
      -[IMDMessageFromStorageController storageTimerInterval](self, "storageTimerInterval");
      -[IMDMessageFromStorageController _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:");
    }
  }

}

- (void)noteLastItemFromStorage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableSet *messagesReceivedDuringStorage;
  NSMutableSet *v9;
  NSMutableSet *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[IMDMessageFromStorageController messageStore](self, "messageStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuppressDatabaseUpdates:", 1);

    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Noting last item from storage (%@)", (uint8_t *)&v11, 0xCu);
      }

    }
    messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    if (!messagesReceivedDuringStorage)
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = self->_messagesReceivedDuringStorage;
      self->_messagesReceivedDuringStorage = v9;

      messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    }
    -[NSMutableSet addObject:](messagesReceivedDuringStorage, "addObject:", v4);
    -[IMDMessageFromStorageController lastMessageStorageTimerInterval](self, "lastMessageStorageTimerInterval");
    -[IMDMessageFromStorageController _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:");
  }

}

- (void)noteLastItemProcessed
{
  -[IMDMessageFromStorageController noteLastItemProcessedWithError:](self, "noteLastItemProcessedWithError:", 0);
}

- (void)noteLastItemProcessedWithError:(unint64_t)a3
{
  IMTimingCollection *timingComingBackFromStorage;
  NSObject *v6;
  unint64_t messagesProcessedComingBackFromStorage;
  IMTimingCollection *v8;
  IMTimingCollection *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  IMTimingCollection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  timingComingBackFromStorage = self->_timingComingBackFromStorage;
  if (timingComingBackFromStorage)
  {
    if (IMOSLoggingEnabled(-[IMTimingCollection stopTimingForKey:](timingComingBackFromStorage, "stopTimingForKey:", CFSTR("ProcessingMessagesFromStorage"))))
    {
      OSLogHandleForIMEventCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = self->_timingComingBackFromStorage;
        messagesProcessedComingBackFromStorage = self->_messagesProcessedComingBackFromStorage;
        v10 = 134218242;
        v11 = messagesProcessedComingBackFromStorage;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Finished processing %lu items from storage %@", (uint8_t *)&v10, 0x16u);
      }

    }
    -[IMDMessageFromStorageController _submitStorageMetricsWithError:](self, "_submitStorageMetricsWithError:", a3);
    v9 = self->_timingComingBackFromStorage;
    self->_timingComingBackFromStorage = 0;

    self->_messagesProcessedComingBackFromStorage = 0;
  }
}

- (void)_submitStorageMetricsWithError:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[13];

  v19[4] = *MEMORY[0x1E0C80C00];
  v5 = IMIsRunningInUnitTesting();
  if ((_DWORD)v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Should not be submitting metrics during unit tests. This method should be stubbed", (uint8_t *)&v16, 2u);
      }

    }
  }
  else
  {
    v18[0] = *MEMORY[0x1E0D38A88];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_messagesProcessedComingBackFromStorage);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v18[1] = *MEMORY[0x1E0D38AE0];
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[IMTimingCollection totalTimeForKey:](self->_timingComingBackFromStorage, "totalTimeForKey:", CFSTR("ProcessingMessagesFromStorage"));
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    v18[2] = *MEMORY[0x1E0D38AD8];
    -[IMDMessageFromStorageController serviceName](self, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v10;
    v18[3] = *MEMORY[0x1E0D38AD0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Submitting message from storage metric with dictionary %@", (uint8_t *)&v16, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trackEvent:withDictionary:", *MEMORY[0x1E0D387C0], v12);

  }
}

- (void)_updateStorageTimerWithInterval:(double)a3
{
  NSObject *v5;
  NSTimer *storageTimer;
  NSTimer *v7;
  NSTimer *v8;
  NSTimer *v9;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0)
  {
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v10 = 134217984;
        v11 = a3;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Scheduling a storage invalidation timer in: %f", (uint8_t *)&v10, 0xCu);
      }

    }
    storageTimer = self->_storageTimer;
    if (storageTimer)
    {
      -[NSTimer invalidate](storageTimer, "invalidate");
      v7 = self->_storageTimer;
      self->_storageTimer = 0;

    }
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__storageTimerFired, 0, 0, a3);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v9 = self->_storageTimer;
    self->_storageTimer = v8;

  }
}

- (void)_storageTimerFired
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSTimer *storageTimer;
  uint64_t v7;
  NSObject *v8;
  NSMutableSet *messagesReceivedDuringStorage;
  uint64_t v10;
  NSObject *v11;
  NSMutableSet *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSMutableSet *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDMessageFromStorageController pendingReadReceiptFromStorageCount](self, "pendingReadReceiptFromStorageCount");
  if (v3)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "We have pending read receipts to process after storage timer fired", (uint8_t *)&v18, 2u);
      }

    }
    -[IMDMessageFromStorageController setPendingReadReceiptFromStorageCount:](self, "setPendingReadReceiptFromStorageCount:", 0);
    -[IMDMessageFromStorageController _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:", 15.0);
    -[IMDMessageFromStorageController messageStore](self, "messageStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuppressDatabaseUpdates:", 1);
  }
  else
  {
    -[NSTimer invalidate](self->_storageTimer, "invalidate");
    storageTimer = self->_storageTimer;
    self->_storageTimer = 0;

    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
        v18 = 138412290;
        v19 = messagesReceivedDuringStorage;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Storage timer fired, guids we need to process: %@", (uint8_t *)&v18, 0xCu);
      }

    }
    v10 = -[NSMutableSet count](self->_messagesReceivedDuringStorage, "count");
    if (v10)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", self->_messagesReceivedDuringStorage);
      v5 = (void *)v10;
    }
    else
    {
      v5 = 0;
    }
    if (self->_timingComingBackFromStorage)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Chat: Missed lastItemProcessed.  This time is likely off by the last storage timer", (uint8_t *)&v18, 2u);
        }

      }
      -[IMDMessageFromStorageController noteLastItemProcessedWithError:](self, "noteLastItemProcessedWithError:", 1);
    }
    v12 = self->_messagesReceivedDuringStorage;
    self->_messagesReceivedDuringStorage = 0;

    -[IMDMessageFromStorageController messageStore](self, "messageStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSuppressDatabaseUpdates:", 0);

    -[IMDMessageFromStorageController messageStore](self, "messageStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messagesWithGUIDs:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDMessageFromStorageController _postMessagesFromStorage:](self, "_postMessagesFromStorage:", v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", *MEMORY[0x1E0D38248], 0);

  }
}

- (void)_postMessagesFromStorage:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id obj;
  uint64_t v21;
  uint64_t v23;
  void *context;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  IMDMessageFromStorageController *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(obj);
        v25 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1D17EA968]();
        -[IMDMessageFromStorageController messageStore](self, "messageStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "chatsForMessage:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if ((objc_msgSend(v15, "isBlackholed") & 1) == 0)
              {
                objc_msgSend(v15, "guid");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "objectForKey:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v17)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v17, "addObject:", v7);
                objc_msgSend(v4, "setObject:forKey:", v17, v16);
                objc_msgSend(v5, "setObject:forKey:", v15, v16);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v12);
        }

        objc_autoreleasePoolPop(context);
        v6 = v25 + 1;
      }
      while (v25 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v23);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1D1476A4C;
  v26[3] = &unk_1E9229B28;
  v27 = v5;
  v28 = self;
  v29 = obj;
  v18 = obj;
  v19 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v26);

}

- (void)incrementPendingReadReceiptFromStorageCount
{
  -[IMDMessageFromStorageController setPendingReadReceiptFromStorageCount:](self, "setPendingReadReceiptFromStorageCount:", self->_pendingReadReceiptFromStorageCount + 1);
}

- (void)decrementPendingReadReceiptFromStorageCount
{
  unint64_t pendingReadReceiptFromStorageCount;

  pendingReadReceiptFromStorageCount = self->_pendingReadReceiptFromStorageCount;
  if (pendingReadReceiptFromStorageCount)
    -[IMDMessageFromStorageController setPendingReadReceiptFromStorageCount:](self, "setPendingReadReceiptFromStorageCount:", pendingReadReceiptFromStorageCount - 1);
}

- (unint64_t)pendingReadReceiptFromStorageCount
{
  return self->_pendingReadReceiptFromStorageCount;
}

- (void)setPendingReadReceiptFromStorageCount:(unint64_t)a3
{
  self->_pendingReadReceiptFromStorageCount = a3;
}

- (IMDMessageStore)messageStore
{
  return self->_messageStore;
}

- (void)setMessageStore:(id)a3
{
  objc_storeStrong((id *)&self->_messageStore, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSTimer)storageTimer
{
  return self->_storageTimer;
}

- (void)setStorageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_storageTimer, a3);
}

- (NSMutableSet)messagesReceivedDuringStorage
{
  return self->_messagesReceivedDuringStorage;
}

- (void)setMessagesReceivedDuringStorage:(id)a3
{
  objc_storeStrong((id *)&self->_messagesReceivedDuringStorage, a3);
}

- (IMTimingCollection)timingComingBackFromStorage
{
  return self->_timingComingBackFromStorage;
}

- (void)setTimingComingBackFromStorage:(id)a3
{
  objc_storeStrong((id *)&self->_timingComingBackFromStorage, a3);
}

- (unint64_t)messagesProcessedComingBackFromStorage
{
  return self->_messagesProcessedComingBackFromStorage;
}

- (void)setMessagesProcessedComingBackFromStorage:(unint64_t)a3
{
  self->_messagesProcessedComingBackFromStorage = a3;
}

- (id)_broadcasterForTesting
{
  return self->__broadcasterForTesting;
}

- (void)set_broadcasterForTesting:(id)a3
{
  objc_storeStrong(&self->__broadcasterForTesting, a3);
}

- (double)storageTimerInterval
{
  return self->_storageTimerInterval;
}

- (void)setStorageTimerInterval:(double)a3
{
  self->_storageTimerInterval = a3;
}

- (double)lastMessageStorageTimerInterval
{
  return self->_lastMessageStorageTimerInterval;
}

- (void)setLastMessageStorageTimerInterval:(double)a3
{
  self->_lastMessageStorageTimerInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__broadcasterForTesting, 0);
  objc_storeStrong((id *)&self->_timingComingBackFromStorage, 0);
  objc_storeStrong((id *)&self->_messagesReceivedDuringStorage, 0);
  objc_storeStrong((id *)&self->_storageTimer, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
}

@end

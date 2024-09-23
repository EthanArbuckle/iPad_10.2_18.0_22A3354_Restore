@implementation IMDMessageProcessingController

- (IMDMessageProcessingController)initWithMessagesPTaskStore:(id)a3
{
  IMDMessageProcessingController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDMessageProcessingController;
  v4 = -[IMDMessageProcessingController init](&v6, sel_init);
  if (v4)
  {
    v4->_pTaskStore = (IMDMessagePTaskStore *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_messageProcessingTaskAdded_, CFSTR("IMDMessagePTaskStoreAddedProcessingTask"), 0);
  }
  return v4;
}

- (IMDMessageProcessingController)init
{
  IMDMessagePTaskXPCStore *v3;
  IMDMessageProcessingController *v4;

  v3 = objc_alloc_init(IMDMessagePTaskXPCStore);
  v4 = -[IMDMessageProcessingController initWithMessagesPTaskStore:](self, "initWithMessagesPTaskStore:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_pTaskStore = 0;
  -[NSTimer invalidate](self->_processingTimer, "invalidate");

  self->_processingTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageProcessingController;
  -[IMDMessageProcessingController dealloc](&v3, sel_dealloc);
}

- (void)scheduleInitialProcessingCheck
{
  -[IMDMessageProcessingController _scheduleDeferredProcessingWithTimeInterval:](self, "_scheduleDeferredProcessingWithTimeInterval:", 120.0);
}

- (void)_xpc_IMDCoreSpotlightAddMessageGUID:(id)a3 reason:(int64_t)a4
{
  IMDCoreSpotlightAddMessageGUID();
}

- (void)_scheduleDeferredProcessingWithTimeInterval:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  _QWORD v10[12];

  if (a3 > 0.0)
  {
    v10[6] = v6;
    v10[7] = v5;
    v10[10] = v3;
    v10[11] = v4;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1D1445438;
    v10[3] = &unk_1E92289C0;
    *(double *)&v10[5] = a3;
    v10[4] = self;
    objc_msgSend(v9, "__im_performBlock:", v10);
  }
}

- (void)_processingTimerFired
{
  NSObject *v3;
  NSTimer *processingTimer;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Checking for deferred message processing task", buf, 2u);
    }
  }
  processingTimer = self->_processingTimer;
  if (processingTimer)
  {
    -[NSTimer invalidate](processingTimer, "invalidate");

    self->_processingTimer = 0;
  }
  v5 = (void *)-[IMDMessagePTaskStore loadMostRecentMessagePTasks](self->_pTaskStore, "loadMostRecentMessagePTasks");
  v6 = IMOSLoggingEnabled(v5);
  if (!v5)
  {
    if (!v6)
      return;
    v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v17 = "MessageProcessing: Unable to retrieve ptask from store";
LABEL_28:
    _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
    return;
  }
  if (v6)
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v24 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Found %ld messages that need processing", buf, 0xCu);
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        -[IMDMessageProcessingController _indexSpotlightIfNeedForPTask:](self, "_indexSpotlightIfNeedForPTask:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  -[IMDMessagePTaskStore deleteAllCompletedTasks](self->_pTaskStore, "deleteAllCompletedTasks");
  v12 = objc_msgSend(v5, "count");
  v13 = v12 == 100;
  v14 = IMOSLoggingEnabled(v12);
  if (!v13)
  {
    if (!v14)
      return;
    v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v17 = "Finished processing deferred messages";
    goto LABEL_28;
  }
  if (v14)
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Scheduling next batch of messages to process", buf, 2u);
    }
  }
  -[IMDMessageProcessingController _scheduleDeferredProcessingWithTimeInterval:](self, "_scheduleDeferredProcessingWithTimeInterval:", 2.0);
}

- (void)_indexSpotlightIfNeedForPTask:(id)a3
{
  _BOOL8 v5;
  NSObject *v6;
  uint8_t v7[16];

  if (objc_msgSend(a3, "needsProccesingFor:", 1))
  {
    objc_msgSend(a3, "compeletedTask:", 1);
    -[IMDMessagePTaskStore updateTaskFlagsForPTask:](self->_pTaskStore, "updateTaskFlagsForPTask:", a3);
    v5 = -[IMDMessageProcessingController _pref_IMDCoreSpotlightHasMigrated](self, "_pref_IMDCoreSpotlightHasMigrated");
    if (v5)
    {
      objc_msgSend(a3, "guid");
      MEMORY[0x1E0DE7D20](self, sel__xpc_IMDCoreSpotlightAddMessageGUID_reason_);
    }
    else if (IMOSLoggingEnabled(v5))
    {
      v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Not indexing message, spotlight has not finished migrating yet", v7, 2u);
      }
    }
  }
}

- (void)messageProcessingTaskAdded:(id)a3
{
  -[IMDMessageProcessingController _scheduleDeferredProcessingWithTimeInterval:](self, "_scheduleDeferredProcessingWithTimeInterval:", a3, 20.0);
}

- (IMDMessagePTaskStore)pTaskStore
{
  return self->_pTaskStore;
}

- (void)setPTaskStore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSTimer)processingTimer
{
  return self->_processingTimer;
}

- (void)setProcessingTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

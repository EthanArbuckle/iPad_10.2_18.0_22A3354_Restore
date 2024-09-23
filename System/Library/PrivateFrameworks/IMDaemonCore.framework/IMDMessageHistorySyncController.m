@implementation IMDMessageHistorySyncController

- (IMDMessageHistorySyncController)initWithMessageHistorySyncTaskFactory:(id)a3
{
  IMDMessageHistorySyncController *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMDMessageHistorySyncController;
  v4 = -[IMDMessageHistorySyncController init](&v9, sel_init);
  if (v4)
  {
    v4->_syncTaskFactory = (IMDMessageHistorySyncTaskFactory *)a3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_ckChatSyncControllerWantsToSync, IMDMessageHistorySyncNotifyCKChatSyncControllerWantsSync, 0);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_replayControllerWantsToSync, IMDMessageHistorySyncNotifyReplayControllerWantsSync, 0);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_IDSTransportLogWantsToSync, IMDMessageHistorySyncNotifyIDSTransactionLogWantsSync, 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_currentlyExecutingSyncTask = 0;
  self->_syncTaskFactory = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistorySyncController;
  -[IMDMessageHistorySyncController dealloc](&v3, sel_dealloc);
}

- (void)replayControllerWantsToSync
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  IMDMessageHistorySyncTask *currentlyExecutingSyncTask;
  uint8_t v7[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "ReplayController requested a history Sync", buf, 2u);
    }
  }
  v4 = -[IMDMessageHistorySyncController replayControllerNeedsSync](self, "replayControllerNeedsSync");
  if ((v4 & 1) != 0
    || (currentlyExecutingSyncTask = self->_currentlyExecutingSyncTask) != 0
    && (v4 = -[IMDMessageHistorySyncTask syncTaskType](currentlyExecutingSyncTask, "syncTaskType")) == 0)
  {
    if (IMOSLoggingEnabled(v4))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "ReplayController already has sync in flight ignoring request", v7, 2u);
      }
    }
  }
  else
  {
    -[IMDMessageHistorySyncController setReplayControllerNeedsSync:](self, "setReplayControllerNeedsSync:", 1);
    -[IMDMessageHistorySyncController _evaluateStateAndActIfNeeded](self, "_evaluateStateAndActIfNeeded");
  }
}

- (void)IDSTransportLogWantsToSync
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "IDS Transport Log requested a history Sync", buf, 2u);
    }
  }
  v4 = -[IMDMessageHistorySyncController idsTransportLogNeedsSync](self, "idsTransportLogNeedsSync");
  if ((v4 & 1) != 0
    || (v4 = -[IMDMessageHistorySyncTask syncTaskType](self->_currentlyExecutingSyncTask, "syncTaskType"), v4 == 2))
  {
    if (IMOSLoggingEnabled(v4))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "IDS Transport Log already has sync in flight ignoring request", v6, 2u);
      }
    }
  }
  else
  {
    -[IMDMessageHistorySyncController setIdsTransportLogNeedsSync:](self, "setIdsTransportLogNeedsSync:", 1);
    -[IMDMessageHistorySyncController _evaluateStateAndActIfNeeded](self, "_evaluateStateAndActIfNeeded");
  }
}

- (void)ckChatSyncControllerWantsToSync
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Cloudkit Chat Controller requested a history Sync", buf, 2u);
    }
  }
  v4 = -[IMDMessageHistorySyncController ckChatSyncControllerNeedsSync](self, "ckChatSyncControllerNeedsSync");
  if ((v4 & 1) != 0
    || (v4 = -[IMDMessageHistorySyncTask syncTaskType](self->_currentlyExecutingSyncTask, "syncTaskType"), v4 == 1))
  {
    if (IMOSLoggingEnabled(v4))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Cloudkit Chat Controller  already has sync in flight ignoring request", v6, 2u);
      }
    }
  }
  else
  {
    -[IMDMessageHistorySyncController setCkChatSyncControllerNeedsSync:](self, "setCkChatSyncControllerNeedsSync:", 1);
    -[IMDMessageHistorySyncController _evaluateStateAndActIfNeeded](self, "_evaluateStateAndActIfNeeded");
  }
}

- (void)_evaluateStateAndActIfNeeded
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  NSObject *v10;
  IMDMessageHistorySyncTask *v11;
  _QWORD v12[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  IMDMessageHistorySyncController *v18;

  v3 = IMOSLoggingEnabled(self);
  if ((_DWORD)v3)
  {
    v4 = OSLogHandleForIMFoundationCategory();
    v3 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if ((_DWORD)v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Checking if any sync task need to be started", buf, 2u);
    }
  }
  if (self->_currentlyExecutingSyncTask)
  {
    if (IMOSLoggingEnabled(v3))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v6 = "Already performing a sync task, waiting for that to complete before kicking off the next task";
LABEL_8:
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, v6, buf, 2u);
        return;
      }
    }
    return;
  }
  if (-[IMDMessageHistorySyncController replayControllerNeedsSync](self, "replayControllerNeedsSync"))
  {
    v7 = -[IMDMessageHistorySyncController setReplayControllerNeedsSync:](self, "setReplayControllerNeedsSync:", 0);
    v8 = 0;
    goto LABEL_15;
  }
  if (-[IMDMessageHistorySyncController ckChatSyncControllerNeedsSync](self, "ckChatSyncControllerNeedsSync"))
  {
    v7 = -[IMDMessageHistorySyncController setCkChatSyncControllerNeedsSync:](self, "setCkChatSyncControllerNeedsSync:", 0);
    v8 = 1;
    goto LABEL_15;
  }
  v9 = -[IMDMessageHistorySyncController idsTransportLogNeedsSync](self, "idsTransportLogNeedsSync");
  if (v9)
  {
    v7 = -[IMDMessageHistorySyncController setIdsTransportLogNeedsSync:](self, "setIdsTransportLogNeedsSync:", 0);
    v8 = 2;
LABEL_15:
    if (IMOSLoggingEnabled(v7))
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Starting Sync", buf, 2u);
      }
    }
    v11 = (IMDMessageHistorySyncTask *)-[IMDMessageHistorySyncTaskFactory newSyncTaskForType:](self->_syncTaskFactory, "newSyncTaskForType:", v8);
    self->_currentlyExecutingSyncTask = v11;
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3052000000;
    v16 = sub_1D15BEDC8;
    v17 = sub_1D15BEDD8;
    v18 = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D15BEDE4;
    v12[3] = &unk_1E922E990;
    v12[4] = buf;
    -[IMDMessageHistorySyncTask startSyncTask:](v11, "startSyncTask:", v12);
    _Block_object_dispose(buf, 8);
    return;
  }
  if (IMOSLoggingEnabled(v9))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "No Message History to sync.";
      goto LABEL_8;
    }
  }
}

- (void)_scheduleNextEvaluation
{
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];

  self->_currentlyExecutingSyncTask = 0;
  if (IMOSLoggingEnabled(v3))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v8 = 4;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Will check in %u seconds if another sync needs to be done", buf, 8u);
    }
  }
  v5 = dispatch_time(0, 4000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15BEF9C;
  block[3] = &unk_1E9228690;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

- (BOOL)replayControllerNeedsSync
{
  return self->_replayControllerNeedsSync;
}

- (void)setReplayControllerNeedsSync:(BOOL)a3
{
  self->_replayControllerNeedsSync = a3;
}

- (BOOL)ckChatSyncControllerNeedsSync
{
  return self->_ckChatSyncControllerNeedsSync;
}

- (void)setCkChatSyncControllerNeedsSync:(BOOL)a3
{
  self->_ckChatSyncControllerNeedsSync = a3;
}

- (BOOL)idsTransportLogNeedsSync
{
  return self->_idsTransportLogNeedsSync;
}

- (void)setIdsTransportLogNeedsSync:(BOOL)a3
{
  self->_idsTransportLogNeedsSync = a3;
}

- (IMDMessageHistorySyncTask)currentlyExecutingSyncTask
{
  return self->_currentlyExecutingSyncTask;
}

- (void)setCurrentlyExecutingSyncTask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (IMDMessageHistorySyncTaskFactory)syncTaskFactory
{
  return self->_syncTaskFactory;
}

- (void)setSyncTaskFactory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end

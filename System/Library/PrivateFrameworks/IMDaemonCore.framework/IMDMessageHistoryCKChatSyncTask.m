@implementation IMDMessageHistoryCKChatSyncTask

- (IMDMessageHistoryCKChatSyncTask)initWithCKSyncController:(id)a3
{
  IMDMessageHistoryCKChatSyncTask *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDMessageHistoryCKChatSyncTask;
  v4 = -[IMDMessageHistoryCKChatSyncTask init](&v6, sel_init);
  if (v4)
    v4->_ckSyncController = (IMDCKSyncController *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_ckSyncController = 0;
  self->_syncTaskCompletionBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistoryCKChatSyncTask;
  -[IMDMessageHistoryCKChatSyncTask dealloc](&v3, sel_dealloc);
}

- (void)startSyncTask:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  if (self->_syncTaskCompletionBlock)
  {
    if (IMOSLoggingEnabled(self))
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "IMDMessageHistoryCKChatSyncTask: Start sync should not be called more than once.  Ignoring request.", v5, 2u);
      }
    }
  }
  else
  {
    -[IMDMessageHistoryCKChatSyncTask setSyncTaskCompletionBlock:](self, "setSyncTaskCompletionBlock:", a3);
    MEMORY[0x1E0DE7D20](self, sel__startICloudSyncWithActivity_);
  }
}

- (unint64_t)syncTaskType
{
  return 1;
}

- (void)_startICloudSyncWithActivity:(id)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Back online, start syncing chats", buf, 2u);
    }
  }
  -[IMDCKSyncController beginComingBackOnlineSyncWithActivity:](self->_ckSyncController, "beginComingBackOnlineSyncWithActivity:", a3);
  if (self->_syncTaskCompletionBlock)
  {
    v6 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D1436A7C;
    block[3] = &unk_1E9228690;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  }
}

- (id)syncTaskCompletionBlock
{
  return self->_syncTaskCompletionBlock;
}

- (void)setSyncTaskCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end

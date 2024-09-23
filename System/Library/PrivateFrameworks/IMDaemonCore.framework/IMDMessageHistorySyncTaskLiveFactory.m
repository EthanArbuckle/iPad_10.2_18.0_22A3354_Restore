@implementation IMDMessageHistorySyncTaskLiveFactory

- (IMDMessageHistorySyncTaskLiveFactory)init
{
  +[IMDCKSyncController sharedInstance](IMDCKSyncController, "sharedInstance");
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  +[IMDReplayController sharedInstance](IMDReplayController, "sharedInstance");
  return (IMDMessageHistorySyncTaskLiveFactory *)MEMORY[0x1E0DE7D20](self, sel__initWithCKSyncController_accountController_replayController_);
}

- (void)dealloc
{
  objc_super v3;

  self->_ckSyncController = 0;
  self->_accountController = 0;
  self->_replayController = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistorySyncTaskLiveFactory;
  -[IMDMessageHistorySyncTaskLiveFactory dealloc](&v3, sel_dealloc);
}

- (id)_initWithCKSyncController:(id)a3 accountController:(id)a4 replayController:(id)a5
{
  IMDMessageHistorySyncTaskLiveFactory *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMDMessageHistorySyncTaskLiveFactory;
  v8 = -[IMDMessageHistorySyncTaskLiveFactory init](&v10, sel_init);
  if (v8)
  {
    v8->_ckSyncController = (IMDCKSyncController *)a3;
    v8->_accountController = (IMDAccountController *)a4;
    v8->_replayController = (IMDReplayController *)a5;
  }
  return v8;
}

- (id)newSyncTaskForType:(unint64_t)a3
{
  if (a3 == 2)
    return (id)MEMORY[0x1E0DE7D20](self, sel__newIDSTransactionLogSyncTask);
  if (a3 == 1)
    return (id)MEMORY[0x1E0DE7D20](self, sel__newKChatSyncTask);
  if (a3)
    return 0;
  return (id)MEMORY[0x1E0DE7D20](self, sel__newFirstUnlockReplaySyncTask);
}

- (id)_newKChatSyncTask
{
  IMDMessageHistoryCKChatSyncTask *v2;

  v2 = [IMDMessageHistoryCKChatSyncTask alloc];
  return (id)MEMORY[0x1E0DE7D20](v2, sel_initWithCKSyncController_);
}

- (id)_newFirstUnlockReplaySyncTask
{
  IMDMessageHistoryFirstUnlockReplaySyncTask *v2;

  v2 = -[IMDMessageHistoryFirstUnlockReplaySyncTask initWithReplayController:accountController:]([IMDMessageHistoryFirstUnlockReplaySyncTask alloc], "initWithReplayController:accountController:", self->_replayController, self->_accountController);
  objc_opt_isKindOfClass();
  return v2;
}

- (id)_newIDSTransactionLogSyncTask
{
  IMDMessageHistoryIDSTransactionLogSyncTask *v2;

  v2 = [IMDMessageHistoryIDSTransactionLogSyncTask alloc];
  return (id)MEMORY[0x1E0DE7D20](v2, sel_initWithAccountController_);
}

@end

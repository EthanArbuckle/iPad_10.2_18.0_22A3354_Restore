@implementation IMDCKAbstractSyncController

- (id)ckUtilities
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (void)setIsSyncing:(BOOL)a3
{
  self->_isSyncing = a3;
  if (a3)
    MEMORY[0x1E0DE7D20](self, sel_setBroadcastedSyncStateStateToStarting);
  else
    -[IMDCKAbstractSyncController setBroadcastedSyncStateStateToFinished](self, "setBroadcastedSyncStateStateToFinished");
}

- (id)recordStore
{
  return 0;
}

- (id)_syncTokenStore
{
  return 0;
}

- (id)errorAnalyzer
{
  return (id)objc_msgSend(MEMORY[0x1E0D39B28], "sharedInstance");
}

- (IMDCKSyncState)syncState
{
  void *v2;
  void *v3;

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDCKSyncState *)v3;
}

- (id)_syncTokenKey
{
  return CFSTR("changeToken");
}

- (void)setLatestSyncToken:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IMDCKAbstractSyncController _syncTokenStore](self, "_syncTokenStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController _syncTokenKey](self, "_syncTokenKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistToken:forKey:", v4, v5);

}

- (void)deleteSyncToken
{
  void *v3;
  id v4;

  -[IMDCKAbstractSyncController _syncTokenStore](self, "_syncTokenStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController _syncTokenKey](self, "_syncTokenKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistToken:forKey:", 0, v3);

}

- (id)latestSyncToken
{
  void *v3;
  void *v4;
  void *v5;

  -[IMDCKAbstractSyncController _syncTokenStore](self, "_syncTokenStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController _syncTokenKey](self, "_syncTokenKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)resetRecordCounts
{
  -[IMDCKAbstractSyncController setRecordsRead:](self, "setRecordsRead:", 0);
  -[IMDCKAbstractSyncController setRecordsWritten:](self, "setRecordsWritten:", 0);
  -[IMDCKAbstractSyncController setRecordsWriteFailed:](self, "setRecordsWriteFailed:", 0);
}

- (void)countRecordOnRead:(BOOL)a3 didSucceed:(BOOL)a4
{
  if (a3)
  {
    -[IMDCKAbstractSyncController setRecordsRead:](self, "setRecordsRead:", -[IMDCKAbstractSyncController recordsRead](self, "recordsRead", a3, a4) + 1);
  }
  else if (a4)
  {
    -[IMDCKAbstractSyncController setRecordsWriteFailed:](self, "setRecordsWriteFailed:", -[IMDCKAbstractSyncController recordsWriteFailed](self, "recordsWriteFailed") + 1);
  }
  else
  {
    -[IMDCKAbstractSyncController setRecordsWritten:](self, "setRecordsWritten:", -[IMDCKAbstractSyncController recordsWritten](self, "recordsWritten") + 1);
  }
}

- (id)describeRecordCounts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lu,%lu,%lu)"), -[IMDCKAbstractSyncController recordsRead](self, "recordsRead"), -[IMDCKAbstractSyncController recordsWritten](self, "recordsWritten"), -[IMDCKAbstractSyncController recordsWriteFailed](self, "recordsWriteFailed"));
}

- (int64_t)syncControllerRecordType
{
  return 0;
}

- (void)setBroadcastedSyncStateStateToFinished
{
  id v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 0, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));

}

- (void)setBroadcastedSyncStateStateToStarting
{
  id v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 1, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));

}

- (void)setBroadcastedSyncStateToDownloading
{
  id v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 2, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));

}

- (void)setBroadcastedSyncStateToUploading
{
  id v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 4, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));

}

- (void)setBroadcastedSyncStateToDeleting
{
  id v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 3, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));

}

- (void)setBroadcastedSyncStateToStartingPeriodicSync
{
  id v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStartingPeriodicSyncWithRecordType:", -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));

}

- (void)setBroadcastedSyncStateToStartingInitialSync
{
  id v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStartingInitialSyncWithRecordType:", -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));

}

- (id)syncStateDebuggingInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("syncState"));

  -[IMDCKAbstractSyncController addSyncDebuggingInfoToDictionary:](self, "addSyncDebuggingInfoToDictionary:", v4);
  return v4;
}

- (void)syncBatchCompleted:(unint64_t)a3
{
  void *v5;
  char v6;
  id v7;

  -[IMDCKAbstractSyncController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IMDCKAbstractSyncController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncController:syncBatchCompleted:", self, a3);

  }
}

- (BOOL)_fetchedAllChangesFromCloudKit
{
  return IMGetDomainBoolForKey();
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (unint64_t)recordsRead
{
  return self->_recordsRead;
}

- (void)setRecordsRead:(unint64_t)a3
{
  self->_recordsRead = a3;
}

- (unint64_t)recordsWritten
{
  return self->_recordsWritten;
}

- (void)setRecordsWritten:(unint64_t)a3
{
  self->_recordsWritten = a3;
}

- (unint64_t)recordsWriteFailed
{
  return self->_recordsWriteFailed;
}

- (void)setRecordsWriteFailed:(unint64_t)a3
{
  self->_recordsWriteFailed = a3;
}

- (IMDCKAbstractSyncControllerDelegate)delegate
{
  return (IMDCKAbstractSyncControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

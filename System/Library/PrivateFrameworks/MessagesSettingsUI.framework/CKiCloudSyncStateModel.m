@implementation CKiCloudSyncStateModel

- (CKiCloudSyncStateModel)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKiCloudSyncStateModel;
  return -[CKiCloudSyncStateModel init](&v3, sel_init);
}

- (int64_t)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(int64_t)a3
{
  self->_syncState = a3;
}

- (int64_t)syncStatusMacButtonType
{
  return self->_syncStatusMacButtonType;
}

- (void)setSyncStatusMacButtonType:(int64_t)a3
{
  self->_syncStatusMacButtonType = a3;
}

- (NSString)messagesInCloudCount
{
  return self->_messagesInCloudCount;
}

- (void)setMessagesInCloudCount:(id)a3
{
  objc_storeStrong((id *)&self->_messagesInCloudCount, a3);
}

- (NSString)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatus, a3);
}

- (NSString)syncStatusFooterText
{
  return self->_syncStatusFooterText;
}

- (void)setSyncStatusFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusFooterText, a3);
}

- (NSString)syncStatusMacToolTipText
{
  return self->_syncStatusMacToolTipText;
}

- (void)setSyncStatusMacToolTipText:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusMacToolTipText, a3);
}

- (NSString)lastSyncedDateString
{
  return self->_lastSyncedDateString;
}

- (void)setLastSyncedDateString:(id)a3
{
  objc_storeStrong((id *)&self->_lastSyncedDateString, a3);
}

- (NSString)syncStatusFooterSubstringForHyperlink
{
  return self->_syncStatusFooterSubstringForHyperlink;
}

- (void)setSyncStatusFooterSubstringForHyperlink:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusFooterSubstringForHyperlink, a3);
}

- (BOOL)isSyncAvailable
{
  return self->_syncAvailable;
}

- (void)setSyncAvailable:(BOOL)a3
{
  self->_syncAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStatusFooterSubstringForHyperlink, 0);
  objc_storeStrong((id *)&self->_lastSyncedDateString, 0);
  objc_storeStrong((id *)&self->_syncStatusMacToolTipText, 0);
  objc_storeStrong((id *)&self->_syncStatusFooterText, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_messagesInCloudCount, 0);
}

@end

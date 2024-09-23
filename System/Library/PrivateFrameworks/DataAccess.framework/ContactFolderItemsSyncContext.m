@implementation ContactFolderItemsSyncContext

- (ContactFolderItemsSyncContext)init
{
  ContactFolderItemsSyncContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContactFolderItemsSyncContext;
  result = -[ContactFolderItemsSyncContext init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_abPersonChangeId = -1;
  return result;
}

- (int)abPersonChangeId
{
  return self->_abPersonChangeId;
}

- (void)setAbPersonChangeId:(int)a3
{
  self->_abPersonChangeId = a3;
}

- (int)abGroupChangeId
{
  return self->_abGroupChangeId;
}

- (void)setAbGroupChangeId:(int)a3
{
  self->_abGroupChangeId = a3;
}

- (BOOL)isChangeHistoryTruncated
{
  return self->_changeHistoryTruncated;
}

- (void)setChangeHistoryTruncated:(BOOL)a3
{
  self->_changeHistoryTruncated = a3;
}

- (unint64_t)latestSequenceNumber
{
  return self->_latestSequenceNumber;
}

- (void)setLatestSequenceNumber:(unint64_t)a3
{
  self->_latestSequenceNumber = a3;
}

- (CNChangeHistoryAnchor)cnChangeAnchor
{
  return self->_cnChangeAnchor;
}

- (void)setCnChangeAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_cnChangeAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnChangeAnchor, 0);
}

@end

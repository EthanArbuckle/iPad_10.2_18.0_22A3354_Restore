@implementation NNMKBatchRequestHandlerResult

- (NSArray)fetchResults
{
  return self->_fetchResults;
}

- (void)setFetchResults:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResults, a3);
}

- (NSArray)mailboxesToTriggerFullSync
{
  return self->_mailboxesToTriggerFullSync;
}

- (void)setMailboxesToTriggerFullSync:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxesToTriggerFullSync, a3);
}

- (NSArray)missingMessageHeaderIds
{
  return self->_missingMessageHeaderIds;
}

- (void)setMissingMessageHeaderIds:(id)a3
{
  objc_storeStrong((id *)&self->_missingMessageHeaderIds, a3);
}

- (NSArray)messageIdsForRequestingContentDownload
{
  return self->_messageIdsForRequestingContentDownload;
}

- (void)setMessageIdsForRequestingContentDownload:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdsForRequestingContentDownload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdsForRequestingContentDownload, 0);
  objc_storeStrong((id *)&self->_missingMessageHeaderIds, 0);
  objc_storeStrong((id *)&self->_mailboxesToTriggerFullSync, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
}

@end

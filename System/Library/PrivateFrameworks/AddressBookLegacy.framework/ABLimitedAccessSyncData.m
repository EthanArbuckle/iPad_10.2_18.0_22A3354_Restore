@implementation ABLimitedAccessSyncData

- (NSEnumerator)syncEvents
{
  void *v2;
  void *v3;

  -[ABLimitedAccessSyncData syncEventsArray](self, "syncEventsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSEnumerator *)v3;
}

- (int64_t)currentSequenceNumber
{
  return self->_currentSequenceNumber;
}

- (void)setCurrentSequenceNumber:(int64_t)a3
{
  self->_currentSequenceNumber = a3;
}

- (BOOL)fullSyncRequired
{
  return self->_fullSyncRequired;
}

- (void)setFullSyncRequired:(BOOL)a3
{
  self->_fullSyncRequired = a3;
}

- (NSArray)syncEventsArray
{
  return self->_syncEventsArray;
}

- (void)setSyncEventsArray:(id)a3
{
  objc_storeStrong((id *)&self->_syncEventsArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncEventsArray, 0);
}

@end

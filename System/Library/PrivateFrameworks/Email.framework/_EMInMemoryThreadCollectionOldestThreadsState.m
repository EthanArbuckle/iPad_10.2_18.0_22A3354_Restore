@implementation _EMInMemoryThreadCollectionOldestThreadsState

- (NSMutableDictionary)oldestThreadsByMailboxObjectIDs
{
  return self->_oldestThreadsByMailboxObjectIDs;
}

- (void)setOldestThreadsByMailboxObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_oldestThreadsByMailboxObjectIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestThreadsByMailboxObjectIDs, 0);
}

@end

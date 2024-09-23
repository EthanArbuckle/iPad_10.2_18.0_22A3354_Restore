@implementation _MFIMAPMailboxDeletionQueueEntry

- (NSArray)urls
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrls:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)paths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPaths:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (IMAPAccount)account
{
  return (IMAPAccount *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->account, 0);
  objc_storeStrong((id *)&self->paths, 0);
  objc_storeStrong((id *)&self->urls, 0);
}

@end

@implementation ARRenderSyncSchedulerBlockWrapper

- (NSDate)entryTimestamp
{
  return self->_entryTimestamp;
}

- (void)setEntryTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_entryTimestamp, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_entryTimestamp, 0);
}

@end

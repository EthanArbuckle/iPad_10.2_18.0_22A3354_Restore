@implementation IMPendingReplicatedMessage

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)replicatedFallbackGUIDs
{
  return self->_replicatedFallbackGUIDs;
}

- (void)setReplicatedFallbackGUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)releaseBlock
{
  return self->_releaseBlock;
}

- (void)setReleaseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_releaseBlock, 0);
  objc_storeStrong((id *)&self->_replicatedFallbackGUIDs, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
}

@end

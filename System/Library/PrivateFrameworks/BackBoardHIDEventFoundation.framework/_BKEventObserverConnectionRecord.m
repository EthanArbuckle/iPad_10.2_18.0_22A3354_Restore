@implementation _BKEventObserverConnectionRecord

- (NSArray)observingChainIdentities
{
  return self->_observingChainIdentities;
}

- (void)setObservingChainIdentities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)alreadySeenDeliveryChains
{
  return self->_alreadySeenDeliveryChains;
}

- (void)setAlreadySeenDeliveryChains:(id)a3
{
  objc_storeStrong((id *)&self->_alreadySeenDeliveryChains, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)observingLocalPolicy
{
  return self->_observingLocalPolicy;
}

- (void)setObservingLocalPolicy:(BOOL)a3
{
  self->_observingLocalPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alreadySeenDeliveryChains, 0);
  objc_storeStrong((id *)&self->_observingChainIdentities, 0);
}

@end

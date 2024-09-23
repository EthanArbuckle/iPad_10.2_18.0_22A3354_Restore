@implementation _BKChainObserverContainer

- (BKSHIDEventDeliveryChainObserving)observingClient
{
  return self->_observingClient;
}

- (void)setObservingClient:(id)a3
{
  objc_storeStrong((id *)&self->_observingClient, a3);
}

- (BKSHIDEventDeliveryChainObserver)observerInterface
{
  return self->_observerInterface;
}

- (void)setObserverInterface:(id)a3
{
  objc_storeStrong((id *)&self->_observerInterface, a3);
}

- (BKSEventDeferringChainIdentity)requestedChainIdentity
{
  return self->_requestedChainIdentity;
}

- (void)setRequestedChainIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_requestedChainIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedChainIdentity, 0);
  objc_storeStrong((id *)&self->_observerInterface, 0);
  objc_storeStrong((id *)&self->_observingClient, 0);
}

@end

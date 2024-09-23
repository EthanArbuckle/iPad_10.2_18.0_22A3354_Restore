@implementation HMDModernTransportDeviceReachabilityObserverListenerContext

- (HMDModernTransportDeviceReachabilityObserverListenerContext)initWithAddress:(id)a3
{
  id v5;
  HMDModernTransportDeviceReachabilityObserverListenerContext *v6;
  uint64_t v7;
  NSHashTable *listeners;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDModernTransportDeviceReachabilityObserverListenerContext;
  v6 = -[HMDModernTransportDeviceReachabilityObserverListenerContext init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    listeners = v6->_listeners;
    v6->_listeners = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_address, a3);
  }

  return v6;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (NSNumber)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (HMDDeviceAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (double)unreachableStartTime
{
  return self->_unreachableStartTime;
}

- (void)setUnreachableStartTime:(double)a3
{
  self->_unreachableStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end

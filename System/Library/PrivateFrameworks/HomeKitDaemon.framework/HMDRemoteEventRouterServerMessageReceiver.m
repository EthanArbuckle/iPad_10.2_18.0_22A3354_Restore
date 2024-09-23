@implementation HMDRemoteEventRouterServerMessageReceiver

- (NSUUID)messageTargetUUID
{
  if (self)
    self = (HMDRemoteEventRouterServerMessageReceiver *)objc_getProperty(self, a2, 8, 1);
  return (NSUUID *)self;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMDRemoteEventRouterServerMessageReceiver *)objc_getProperty(self, a2, 16, 1);
  return (OS_dispatch_queue *)self;
}

- (void)handleRequestMessage:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "_handleRequestMessage:connectionMode:", v6, 1);

    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end

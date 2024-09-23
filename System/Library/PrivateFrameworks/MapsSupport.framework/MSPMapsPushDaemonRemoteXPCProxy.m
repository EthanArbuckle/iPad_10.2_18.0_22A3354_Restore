@implementation MSPMapsPushDaemonRemoteXPCProxy

- (MSPMapsPushDaemonRemoteXPCProxy)initWithObserver:(id)a3
{
  id v3;
  MSPMapsPushDaemonRemoteXPCProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSPMapsPushDaemonRemoteXPCProxy;
  v3 = a3;
  v4 = -[MSPMapsPushDaemonRemoteXPCProxy init](&v6, sel_init);
  objc_storeWeak((id *)&v4->_target, v3);

  return v4;
}

- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  MSPMapsPushDaemonRemoteProxy **p_target;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_target = &self->_target;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_target);
  objc_msgSend(WeakRetained, "pushDaemonProxyReceivedNotificationData:forType:recordIdentifier:", v10, v9, v8);

}

- (MSPMapsPushDaemonRemoteProxy)target
{
  return (MSPMapsPushDaemonRemoteProxy *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end

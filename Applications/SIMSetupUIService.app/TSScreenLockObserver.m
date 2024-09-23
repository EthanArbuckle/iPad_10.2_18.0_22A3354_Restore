@implementation TSScreenLockObserver

- (TSScreenLockObserver)initWithDelegate:(id)a3
{
  id v4;
  TSScreenLockObserver *v5;
  TSScreenLockObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSScreenLockObserver;
  v5 = -[TSScreenLockObserver init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[TSScreenLockObserver setDelegate:](v5, "setDelegate:", v4);
    v6->_notifyToken = -1;
  }

  return v6;
}

- (void)registerForLockNotifications
{
  _QWORD *v3;
  int *p_notifyToken;
  id v5;
  NSObject *v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000034A8;
  v7[3] = &unk_10001C6F0;
  v7[4] = self;
  v3 = objc_retainBlock(v7);
  p_notifyToken = &self->_notifyToken;
  if (notify_register_dispatch(kSBSLockStateNotifyKey, p_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v3))
  {
    v5 = sub_10000CE68();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000F46C(v6);

    *p_notifyToken = -1;
  }

}

- (void)unregisterFromLockNotifications
{
  int notifyToken;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
}

- (TSScreenLockObserverDelegate)delegate
{
  return (TSScreenLockObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

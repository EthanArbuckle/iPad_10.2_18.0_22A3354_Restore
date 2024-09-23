@implementation FBANetworkMonitor

- (FBANetworkMonitor)init
{
  void *v3;
  void *v4;
  void *v5;
  FBANetworkMonitor *v6;
  FBANetworkMonitor *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKSharedConstants appleSeedURL](FBKSharedConstants, "appleSeedURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("sp")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

  v13.receiver = self;
  v13.super_class = (Class)FBANetworkMonitor;
  v6 = -[FBANetworkMonitor init](&v13, "init");
  v7 = v6;
  if (v6)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor reachabilityWithHost:](v6, "reachabilityWithHost:", v5));
    -[FBANetworkMonitor setReachability:](v7, "setReachability:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor reachability](v7, "reachability"));
    objc_msgSend(v10, "startNotifier");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, "reachabilityDidChange:", off_100115AF8, 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBANetworkMonitor;
  -[FBANetworkMonitor dealloc](&v4, "dealloc");
}

- (id)reachabilityWithHost:(id)a3
{
  return +[Reachability reachabilityWithHostName:](Reachability, "reachabilityWithHostName:", a3);
}

- (id)allowCellDefaultKey
{
  return FBKAllowCellularFileUploads;
}

+ (FBANetworkMonitor)sharedInstance
{
  if (qword_100117FA8 != -1)
    dispatch_once(&qword_100117FA8, &stru_1000E66A0);
  return (FBANetworkMonitor *)(id)qword_100117FA0;
}

- (BOOL)shouldShowWaitingOnWifi
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor allowCellDefaultKey](self, "allowCellDefaultKey"));
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return -[FBANetworkMonitor isConnectedToCellNetwork](self, "isConnectedToCellNetwork") & ~v5;
}

- (void)reachabilityDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor reachability](self, "reachability", a3));
  v5 = objc_msgSend(v4, "currentReachabilityStatus");

  if (v5 == (id)2)
  {
    -[FBANetworkMonitor setIsConnectedToCellNetwork:](self, "setIsConnectedToCellNetwork:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor delegate](self, "delegate"));

    if (!v7)
      return;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor delegate](self, "delegate"));
    objc_msgSend(v8, "connectionDidChangeToCellular");
    goto LABEL_7;
  }
  if (v5 == (id)1)
  {
    -[FBANetworkMonitor setIsConnectedToCellNetwork:](self, "setIsConnectedToCellNetwork:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor delegate](self, "delegate"));

    if (v6)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor delegate](self, "delegate"));
      objc_msgSend(v8, "connectionDidChangeToWifi");
LABEL_7:

    }
  }
}

- (BOOL)_isConnectedToCellNetwork
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBANetworkMonitor reachability](self, "reachability"));
  v3 = objc_msgSend(v2, "currentReachabilityStatus");

  return v3 == (id)2;
}

- (void)updateCache
{
  -[FBANetworkMonitor setIsConnectedToCellNetwork:](self, "setIsConnectedToCellNetwork:", -[FBANetworkMonitor _isConnectedToCellNetwork](self, "_isConnectedToCellNetwork"));
}

- (FBANetworkMonitorDelegate)delegate
{
  return (FBANetworkMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isConnectedToCellNetwork
{
  return self->_isConnectedToCellNetwork;
}

- (void)setIsConnectedToCellNetwork:(BOOL)a3
{
  self->_isConnectedToCellNetwork = a3;
}

- (Reachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

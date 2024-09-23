@implementation GKDiscovery

- (GKDiscovery)init
{
  return -[GKDiscovery initWithDomain:type:](self, "initWithDomain:type:", CFSTR("local."), CFSTR("_gamecenter._tcp"));
}

- (GKDiscovery)initWithDomain:(id)a3 type:(id)a4
{
  GKDiscovery *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDiscovery;
  v6 = -[GKDiscovery init](&v8, sel_init);
  if (v6)
  {
    VRTraceReset();
    v6->_manager = -[GKDiscoveryManager initWithDomain:type:]([GKDiscoveryManager alloc], "initWithDomain:type:", a3, a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDiscovery;
  -[GKDiscovery dealloc](&v3, sel_dealloc);
}

- (id)playerFoundHandler
{
  return -[GKDiscoveryManager playerFoundHandler](-[GKDiscovery manager](self, "manager"), "playerFoundHandler");
}

- (void)setPlayerFoundHandler:(id)a3
{
  -[GKDiscoveryManager setPlayerFoundHandler:](-[GKDiscovery manager](self, "manager"), "setPlayerFoundHandler:", a3);
}

- (id)playerLostHandler
{
  return -[GKDiscoveryManager playerLostHandler](-[GKDiscovery manager](self, "manager"), "playerLostHandler");
}

- (void)setPlayerLostHandler:(id)a3
{
  -[GKDiscoveryManager setPlayerLostHandler:](-[GKDiscovery manager](self, "manager"), "setPlayerLostHandler:", a3);
}

- (id)receiveDataHandler
{
  return -[GKDiscoveryManager receiveDataHandler](-[GKDiscovery manager](self, "manager"), "receiveDataHandler");
}

- (void)setReceiveDataHandler:(id)a3
{
  -[GKDiscoveryManager setReceiveDataHandler:](-[GKDiscovery manager](self, "manager"), "setReceiveDataHandler:", a3);
}

- (id)startAdvertisingLocalPlayer:(id)a3 discoveryInfo:(id)a4
{
  return -[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:](self->_manager, "startAdvertisingLocalPlayer:discoveryInfo:", a3, a4);
}

- (void)stopAdvertising
{
  -[GKDiscoveryManager stopAdvertising](self->_manager, "stopAdvertising");
}

- (void)startBrowsingLocalPlayer:(id)a3
{
  -[GKDiscoveryManager startBrowsingLocalPlayer:](self->_manager, "startBrowsingLocalPlayer:", a3);
}

- (void)stopBrowsing
{
  -[GKDiscoveryManager stopBrowsing](self->_manager, "stopBrowsing");
}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 withCompletionHandler:(id)a6
{
  -[GKDiscoveryManager sendDataToParticipant:deviceID:data:withCompletionHandler:](self->_manager, "sendDataToParticipant:deviceID:data:withCompletionHandler:", a3, a4, a5, a6);
}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4
{
  -[GKDiscoveryManager forgetParticipant:deviceID:](self->_manager, "forgetParticipant:deviceID:", a3, a4);
}

- (GKDiscoveryManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end

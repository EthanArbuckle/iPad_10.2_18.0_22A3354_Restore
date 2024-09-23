@implementation GKViceroyNearbyDiscovery

- (GKViceroyNearbyDiscovery)init
{
  GKViceroyNearbyDiscovery *v2;
  GKDiscovery *v3;
  GKDiscovery *discovery;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKViceroyNearbyDiscovery;
  v2 = -[GKViceroyNearbyDiscovery init](&v6, sel_init);
  if (v2)
  {
    v3 = (GKDiscovery *)objc_alloc_init(MEMORY[0x1E0D25C68]);
    discovery = v2->_discovery;
    v2->_discovery = v3;

  }
  return v2;
}

- (void)setupWithPlayerFoundHandler:(id)a3 playerLostHandler:(id)a4 receiveDataHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlayerFoundHandler:", v10);

  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPlayerLostHandler:", v9);

  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReceiveDataHandler:", v8);

}

- (void)startBrowsingWithPlayerID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startBrowsingLocalPlayer:", v4);

}

- (void)stopBrowsing
{
  id v2;

  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopBrowsing");

}

- (id)startAdvertisingWithDiscoveryInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAdvertisingLocalPlayer:discoveryInfo:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)stopAdvertising
{
  id v2;

  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAdvertising");

}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forgetParticipant:deviceID:", v7, v6);

}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[GKViceroyNearbyDiscovery discovery](self, "discovery");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendDataToParticipant:deviceID:data:withCompletionHandler:", v13, v12, v11, v10);

}

- (GKDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
}

@end

@implementation IRNearbyInteractionBridge

- (IRNearbyInteractionBridge)initWithDelegate:(id)a3 NIConfiguration:(id)a4 observer:(BOOL)a5 name:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  IRNearbyInteractionBridge *v13;
  IRNearbyInteractionBridge *v14;
  void *v15;
  objc_super v17;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IRNearbyInteractionBridge;
  v13 = -[IRNearbyInteractionBridge init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[IRNearbyInteractionBridge setName:](v13, "setName:", v12);
    v15 = (void *)objc_msgSend(v11, "copy");
    -[IRNearbyInteractionBridge setNiConfiguration:](v14, "setNiConfiguration:", v15);

    -[IRNearbyInteractionBridge setDelegate:](v14, "setDelegate:", v10);
    -[IRNearbyInteractionBridge setIsObserver:](v14, "setIsObserver:", v7);
  }

  return v14;
}

- (void)invalidate
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 24);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_23FFBA000, a2, OS_LOG_TYPE_DEBUG, "#nearby-interaction-bridge, Invalidate NI session: %@", (uint8_t *)&v3, 0xCu);
}

- (void)run
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[IRNearbyInteractionBridge niSession](self, "niSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_isObserver)
    {
      objc_msgSend(MEMORY[0x24BDDFE38], "observerSession");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_opt_new();
    }
    v5 = (void *)v4;
    -[IRNearbyInteractionBridge setNiSession:](self, "setNiSession:", v4);

    -[IRNearbyInteractionBridge niSession](self, "niSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

  }
  -[IRNearbyInteractionBridge niSession](self, "niSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "runWithConfiguration:", self->_niConfiguration);

}

- (void)sessionWasSuspended:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[IRNearbyInteractionBridge delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyInteractionBridge name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didBridgeSuspendStartedWithName:", v5);

  v6 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[IRNearbyInteractionBridge name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] sessionWasSuspended", (uint8_t *)&v9, 0xCu);

  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[IRNearbyInteractionBridge delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyInteractionBridge name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didBridgeSuspendEndedWithName:", v5);

  v6 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[IRNearbyInteractionBridge name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] sessionSuspensionEnded", (uint8_t *)&v9, 0xCu);

  }
}

- (void)sessionDidStartRunning:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[IRNearbyInteractionBridge name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] sessionDidStartRunning", (uint8_t *)&v9, 0xCu);

  }
  -[IRNearbyInteractionBridge delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyInteractionBridge name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didBridgeRunSuccesfully:", v8);

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = a4;
    -[IRNearbyInteractionBridge name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] session:didInvalidateWithError %@", (uint8_t *)&v13, 0x16u);

  }
  -[IRNearbyInteractionBridge delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyInteractionBridge name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didBridgeFail:", v12);

}

- (double)_nearbyObjectDistance:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  double v8;
  void *v10;
  float v11;
  void *v12;
  double *v13;
  double v14;

  v4 = a3;
  v5 = *MEMORY[0x24BDDFDF0];
  objc_msgSend(v4, "distance");
  if (v5 == v6 || (objc_msgSend(v4, "distance"), v7 < 0.0))
  {
    v8 = 1000.0;
  }
  else
  {
    -[IRNearbyInteractionBridge binaryRegionThreshold](self, "binaryRegionThreshold");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "distance");
    v8 = v11;
    if (v10)
    {
      -[IRNearbyInteractionBridge binaryRegionThreshold](self, "binaryRegionThreshold");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v13 = (double *)&kProximityProviderDistanceFar;
      if (v14 >= v8)
        v13 = (double *)&kProximityProviderDistanceNear;
      v8 = *v13;

    }
  }

  return v8;
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v5;
  IRNearbyDeviceDO *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  IRNearbyDeviceDO *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  IRNearbyDeviceDO *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = [IRNearbyDeviceDO alloc];
  -[IRNearbyInteractionBridge _nearbyObjectDistance:](self, "_nearbyObjectDistance:", v5);
  v8 = v7;
  objc_msgSend(v5, "deviceIdentifer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyInteractionBridge name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](v6, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v9, 0, v10, v11, v8);

  -[IRNearbyInteractionBridge _updateRegionToDelegate:](self, "_updateRegionToDelegate:", v12);
  v13 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
  {
    v14 = v13;
    -[IRNearbyInteractionBridge name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v15;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v16;
    _os_log_debug_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_DEBUG, "#nearby-interaction-bridge, [%@] session:didDiscoverNearbyObject: %@, %@", (uint8_t *)&v17, 0x20u);

  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v9;
  id v10;
  id v11;
  IRNearbyDeviceDO *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  IRNearbyDeviceDO *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[IRNearbyInteractionBridge trackRegion](self, "trackRegion"))
  {
    v12 = [IRNearbyDeviceDO alloc];
    -[IRNearbyInteractionBridge _nearbyObjectDistance:](self, "_nearbyObjectDistance:", v9);
    v14 = v13;
    objc_msgSend(v9, "deviceIdentifer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRNearbyInteractionBridge name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](v12, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v15, 0, v16, v17, v14);

    -[IRNearbyInteractionBridge _updateRegionToDelegate:](self, "_updateRegionToDelegate:", v18);
    v19 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[IRNearbyInteractionBridge name](self, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deviceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413314;
      v24 = v21;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] didUpdateRegion to %@ from %@ for %@ with deviceIdentifier: %@", (uint8_t *)&v23, 0x34u);

    }
  }

}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5;
  _QWORD v6[5];

  v5 = a4;
  if (-[IRNearbyInteractionBridge trackUpdates](self, "trackUpdates"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__IRNearbyInteractionBridge_session_didUpdateNearbyObjects___block_invoke;
    v6[3] = &unk_251045AE8;
    v6[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  }

}

void __60__IRNearbyInteractionBridge_session_didUpdateNearbyObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  IRNearbyDeviceDO *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  IRNearbyDeviceDO *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [IRNearbyDeviceDO alloc];
  objc_msgSend(*(id *)(a1 + 32), "_nearbyObjectDistance:", v3);
  v6 = v5;
  objc_msgSend(v3, "deviceIdentifer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](v4, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v7, 0, v8, v9, v6);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didUpdateNearbyDevice:withName:", v10, v12);

  v13 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
  {
    v14 = *(void **)(a1 + 32);
    v15 = v13;
    objc_msgSend(v14, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD16E0];
    -[IRNearbyDeviceDO range](v10, "range");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v16;
    v21 = 2112;
    v22 = v3;
    v23 = 2112;
    v24 = v18;
    _os_log_debug_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_DEBUG, "#nearby-interaction-bridge, [%@] didUpdateNearbyObject to %@ , distance = %@", (uint8_t *)&v19, 0x20u);

  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__IRNearbyInteractionBridge_session_didRemoveNearbyObjects_withReason___block_invoke;
  v5[3] = &unk_251045AE8;
  v5[4] = self;
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", v5);
}

void __71__IRNearbyInteractionBridge_session_didRemoveNearbyObjects_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  IRNearbyDeviceDO *v4;
  void *v5;
  void *v6;
  void *v7;
  IRNearbyDeviceDO *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [IRNearbyDeviceDO alloc];
  objc_msgSend(v3, "deviceIdentifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](v4, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v5, 0, v6, v7, 1000.0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didRemoveDevice:withName:", v8, v10);

  v11 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v11;
    objc_msgSend(v12, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD16E0];
    -[IRNearbyDeviceDO range](v8, "range");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v14;
    v19 = 2112;
    v20 = v3;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_23FFBA000, v13, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] didRemoveDevice to %@ , distance = %@", (uint8_t *)&v17, 0x20u);

  }
}

- (void)_updateRegionToDelegate:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  -[IRNearbyInteractionBridge delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v12, "range");
    v6 = v5;
    +[IRPreferences shared](IRPreferences, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nearbyDeviceRegionThreshold");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    -[IRNearbyInteractionBridge name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 >= v10)
      objc_msgSend(v4, "didRemoveDevice:withName:", v12, v11);
    else
      objc_msgSend(v4, "didUpdateNearbyDevice:withName:", v12, v11);

  }
}

- (NIConfiguration)niConfiguration
{
  return self->_niConfiguration;
}

- (void)setNiConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_niConfiguration, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (IRProximityBridgeDelegateProtocol)delegate
{
  return (IRProximityBridgeDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (void)setIsObserver:(BOOL)a3
{
  self->_isObserver = a3;
}

- (NSNumber)binaryRegionThreshold
{
  return self->_binaryRegionThreshold;
}

- (void)setBinaryRegionThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_binaryRegionThreshold, a3);
}

- (BOOL)trackRegion
{
  return self->_trackRegion;
}

- (void)setTrackRegion:(BOOL)a3
{
  self->_trackRegion = a3;
}

- (BOOL)trackUpdates
{
  return self->_trackUpdates;
}

- (void)setTrackUpdates:(BOOL)a3
{
  self->_trackUpdates = a3;
}

- (NISession)niSession
{
  return self->_niSession;
}

- (void)setNiSession:(id)a3
{
  objc_storeStrong((id *)&self->_niSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_storeStrong((id *)&self->_binaryRegionThreshold, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_niConfiguration, 0);
}

@end

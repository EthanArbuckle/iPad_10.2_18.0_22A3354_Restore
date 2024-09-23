@implementation MPCAssistantDiscovery

- (MPCAssistantDiscovery)init
{
  MPCAssistantDiscovery *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPCAssistantDiscovery;
  result = -[MPCAssistantDiscovery init](&v3, sel_init);
  if (result)
    result->_waitForCompleteClusters = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MPCAssistantDiscovery stopDiscovery](self, "stopDiscovery");
  v3.receiver = self;
  v3.super_class = (Class)MPCAssistantDiscovery;
  -[MPCAssistantDiscovery dealloc](&v3, sel_dealloc);
}

- (void)discoverAirplayDevicesMatchingGroupID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[MPCAssistantDiscovery stopDiscovery](self, "stopDiscovery");
  v7 = (void *)MRAVReconnaissanceSessionCreateWithMatchingOutputGroupIDFeatures();

  self->_reconSession = v7;
  -[MPCAssistantDiscovery _discoverAirplayDevices:](self, "_discoverAirplayDevices:", v8);

}

- (void)discoverAirplayDevicesMatchingLogicalDeviceIDs:(id)a3 expectedCount:(unint64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a5;
  v7 = a3;
  -[MPCAssistantDiscovery stopDiscovery](self, "stopDiscovery");
  v8 = (void *)MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs();

  self->_reconSession = v8;
  MRAVReconnaissanceSessionSetWaitForCompleteClusters();
  MRAVReconnaissanceSessionSetExpectedLogicalDevices();
  -[MPCAssistantDiscovery _discoverAirplayDevices:](self, "_discoverAirplayDevices:", v9);

}

- (void)discoverAirplayDevicesMatchingUIDs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[MPCAssistantDiscovery stopDiscovery](self, "stopDiscovery");
  v7 = (void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();

  self->_reconSession = v7;
  MRAVReconnaissanceSessionSetWaitForCompleteClusters();
  -[MPCAssistantDiscovery _discoverAirplayDevices:](self, "_discoverAirplayDevices:", v8);

}

- (void)discoverRemoteControlEndpointsMatchingUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[MPCAssistantDiscovery stopDiscovery](self, "stopDiscovery");
  v8 = (void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();

  self->_reconSession = v8;
  MRAVReconnaissanceSessionSetWaitForCompleteClusters();
  MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints();
  MRAVReconnaissanceSessionSetReturnPartialResults();
  v10 = v6;
  v9 = v6;
  MRAVReconnaissanceSessionBeginEndpointsSearch();

}

- (void)stopDiscovery
{
  void *reconSession;

  reconSession = self->_reconSession;
  if (reconSession)
  {
    CFRelease(reconSession);
    self->_reconSession = 0;
  }
}

- (void)_discoverAirplayDevices:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  MRAVReconnaissanceSessionSetReturnPartialResults();
  objc_msgSend(MEMORY[0x24BDB1858], "auxiliarySession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDB15A8];
  v13 = 0;
  v6 = objc_msgSend(v4, "setCategory:error:", v5, &v13);
  v7 = v13;
  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "Audio session category failed: %{public}@ (AirPlay devices may be missed)", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "opaqueSessionID");
  MRAVReconnaissanceSessionSetTargetAudioSessionID();
  v11 = v4;
  v12 = v3;
  v9 = v3;
  v10 = v4;
  MRAVReconnaissanceSessionBeginSearch();

}

- (BOOL)waitForCompleteClusters
{
  return self->_waitForCompleteClusters;
}

- (void)setWaitForCompleteClusters:(BOOL)a3
{
  self->_waitForCompleteClusters = a3;
}

void __49__MPCAssistantDiscovery__discoverAirplayDevices___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v3, a2);

}

void __79__MPCAssistantDiscovery_discoverRemoteControlEndpointsMatchingUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v11 = a3;
    v19 = a2;
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 134218240;
      v22 = objc_msgSend(v11, "count");
      v23 = 2048;
      v24 = objc_msgSend(v19, "count");
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "Found %lu endpoints, %lu devices.", (uint8_t *)&v21, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "code") == 26)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE65728]);

    if (v10)
    {
      v11 = a3;
      v12 = objc_msgSend(v11, "count");
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14)
        {
          v21 = 138543362;
          v22 = (uint64_t)v11;
          v15 = "Timed out with partial discovery. Found endpoints: %{public}@";
          v16 = v13;
          v17 = 12;
LABEL_15:
          _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v21, v17);
        }
      }
      else if (v14)
      {
        LOWORD(v21) = 0;
        v15 = "Timed out with no devices discovered";
        v16 = v13;
        v17 = 2;
        goto LABEL_15;
      }

      (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v11);
LABEL_17:

      goto LABEL_18;
    }
  }
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v21 = 138543362;
    v22 = (uint64_t)v8;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "Failed to discover output devices error: %{public}@", (uint8_t *)&v21, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_18:

}

@end

@implementation MRAVLocalEndpoint

BOOL __32__MRAVLocalEndpoint_groupLeader__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isLocalDevice") & 1) != 0 || objc_msgSend(v2, "deviceType") != 1;

  return v3;
}

- (id)groupLeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MRAVOutputContextEndpoint outputDevices](self, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_firstWhere:", &__block_literal_global_14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MRAVLocalEndpoint audioDiscoverySession](self, "audioDiscoverySession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableOutputDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "msv_firstWhere:", &__block_literal_global_15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __65__MRAVLocalEndpoint_sharedLocalEndpointForRoutingContextWithUID___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  objc_msgSend((id)sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
      +[MRAVConcreteOutputContext sharedAudioPresentationContext](MRAVConcreteOutputContext, "sharedAudioPresentationContext");
    else
      +[MRAVConcreteOutputContext createOutputContextWithUniqueIdentifier:](MRAVConcreteOutputContext, "createOutputContextWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[MRAVLocalEndpoint initWithOutputContext:]([MRAVLocalEndpoint alloc], v15);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v13)
    {
      +[MROutputContextController sharedOutputContextController](MROutputContextController, "sharedOutputContextController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setOutputContextController:", v14);

    }
    objc_msgSend((id)sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));

  }
}

+ (id)sharedLocalEndpointForRoutingContextWithUID:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  __CFString *v8;
  id v9;
  _QWORD v11[4];
  __CFString *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (sharedLocalEndpointForRoutingContextWithUID____once == -1)
  {
    if (v3)
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&sharedLocalEndpointForRoutingContextWithUID____once, &__block_literal_global_14);
    if (v4)
      goto LABEL_6;
  }
  +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
    v4 = (__CFString *)v6;
  else
    v4 = CFSTR("SYSTEM");
LABEL_6:
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v7 = sharedLocalEndpointForRoutingContextWithUID____serialQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__MRAVLocalEndpoint_sharedLocalEndpointForRoutingContextWithUID___block_invoke_4;
  v11[3] = &unk_1E30C5D20;
  v12 = v4;
  v13 = &v14;
  v8 = v4;
  dispatch_sync(v7, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)initWithOutputContext:(void *)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = v2;
    v7.super_class = (Class)MRAVLocalEndpoint;
    v2 = objc_msgSendSuper2(&v7, sel_initWithOutputContext_uniqueIdentifier_, v3, v4);

    if (v2)
    {
      +[MROrigin localOrigin](MROrigin, "localOrigin");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setOrigin:", v5);

      -[MRAVLocalEndpoint registerNotifications]((uint64_t)v2);
    }
  }
  return v2;
}

- (void)registerNotifications
{
  id v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel_handleActiveGroupSessionDidChangeNotification_, CFSTR("MRActiveGroupSessionInfoDidChangeNotification"), 0);

  }
}

void __65__MRAVLocalEndpoint_sharedLocalEndpointForRoutingContextWithUID___block_invoke()
{
  id v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap;
  sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap = (uint64_t)v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.MRAVEndpoint.sharedLocalEndpointSerialQueue", v4);
  v3 = (void *)sharedLocalEndpointForRoutingContextWithUID____serialQueue;
  sharedLocalEndpointForRoutingContextWithUID____serialQueue = (uint64_t)v2;

}

+ (id)sharedLocalEndpoint
{
  return (id)objc_msgSend((id)objc_opt_class(), "sharedLocalEndpointForRoutingContextWithUID:", 0);
}

- (id)groupSessionInfo
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isHosted"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)handleActiveGroupSessionDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  -[MRAVLocalEndpoint groupSessionInfo](self, "groupSessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("MRAVEndpointGroupSessionInfoUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointGroupSessionInfoDidChangeNotification"), self, v8);
}

BOOL __32__MRAVLocalEndpoint_groupLeader__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isLocalDevice") & 1) != 0 || objc_msgSend(v2, "deviceType") != 1;

  return v3;
}

- (MRAVRoutingDiscoverySession)audioDiscoverySession
{
  if (audioDiscoverySession___token != -1)
    dispatch_once(&audioDiscoverySession___token, &__block_literal_global_16);
  return (MRAVRoutingDiscoverySession *)(id)audioDiscoverySession___audioDiscoverySession;
}

void __42__MRAVLocalEndpoint_audioDiscoverySession__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)audioDiscoverySession___audioDiscoverySession;
  audioDiscoverySession___audioDiscoverySession = v0;

}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  void *v2;
  void *v3;
  char v4;

  -[MRAVLocalEndpoint groupSessionEligibilityMonitor](self, "groupSessionEligibilityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEligibleForHostingGroupSessionExcludingAcknowledgements");

  return v4;
}

- (MRGroupSessionEligibilityMonitor)groupSessionEligibilityMonitor
{
  if (groupSessionEligibilityMonitor___token != -1)
    dispatch_once(&groupSessionEligibilityMonitor___token, &__block_literal_global_19);
  objc_msgSend((id)groupSessionEligibilityMonitor___groupSessionEligibilityMonitor, "addObserver:", self);
  return (MRGroupSessionEligibilityMonitor *)(id)groupSessionEligibilityMonitor___groupSessionEligibilityMonitor;
}

void __51__MRAVLocalEndpoint_groupSessionEligibilityMonitor__block_invoke()
{
  MRGroupSessionEligibilityMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(MRGroupSessionEligibilityMonitor);
  v1 = (void *)groupSessionEligibilityMonitor___groupSessionEligibilityMonitor;
  groupSessionEligibilityMonitor___groupSessionEligibilityMonitor = (uint64_t)v0;

}

- (id)deviceInfo
{
  return +[MRDeviceInfoRequest localDeviceInfo](MRDeviceInfoRequest, "localDeviceInfo");
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke;
  v15 = &unk_1E30C7098;
  v16 = v6;
  v17 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x194036C44](&v12);
  MRGetSharedService();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestGroupSessionWithCompletion:", v10, v12, v13, v14, v15);

}

void __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)groupSessionMonitor:(id)a3 statusDidChangeFrom:(id)a4 to:(id)a5
{
  id v7;
  int v8;
  id v9;

  v7 = a5;
  LODWORD(a4) = objc_msgSend(a4, "isEligibleForHostingGroupSessionExcludingAcknowledgements");
  v8 = objc_msgSend(v7, "isEligibleForHostingGroupSessionExcludingAcknowledgements");

  if ((_DWORD)a4 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointGroupSessionHostingEligibilityDidChangeNotification"), self, 0);

  }
}

@end

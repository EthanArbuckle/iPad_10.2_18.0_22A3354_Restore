@implementation MRDestinationResolverDependencies

+ (id)defaultDependencies
{
  if (defaultDependencies_onceToken != -1)
    dispatch_once(&defaultDependencies_onceToken, &__block_literal_global_44);
  return (id)defaultDependencies__defaultDependencies;
}

void __56__MRDestinationResolverDependencies_defaultDependencies__block_invoke()
{
  MRDestinationResolverDependencies *v0;
  void *v1;

  v0 = objc_alloc_init(MRDestinationResolverDependencies);
  v1 = (void *)defaultDependencies__defaultDependencies;
  defaultDependencies__defaultDependencies = (uint64_t)v0;

}

- (void)createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v28 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v29[0] = CFSTR("MRNowPlayingController");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke;
  v22[3] = &unk_1E30C68F0;
  v26 = v13;
  v27 = v15;
  v23 = v14;
  v24 = v11;
  v25 = v12;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v15;
  v21 = v14;
  objc_msgSend(v19, "connectToExternalDeviceWithUserInfo:completion:", v16, v22);

}

void __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C7C50;
  v7 = v3;
  v11 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, block);

}

void __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke_2(uint64_t a1)
{
  MRPlayerPath *v2;
  void *v3;
  MRPlayerPath *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v2 = [MRPlayerPath alloc];
    objc_msgSend(*(id *)(a1 + 40), "origin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MRPlayerPath initWithOrigin:client:player:](v2, "initWithOrigin:client:player:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)resolvePlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__MRDestinationResolverDependencies_resolvePlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E30C7B60;
  v10 = v7;
  v8 = v7;
  MRMediaRemoteNowPlayingResolvePlayerPath(a3, a4, v9);

}

uint64_t __72__MRDestinationResolverDependencies_resolvePlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveEndpointForContextUID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  MRAVLightweightReconnaissanceSession *v10;
  id v11;
  MRAVLightweightReconnaissanceSession *v12;
  id v13;
  _QWORD v14[4];
  MRAVLightweightReconnaissanceSession *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  v16 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke;
  v17[3] = &unk_1E30C6FB0;
  v18 = v7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke_2;
  v14[3] = &unk_1E30C7C28;
  v15 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v7;
  -[MRAVLightweightReconnaissanceSession searchEndpointsWithPredicate:timeout:reason:queue:completion:](v12, "searchEndpointsWithPredicate:timeout:reason:queue:completion:", v17, CFSTR("MRNowPlayingController-partialGroupUID"), v9, v14, 3.0);

}

uint64_t __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupContextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

void __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

- (void)retrieveEndpointForUID:(id)a3 endpointGroupUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  int v14;
  MRAVLightweightReconnaissanceSession *v15;
  MRAVLightweightReconnaissanceSession *v16;
  id *v17;
  id *v18;
  _QWORD v19[4];
  MRAVLightweightReconnaissanceSession *v20;
  id v21;
  _QWORD v22[4];
  MRAVLightweightReconnaissanceSession *v23;
  id v24;
  _QWORD v25[4];
  MRAVLightweightReconnaissanceSession *v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("proactiveEndpoint"));
  v14 = objc_msgSend(v9, "isEqualToString:", CFSTR("userSelectedEndpoint"));
  if ((v13 & 1) != 0 || v14)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke;
    v25[3] = &unk_1E30C7C00;
    v26 = (MRAVLightweightReconnaissanceSession *)v12;
    MRAVEndpointResolveActiveSystemEndpointWithType(v13, v11, v25, 3.0);
    v16 = v26;
  }
  else
  {
    v15 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    v16 = v15;
    if (v10)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_2;
      v22[3] = &unk_1E30C7C28;
      v17 = (id *)&v23;
      v23 = v15;
      v18 = &v24;
      v24 = v12;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForGroupUID:timeout:reason:queue:completion:](v16, "searchEndpointsForGroupUID:timeout:reason:queue:completion:", v10, CFSTR("MRNowPlayingController-recon"), v11, v22, 3.0);
    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_3;
      v19[3] = &unk_1E30C7C28;
      v17 = (id *)&v20;
      v20 = v15;
      v18 = &v21;
      v21 = v12;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:](v16, "searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:", v9, CFSTR("MRNowPlayingController-recon"), v11, v19, 3.0);
    }

  }
}

uint64_t __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

void __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

- (void)retrieveOutputDeviceUIDForOrigin:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__MRDestinationResolverDependencies_retrieveOutputDeviceUIDForOrigin_queue_completion___block_invoke;
  v9[3] = &unk_1E30C7B60;
  v10 = v7;
  v8 = v7;
  MRMediaRemoteGetDeviceInfo((uint64_t)a3, (uint64_t)a4, v9);

}

void __87__MRDestinationResolverDependencies_retrieveOutputDeviceUIDForOrigin_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "deviceUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

- (id)addPlayerPathInvalidationHandler:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__MRDestinationResolverDependencies_addPlayerPathInvalidationHandler_queue_handler___block_invoke;
  v11[3] = &unk_1E30C8FE0;
  v12 = v7;
  v8 = v7;
  v9 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler((uint64_t)a3, a4, v11);

  return v9;
}

uint64_t __84__MRDestinationResolverDependencies_addPlayerPathInvalidationHandler_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removePlayerPathInvalidationHandler:(id)a3
{
  MRMediaRemoteRemovePlayerPathInvalidationHandler((uint64_t)a3);
}

- (id)createEndpointObserverWithUID:(id)a3
{
  id v3;
  MRAVEndpointObserver *v4;

  v3 = a3;
  v4 = -[MRAVEndpointObserver initWithOutputDeviceUID:]([MRAVEndpointObserver alloc], "initWithOutputDeviceUID:", v3);

  return v4;
}

@end

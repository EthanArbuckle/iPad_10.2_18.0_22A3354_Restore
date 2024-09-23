@implementation MRDeviceInfoRequest

uint64_t __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)cachedDeviceInfoForOrigin:(id)a3
{
  id v5;
  MRPlayerPath *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRDeviceInfoRequest.m"), 46, CFSTR("origin cannot be nil"));

  }
  v6 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v5, 0, 0);
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originClientRequestsForPlayerPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "deviceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke;
    v16 = &unk_1E30C78E0;
    v18 = a1;
    v17 = v5;
    if (cachedDeviceInfoForOrigin__onceToken != -1)
      dispatch_once(&cachedDeviceInfoForOrigin__onceToken, &v13);

  }
  v10 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v10;
}

+ (MRDeviceInfo)localDeviceInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceInfoForOrigin:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRDeviceInfo *)v4;
}

+ (id)deviceInfoForOrigin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MRPlayerPath *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!v4)
  {
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activePlayerPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "origin");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_4;
  }
  objc_msgSend(a1, "cachedDeviceInfoForOrigin:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_4:
    v8 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v4, 0, 0);
    v9 = (void *)MRGetSharedService();
    MRMediaRemoteServiceCopyDeviceInfo(v9, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

void __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  qos_class_t v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = qos_class_self();
  dispatch_get_global_queue(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_2;
  v8[3] = &unk_1E30CFF00;
  v7 = *(_OWORD *)(a1 + 32);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v2, "deviceInfoForOrigin:queue:completion:", v3, v5, v8);

}

+ (void)deviceInfoForOrigin:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  void *v18;
  _QWORD block[4];
  id v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (!v8)
    {
      v8 = MEMORY[0x1E0C80D38];
      v10 = MEMORY[0x1E0C80D38];
    }
    kdebug_trace();
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke;
    v22[3] = &unk_1E30CFF50;
    v8 = v8;
    v23 = v8;
    v24 = v9;
    v12 = (void *)MEMORY[0x194036C44](v22);
    v13 = v12;
    if (v7)
    {
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_4;
      block[3] = &unk_1E30C6568;
      v14 = &v21;
      v21 = v12;
      v20 = v7;
      v15 = v13;
      dispatch_async(v8, block);

    }
    else
    {
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_5;
      v17[3] = &unk_1E30CFF78;
      v14 = &v18;
      v18 = v12;
      v16 = v12;
      MRMediaRemoteGetActiveOrigin(v8, v17);
    }

  }
}

void __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  kdebug_trace();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_3;
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

void __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MRPlayerPath *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v3, 0, 0);

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_2;
  v12 = &unk_1E30CFF28;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](&v9);
  if (v3)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager", v9, v10, v11, v12, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originClientRequestsForPlayerPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "handleDeviceInfoRequestWithCompletion:", v5);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (void *)objc_msgSend(v8, "initWithMRError:", 5, v9, v10, v11, v12, v13);
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v7);
  }

}

void __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_3(uint64_t a1)
{
  id v2;
  MRPlayerPath *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;

  objc_msgSend(*(id *)(a1 + 40), "cachedDeviceInfoForOrigin:", *(_QWORD *)(a1 + 32));
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", *(_QWORD *)(a1 + 32), 0, 0);
  MRAddPlayerPathToUserInfo(v2, v3);

  MRAddDeviceInfoToUserInfo(v2, v7);
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateDecodedUserInfo(v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:userInfo:object:", CFSTR("kMRDeviceInfoDidChangeNotification"), v6, 0);

}

void __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  __int128 v9;

  if (a2)
  {
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_3;
    block[3] = &unk_1E30C78E0;
    v7 = *(_OWORD *)(a1 + 32);
    v6 = (id)v7;
    v9 = v7;
    dispatch_async(v5, block);

  }
}

uint64_t __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)deviceInfoForUID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  MRDestination *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRDeviceInfoRequest.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v10)
  {
LABEL_3:
    v10 = (id)MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
LABEL_4:
  v13 = -[MRDestination initWithOutputDeviceUID:]([MRDestination alloc], "initWithOutputDeviceUID:", v9);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke;
  v17[3] = &unk_1E30CFFA0;
  v18 = v10;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  +[MRDestinationResolver resolveDestination:level:timeout:completion:](MRDestinationResolver, "resolveDestination:level:timeout:completion:", v13, 0, v17, 7.0);

}

void __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id *v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  objc_msgSend(a2, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_2;
    v12[3] = &unk_1E30C7B60;
    v8 = &v13;
    v13 = *(id *)(a1 + 40);
    MRMediaRemoteGetDeviceInfo((uint64_t)v6, (uint64_t)v7, v12);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_3;
    block[3] = &unk_1E30C6568;
    v8 = &v11;
    v11 = *(id *)(a1 + 40);
    v10 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 5);
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

@end

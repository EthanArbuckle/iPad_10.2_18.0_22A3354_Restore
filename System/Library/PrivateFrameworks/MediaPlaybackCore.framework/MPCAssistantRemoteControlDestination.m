@implementation MPCAssistantRemoteControlDestination

- (MPCAssistantRemoteControlDestination)initWithAppBundleID:(id)a3 playerID:(id)a4 origin:(void *)a5
{
  id v8;
  id v9;
  MPCAssistantRemoteControlDestination *v10;
  uint64_t v11;
  NSString *appBundleID;
  uint64_t v13;
  NSString *playerID;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPCAssistantRemoteControlDestination;
  v10 = -[MPCAssistantRemoteControlDestination init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    appBundleID = v10->_appBundleID;
    v10->_appBundleID = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    playerID = v10->_playerID;
    v10->_playerID = (NSString *)v13;

    if (a5)
      v15 = (void *)CFRetain(a5);
    else
      v15 = 0;
    v10->_origin = v15;
  }

  return v10;
}

- (MPCAssistantRemoteControlDestination)initWithAppBundleID:(id)a3
{
  return -[MPCAssistantRemoteControlDestination initWithAppBundleID:playerID:origin:](self, "initWithAppBundleID:playerID:origin:", a3, 0, 0);
}

- (MPCAssistantRemoteControlDestination)init
{
  return -[MPCAssistantRemoteControlDestination initWithAppBundleID:playerID:origin:](self, "initWithAppBundleID:playerID:origin:", 0, 0, 0);
}

- (void)dealloc
{
  void *origin;
  objc_super v4;

  origin = self->_origin;
  if (origin)
    CFRelease(origin);
  v4.receiver = self;
  v4.super_class = (Class)MPCAssistantRemoteControlDestination;
  -[MPCAssistantRemoteControlDestination dealloc](&v4, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p "), v5, self);

  if (-[NSArray count](self->_outputDeviceUIDs, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("outputDeviceUIDs=%@ "), self->_outputDeviceUIDs);
  if (-[NSArray count](self->_outputGroups, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("outputGroups=%@ "), self->_outputGroups);
  if (self->_outputGroupID)
    objc_msgSend(v6, "appendFormat:", CFSTR("outputGroupID=%@ "), self->_outputGroupID);
  if (self->_origin)
    objc_msgSend(v6, "appendFormat:", CFSTR("origin=%d "), MROriginGetUniqueIdentifier());
  if (self->_originatingOutputDeviceUID)
    objc_msgSend(v6, "appendFormat:", CFSTR("originatingOutputDeviceUID=%@"), self->_originatingOutputDeviceUID);
  if (self->_appBundleID)
    objc_msgSend(v6, "appendFormat:", CFSTR("bundleID=%@ "), self->_appBundleID);
  if (self->_playerID)
    objc_msgSend(v6, "appendFormat:", CFSTR("playerID=%@ "), self->_playerID);
  v7 = CFSTR("YES");
  if (self->_singleGroup)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!self->_originatingDeviceControl)
    v7 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("SG=%@ ODC=%@>"), v8, v7);
  return v6;
}

- (void)createPlayerPath
{
  const void *v3;
  const void *v4;
  void *v5;

  if (self->_appBundleID)
    v3 = (const void *)MRNowPlayingClientCreate();
  else
    v3 = 0;
  if (self->_playerID)
    v4 = (const void *)MRNowPlayingPlayerCreate();
  else
    v4 = 0;
  v5 = (void *)MRNowPlayingPlayerPathCreate();
  if (v3)
    CFRelease(v3);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (void)resolveWithHashedRouteIdentifiers:(id)a3 completion:(id)a4
{
  -[MPCAssistantRemoteControlDestination resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:](self, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", a3, 0, a4);
}

- (void)resolveWithHashedRouteIdentifiers:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5
{
  -[MPCAssistantRemoteControlDestination resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:](self, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", 0, a3, 0, *(unsigned int *)&a4, a5);
}

- (void)resolveWithRouteIdentifiers:(id)a3 completion:(id)a4
{
  -[MPCAssistantRemoteControlDestination resolveWithRouteIdentifiers:audioRoutingInfo:completion:](self, "resolveWithRouteIdentifiers:audioRoutingInfo:completion:", a3, 0, a4);
}

- (void)resolveWithRouteIdentifiers:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5
{
  -[MPCAssistantRemoteControlDestination resolveWithQueue:routeIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:](self, "resolveWithQueue:routeIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", 0, a3, 0, *(unsigned int *)&a4, a5);
}

- (void)resolveWithQueue:(id)a3 hashedRouteIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 completion:(id)a6
{
  -[MPCAssistantRemoteControlDestination resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:](self, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", a3, a4, 1, 0, a6);
}

- (void)resolveWithQueue:(id)a3 hashedRouteIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 audioRoutingInfo:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  MPCAssistantEncodings *v16;
  id v17;
  MPCAssistantEncodings *v18;
  _QWORD v19[4];
  MPCAssistantEncodings *v20;
  id v21;
  id v22;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (objc_msgSend(v13, "count"))
  {
    v15 = (void *)-[MPCAssistantRemoteControlDestination mutableCopy](self, "mutableCopy");
    v16 = objc_alloc_init(MPCAssistantEncodings);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __131__MPCAssistantRemoteControlDestination_resolveWithQueue_hashedRouteIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion___block_invoke;
    v19[3] = &unk_24CAB8318;
    v20 = v16;
    v21 = v15;
    v22 = v14;
    v17 = v15;
    v18 = v16;
    -[MPCAssistantEncodings decodeHashedRouteUIDs:completion:](v18, "decodeHashedRouteUIDs:completion:", v13, v19);

  }
  else
  {
    -[MPCAssistantRemoteControlDestination resolveWithQueue:routeIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:](self, "resolveWithQueue:routeIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", v12, 0, v9, *(unsigned int *)&a6, v14);
  }

}

- (void)resolveWithQueue:(id)a3 routeIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 completion:(id)a6
{
  -[MPCAssistantRemoteControlDestination resolveWithQueue:routeIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:](self, "resolveWithQueue:routeIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", a3, a4, 1, 0, a6);
}

- (void)resolveWithQueue:(id)a3 routeIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 audioRoutingInfo:(id)a6 completion:(id)a7
{
  void (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v9 = (void (**)(id, void *))a7;
  v10 = (void *)-[MPCAssistantRemoteControlDestination mutableCopy](self, "mutableCopy");
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v10, "setOutputDeviceUIDs:", v12);
    v9[2](v9, v10);
  }
  else
  {
    v11 = -[MPCAssistantRemoteControlDestination copy](self, "copy");
    v9[2](v9, (void *)v11);

    v9 = (void (**)(id, void *))v11;
  }

}

- (void)resolveForWatchControlCommandWithRouteIdentifiers:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  uint64_t v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint8_t buf[16];
  _QWORD v24[5];
  id v25;
  id v26;
  void (**v27)(id, void *);
  id v28;
  _QWORD aBlock[5];
  id v30;
  void (**v31)(id, void *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)-[MPCAssistantRemoteControlDestination mutableCopy](self, "mutableCopy");
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v11, "setOutputDeviceUIDs:", v8);
    v10[2](v10, v11);
  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke;
    aBlock[3] = &unk_24CAB98A8;
    aBlock[4] = self;
    v13 = v11;
    v30 = v13;
    v14 = v10;
    v31 = v14;
    v15 = _Block_copy(aBlock);
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_35;
    v24[3] = &unk_24CAB8368;
    v24[4] = self;
    v25 = v9;
    v26 = v13;
    v27 = v14;
    v16 = v15;
    v28 = v16;
    v17 = _Block_copy(v24);
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: GetElectedPlayerPath start", buf, 2u);
    }

    v21 = v17;
    v22 = v16;
    v19 = v16;
    v20 = v17;
    MRMediaRemoteGetElectedPlayerPath();

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPCAssistantRemoteControlDestination _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPCAssistantRemoteControlDestination _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const void *origin;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = objc_alloc_init(a4);
  v6 = -[NSString copy](self->_appBundleID, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copy](self->_playerID, "copy");
  v9 = (void *)v5[2];
  v5[2] = v8;

  origin = self->_origin;
  if (origin)
    origin = CFRetain(origin);
  v5[3] = origin;
  v11 = -[NSArray copy](self->_outputDeviceUIDs, "copy");
  v12 = (void *)v5[4];
  v5[4] = v11;

  v13 = -[NSArray copy](self->_hashedOutputDeviceUIDs, "copy");
  v14 = (void *)v5[5];
  v5[5] = v13;

  v15 = -[NSArray copy](self->_outputGroups, "copy");
  v16 = (void *)v5[6];
  v5[6] = v15;

  v17 = -[NSString copy](self->_outputGroupID, "copy");
  v18 = (void *)v5[7];
  v5[7] = v17;

  v19 = -[NSString copy](self->_originatingOutputDeviceUID, "copy");
  v20 = (void *)v5[8];
  v5[8] = v19;

  *((_BYTE *)v5 + 72) = self->_singleGroup;
  *((_BYTE *)v5 + 73) = self->_originatingDeviceControl;
  return v5;
}

- (void)_getCompanionOriginWithQueue:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *originatingOutputDeviceUID;
  id v5;

  originatingOutputDeviceUID = self->_originatingOutputDeviceUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originatingOutputDeviceUID, CFSTR("OriginatingOutputDeviceUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleID, CFSTR("AppBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playerID, CFSTR("PlayerID"));

}

- (MPCAssistantRemoteControlDestination)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MPCAssistantRemoteControlDestination *v7;
  uint64_t v8;
  NSString *originatingOutputDeviceUID;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlayerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPCAssistantRemoteControlDestination initWithAppBundleID:playerID:origin:](self, "initWithAppBundleID:playerID:origin:", v5, v6, 0);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OriginatingOutputDeviceUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    originatingOutputDeviceUID = v7->_originatingOutputDeviceUID;
    v7->_originatingOutputDeviceUID = (NSString *)v8;

  }
  return v7;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)origin
{
  return self->_origin;
}

- (NSArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (NSArray)hashedOutputDeviceUIDs
{
  return self->_hashedOutputDeviceUIDs;
}

- (NSArray)outputGroups
{
  return self->_outputGroups;
}

- (NSString)outputGroupID
{
  return self->_outputGroupID;
}

- (NSString)originatingOutputDeviceUID
{
  return self->_originatingOutputDeviceUID;
}

- (BOOL)singleGroup
{
  return self->_singleGroup;
}

- (BOOL)originatingDeviceControl
{
  return self->_originatingDeviceControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingOutputDeviceUID, 0);
  objc_storeStrong((id *)&self->_outputGroupID, 0);
  objc_storeStrong((id *)&self->_outputGroups, 0);
  objc_storeStrong((id *)&self->_hashedOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

uint64_t __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: Using local origin", v4, 2u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isEqualToString:", CFSTR("com.apple.iBooks")))
    objc_msgSend(*(id *)(a1 + 40), "setAppBundleID:", CFSTR("com.apple.NanoBooks"));
  objc_msgSend(*(id *)(a1 + 40), "setOrigin:", MRMediaRemoteGetLocalOrigin());
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_35(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: Attempting to fetch companion origin", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_36;
  v5[3] = &unk_24CAB8340;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v3, "_getCompanionOriginWithQueue:completion:", v4, v5);

}

void __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "identifier");

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "origin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109376;
    v9[1] = objc_msgSend(v7, "identifier");
    v10 = 1024;
    v11 = v5 == 1129140302;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: GetElectedPlayerPath finish. identifier:'%d'  isCompanionOriginElected:%{BOOL}u", (uint8_t *)v9, 0xEu);

  }
  v8 = 40;
  if (v5 == 1129140302)
    v8 = 32;
  (*(void (**)(void))(*(_QWORD *)(a1 + v8) + 16))();

}

uint64_t __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_36(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = a2;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: Found companion origin: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setOrigin:", a2);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "resolveForWatchControlCommand: Companion origin not found. Falling back to local origin.", (uint8_t *)&v7, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __131__MPCAssistantRemoteControlDestination_resolveWithQueue_hashedRouteIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setOutputDeviceUIDs:", v5);

  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setHashedOutputDeviceUIDs:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)systemMediaApplicationDestination
{
  __CFString *v2;
  void *v3;
  int v4;
  void *v5;

  v2 = (__CFString *)(id)*MEMORY[0x24BE65A48];
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sonicHijack");

  if (v4)
  {

    v2 = CFSTR("com.apple.Sonic");
  }
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAppBundleID:", v2);

  return v5;
}

+ (id)podcastsApplicationDestination
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAppBundleID:", CFSTR("com.apple.podcasts"));
}

+ (id)iBooksApplicationDestination
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAppBundleID:", CFSTR("com.apple.iBooks"));
}

+ (id)nowPlayingApplicationDestination
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

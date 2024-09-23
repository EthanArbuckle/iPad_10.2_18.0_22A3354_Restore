@implementation MPAssistantGetStateResponseRemote

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPAssistantGetStateResponseRemote;
  -[MPAssistantGetStateResponseRemote dealloc](&v4, sel_dealloc);
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *workingRemoteResponse;
  NSMutableDictionary *v16;
  NSMutableDictionary *originMapping;
  MPCAssistantEncodings *v18;
  MPCAssistantEncodings *encoder;
  MPCAssistantEncodings *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetStateResponseRemote aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State Response Remote"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[MPAssistantGetStateResponseRemote hashedRouteUIDs](self, "hashedRouteUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v9;
    v29 = 2048;
    v30 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);

  }
  v11 = self->_requestAceHash;
  -[MPAssistantGetStateResponseRemote hashedRouteUIDs](self, "hashedRouteUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Get State Response Remote"), v11, v12);

  v13 = objc_alloc_init(MEMORY[0x1E0D88238]);
  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  workingRemoteResponse = self->_workingRemoteResponse;
  self->_workingRemoteResponse = v14;

  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  originMapping = self->_originMapping;
  self->_originMapping = v16;

  v18 = (MPCAssistantEncodings *)objc_alloc_init(MEMORY[0x1E0D4B310]);
  encoder = self->_encoder;
  self->_encoder = v18;

  v20 = self->_encoder;
  -[MPAssistantGetStateResponseRemote hashedRouteUIDs](self, "hashedRouteUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1CC97F020;
  v24[3] = &unk_1E88E3F78;
  v25 = v13;
  v26 = v4;
  v24[4] = self;
  v22 = v13;
  v23 = v4;
  -[MPCAssistantEncodings decodeHashedRouteUIDs:completion:](v20, "decodeHashedRouteUIDs:completion:", v21, v24);

}

- (void)setPlayingInfoFromEndpoint:(void *)a3
{
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  const void *LocalOrigin;
  NSObject *v12;
  const void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint64_t Client;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *group;
  _QWORD block[12];
  _QWORD v28[5];
  id v29;
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  void *v37;
  MPAssistantGetStateResponseRemote *v38;
  id v39;
  NSObject *v40;
  _QWORD *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[3];
  char v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, unsigned int);
  void *v49;
  MPAssistantGetStateResponseRemote *v50;
  id v51;
  NSObject *v52;
  _QWORD *v53;
  void *v54;
  _QWORD v55[3];
  int v56;
  _QWORD v57[5];
  id v58;
  NSObject *v59;
  _BYTE *v60;
  void *v61;
  uint64_t v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetStateResponseRemote aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State Response Remote"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: Set info for: %{public}@", buf, 0x16u);
  }

  v10 = (void *)MRAVEndpointCopyUniqueIdentifier();
  if (MRAVEndpointIsLocalEndpoint())
  {
    LocalOrigin = (const void *)MRMediaRemoteGetLocalOrigin();
    CFRetain(LocalOrigin);
  }
  else
  {
    MRAVEndpointGetExternalDevice();
    LocalOrigin = (const void *)MRExternalDeviceCopyCustomOrigin();
  }
  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v13 = (const void *)MRNowPlayingPlayerPathCreate();
  v62 = 0;
  v14 = MRMediaRemoteNowPlayingCopyResolvedPlayerPath();
  if (v13)
    CFRelease(v13);
  v15 = (const void *)MRPlaybackQueueRequestCreate();
  MRPlaybackQueueRequestSetIncludeMetadata();
  MRPlaybackQueueRequestSetIncludeInfo();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v64 = sub_1CC97DE24;
  v65 = sub_1CC97DE34;
  v66 = 0;
  dispatch_group_enter(group);
  CFRetain(a3);
  v16 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = sub_1CC97DE3C;
  v57[3] = &unk_1E88E27F0;
  v57[4] = self;
  v17 = v10;
  v58 = v17;
  v60 = buf;
  v61 = a3;
  v18 = group;
  v59 = v18;
  MEMORY[0x1D17B027C](v15, v14, v12, v57);
  if (v15)
    CFRelease(v15);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v56 = 0;
  dispatch_group_enter(v18);
  CFRetain(a3);
  v46 = v16;
  v47 = 3221225472;
  v48 = sub_1CC97E03C;
  v49 = &unk_1E88E2818;
  v50 = self;
  v19 = v17;
  v51 = v19;
  v53 = v55;
  v54 = a3;
  v20 = v18;
  v52 = v20;
  MRMediaRemoteGetPlaybackStateForPlayer();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  dispatch_group_enter(v20);
  CFRetain(a3);
  Client = MRNowPlayingPlayerPathGetClient();
  v22 = MEMORY[0x1E0C80D38];
  v34 = v16;
  v35 = 3221225472;
  v36 = sub_1CC97E198;
  v37 = &unk_1E88E2840;
  v41 = v44;
  v42 = Client;
  v38 = self;
  v23 = v19;
  v39 = v23;
  v43 = a3;
  v24 = v20;
  v40 = v24;
  MRMediaRemoteGetDeviceInfo();

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_1CC97DE24;
  v32[4] = sub_1CC97DE34;
  v33 = 0;
  dispatch_group_enter(v24);
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = sub_1CC97E3D4;
  v28[3] = &unk_1E88E2868;
  v28[4] = self;
  v29 = v23;
  v31 = v32;
  v25 = v24;
  v30 = v25;
  MEMORY[0x1D17B0204](v12, v28);
  CFRetain(a3);
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = sub_1CC97E510;
  block[3] = &unk_1E88E28E0;
  block[4] = self;
  block[5] = v32;
  block[6] = buf;
  block[7] = v44;
  block[8] = v55;
  block[9] = a3;
  block[10] = v14;
  block[11] = LocalOrigin;
  dispatch_group_notify(v25, v12, block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(buf, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_responseCollectionQueue, 0);
  objc_storeStrong((id *)&self->_originMapping, 0);
  objc_storeStrong((id *)&self->_workingRemoteResponse, 0);
  objc_storeStrong((id *)&self->_decodedDeviceUIDs, 0);
}

@end

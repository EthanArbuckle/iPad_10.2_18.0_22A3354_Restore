@implementation MPCPlayerPath

- (BOOL)isSystemMusicPath
{
  void *v2;
  char v3;
  char IsSystemMediaApplication;

  -[MPCPlayerPath representedBundleID](self, "representedBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE65A48]);
  IsSystemMediaApplication = v3;
  if (v2 && (v3 & 1) == 0)
    IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication();

  return IsSystemMediaApplication;
}

- (NSString)representedBundleID
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  v3 = self->_bundleID;
  if (self->_mediaRemotePlayerPath)
  {
    MRNowPlayingPlayerPathGetClient();
    v4 = (void *)MRNowPlayingClientCopyBundleIdentifierHierarchy();
    MRNowPlayingClientGetParentAppBundleIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "lastObject");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "length"))
      {
LABEL_7:

        return v3;
      }
      v6 = v5;
    }
    v7 = v6;

    v3 = v7;
    goto LABEL_7;
  }
  return v3;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (id)description
{
  void *v3;
  void *v4;
  MPAVRoute *route;
  BOOL v6;
  uint64_t DisplayName;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  NSString *bundleID;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@:"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  route = self->_route;
  v6 = route != 0;
  if (route)
    objc_msgSend(v3, "appendFormat:", CFSTR(" route=%@"), self->_route);
  if (self->_deviceUID)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" deviceUID=%@"), self->_deviceUID);
    v6 = 1;
  }
  if (!self->_mediaRemotePlayerPath)
  {
    bundleID = self->_bundleID;
    if (!bundleID)
      goto LABEL_20;
    v12 = bundleID;
    if (-[NSString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BE65A48]))
    {
      v14 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();

      objc_msgSend(v14, "stringByAppendingString:", CFSTR(" [system media app]"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "appendFormat:", CFSTR(" bundleID=%@"), v12);
    goto LABEL_19;
  }
  if (MRNowPlayingPlayerPathGetOrigin())
  {
    DisplayName = MROriginGetDisplayName();
    objc_msgSend(v4, "appendFormat:", CFSTR(" origin[MR]=%@-%d"), DisplayName, MROriginGetUniqueIdentifier());
    v6 = 1;
  }
  if (MRNowPlayingPlayerPathGetClient())
  {
    v8 = (void *)MRNowPlayingClientCopyBundleIdentifierHierarchy();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" bundleID[MR]=%@"), v9);

    if (MRNowPlayingClientGetProcessIdentifier())
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pid);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" pid[MR]=%@"), v10);

    }
    v6 = 1;
  }
  if (MRNowPlayingPlayerPathGetPlayer())
  {
    MRNowPlayingPlayerGetIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (NSString *)v11;
    if (v11)
      objc_msgSend(v4, "appendFormat:", CFSTR(" playerID[MR]=%@"), v11);
LABEL_19:

    v6 = 1;
  }
LABEL_20:
  if (self->_pid)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" pid=%@"), v15);

  }
  if (self->_playerID)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" playerID=%@"), self->_playerID);
  }
  else if (!v6)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" local active"));
  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)mediaRemotePlayerPath
{
  return self->_mediaRemotePlayerPath;
}

- (BOOL)isInProcess
{
  void *mediaRemotePlayerPath;
  void *v4;
  void *v5;
  uint64_t BundleIdentifier;
  char v7;

  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath)
  {
    MRNowPlayingPlayerPathGetClient();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BundleIdentifier = MRNowPlayingClientGetBundleIdentifier();
    if (v5 == (void *)BundleIdentifier)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqual:", BundleIdentifier);

    LOBYTE(mediaRemotePlayerPath) = -[MPCPlayerPath isLocal](self, "isLocal") & v7;
  }
  return (char)mediaRemotePlayerPath;
}

- (BOOL)isLocal
{
  void *mediaRemotePlayerPath;

  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath)
    LOBYTE(mediaRemotePlayerPath) = MRNowPlayingPlayerPathIsLocal();
  return (char)mediaRemotePlayerPath;
}

+ (id)systemMusicPathWithRoute:(id)a3 playerID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  const __CFString *v12;
  void *v13;

  v6 = (void *)MEMORY[0x24BDDCB28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sonicHijack");

  v11 = objc_alloc((Class)a1);
  if (v10)
    v12 = CFSTR("com.apple.Sonic");
  else
    v12 = (const __CFString *)*MEMORY[0x24BE65A48];
  v13 = (void *)objc_msgSend(v11, "initWithRoute:bundleID:playerID:", v8, v12, v7);

  return v13;
}

- (void)resolveWithRouteResolvedHandler:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t Origin;
  void (**v13)(void *, void *, _QWORD);
  NSString *deviceUID;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  uint64_t LocalOrigin;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, int);
  void *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD aBlock[5];
  id v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  NSString *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[MPCPlayerPath isResolved](self, "isResolved"))
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke;
    aBlock[3] = &unk_24CAB8340;
    aBlock[4] = self;
    v9 = v6;
    v47 = v9;
    v10 = v7;
    v48 = v10;
    v11 = _Block_copy(aBlock);
    Origin = MRNowPlayingPlayerPathGetOrigin();
    if (Origin && !MROriginIsLocalOrigin()
      || self->_deviceUID
      || (-[MPCPlayerPath route](self, "route"), (v25 = (id)objc_claimAutoreleasedReturnValue()) != 0)
      && (v26 = v25, v27 = objc_msgSend(v25, "isDeviceRoute"), v26, v26, !v27))
    {
      if (self->_deviceUID)
      {
        v43[0] = v8;
        v43[1] = 3221225472;
        v43[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_3;
        v43[3] = &unk_24CAB5790;
        v43[4] = self;
        v44 = v10;
        v45 = v9;
        v13 = (void (**)(void *, void *, _QWORD))_Block_copy(v43);
        deviceUID = self->_deviceUID;
        objc_msgSend(MEMORY[0x24BE654D0], "localDeviceUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(deviceUID) = -[NSString isEqualToString:](deviceUID, "isEqualToString:", v15);

        if ((_DWORD)deviceUID)
        {
          objc_msgSend(MEMORY[0x24BE654C8], "sharedLocalEndpoint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v16;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v13[2](v13, v17, 0);
        }
        else
        {
          v16 = (void *)objc_opt_new();
          v51 = self->_deviceUID;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v17, v13);
        }

        v29 = v44;
      }
      else
      {
        -[MPCPlayerPath route](self, "route");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[MPCPlayerPath route](self, "route");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "connection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            -[MPCPlayerPath route](self, "route");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "connection");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "reset");
            v49 = *MEMORY[0x24BDDBA30];
            v50 = CFSTR("MPCPlayerPath");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v33[0] = v8;
            v33[1] = 3221225472;
            v33[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_6;
            v33[3] = &unk_24CAB57E0;
            v34 = v22;
            v35 = v11;
            v36 = v10;
            v24 = v22;
            objc_msgSend(v24, "connectWithUserInfo:completion:", v23, v33);

          }
          else
          {
            v30 = (void *)MEMORY[0x24BDD1540];
            -[MPCPlayerPath route](self, "route");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 5000, CFSTR("%@ did not have connection"), v23);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v31);

          }
          goto LABEL_23;
        }
        if (Origin)
        {
          (*((void (**)(void *, uint64_t))v11 + 2))(v11, Origin);
          goto LABEL_23;
        }
        dispatch_get_global_queue(21, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v8;
        v38 = 3221225472;
        v39 = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_5;
        v40 = &unk_24CAB57B8;
        v41 = v11;
        v42 = v10;
        MRMediaRemoteGetActiveOrigin();

        v29 = v41;
      }

    }
    else
    {
      LocalOrigin = MRMediaRemoteGetLocalOrigin();
      (*((void (**)(void *, uint64_t))v11 + 2))(v11, LocalOrigin);
    }
LABEL_23:

    goto LABEL_24;
  }
  (*((void (**)(id, MPCPlayerPath *, _QWORD))v7 + 2))(v7, self, 0);
LABEL_24:

}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  const void *v12;
  const void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = v2;
  v6 = v3;
  v7 = v6;
  if (v5)
  {
    if (!v4)
    {
      if (MROriginIsLocalOrigin())
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v5, "isEqualToString:", v9);

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "processIdentifier");

        }
      }
    }
    v12 = (const void *)MRNowPlayingClientCreate();
    if (v7)
      goto LABEL_9;
LABEL_7:
    v13 = 0;
    goto LABEL_10;
  }
  v12 = 0;
  if (!v6)
    goto LABEL_7;
LABEL_9:
  v13 = (const void *)MRNowPlayingPlayerCreate();
LABEL_10:
  v14 = MRNowPlayingPlayerPathCreate();
  if (v12)
    CFRelease(v12);
  if (v13)
    CFRelease(v13);

  if (*(_QWORD *)(a1 + 40))
  {
    +[MPCPlayerPath pathWithRoute:mediaRemotePlayerPath:isResolved:](MPCPlayerPath, "pathWithRoute:mediaRemotePlayerPath:isResolved:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  dispatch_get_global_queue(21, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(id *)(a1 + 48);
  MRMediaRemoteNowPlayingResolvePlayerPath();

}

- (void)dealloc
{
  void *mediaRemotePlayerPath;
  objc_super v4;

  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath)
    CFRelease(mediaRemotePlayerPath);
  v4.receiver = self;
  v4.super_class = (Class)MPCPlayerPath;
  -[MPCPlayerPath dealloc](&v4, sel_dealloc);
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  id v9;

  v5 = a3;
  if (v5)
    goto LABEL_2;
  if (!MRNowPlayingPlayerPathGetOrigin())
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 5000, CFSTR("resolved player path %@ did not have an origin. (unresolved player path %@)"), a2, a1[6]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_2:
    v6 = v5;
    v7 = 0;
    goto LABEL_5;
  }
  +[MPCPlayerPath pathWithRoute:mediaRemotePlayerPath:isResolved:](MPCPlayerPath, "pathWithRoute:mediaRemotePlayerPath:isResolved:", *(_QWORD *)(a1[4] + 40), a2, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v6 = 0;
LABEL_5:
  v9 = (id)v7;
  (*(void (**)(void))(a1[5] + 16))();
  v8 = (const void *)a1[6];
  if (v8)
    CFRelease(v8);

}

+ (MPCPlayerPath)pathWithRoute:(id)a3 mediaRemotePlayerPath:(void *)a4 isResolved:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a3;
  MRNowPlayingPlayerPathGetClient();
  MRNowPlayingClientGetBundleIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRNowPlayingPlayerPathGetPlayer();
  MRNowPlayingPlayerGetIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pathWithRoute:bundleID:playerID:", v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(v10 + 32) = MRNowPlayingPlayerPathCopy();
  *(_DWORD *)(v10 + 8) = MRNowPlayingClientGetProcessIdentifier();
  *(_BYTE *)(v10 + 12) = a5;

  return (MPCPlayerPath *)(id)v10;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

- (BOOL)isEqual:(id)a3
{
  MPCPlayerPath *v4;
  MPCPlayerPath *v5;
  MPAVRoute *route;
  MPAVRoute *v7;
  int v8;
  char v9;
  NSString *bundleID;
  NSString *v11;
  int v12;
  int pid;
  int v14;
  NSString *playerID;
  NSString *v16;
  int v17;
  BOOL v18;
  NSString *deviceUID;
  NSString *v20;
  NSString *v21;
  char v22;
  int v23;

  v4 = (MPCPlayerPath *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      route = self->_route;
      -[MPCPlayerPath route](v5, "route");
      v7 = (MPAVRoute *)objc_claimAutoreleasedReturnValue();
      if (route == v7)
        v8 = 0;
      else
        v8 = -[MPAVRoute isEqual:](route, "isEqual:", v7) ^ 1;

      bundleID = self->_bundleID;
      -[MPCPlayerPath bundleID](v5, "bundleID");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (bundleID == v11)
        v12 = 0;
      else
        v12 = -[NSString isEqual:](bundleID, "isEqual:", v11) ^ 1;

      pid = self->_pid;
      v14 = v5->_pid;
      playerID = self->_playerID;
      -[MPCPlayerPath playerID](v5, "playerID");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (playerID == v16)
        v17 = 0;
      else
        v17 = -[NSString isEqual:](playerID, "isEqual:", v16) ^ 1;

      if (self->_mediaRemotePlayerPath == v5->_mediaRemotePlayerPath)
      {
        v18 = 1;
      }
      else
      {
        MRNowPlayingPlayerPathGetOrigin();
        MRNowPlayingPlayerPathGetOrigin();
        v18 = MROriginEqualToOrigin() != 0;
      }
      deviceUID = v5->_deviceUID;
      v20 = self->_deviceUID;
      v21 = v20;
      if (v20 == deviceUID)
        v22 = 1;
      else
        v22 = -[NSString isEqual:](v20, "isEqual:", deviceUID);

      v23 = v8 | v12;
      if (pid != v14)
        v23 = 1;
      if (((v23 | v17) & 1) != 0)
        v9 = 0;
      else
        v9 = v18 & v22;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (MPAVRoute)route
{
  return self->_route;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

+ (MPCPlayerPath)pathWithRoute:(id)a3 bundleID:(id)a4 playerID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRoute:bundleID:playerID:", v10, v9, v8);

  return (MPCPlayerPath *)v11;
}

+ (id)deviceActivePlayerPath
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRoute:bundleID:playerID:", 0, 0, 0);
}

- (MPCPlayerPath)initWithRoute:(id)a3 bundleID:(id)a4 playerID:(id)a5
{
  return -[MPCPlayerPath initWithRoute:bundleID:pid:playerID:](self, "initWithRoute:bundleID:pid:playerID:", a3, a4, 0, a5);
}

- (MPCPlayerPath)initWithRoute:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  id v12;
  id v13;
  id v14;
  MPCPlayerPath *v15;
  MPCPlayerPath *v16;
  uint64_t v17;
  NSString *bundleID;
  uint64_t v19;
  NSString *playerID;
  void *v22;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayerPath.m"), 85, CFSTR("Unsupported route type %@"), objc_opt_class());

    }
  }
  v23.receiver = self;
  v23.super_class = (Class)MPCPlayerPath;
  v15 = -[MPCPlayerPath init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_route, a3);
    v17 = objc_msgSend(v13, "copy");
    bundleID = v16->_bundleID;
    v16->_bundleID = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    playerID = v16->_playerID;
    v16->_playerID = (NSString *)v19;

    v16->_pid = a5;
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t pid;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = -[MPAVRoute hash](self->_route, "hash");
  v10 = v5 ^ 0x7465646279746573 ^ v9;
  v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  v12 = v8 + v10;
  v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  v14 = v13 + __ROR8__(v6 + v7, 32);
  v85 = __ROR8__(v12 + v11, 32);
  v90 = v14 ^ __ROR8__(v13, 43);
  v15 = v14 ^ v9;
  v80 = (v12 + v11) ^ __ROR8__(v11, 47);
  v16 = self->_bundleID;
  v17 = -[NSString hash](v16, "hash");
  v18 = (v15 + v80) ^ __ROR8__(v80, 51);
  v19 = v85 + (v90 ^ v17);
  v20 = __ROR8__(v90 ^ v17, 48);
  v21 = (v19 ^ v20) + __ROR8__(v15 + v80, 32);
  v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  v23 = v19 + v18;
  v86 = __ROR8__(v23, 32);
  v91 = v22;
  v76 = v21 ^ v17;
  v81 = v23 ^ __ROR8__(v18, 47);

  pid = self->_pid;
  v25 = (v76 + v81) ^ __ROR8__(v81, 51);
  v26 = v86 + (v91 ^ pid);
  v27 = __ROR8__(v91 ^ pid, 48);
  v28 = (v26 ^ v27) + __ROR8__(v76 + v81, 32);
  v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  v30 = v26 + v25;
  v87 = __ROR8__(v30, 32);
  v92 = v29;
  v77 = v28 ^ pid;
  v82 = v30 ^ __ROR8__(v25, 47);
  v31 = self->_playerID;
  v32 = -[NSString hash](v31, "hash");
  v33 = (v77 + v82) ^ __ROR8__(v82, 51);
  v34 = v87 + (v92 ^ v32);
  v35 = __ROR8__(v92 ^ v32, 48);
  v36 = (v34 ^ v35) + __ROR8__(v77 + v82, 32);
  v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  v38 = v34 + v33;
  v88 = __ROR8__(v38, 32);
  v93 = v37;
  v78 = v36 ^ v32;
  v83 = v38 ^ __ROR8__(v33, 47);

  v39 = self->_deviceUID;
  v40 = -[NSString hash](v39, "hash");
  v41 = (v78 + v83) ^ __ROR8__(v83, 51);
  v42 = v88 + (v93 ^ v40);
  v43 = __ROR8__(v93 ^ v40, 48);
  v44 = (v42 ^ v43) + __ROR8__(v78 + v83, 32);
  v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  v46 = v42 + v41;
  v89 = __ROR8__(v46, 32);
  v94 = v45;
  v79 = v44 ^ v40;
  v84 = v46 ^ __ROR8__(v41, 47);

  v47 = (v79 + v84) ^ __ROR8__(v84, 51);
  v48 = v89 + (v94 ^ 0x2800000000000000);
  v49 = __ROR8__(v94 ^ 0x2800000000000000, 48);
  v50 = (v48 ^ v49) + __ROR8__(v79 + v84, 32);
  v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
  v52 = v48 + v47;
  v53 = v52 ^ __ROR8__(v47, 47);
  v54 = (v50 ^ 0x2800000000000000) + v53;
  v55 = v54 ^ __ROR8__(v53, 51);
  v56 = (__ROR8__(v52, 32) ^ 0xFFLL) + v51;
  v57 = __ROR8__(v51, 48);
  v58 = __ROR8__(v54, 32) + (v56 ^ v57);
  v59 = v58 ^ __ROR8__(v56 ^ v57, 43);
  v60 = v55 + v56;
  v61 = v60 ^ __ROR8__(v55, 47);
  v62 = v61 + v58;
  v63 = v62 ^ __ROR8__(v61, 51);
  v64 = __ROR8__(v60, 32) + v59;
  v65 = __ROR8__(v59, 48);
  v66 = __ROR8__(v62, 32) + (v64 ^ v65);
  v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
  v68 = v63 + v64;
  v69 = v68 ^ __ROR8__(v63, 47);
  v70 = v69 + v66;
  v71 = v70 ^ __ROR8__(v69, 51);
  v72 = __ROR8__(v68, 32) + v67;
  v73 = __ROR8__(v67, 48);
  v74 = __ROR8__(v70, 32) + (v72 ^ v73);
  return (v71 + v72) ^ __ROR8__(v71, 47) ^ v74 ^ __ROR8__(v71 + v72, 32) ^ v74 ^ __ROR8__(v72 ^ v73, 43);
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)getPlaybackIntentDestinationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __90__MPCPlayerPath_MPCPlaybackIntentDestination__getPlaybackIntentDestinationWithCompletion___block_invoke;
  v6[3] = &unk_24CAB37F8;
  v7 = v4;
  v5 = v4;
  -[MPCPlayerPath resolveWithCompletion:](self, "resolveWithCompletion:", v6);

}

void __90__MPCPlayerPath_MPCPlaybackIntentDestination__getPlaybackIntentDestinationWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  uint64_t v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isInProcess"))
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isLocal"))
    v7 = 2;
  else
    v7 = 3;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, 0);
LABEL_6:

}

- (MPCPlayerPath)initWithDeviceUID:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPCPlayerPath *v13;
  uint64_t v14;
  NSString *deviceUID;
  uint64_t v16;
  NSString *bundleID;
  uint64_t v18;
  NSString *playerID;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MPCPlayerPath;
  v13 = -[MPCPlayerPath init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    deviceUID = v13->_deviceUID;
    v13->_deviceUID = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    bundleID = v13->_bundleID;
    v13->_bundleID = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    playerID = v13->_playerID;
    v13->_playerID = (NSString *)v18;

    v13->_pid = a5;
  }

  return v13;
}

- (MPCPlayerPath)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MPCPlayerPath *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));

  v9 = -[MPCPlayerPath initWithRoute:bundleID:pid:playerID:](self, "initWithRoute:bundleID:pid:playerID:", v5, v6, v8, v7);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_route, CFSTR("route"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  if (self->_mediaRemotePlayerPath)
  {
    MRNowPlayingPlayerPathGetClient();
    objc_msgSend(v4, "encodeInt32:forKey:", MRNowPlayingClientGetProcessIdentifier(), CFSTR("pid"));
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_playerID, CFSTR("playerID"));

}

- (BOOL)isFullyResolved
{
  void *mediaRemotePlayerPath;

  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath)
    LOBYTE(mediaRemotePlayerPath) = MRNowPlayingPlayerPathGetIsResolved();
  return (char)mediaRemotePlayerPath;
}

- (NSString)representedBundleDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (self->_mediaRemotePlayerPath)
  {
    MRNowPlayingPlayerPathGetClient();
    MRNowPlayingClientGetBundleIdentifier();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24CABB5D0, CFSTR("PlayerPathDisplayName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", v2))
    {
      MRNowPlayingClientGetDisplayName();
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSString *)v7;
}

- (BOOL)isNativeMusicPath
{
  return MRMediaRemoteApplicationIsSystemMediaApplication();
}

- (BOOL)isNativePodcastsPath
{
  return MRMediaRemoteApplicationIsSystemPodcastApplication();
}

- (BOOL)isNativeBooksPath
{
  return MRMediaRemoteApplicationIsSystemBooksApplication();
}

- (void)resolveWithCompletion:(id)a3
{
  -[MPCPlayerPath resolveWithRouteResolvedHandler:completion:](self, "resolveWithRouteResolvedHandler:completion:", 0, a3);
}

- (void)origin
{
  return (void *)MRNowPlayingPlayerPathGetOrigin();
}

- (id)pathByAppendingPlayerIDSuffix:(id)a3
{
  id v4;
  const void *v5;
  void *v6;
  void *v7;
  MPCPlayerPath *v8;
  NSString *playerID;
  id v10;

  if (self->_mediaRemotePlayerPath)
  {
    v4 = a3;
    v5 = (const void *)MRNowPlayingPlayerPathCopy();
    MRNowPlayingPlayerPathGetPlayer();
    MRNowPlayingPlayerGetIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    MRNowPlayingPlayerSetIdentifier();
    +[MPCPlayerPath pathWithRoute:mediaRemotePlayerPath:isResolved:](MPCPlayerPath, "pathWithRoute:mediaRemotePlayerPath:isResolved:", self->_route, v5, self->_resolved);
    v8 = (MPCPlayerPath *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    playerID = self->_playerID;
    v10 = a3;
    -[NSString stringByAppendingString:](playerID, "stringByAppendingString:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[MPCPlayerPath initWithRoute:bundleID:pid:playerID:]([MPCPlayerPath alloc], "initWithRoute:bundleID:pid:playerID:", self->_route, self->_bundleID, self->_pid, v7);
  }

  return v8;
}

- (MRPlayerPath)mrPlayerPath
{
  void *mediaRemotePlayerPath;
  id v3;

  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath)
    v3 = mediaRemotePlayerPath;
  return (MRPlayerPath *)mediaRemotePlayerPath;
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t ExternalDevice;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MPCPlayerPath *v12;
  uint64_t v13;
  MPCPlayerPath *v14;
  _QWORD v15[4];
  MPCPlayerPath *v16;
  id v17;

  v3 = a2;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC6A0]), "initWithEndpoint:", v4);
    ExternalDevice = MRAVEndpointGetExternalDevice();
    if ((MRAVEndpointIsLocalEndpoint() & 1) != 0 || ExternalDevice)
    {
      if (ExternalDevice)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC6C8]), "initWithExternalDevice:", ExternalDevice);
        objc_msgSend(v5, "setConnection:", v11);

      }
      v12 = -[MPCPlayerPath initWithRoute:bundleID:pid:playerID:]([MPCPlayerPath alloc], "initWithRoute:bundleID:pid:playerID:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_4;
      v15[3] = &unk_24CAB5768;
      v16 = v12;
      v13 = *(_QWORD *)(a1 + 48);
      v17 = *(id *)(a1 + 40);
      v14 = v12;
      -[MPCPlayerPath resolveWithRouteResolvedHandler:completion:](v14, "resolveWithRouteResolvedHandler:completion:", v13, v15);

    }
    else
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 5000, CFSTR("Missing external device for endpoint %@."), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 5000, CFSTR("Could not discover endpoint for device UID (%@)."), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 5000, CFSTR("Could not get active origin."));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint64_t v5;
  const void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    v7 = v3;
LABEL_3:
    v4();

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "externalDevice");
  v5 = MRExternalDeviceCopyCustomOrigin();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 5000, CFSTR("external device %@ did not have an origin. (connection %@, isConnected:%d isInvalidated:%d)"), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "externalDevice"), objc_msgSend(*(id *)(a1 + 32), "isConnected"), objc_msgSend(*(id *)(a1 + 32), "isInvalidated"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_3;
  }
  v6 = (const void *)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CFRelease(v6);
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

+ (id)systemPodcastsPathWithRoute:(id)a3 playerID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_msgSend(v8, "initWithRoute:bundleID:playerID:", v7, *MEMORY[0x24BE65A50], v6);

  return v9;
}

+ (MPCPlayerPath)pathWithDeviceUIDs:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v13, "initWithDeviceUID:bundleID:pid:playerID:", v14, v11, v6, v10);
  return (MPCPlayerPath *)v15;
}

+ (MPCPlayerPath)pathWithDeviceUID:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceUID:bundleID:pid:playerID:", v12, v11, v6, v10);

  return (MPCPlayerPath *)v13;
}

+ (MPCPlayerPath)pathWithCustomOrigin:(void *)a3 bundleID:(id)a4 playerID:(id)a5
{
  id v8;
  id v9;
  const void *v10;
  const void *v11;
  const void *v12;
  void *v13;
  void *v15;

  v8 = a4;
  v9 = a5;
  if (MROriginIsLocalOrigin())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCPlayerPath.m"), 68, CFSTR("%s is only for use with custom origins."), "+[MPCPlayerPath pathWithCustomOrigin:bundleID:playerID:]");

  }
  v10 = (const void *)MRNowPlayingClientCreate();
  v11 = (const void *)MRNowPlayingPlayerCreate();

  v12 = (const void *)MRNowPlayingPlayerPathCreate();
  CFRelease(v11);
  CFRelease(v10);
  objc_msgSend(a1, "pathWithRoute:mediaRemotePlayerPath:isResolved:", 0, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v12);

  return (MPCPlayerPath *)v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerPath)

- (id)_musicKit_self_playerPath
{
  id v2;

  getMPCPlayerPathClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_playerPath_bundleID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_playerPath_playerID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "playerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)musicKit_playerPath_isInProcess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isInProcess");

  return v2;
}

- (id)musicKit_playerPath_route
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)musicKit_playerPath_isLocal
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isLocal");

  return v2;
}

- (uint64_t)musicKit_playerPath_hasNonLocalEndpointRoute
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getMPAVEndpointRouteClass();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v2)
  {
    objc_msgSend(v2, "endpointObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!objc_msgSend(v11, "isLocalDevice", (_QWORD)v13)
            || objc_msgSend(v11, "deviceSubtype") == 19
            || objc_msgSend(v11, "deviceSubtype") == 3)
          {
            v3 = 1;
            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v3 = 0;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v3 = 0;
    }
LABEL_16:

  }
  return v3;
}

- (uint64_t)musicKit_playerPath_isCompanion
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getMPAVEndpointRouteClass();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v3 = v2) != 0)
  {
    v4 = v3;
    objc_msgSend(v3, "endpointObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCompanionEndpoint");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)musicKit_playerPath_mrPlayerPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mrPlayerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

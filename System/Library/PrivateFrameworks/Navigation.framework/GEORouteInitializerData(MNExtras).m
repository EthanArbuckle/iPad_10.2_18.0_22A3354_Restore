@implementation GEORouteInitializerData(MNExtras)

- (id)allRouteInfos
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allRoutes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_geo_map:", &__block_literal_global_15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (MNActiveRouteInfo)mainRouteInfo
{
  void *v1;
  MNActiveRouteInfo *v2;

  objc_msgSend(a1, "mainRoute");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v1);
  else
    v2 = 0;

  return v2;
}

- (id)allETAUAlternateRouteInfos
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a1, "etaTrafficUpdateResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waypointRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (v4 = (void *)objc_msgSend(v3, "newWaypointRoutes"), v5 = objc_msgSend(v4, "count"), v4, v5))
  {
    objc_msgSend(a1, "allETAUAlternateRoutes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__GEORouteInitializerData_MNExtras__allETAUAlternateRouteInfos__block_invoke;
    v9[3] = &unk_1E61D30C8;
    v10 = v3;
    objc_msgSend(v6, "_geo_map:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

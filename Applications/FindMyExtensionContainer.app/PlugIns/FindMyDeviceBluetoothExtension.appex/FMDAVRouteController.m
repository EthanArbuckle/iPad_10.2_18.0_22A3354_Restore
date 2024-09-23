@implementation FMDAVRouteController

- (void)initializeNotifications
{
  id v2;

  v2 = +[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController");
}

- (id)pickableRoutesForCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  FMDAVRoute *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v18 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pickableRoutesForCategory:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9);
        v11 = objc_alloc_init(FMDAVRoute);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AVSystemController_RouteDescriptionKey_RouteUID));
        -[FMDAVRoute setRouteID:](v11, "setRouteID:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AVSystemController_RouteDescriptionKey_RouteType));
        -[FMDAVRoute setRouteType:](v11, "setRouteType:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AVSystemController_RouteDescriptionKey_RouteSubtype));
        -[FMDAVRoute setRouteSubType:](v11, "setRouteSubType:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked));
        -[FMDAVRoute setCurrentlyPicked:](v11, "setCurrentlyPicked:", objc_msgSend(v15, "BOOLValue"));

        -[FMDAVRoute setRawRouteInfo:](v11, "setRawRouteInfo:", v10);
        objc_msgSend(v5, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v5;
}

- (BOOL)setPickedRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rawRouteInfo"));

  LOBYTE(v3) = objc_msgSend(v4, "setPickedRouteWithPassword:withPassword:", v5, &stru_100023E70);
  return (char)v3;
}

- (BOOL)setVolume:(float)a3 forCategory:(id)a4 route:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeSubType"));

  *(float *)&v13 = a3;
  LOBYTE(v7) = objc_msgSend(v9, "setVolumeForRouteTo:forCategory:mode:route:deviceIdentifier:andRouteSubtype:", v8, 0, v10, v11, v12, v13);

  return (char)v7;
}

- (BOOL)getVolume:(float *)a3 forCategory:(id)a4 route:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeSubType"));

  LOBYTE(a3) = objc_msgSend(v9, "getVolumeForRoute:forCategory:mode:route:deviceIdentifier:andRouteSubtype:", a3, v8, 0, v10, v11, v12);
  return (char)a3;
}

@end

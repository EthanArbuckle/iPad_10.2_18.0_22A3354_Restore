@implementation GEODirectionsRequest(MKDirections)

- (void)_commonSetup:()MKDirections
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  _routeAttributesForMKDirectionsRequest(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRouteAttributes:", v5);

  LODWORD(v5) = objc_msgSend(v4, "requestsAlternateRoutes");
  if ((_DWORD)v5)
    v6 = 3;
  else
    v6 = 1;
  objc_msgSend(a1, "setMainTransportTypeMaxRouteCount:", v6);
  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasLocation") && (objc_msgSend(v8, "isLastLocationStale") & 1) == 0)
  {
    objc_msgSend(v8, "currentLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCurrentUserLocation:", v7);

  }
}

- (void)initWithDirectionsRequest:()MKDirections origin:destination:withFeedback:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(a1, "initWithFeedback:", a6);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "_commonSetup:", v10);
    objc_msgSend(v11, "geoWaypointTyped");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addWaypointTyped:", v15);

    objc_msgSend(v12, "geoWaypointTyped");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addWaypointTyped:", v16);

    if (GEOConfigGetBOOL())
    {
      objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientCapabilities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "copy");

      objc_msgSend(v19, "setRouteOptionsSupported:", 0);
      objc_msgSend(v14, "setClientCapabilities:", v19);

    }
  }

  return v14;
}

@end

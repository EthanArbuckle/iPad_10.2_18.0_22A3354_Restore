@implementation GEOSharedNavState(ReceiverCapabilities)

- (BOOL)requiresChangesForCompatibilityWithReceiverCapabilities:()ReceiverCapabilities
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = (!objc_msgSend(v4, "supportsRoutingPathLeg") || GEOConfigGetBOOL())
    && (objc_msgSend(a1, "hasRouteInfo") & 1) != 0
    || (!objc_msgSend(v4, "supportsWaypointRouteSharing") || GEOConfigGetBOOL())
    && ((objc_msgSend(a1, "hasRouteInfo") & 1) != 0
     || objc_msgSend(a1, "waypointInfosCount")
     || objc_msgSend(a1, "etaInfosCount"));

  return v5;
}

- (id)instanceCompatibleWithReceiverCapabilities:()ReceiverCapabilities
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v23 = a1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__GEOSharedNavState_ReceiverCapabilities__instanceCompatibleWithReceiverCapabilities___block_invoke;
  v17[3] = &unk_1E6654648;
  v17[4] = v23;
  v17[5] = &v18;
  v5 = (void (**)(_QWORD))MEMORY[0x1B5E2B4E8](v17);
  if (objc_msgSend((id)v19[5], "hasRouteInfo"))
  {
    if ((GEOConfigGetBOOL() & 1) == 0)
    {
      if (objc_msgSend(v4, "supportsRoutingPathLeg"))
      {
        v5[2](v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "routeInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "clearCoordinates");
        goto LABEL_6;
      }
      if ((objc_msgSend(v4, "supportsRoutingPathLeg") & 1) != 0)
        goto LABEL_7;
    }
    v5[2](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearRoutingPathLegs");
LABEL_6:

  }
LABEL_7:
  if ((objc_msgSend((id)v19[5], "hasRouteInfo") & 1) != 0
    || objc_msgSend((id)v19[5], "waypointInfosCount")
    || objc_msgSend((id)v19[5], "etaInfosCount"))
  {
    if ((GEOConfigGetBOOL() & 1) == 0)
    {
      if (objc_msgSend(v4, "supportsWaypointRouteSharing"))
      {
        v5[2](v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "routeInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "clearChargingStations");

        objc_msgSend(v8, "setDestinationInfo:", 0);
LABEL_21:

        goto LABEL_22;
      }
      if ((objc_msgSend(v4, "supportsWaypointRouteSharing") & 1) != 0)
        goto LABEL_22;
    }
    v5[2](v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "arrived") && objc_msgSend(v8, "isNavigatingToIntermediateStop"))
      objc_msgSend(v8, "setArrived:", 0);
    objc_msgSend(v8, "clearWaypointInfos");
    objc_msgSend(v8, "finalETAInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "lastLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "hasCoordinate"))
      {
        objc_msgSend(v10, "coordinate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lat");
        objc_msgSend(v9, "setLatitude:");

        objc_msgSend(v10, "coordinate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lng");
        objc_msgSend(v9, "setLongitude:");

        objc_msgSend(v8, "setLastLocation:", 0);
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEtaInfos:", v13);

    }
    goto LABEL_21;
  }
LABEL_22:
  v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v15;
}

@end

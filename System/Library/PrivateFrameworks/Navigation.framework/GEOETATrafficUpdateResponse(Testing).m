@implementation GEOETATrafficUpdateResponse(Testing)

- (void)addFakeTrafficIncidentAlert:()Testing mainRouteInfo:alternateRouteInfo:currentDistance:
{
  id v10;
  int UInteger;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t BOOL;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;

  v45 = a5;
  v10 = a4;
  UInteger = GEOConfigGetUInteger();
  +[MNTrafficIncidentAlert createFakeTrafficBannerTextWithType:mainRouteInfo:alternateRouteInfo:incidentDistance:](MNTrafficIncidentAlert, "createFakeTrafficBannerTextWithType:mainRouteInfo:alternateRouteInfo:incidentDistance:", a3, v10, v45, 50);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (GEOConfigGetBOOL())
  {
    objc_msgSend(v12, "setPreserveBannerInUpdates:", GEOConfigGetBOOL());
    v13 = objc_alloc_init(MEMORY[0x1E0D27630]);
    objc_msgSend(v12, "setTriggerRange:", v13);

    v14 = GEOConfigGetUInteger();
    objc_msgSend(v12, "triggerRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDisplayTime:", v14);

    objc_msgSend(v12, "setMinDisplayTime:", GEOConfigGetUInteger());
    objc_msgSend(v12, "setPriority:", GEOConfigGetUInteger());
    v16 = objc_alloc_init(MEMORY[0x1E0D27628]);
    objc_msgSend(v12, "triggerRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShowAtPoint:", v16);

    objc_msgSend(v12, "triggerRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "showAtPoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setReferenceOffsetCm:", (100 * (a6 - UInteger)));

    BOOL = GEOConfigGetBOOL();
    objc_msgSend(v12, "triggerRange");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hideAtPoint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsShifting:", BOOL);

    if (GEOConfigGetBOOL())
    {
      v23 = objc_alloc_init(MEMORY[0x1E0D27628]);
      objc_msgSend(v12, "triggerRange");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHideAtPoint:", v23);

      v25 = 100 * (a6 - GEOConfigGetUInteger());
      objc_msgSend(v12, "triggerRange");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hideAtPoint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setReferenceOffsetCm:", v25);

      v28 = GEOConfigGetBOOL();
      objc_msgSend(v12, "triggerRange");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "hideAtPoint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAllowsShifting:", v28);

    }
    if (GEOConfigGetBOOL())
    {
      v31 = objc_alloc_init(MEMORY[0x1E0D27630]);
      objc_msgSend(v12, "setProgressBarRange:", v31);

      v32 = GEOConfigGetUInteger();
      objc_msgSend(v12, "progressBarRange");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDisplayTime:", v32);

      v34 = objc_alloc_init(MEMORY[0x1E0D27628]);
      objc_msgSend(v12, "progressBarRange");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setShowAtPoint:", v34);

      v36 = 100 * (a6 - GEOConfigGetUInteger());
      objc_msgSend(v12, "progressBarRange");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "showAtPoint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setReferenceOffsetCm:", v36);

    }
  }
  objc_msgSend(a1, "waypointRoute");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend(v45, "route");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "geoWaypointRoute");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "copy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setNewWaypointRoutes:", v43);

  }
  objc_msgSend(v39, "addTrafficBannerText:", v12);
  v44 = objc_alloc_init(MEMORY[0x1E0D27258]);
  objc_msgSend(v44, "setIsBlocked:", a3 == 1);
  objc_msgSend(v39, "setNavigabilityInfo:", v44);

}

@end

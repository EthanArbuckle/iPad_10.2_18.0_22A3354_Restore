@implementation GEODirectionsResponse(Testing)

- (void)addFakeTrafficIncidentAlert:()Testing targetLegIndex:mainRouteInfo:alternateRouteInfo:currentDistance:
{
  id v12;
  void *v13;
  id v14;
  uint64_t UInteger;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t BOOL;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v43 = a5;
  v12 = a6;
  if (objc_msgSend(a1, "waypointRoutesCount") > a4)
  {
    GEOConfigGetUInteger();
    +[MNTrafficIncidentAlert createFakeTrafficBannerTextWithType:mainRouteInfo:alternateRouteInfo:incidentDistance:](MNTrafficIncidentAlert, "createFakeTrafficBannerTextWithType:mainRouteInfo:alternateRouteInfo:incidentDistance:", a3, v43, v12, 50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (GEOConfigGetBOOL())
    {
      objc_msgSend(v13, "setPreserveBannerInUpdates:", GEOConfigGetBOOL());
      v14 = objc_alloc_init(MEMORY[0x1E0D27630]);
      objc_msgSend(v13, "setTriggerRange:", v14);

      UInteger = GEOConfigGetUInteger();
      objc_msgSend(v13, "triggerRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDisplayTime:", UInteger);

      objc_msgSend(v13, "setMinDisplayTime:", GEOConfigGetUInteger());
      objc_msgSend(v13, "setPriority:", GEOConfigGetUInteger());
      v17 = objc_alloc_init(MEMORY[0x1E0D27628]);
      objc_msgSend(v13, "triggerRange");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setShowAtPoint:", v17);

      v19 = 100 * (a7 - GEOConfigGetUInteger());
      objc_msgSend(v13, "triggerRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "showAtPoint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setReferenceOffsetCm:", v19);

      BOOL = GEOConfigGetBOOL();
      objc_msgSend(v13, "triggerRange");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "showAtPoint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAllowsShifting:", BOOL);

      if (GEOConfigGetBOOL())
      {
        v25 = objc_alloc_init(MEMORY[0x1E0D27628]);
        objc_msgSend(v13, "triggerRange");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setHideAtPoint:", v25);

        v27 = 100 * (a7 - GEOConfigGetUInteger());
        objc_msgSend(v13, "triggerRange");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "hideAtPoint");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setReferenceOffsetCm:", v27);

        v30 = GEOConfigGetBOOL();
        objc_msgSend(v13, "triggerRange");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "hideAtPoint");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setAllowsShifting:", v30);

      }
      if (GEOConfigGetBOOL())
      {
        v33 = objc_alloc_init(MEMORY[0x1E0D27630]);
        objc_msgSend(v13, "setProgressBarRange:", v33);

        v34 = GEOConfigGetUInteger();
        objc_msgSend(v13, "progressBarRange");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setDisplayTime:", v34);

        v36 = objc_alloc_init(MEMORY[0x1E0D27628]);
        objc_msgSend(v13, "progressBarRange");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setShowAtPoint:", v36);

        v38 = 100 * (a7 - GEOConfigGetUInteger());
        objc_msgSend(v13, "progressBarRange");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "showAtPoint");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setReferenceOffsetCm:", v38);

      }
    }
    objc_msgSend(a1, "waypointRoutes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", a4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addTrafficBannerText:", v13);

  }
}

@end

@implementation GEOSharedNavState(MSPExtras)

- (id)destinationName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "destinationWaypointInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)destinationWaypointInfo
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (!objc_msgSend(a1, "waypointInfosCount"))
  {
LABEL_6:
    objc_msgSend(a1, "destinationInfo");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0D27548]);
      objc_msgSend(a1, "destinationInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setMapItemStorage:", v5);
      goto LABEL_8;
    }
    return v3;
  }
  objc_msgSend(a1, "waypointInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mapItemStorage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
LABEL_8:

    return v3;
  }
  objc_msgSend(v3, "chargingStationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

    goto LABEL_6;
  }
  return v3;
}

- (id)destinationWaypointMapItem
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "destinationWaypointInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapItemStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)senderName
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "senderInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasLocalContactIdentifier"))
  {

  }
  else
  {
    objc_msgSend(a1, "senderInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasFromDisplayName");

    if (!v4)
    {
      v6 = 0;
      return v6;
    }
  }
  objc_msgSend(a1, "senderInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)senderNameOrHandle
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "senderInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)merge:()MSPExtras
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int16 v40;
  uint8_t v41[16];
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "hasDestinationInfo"))
  {
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "Migrating legacy destinationInfo to modern waypointInfos", buf, 2u);
    }

    objc_msgSend(a1, "clearWaypointInfos");
    v6 = objc_alloc_init(MEMORY[0x1E0D27548]);
    objc_msgSend(v4, "destinationInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMapItemStorage:", v7);

    objc_msgSend(a1, "addWaypointInfo:", v6);
    objc_msgSend(a1, "setDestinationInfo:", 0);

  }
  if ((objc_msgSend(v4, "hasLastLocation") & 1) == 0 && objc_msgSend(v4, "etaInfosCount") == 1)
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "Migrating legacy location in etaInfo to modern lastLocation", v41, 2u);
    }

    objc_msgSend(v4, "etaInfos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "hasLatitude") && objc_msgSend(v10, "hasLongitude"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0D27528]);
      v12 = objc_alloc_init(MEMORY[0x1E0D27140]);
      objc_msgSend(v10, "latitude");
      objc_msgSend(v12, "setLat:");
      objc_msgSend(v10, "longitude");
      objc_msgSend(v12, "setLng:");
      objc_msgSend(v11, "setCoordinate:", v12);
      objc_msgSend(v4, "setLastLocation:", v11);
      objc_msgSend(v10, "setHasLatitude:", 0);
      objc_msgSend(v10, "setHasLongitude:", 0);

    }
  }
  objc_msgSend(a1, "composedRouteIfExists");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v4, "hasRouteInfo"))
    {
      MSPGetSharedTripLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v40 = 0;
        v15 = "Clearing generated composedRoute because incoming state has routeInfo";
        v16 = (uint8_t *)&v40;
LABEL_21:
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "waypointInfosCount"))
    {
      v17 = objc_msgSend(v4, "waypointInfosCount");
      if (v17 != objc_msgSend(a1, "waypointInfosCount"))
      {
        MSPGetSharedTripLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v39) = 0;
          v15 = "Clearing generated composedRoute because incoming waypoint count differs from ours";
          v16 = (uint8_t *)&v39;
          goto LABEL_21;
        }
LABEL_22:

        objc_msgSend(a1, "setComposedRoute:", 0);
      }
    }
  }
  if (!objc_msgSend(v4, "hasRouteInfo", v39))
    goto LABEL_31;
  v18 = objc_msgSend(a1, "hasRouteInfo");
  objc_msgSend(v4, "routeInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((v18 & 1) != 0)
  {
    if (objc_msgSend(v19, "coordinatesCount"))
    {

    }
    else
    {
      objc_msgSend(v4, "routeInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "routingPathLegsCount");

      if (!v22)
      {
        objc_msgSend(a1, "routeInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "routeInfo");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "trafficColors");
        objc_msgSend(v4, "routeInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setTrafficColors:count:", v34, objc_msgSend(v35, "trafficColorsCount"));

        objc_msgSend(a1, "routeInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "routeInfo");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "trafficColorOffsets");
        objc_msgSend(v4, "routeInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTrafficColorOffsets:count:", v37, objc_msgSend(v38, "trafficColorOffsetsCount"));

        goto LABEL_30;
      }
    }
    objc_msgSend(v4, "routeInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "setRouteInfo:", v20);
LABEL_30:

LABEL_31:
  if (objc_msgSend(v4, "etaInfosCount"))
  {
    objc_msgSend(v4, "etaInfos");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    objc_msgSend(a1, "setEtaInfos:", v24);

  }
  if (objc_msgSend(v4, "hasSenderInfo"))
  {
    objc_msgSend(a1, "senderInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(a1, "senderInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "senderInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "merge:", v27);

    }
    else
    {
      objc_msgSend(v4, "senderInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setSenderInfo:", v26);
    }

  }
  if (objc_msgSend(v4, "hasArrived"))
    objc_msgSend(a1, "setArrived:", objc_msgSend(v4, "arrived"));
  if (objc_msgSend(v4, "hasArrivedTimestamp"))
  {
    objc_msgSend(v4, "arrivedTimestamp");
    objc_msgSend(a1, "setArrivedTimestamp:");
  }
  if (objc_msgSend(v4, "hasClosed"))
    objc_msgSend(a1, "setClosed:", objc_msgSend(v4, "closed"));
  if (objc_msgSend(v4, "hasClosedTimestamp"))
  {
    objc_msgSend(v4, "closedTimestamp");
    objc_msgSend(a1, "setClosedTimestamp:");
  }
  if (objc_msgSend(v4, "hasGroupIdentifier"))
  {
    objc_msgSend(v4, "groupIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setGroupIdentifier:", v28);

  }
  if (objc_msgSend(v4, "hasReferenceFrame"))
    objc_msgSend(a1, "setReferenceFrame:", objc_msgSend(v4, "referenceFrame"));
  if (objc_msgSend(v4, "hasMuted"))
    objc_msgSend(a1, "setMuted:", objc_msgSend(v4, "muted"));
  if (objc_msgSend(v4, "hasUpdatedTimestamp"))
  {
    objc_msgSend(v4, "updatedTimestamp");
    objc_msgSend(a1, "setUpdatedTimestamp:");
  }
  if (objc_msgSend(v4, "hasTransportType"))
    objc_msgSend(a1, "setTransportType:", objc_msgSend(v4, "transportType"));
  if (objc_msgSend(v4, "waypointInfosCount"))
  {
    objc_msgSend(v4, "waypointInfos");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");
    objc_msgSend(a1, "setWaypointInfos:", v30);

  }
  if (objc_msgSend(v4, "hasLastLocation"))
  {
    objc_msgSend(v4, "lastLocation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setLastLocation:", v31);

  }
  if (objc_msgSend(v4, "hasCurrentWaypointIndex"))
    objc_msgSend(a1, "setCurrentWaypointIndex:", objc_msgSend(v4, "currentWaypointIndex"));
  if (objc_msgSend(v4, "hasResumed"))
    objc_msgSend(a1, "setResumed:", objc_msgSend(v4, "resumed"));
  if (objc_msgSend(v4, "hasClosureReason"))
    objc_msgSend(a1, "setClosureReason:", objc_msgSend(v4, "closureReason"));

}

- (id)mspDescription
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;

  v30 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "groupIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "updatedTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "localUpdatedTimestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "closed"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v33 = v4;
  v27 = objc_msgSend(a1, "closureReason");
  objc_msgSend(a1, "senderInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "destinationName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(a1, "waypointInfosCount");
  v22 = objc_msgSend(a1, "currentWaypointIndex");
  if (objc_msgSend(a1, "arrived"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v21 = v5;
  objc_msgSend(a1, "lastLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "etaInfos");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "valueForKeyPath:", CFSTR("mspDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "routeInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v23, "coordinatesCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "routeInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v20, "routingPathLegsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "routeInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "trafficColorsCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "muted"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = v15;
  if (objc_msgSend(a1, "resumed"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<%p groupID %@, last updated %@, local updated %@, closed %@ (reason: %lu), localName \"%@\", destination \"%@\" (%lu waypoints), current waypoint: %lu, reached %@, location %@, eta %@, (coords %@pt, routingPathLegs %@), traffic colors %@, muted %@, resumed %@"), a1, v29, v28, v34, v33, v27, v32, v25, v24, v22, v21, v6, v7, v9, v11, v14,
    v16,
    v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_msp_logWithCategory:()MSPExtras type:object:prefix:
{
  id v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  id v14;
  __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  __CFString *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  const __CFString *v59;
  const __CFString *v60;
  int v61;
  const __CFString *v62;
  int v63;
  const __CFString *v64;
  int v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  os_log_type_t type;
  int v82;
  int v83;
  __CFString *v84;
  id v85;
  __CFString *v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  __CFString *v90;
  __CFString *v91;
  void *v92;
  void *v93;
  void *v94;
  __CFString *v95;
  __CFString *v96;
  __CFString *v97;
  __CFString *v98;
  __CFString *v99;
  void *v100;
  __CFString *v101;
  id v102;
  __CFString *v103;
  id v104;
  id v105;
  __CFString *v106;
  uint8_t buf[4];
  __CFString *v108;
  __int16 v109;
  const __CFString *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  __CFString *v116;
  __int16 v117;
  __CFString *v118;
  __int16 v119;
  __CFString *v120;
  __int16 v121;
  __CFString *v122;
  __int16 v123;
  const __CFString *v124;
  __int16 v125;
  __CFString *v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  __CFString *v130;
  __int16 v131;
  const __CFString *v132;
  __int16 v133;
  __CFString *v134;
  __int16 v135;
  const __CFString *v136;
  __int16 v137;
  __CFString *v138;
  __int16 v139;
  __CFString *v140;
  __int16 v141;
  __CFString *v142;
  __int16 v143;
  __CFString *v144;
  __int16 v145;
  __CFString *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  id v150;
  __int16 v151;
  void *v152;
  __int16 v153;
  id v154;
  __int16 v155;
  __CFString *v156;
  __int16 v157;
  id v158;
  __int16 v159;
  void *v160;
  __int16 v161;
  void *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  void *v166;
  __int16 v167;
  __CFString *v168;
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    MSPGetSharedTripLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v10;
  if (os_log_type_enabled(v13, a4))
  {
    v14 = v11;
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("<nil>");
    }

    v101 = v15;
    v16 = &stru_1E6655688;
    if (v12)
      v16 = v12;
    v70 = v16;
    objc_msgSend(a1, "groupIdentifier");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(a1, "hasTransportType");
    v84 = v12;
    if (v83)
    {
      v17 = objc_msgSend(a1, "transportType");
      if (v17 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v18 = off_1E6651F60[(int)v17];
    }
    else
    {
      v18 = CFSTR("n/a");
    }
    v92 = (void *)v18;
LABEL_15:
    v82 = objc_msgSend(a1, "hasUpdatedTimestamp");
    if (v82)
    {
      v19 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a1, "updatedTimestamp");
      objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
      v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v91 = CFSTR("n/a");
    }
    v20 = CFSTR("n/a");
    v80 = objc_msgSend(a1, "hasLocalUpdatedTimestamp");
    v85 = v11;
    if (v80)
    {
      v21 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a1, "localUpdatedTimestamp");
      objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v90 = CFSTR("n/a");
    }
    if (objc_msgSend(a1, "hasSenderInfo"))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v99 = v22;
    objc_msgSend(a1, "senderInfo");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "hasFromDisplayName"))
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v98 = v23;
    objc_msgSend(a1, "senderInfo");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "fromDisplayName");
    v24 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)v24;
    if (v24)
      v25 = (const __CFString *)v24;
    else
      v25 = CFSTR("n/a");
    v64 = v25;
    objc_msgSend(a1, "senderInfo");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "hasFromIdentifier"))
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v97 = v26;
    objc_msgSend(a1, "senderInfo");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "fromIdentifier");
    v27 = objc_claimAutoreleasedReturnValue();
    v74 = (void *)v27;
    if (v27)
      v28 = (const __CFString *)v27;
    else
      v28 = CFSTR("n/a");
    v62 = v28;
    objc_msgSend(a1, "senderInfo");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "hasLocalName"))
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    v96 = v29;
    objc_msgSend(a1, "senderInfo");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "localName");
    v30 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v30;
    if (v30)
      v31 = (const __CFString *)v30;
    else
      v31 = CFSTR("n/a");
    v60 = v31;
    objc_msgSend(a1, "senderInfo");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v69, "hasLocalContactIdentifier"))
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    v106 = v32;
    objc_msgSend(a1, "senderInfo");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localContactIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)v33;
    if (v33)
      v34 = (const __CFString *)v33;
    else
      v34 = CFSTR("n/a");
    v59 = v34;
    v66 = objc_msgSend(a1, "hasArrived");
    if (v66)
    {
      if (objc_msgSend(a1, "arrived"))
        v35 = CFSTR("YES");
      else
        v35 = CFSTR("NO");
      v20 = v35;
    }
    v65 = objc_msgSend(a1, "hasArrivedTimestamp");
    if (v65)
    {
      v36 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a1, "arrivedTimestamp");
      objc_msgSend(v36, "dateWithTimeIntervalSinceReferenceDate:");
      v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v89 = CFSTR("n/a");
    }
    v63 = objc_msgSend(a1, "hasClosed");
    if (v63)
    {
      if (objc_msgSend(a1, "closed"))
        v37 = CFSTR("YES");
      else
        v37 = CFSTR("NO");
      v88 = v37;
    }
    else
    {
      v88 = CFSTR("n/a");
    }
    v61 = objc_msgSend(a1, "hasClosedTimestamp");
    type = a4;
    if (v61)
    {
      v38 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a1, "closedTimestamp");
      objc_msgSend(v38, "dateWithTimeIntervalSinceReferenceDate:");
      v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v87 = CFSTR("n/a");
    }
    v58 = objc_msgSend(a1, "hasClosureReason");
    v95 = (__CFString *)v20;
    if (v58)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "closureReason"));
      v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v86 = CFSTR("n/a");
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "etaInfosCount"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "etaInfos");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "valueForKey:", CFSTR("mspDescription"));
    v105 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "waypointInfosCount"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "waypointInfos");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "valueForKey:", CFSTR("name"));
    v104 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "hasLastLocation"))
      v39 = CFSTR("YES");
    else
      v39 = CFSTR("NO");
    v103 = v39;
    objc_msgSend(a1, "lastLocation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "mspDescription");
    v102 = (id)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "routeInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v54, "routingPathLegsCount"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "routeInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v43, "coordinatesCount"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "routeInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "numberWithUnsignedInteger:", objc_msgSend(v46, "trafficColorsCount"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "routeInfo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v49, "trafficColorOffsetsCount"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(a1, "hasReferenceFrame");
    if (v51)
    {
      v52 = objc_msgSend(a1, "referenceFrame");
      if (v52 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v52);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = off_1E6651F98[(int)v52];
      }
    }
    else
    {
      v53 = CFSTR("n/a");
    }
    v110 = v70;
    v124 = v64;
    v128 = v62;
    v132 = v60;
    v136 = v59;
    v123 = 2113;
    v127 = 2113;
    v131 = 2113;
    v135 = 2113;
    v149 = 2113;
    v153 = 2113;
    v157 = 2113;
    v134 = v106;
    v138 = v95;
    v140 = v89;
    v142 = v88;
    v146 = v86;
    v148 = v94;
    v150 = v105;
    v154 = v104;
    v156 = v103;
    v158 = v102;
    v162 = v44;
    v164 = v47;
    v166 = v50;
    v109 = 2114;
    v111 = 2114;
    v113 = 2114;
    v115 = 2114;
    v117 = 2114;
    v119 = 2114;
    v121 = 2114;
    v125 = 2114;
    v129 = 2114;
    v133 = 2114;
    v137 = 2114;
    v139 = 2114;
    v141 = 2114;
    v143 = 2114;
    v145 = 2114;
    v147 = 2114;
    v151 = 2114;
    v155 = 2114;
    v159 = 2114;
    v161 = 2114;
    v163 = 2114;
    v165 = 2114;
    v167 = 2114;
    *(_DWORD *)buf = 138551043;
    v108 = v101;
    v112 = v100;
    v114 = v92;
    v116 = v91;
    v118 = v90;
    v120 = v99;
    v122 = v98;
    v126 = v97;
    v130 = v96;
    v144 = v87;
    v152 = v93;
    v160 = v41;
    v168 = v53;
    _os_log_impl(&dword_1B39C0000, v13, type, "[%{public}@] %{public}@\n== Trip %{public}@ ====\n\ttransportType: %{public}@, lastUpdated: %{public}@, locallyUpdated: %{public}@\n\tsenderInfo: %{public}@, fromDisplayName: %{public}@ [ %{private}@ ], fromIdentifier: %{public}@ [ %{private}@ ], localName: %{public}@ [ %{private}@ ], localContactIdentifier: %{public}@ [ %{private}@ ]\n\tarrived: %{public}@, arrivedTimestamp: %{public}@, closed: %{public}@, closedTimestamp: %{public}@, closureReason: %{public}@\n\tETAs: %{public}@ %{private}@\n\twaypoints: %{public}@ %{private}@\n\tlocation: %{public}@ %{private}@ \n\troute: routingPathLegs: %{public}@, coordinates: %{public}@, trafficColors: %{public}@, trafficOffsets: %{public}@, referenceFrame: %{public}@\n================", buf, 0x138u);
    if (v51)

    if (v58)
    v12 = v84;
    v11 = v85;
    if (v61)

    if (v63)
    if (v65)

    if (v66)
    if (v80)

    if (v82)
    if (v83)

  }
}

- (void)truncatePointDataForPrivacy
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  unsigned int v41;
  double v42;
  double v43;
  NSObject *v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  double v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  os_signpost_id_t spid;
  unint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  unint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "truncatePointDataForPrivacy", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  objc_msgSend(a1, "composedRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v61 = v3 - 1;
    objc_msgSend(a1, "lastLocation");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject coordinate](v7, "coordinate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(a1, "etaInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && objc_msgSend(v9, "hasLatitude") && objc_msgSend(v10, "hasLongitude"))
      {
        v7 = objc_alloc_init(MEMORY[0x1E0D27528]);
        v11 = objc_alloc_init(MEMORY[0x1E0D27140]);

        -[NSObject setCoordinate:](v7, "setCoordinate:", v11);
        objc_msgSend(v10, "latitude");
        objc_msgSend(v11, "setLat:");
        objc_msgSend(v10, "longitude");
        objc_msgSend(v11, "setLng:");
        v8 = v11;
      }
      else
      {
        v7 = 0;
      }

    }
    v62 = v8;
    if (v8)
    {
      objc_msgSend(v8, "lat");
      v15 = v14;
      objc_msgSend(v8, "lng");
      v17 = objc_msgSend(v6, "closestPointOnRoute:", v15, v16);
      v18 = v17;
      v19 = HIDWORD(v17);
      MSPGetSharedTripLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v69 = v18;
        _os_log_impl(&dword_1B39C0000, v20, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy closest index %lu, sourced from route + latlng", buf, 0xCu);
      }

    }
    else
    {
      v18 = *MEMORY[0x1E0D26A38];
      v19 = *(unsigned int *)(MEMORY[0x1E0D26A38] + 4);
    }
    spid = v3;
    if (GEOPolylineCoordinateIsInvalid())
    {
      MSPGetSharedTripLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = -[NSObject hasMatchedCoordinate](v7, "hasMatchedCoordinate");
        v23 = CFSTR("NO");
        if (v22)
          v23 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v69 = (unint64_t)v23;
        v24 = v23;
        _os_log_impl(&dword_1B39C0000, v21, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy no valid closest index, will use whole route (sender provided: %@)", buf, 0xCu);

      }
      v19 = 0;
      v18 = 0;
    }
    v25 = v18;
    v26 = v18 | (v19 << 32);
    if (GEOPolylineCoordinateIsInvalid())
    {
      MSPGetSharedTripLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v27, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy early exit: closestPointOnRoute returned GEOPolylineCoordinateInvalid", buf, 2u);
      }

      v28 = v5;
      v29 = v28;
      v30 = v62;
      if (v61 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v31 = v29;
      }
      else
      {
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B39C0000, v29, OS_SIGNPOST_EVENT, spid, "truncatePointDataForPrivacy_EarlyExit_GEOPolylineCoordinateInvalid", (const char *)&unk_1B3A3EAC5, buf, 2u);
        }

        v31 = v29;
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B39C0000, v31, OS_SIGNPOST_INTERVAL_END, spid, "truncatePointDataForPrivacy", (const char *)&unk_1B3A3EAC5, buf, 2u);
        }
      }
      goto LABEL_67;
    }
    objc_msgSend(a1, "routeInfo");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      MSPGetSharedTripLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v32, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy: missing routeInfo, creating on-demand", buf, 2u);
      }

      v31 = objc_alloc_init(MEMORY[0x1E0D27530]);
      objc_msgSend(a1, "setRouteInfo:", v31);
    }
    if (objc_msgSend(v6, "usesRoutingPathPoints"))
    {
      MSPGetSharedTripLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v33, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy truncating routingPathLeg from closest coordinate", buf, 2u);
      }

      objc_msgSend(v6, "routingPathDataFromStart:", v18 | (v19 << 32));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "mutableCopy");
      -[NSObject setRoutingPathLegs:](v31, "setRoutingPathLegs:", v35);

    }
    -[NSObject clearCoordinates](v31, "clearCoordinates");
    v36 = objc_msgSend(v6, "pointCount");
    if (v36)
    {
      v37 = v36;
      v38 = objc_msgSend(v6, "pointCount");
      MSPGetSharedTripLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v69 = v37;
        v70 = 2048;
        v71 = (2 * v38);
        _os_log_impl(&dword_1B39C0000, v39, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy composed route coordinates count %lu (%lu)", buf, 0x16u);
      }

      MSPGetSharedTripLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v69) = v18;
        _os_log_impl(&dword_1B39C0000, v40, OS_LOG_TYPE_DEBUG, "index for current location %u", buf, 8u);
      }

      v41 = v37 - v18;
      if (v37 <= v18)
      {
        MSPGetSharedTripLog();
        v57 = objc_claimAutoreleasedReturnValue();
        v30 = v62;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B39C0000, v57, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy early exit: index > number of coordinates", buf, 2u);
        }

        v58 = v5;
        v59 = v58;
        if (v61 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v47 = v59;
        }
        else
        {
          if (os_signpost_enabled(v58))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B39C0000, v59, OS_SIGNPOST_EVENT, spid, "truncatePointDataForPrivacy_EarlyExit_NumberOfCoordinates", (const char *)&unk_1B3A3EAC5, buf, 2u);
          }

          v47 = v59;
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B39C0000, v47, OS_SIGNPOST_INTERVAL_END, spid, "truncatePointDataForPrivacy", (const char *)&unk_1B3A3EAC5, buf, 2u);
          }
        }
        goto LABEL_65;
      }
      do
      {
        objc_msgSend(v6, "pointAt:", v25);
        v43 = v42;
        -[NSObject addCoordinates:](v31, "addCoordinates:");
        -[NSObject addCoordinates:](v31, "addCoordinates:", v43);
        ++v25;
        --v41;
      }
      while (v41);
      MSPGetSharedTripLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v45 = (unint64_t)(float)((float)(unint64_t)-[NSObject coordinatesCount](v31, "coordinatesCount")
                                      * 0.5);
        v46 = -[NSObject coordinatesCount](v31, "coordinatesCount");
        *(_DWORD *)buf = 134218240;
        v69 = v45;
        v70 = 2048;
        v71 = v46;
        _os_log_impl(&dword_1B39C0000, v44, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy route info coordinates after truncation count %lu (%lu)", buf, 0x16u);
      }

    }
    -[NSObject clearTrafficColors](v31, "clearTrafficColors");
    -[NSObject clearTrafficColorOffsets](v31, "clearTrafficColorOffsets");
    objc_msgSend(v6, "truncatedTrafficFromRouteCoordinate:", v26);
    v47 = objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    -[NSObject routeTrafficColors](v47, "routeTrafficColors");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v64 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          -[NSObject addTrafficColor:](v31, "addTrafficColor:", objc_msgSend(v53, "color"));
          objc_msgSend(v53, "offsetMeters");
          -[NSObject addTrafficColorOffset:](v31, "addTrafficColorOffset:", v54);
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v50);
    }

    v55 = v5;
    v56 = v55;
    if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v56, OS_SIGNPOST_INTERVAL_END, spid, "truncatePointDataForPrivacy", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }

    v30 = v62;
LABEL_65:

LABEL_67:
    goto LABEL_68;
  }
  MSPGetSharedTripLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy early exit: no composed route to truncate", buf, 2u);
  }

  v13 = v5;
  v7 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v7, OS_SIGNPOST_INTERVAL_END, v3, "truncatePointDataForPrivacy", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }
LABEL_68:

}

- (uint64_t)updateWaypointsFromComposedRoute:()MSPExtras
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "legs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v3;
  v6 = (void *)v4;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  v43 = (void *)v4;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v12 = objc_alloc_init(MEMORY[0x1E0D27548]);
        objc_msgSend(v6, "addObject:", v12);
        objc_msgSend(v11, "destination");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueWaypointID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v11, "destination");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueWaypointID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_uuidForData:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v12, "setUniqueIdentifier:", v18);
        objc_msgSend(v11, "destination");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "destination");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "chargingInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0D27518]);
          objc_msgSend(v22, "setMuid:", objc_msgSend(v21, "muid"));
          objc_msgSend(v21, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "copy");
          objc_msgSend(v22, "setName:", v24);

          objc_msgSend(v21, "chargingTime");
          objc_msgSend(v22, "setChargingTime:");
          objc_msgSend(v12, "setChargingStationInfo:", v22);
          objc_msgSend(v42, "addObject:", v22);
        }
        else
        {
          objc_msgSend(v19, "geoMapItem");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_14;
          v26 = (void *)MEMORY[0x1E0D271E8];
          objc_msgSend(v19, "geoMapItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "mapItemStorageForGEOMapItem:forUseType:", v27, 2);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "setMapItemStorage:", v22);
        }

        v6 = v43;
LABEL_14:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v8);
  }

  v28 = objc_msgSend(v6, "count");
  if (v28 != objc_msgSend(a1, "waypointInfosCount"))
    goto LABEL_20;
  objc_msgSend(a1, "waypointInfos");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  v31 = v29;
  if (!(v30 | v31)
    || (v32 = (void *)v31,
        v33 = objc_msgSend((id)v30, "isEqual:", v31),
        v32,
        (id)v30,
        v32,
        (v33 & 1) != 0))
  {
    v34 = 0;
  }
  else
  {
LABEL_20:
    objc_msgSend(a1, "setWaypointInfos:", v6);
    objc_msgSend(a1, "setCurrentWaypointIndex:", 0);
    objc_msgSend(a1, "_createPlaceholderETAInfosForWaypoints:", v6);
    objc_msgSend(a1, "waypointInfos");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lastObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "mapItemStorage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setDestinationInfo:", v37);

    v6 = v43;
    objc_msgSend(a1, "routeInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setChargingStations:", v42);

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(a1, "setUpdatedTimestamp:");
    v34 = 1;
  }

  return v34;
}

- (void)_createPlaceholderETAInfosForWaypoints:()MSPExtras
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  objc_msgSend(a1, "clearEtaInfos");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__GEOSharedNavState_MSPExtras___createPlaceholderETAInfosForWaypoints___block_invoke;
  v5[3] = &unk_1E6651ED8;
  v5[4] = a1;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (void)updateRouteInfoFromComposedRoute:()MSPExtras
{
  id v2;

  objc_msgSend(a1, "setComposedRoute:");
  v2 = objc_alloc_init(MEMORY[0x1E0D27530]);
  objc_msgSend(a1, "setRouteInfo:", v2);
  objc_msgSend(a1, "truncatePointDataForPrivacy");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(a1, "setUpdatedTimestamp:");

}

- (BOOL)updateFromTraffic:()MSPExtras
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traffic");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (v4 | v7) != 0;
  if (!(v4 | v7))
  {

LABEL_6:
    goto LABEL_7;
  }
  v9 = (void *)v7;
  v10 = objc_msgSend((id)v7, "isEqual:", v4);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(a1, "composedRoute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mutableData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTraffic:", v4);

    objc_msgSend(a1, "truncatePointDataForPrivacy");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(a1, "setUpdatedTimestamp:");
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (void)setComposedRoute:()MSPExtras
{
  objc_setAssociatedObject(a1, sel_composedRoute, a3, (void *)1);
}

- (id)composedRoute
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  uint8_t buf[4];
  _BYTE v59[10];
  uint64_t v60;
  __int16 v61;
  unint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "composedRouteIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "routeInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "routingPathLegs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      if (!objc_msgSend(v3, "coordinatesCount"))
      {
LABEL_40:
        v2 = 0;
LABEL_48:

        return v2;
      }
      MSPGetSharedTripLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v59 = objc_msgSend(v3, "coordinatesCount");
        _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEFAULT, "Building composedRoute from routeInfo (%lu coordinates)", buf, 0xCu);
      }

      v14 = (unint64_t)objc_msgSend(v3, "coordinatesCount") >> 1;
      v15 = objc_alloc_init(MEMORY[0x1E0D274A0]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v3, "coordinates"), 16 * v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUnpackedLatLngVertices:", v16);

      objc_msgSend(v15, "setTrafficColors:count:", objc_msgSend(v3, "trafficColors"), objc_msgSend(v3, "trafficColorsCount"));
      objc_msgSend(v15, "setTrafficColorOffsets:count:", objc_msgSend(v3, "trafficColorOffsets"), objc_msgSend(v3, "trafficColorOffsetsCount"));
      v17 = objc_alloc_init(MEMORY[0x1E0D27580]);
      objc_msgSend(v17, "setManeuverStartZilchIndex:", 0);
      v18 = (v14 - 1);
      objc_msgSend(v17, "setManeuverEndBasicIndex:", v18);
      objc_msgSend(v17, "setManeuverEndZilchIndex:", v18);
      objc_msgSend(v15, "addStep:", v17);
      if (objc_msgSend(v15, "hasUnpackedLatLngVertices"))
      {
        objc_msgSend(v15, "coordinateAt:", 0);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithLatitude:longitude:", v19, v20);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FF8]), "initWithLocation:isCurrentLocation:", v21, 1);
        v23 = objc_alloc(MEMORY[0x1E0D26FF8]);
        objc_msgSend(a1, "destinationWaypointMapItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithMapItem:", v24);

        v57[0] = v22;
        v57[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D274D8]), "initWithWaypoints:routeAttributes:directionsResponse:", v26, 0, 0);

      }
      else
      {
        v27 = 0;
      }
      v51 = objc_alloc_init(MEMORY[0x1E0D27708]);
      objc_msgSend(v51, "addRouteLeg:", v15);
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FA8]), "initWithGeoWaypointRoute:initializerData:", v51, v27);

LABEL_47:
      objc_msgSend(a1, "setComposedRoute:", v2);
      goto LABEL_48;
    }
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v59 = objc_msgSend(v3, "routingPathLegsCount");
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "Building composedRoute from routeInfo (%lu routingPathLegs)", buf, 0xCu);
    }

    v7 = objc_msgSend(v3, "trafficColorsCount");
    if (v7 != objc_msgSend(v3, "trafficColorOffsetsCount"))
    {
      MSPGetSharedTripLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(v3, "trafficColorsCount");
        v10 = objc_msgSend(v3, "trafficColorOffsetsCount");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v59 = v9;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = v10;
        _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_ERROR, "SharedNavRouteInfo traffic colors count (%d) is not equal to traffic color offsets count (%d). Attempting to continue anyway", buf, 0xEu);
      }

    }
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(a1, "waypointInfosCount"))
      v12 = objc_msgSend(a1, "waypointInfosCount");
    else
      v12 = 1;
    v15 = (id)objc_msgSend(v11, "initWithCapacity:", v12);
    if (objc_msgSend(a1, "waypointInfosCount"))
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(a1, "waypointInfos", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "copy");

      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v54 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            v35 = objc_alloc(MEMORY[0x1E0D26FF8]);
            objc_msgSend(v34, "mapItemStorage");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_msgSend(v35, "initWithMapItem:", v36);

            objc_msgSend(v15, "addObject:", v37);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        }
        while (v31);
      }
    }
    else
    {
      if (!objc_msgSend(a1, "hasDestinationInfo"))
        goto LABEL_29;
      v38 = objc_alloc(MEMORY[0x1E0D26FF8]);
      objc_msgSend(a1, "destinationWaypointMapItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v38, "initWithMapItem:", v29);
      objc_msgSend(v15, "addObject:", v39);

    }
LABEL_29:
    v40 = objc_msgSend(v3, "routingPathLegsCount");
    if (v40 != objc_msgSend(v15, "count") && objc_msgSend(v15, "count") > v40)
    {
      v41 = objc_msgSend(v15, "count") - v40;
      MSPGetSharedTripLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v59 = v40;
        *(_WORD *)&v59[8] = 2048;
        v60 = v43;
        v61 = 2048;
        v62 = v41;
        _os_log_impl(&dword_1B39C0000, v42, OS_LOG_TYPE_DEFAULT, "Found %lu routingPathLegs for %lu waypoints, dropping %lu leading waypoints", buf, 0x20u);
      }

      objc_msgSend(v15, "removeObjectsInRange:", 0, v41);
    }
    if (!objc_msgSend(v15, "count") || !v40 || v40 > objc_msgSend(v15, "count"))
    {
      MSPGetSharedTripLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v59 = v40;
        *(_WORD *)&v59[8] = 2048;
        v60 = v45;
        _os_log_impl(&dword_1B39C0000, v44, OS_LOG_TYPE_ERROR, "Cannot create composedRoute from %lu routingPathLegs and %lu waypoints", buf, 0x16u);
      }

      goto LABEL_40;
    }
    v17 = (id)objc_opt_new();
    objc_msgSend(v17, "setTransportType:", objc_msgSend(a1, "transportType"));
    v46 = objc_alloc(MEMORY[0x1E0D273E8]);
    objc_msgSend(v3, "routingPathLegs");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v46, "initWithRawData:", v47);
    objc_msgSend(v17, "setRawRouteGeometry:", v48);

    objc_msgSend(v17, "setDestinations:", v15);
    objc_msgSend(v17, "setIsOriginCurrentLocation:", 1);
    objc_msgSend(v17, "setSource:", 4);
    v49 = objc_msgSend(v3, "trafficColorsCount");
    if (v49 >= objc_msgSend(v3, "trafficColorOffsetsCount"))
      v50 = objc_msgSend(v3, "trafficColorOffsetsCount");
    else
      v50 = objc_msgSend(v3, "trafficColorsCount");
    objc_msgSend(v17, "setTrafficColors:offsets:count:", objc_msgSend(v3, "trafficColors"), objc_msgSend(v3, "trafficColorOffsets"), v50);
    objc_msgSend(v17, "buildRoute");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  return v2;
}

- (id)composedRouteIfExists
{
  return objc_getAssociatedObject(a1, sel_composedRoute);
}

- (id)equalityTest
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__GEOSharedNavState_MSPExtras__equalityTest__block_invoke;
  v2[3] = &unk_1E6651F00;
  v2[4] = a1;
  return (id)MEMORY[0x1B5E2B4E8](v2);
}

- (uint64_t)stripArrivedOrClosedTrip
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "arrived")
    || objc_msgSend(a1, "hasClosed") && (objc_msgSend(a1, "closed") & 1) != 0
    || (result = objc_msgSend(a1, "isNavigatingToIntermediateStop"), (result & 1) == 0))
  {
    if (objc_msgSend(a1, "closed"))
    {
      MSPGetSharedTripLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "groupIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "Stripping route and ETAs from trip %@ (closed)", (uint8_t *)&v7, 0xCu);

      }
      objc_msgSend(a1, "waypointInfos");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_createPlaceholderETAInfosForWaypoints:", v5);
    }
    else
    {
      if (!objc_msgSend(a1, "arrived"))
      {
LABEL_13:
        objc_msgSend(a1, "setRouteInfo:", 0);
        return objc_msgSend(a1, "setComposedRoute:", 0);
      }
      MSPGetSharedTripLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "groupIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "Stripping route from trip %@ (arrived)", (uint8_t *)&v7, 0xCu);

      }
    }

    goto LABEL_13;
  }
  return result;
}

- (BOOL)hasEtaInfo
{
  return objc_msgSend(a1, "etaInfosCount") != 0;
}

- (id)etaInfo
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(a1, "hasCurrentWaypointIndex")
    && (v2 = objc_msgSend(a1, "currentWaypointIndex"), objc_msgSend(a1, "etaInfosCount") > (unint64_t)v2))
  {
    objc_msgSend(a1, "etaInfos");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(a1, "currentWaypointIndex"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "etaInfos");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)finalETAInfo
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "etaInfos");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)numberOfIntermediateStopsRemaining
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  if (objc_msgSend(a1, "waypointInfosCount"))
  {
    v2 = objc_msgSend(a1, "waypointInfosCount");
    if (objc_msgSend(a1, "hasCurrentWaypointIndex"))
      v3 = ~(unint64_t)objc_msgSend(a1, "currentWaypointIndex");
    else
      v3 = -1;
    return v3 + v2;
  }
  else
  {
    objc_msgSend(a1, "routeInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "chargingStationsCount");

    return v5;
  }
}

- (uint64_t)isNavigatingToIntermediateStop
{
  uint64_t result;
  unsigned int v3;

  result = objc_msgSend(a1, "waypointInfosCount");
  if (result)
  {
    result = objc_msgSend(a1, "hasCurrentWaypointIndex");
    if ((_DWORD)result)
    {
      v3 = objc_msgSend(a1, "currentWaypointIndex");
      return objc_msgSend(a1, "waypointInfosCount") - 1 > (unint64_t)v3;
    }
  }
  return result;
}

- (BOOL)hasWaypointInfos
{
  return objc_msgSend(a1, "waypointInfosCount") != 0;
}

- (id)nextWaypointInfo
{
  unsigned int v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "hasCurrentWaypointIndex")
    && (v2 = objc_msgSend(a1, "currentWaypointIndex"), objc_msgSend(a1, "waypointInfosCount") > (unint64_t)v2))
  {
    objc_msgSend(a1, "waypointInfos");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(a1, "currentWaypointIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "destinationWaypointInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (uint64_t)stripForSendingUpdatedWaypoints
{
  unint64_t v2;
  unsigned int v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "hasCurrentWaypointIndex"))
  {
    v2 = objc_msgSend(a1, "waypointInfosCount");
    if (v2 > objc_msgSend(a1, "currentWaypointIndex"))
    {
      v3 = objc_msgSend(a1, "currentWaypointIndex");
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "waypointInfos");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enumerateObjectsAtIndexes:options:usingBlock:", v4, 0, &__block_literal_global_2);

    }
  }
  objc_msgSend(a1, "setLastLocation:", 0);
  return objc_msgSend(a1, "setRouteInfo:", 0);
}

- (uint64_t)stripForSendingUpdatedRoute
{
  objc_msgSend(a1, "setSenderInfo:", 0);
  objc_msgSend(a1, "setDestinationInfo:", 0);
  objc_msgSend(a1, "setLastLocation:", 0);
  objc_msgSend(a1, "truncatePointDataForPrivacy");
  return objc_msgSend(a1, "clearWaypointInfos");
}

- (uint64_t)stripForSendingUpdatedETA
{
  objc_msgSend(a1, "setSenderInfo:", 0);
  objc_msgSend(a1, "setRouteInfo:", 0);
  objc_msgSend(a1, "setDestinationInfo:", 0);
  return objc_msgSend(a1, "clearWaypointInfos");
}

- (uint64_t)stripForSendingUpdatedTraffic
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "routeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearCoordinates");

  objc_msgSend(a1, "routeInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearRoutingPathLegs");

  objc_msgSend(a1, "setLastLocation:", 0);
  objc_msgSend(a1, "setSenderInfo:", 0);
  objc_msgSend(a1, "setDestinationInfo:", 0);
  return objc_msgSend(a1, "clearWaypointInfos");
}

- (uint64_t)stripForSendingArrival
{
  uint64_t result;
  unint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "setSenderInfo:", 0);
  objc_msgSend(a1, "setRouteInfo:", 0);
  result = objc_msgSend(a1, "waypointInfosCount");
  if (result)
  {
    result = objc_msgSend(a1, "waypointInfosCount");
    if (result != 1)
    {
      v3 = 0;
      do
      {
        result = objc_msgSend(a1, "currentWaypointIndex");
        if (v3 == result)
          break;
        objc_msgSend(a1, "waypointInfos");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndex:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setMapItemStorage:", 0);
        objc_msgSend(v5, "setChargingStationInfo:", 0);

        ++v3;
        result = objc_msgSend(a1, "waypointInfosCount");
      }
      while (v3 < result - 1);
    }
  }
  return result;
}

- (uint64_t)stripForSendingResuming
{
  objc_msgSend(a1, "setSenderInfo:", 0);
  return objc_msgSend(a1, "setRouteInfo:", 0);
}

- (uint64_t)stripForSendingStoppedSharing
{
  objc_msgSend(a1, "setRouteInfo:", 0);
  objc_msgSend(a1, "setDestinationInfo:", 0);
  objc_msgSend(a1, "setLastLocation:", 0);
  objc_msgSend(a1, "clearWaypointInfos");
  return objc_msgSend(a1, "clearEtaInfos");
}

@end

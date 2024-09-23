@implementation VKMapSnapshotCreator(MapKitAdditions)

- (void)_mapkit_configureWithOptions:()MapKitAdditions configuration:scale:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  _BOOL8 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  MKRouteContextBuilder *v39;
  void *v40;
  void *v41;
  id v42;
  void (**v43)(_QWORD, _QWORD);
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  _QWORD v71[4];
  id v72;
  void *v73;
  double v74;
  uint8_t buf[4];
  const char *v76;
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a1, "_mapkit_configureFromDefaults");
  objc_msgSend(a1, "setMapType:", _VKMapTypeForMKCartographicConfiguration(a5));
  objc_msgSend(v8, "pointOfInterestFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_geoPOICategoryFilter");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPointsOfInterestFilter:", v10);

  objc_msgSend(a1, "setShowsRoadLabels:", objc_msgSend(v8, "_showsRoadLabels"));
  objc_msgSend(a1, "setShowsRoadShields:", objc_msgSend(v8, "_showsRoadShields"));
  objc_msgSend(a1, "setShowsPointLabels:", objc_msgSend(v8, "_showsPointLabels"));
  objc_msgSend(a1, "setShowsBuildings:", objc_msgSend(v8, "showsBuildings"));
  objc_msgSend(a1, "setShowsVenues:", objc_msgSend(v8, "_showsVenues"));
  objc_msgSend(v8, "preferredConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v8, "preferredConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "showsTraffic");

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v8, "preferredConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v8, "preferredConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "showsHiking");

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v8, "preferredConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    objc_msgSend(v8, "preferredConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "showsTopographicFeatures");

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(a1, "setShowsTraffic:", v13);
  objc_msgSend(a1, "setShowsGlobe:", a5[2] == 1);
  objc_msgSend(a1, "setTerrainMode:", _VKTerrainModeForMKCartographicConfiguration((uint64_t)a5));
  v22 = !objc_msgSend(a1, "mapType")
     && (objc_msgSend(a1, "terrainMode") == 1 || objc_msgSend(a1, "terrainMode") == 3);
  objc_msgSend(a1, "setShowsTintBands:", v22);
  if (!objc_msgSend(a1, "mapType"))
  {
    objc_msgSend(a1, "setShowsHillshade:", 0);
    objc_msgSend(a1, "setShowsHiking:withTopographicFeatures:", v17, v21);
  }
  objc_msgSend(v8, "_edgeInsets");
  *(float *)&v23 = v23;
  *(float *)&v24 = v24;
  *(float *)&v25 = v25;
  *(float *)&v26 = v26;
  objc_msgSend(a1, "setEdgeInsets:", v23, v24, v25, v26);
  objc_msgSend(v8, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "preferredContentSizeCategory");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  v30 = (void *)*MEMORY[0x1E0CEB440];
  if (v28)
    v30 = (void *)v28;
  v31 = v30;

  objc_msgSend(a1, "_mapkit_configureLabelSizesForContentSizeCategory:", v31);
  objc_msgSend(a1, "setEmphasis:", _VKEmphasisForMKCartographicConfiguration(a5));
  objc_msgSend(a1, "setMapKitUsage:", _VKMapKitUsageForMKCartographicConfiguration((uint64_t)a5));
  objc_msgSend(a1, "setMapKitClientMode:", _VKMapKitClientModeForMKCartographicConfiguration((uint64_t)a5));
  objc_msgSend(v8, "_routeContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRouteContext:", v32);

  objc_msgSend(v8, "_routeOverlay");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRouteOverlay:", v33);

  objc_msgSend(v8, "_composedRouteForRouteLine");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v8, "_composedRouteForRouteLine");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "traffic");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc_init(MEMORY[0x1E0DC6540]);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6548]), "initWithComposedRoute:traffic:", v35, v36);
    objc_msgSend(v37, "addPolyline:", v38);
    objc_msgSend(v38, "setShowTraffic:", 1);
    objc_msgSend(v38, "setSelected:", 1);
    objc_msgSend(a1, "setRouteOverlay:", v37);
    v39 = objc_alloc_init(MKRouteContextBuilder);
    v77[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKRouteContextBuilder buildRouteContextForRoutes:selectedRouteIndex:](v39, "buildRouteContextForRoutes:selectedRouteIndex:", v40, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setRouteContext:", v41);

  }
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __90__VKMapSnapshotCreator_MapKitAdditions___mapkit_configureWithOptions_configuration_scale___block_invoke;
  v71[3] = &unk_1E20DBFE8;
  v42 = v8;
  v74 = a2;
  v72 = v42;
  v73 = a1;
  v43 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](v71);
  v43[2](v43, 0);
  v43[2](v43, 1);
  objc_msgSend(v42, "_selectedTrailID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v42, "_selectedTrailID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "unsignedLongLongValue");
    objc_msgSend(v42, "_selectedTrailName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_selectedTrailLocale");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setSelectedTrailWithId:name:locale:", v46, v47, v48);

  }
  objc_msgSend(v42, "camera");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "_viewportMode") == 2)
  {
    objc_msgSend(v49, "centerCoordinate");
    v51 = v50;
    v53 = v52;
    objc_msgSend(v49, "altitude");
    v55 = v54;
    objc_msgSend(v49, "heading");
    v57 = v56;
    objc_msgSend(v49, "pitch");
    objc_msgSend(a1, "setCenterCoordinate:altitude:yaw:pitch:", v51, v53, v55, v57, v58);
  }
  else
  {
    objc_msgSend(v42, "mapRect");
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithMapRect:", v59, v60, v61, v62);
    objc_msgSend(v49, "pitch");
    v65 = v64;
    objc_msgSend(v49, "heading");
    objc_msgSend(a1, "setMapRegion:pitch:yaw:", v63, v65, v66);

  }
  MKGetSnapshotLog();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "routeOverlay");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = "YES";
    if (!v68)
      v69 = "NO";
    *(_DWORD *)buf = 136315138;
    v76 = v69;
    _os_log_impl(&dword_18B0B0000, v67, OS_LOG_TYPE_INFO, "Has Route Overlay: %s ", buf, 0xCu);

  }
  MKGetSnapshotLog();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v76 = (const char *)v49;
    _os_log_impl(&dword_18B0B0000, v70, OS_LOG_TYPE_INFO, "Camera Configuration: %@", buf, 0xCu);
  }

}

- (void)initWithSnapshotOptions:()MapKitAdditions homeQueue:auditToken:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  unsigned __int8 *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  BOOL v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  int v60;
  int v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  unsigned __int8 *v68;
  uint64_t v69;
  int v70;
  int v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  int v77;
  int v78;
  int v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  id v86;
  _BYTE *v88;
  unsigned __int8 *v89;
  unsigned __int8 *v90;
  void *v92;
  id v93;
  _DWORD *v94;
  char *v95;
  _OWORD v96[3];
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  const char *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v93 = a4;
  v8 = a5;
  v97 = 0;
  memset(v96, 0, sizeof(v96));
  if (v7)
    objc_msgSend(v7, "_resolvedCartographicConfigurationWithAuditToken:", v8);
  v92 = v8;
  objc_msgSend(v7, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceStyle");

  v11 = *(_QWORD *)&v96[0] | v10;
  MKGetSnapshotLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = "NO";
    if (!v11)
      v13 = "YES";
    *(_DWORD *)buf = 136315138;
    v107 = v13;
    _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_INFO, "Generate both light and dark: %s ", buf, 0xCu);
  }

  v14 = (unsigned __int8 *)MEMORY[0x1E0DC65F8];
  if (v11)
  {
    objc_msgSend(v7, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceStyle") == 2;

    v17 = *(_QWORD *)&v96[0] == 0;
    v94 = malloc_type_malloc(6uLL, 0x1000040274DC3F3uLL);
    v18 = v7;
    v19 = v18;
    v20 = !v16 || !v17;
    if (v16 && v17)
      v21 = (unsigned __int8 *)MEMORY[0x1E0DC6600];
    else
      v21 = v14;
    if (v20)
      v22 = v14 + 1;
    else
      v22 = (unsigned __int8 *)(MEMORY[0x1E0DC6600] + 1);
    if (v20)
      v23 = v14 + 2;
    else
      v23 = (_BYTE *)(MEMORY[0x1E0DC6600] + 2);
    if (v20)
      v24 = (uint64_t)(v14 + 3);
    else
      v24 = MEMORY[0x1E0DC6600] + 3;
    v25 = MEMORY[0x1E0DC6600] + 5;
    v102 = 0u;
    v103 = 0u;
    if (v20)
      v25 = (uint64_t)(v14 + 5);
    v89 = (unsigned __int8 *)v25;
    v90 = (unsigned __int8 *)v24;
    v104 = 0uLL;
    v105 = 0uLL;
    objc_msgSend(v18, "_customFeatureAnnotations");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
    if (v27)
    {
      v88 = v23;
      v28 = *(_QWORD *)v103;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v103 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v30, "representation") == 2)
          {
            LOBYTE(v27) = 1;
            goto LABEL_44;
          }
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
        if (v27)
          continue;
        break;
      }
LABEL_44:
      v23 = v88;
    }

    if (v7)
    {
      objc_msgSend(v19, "_cartographicConfiguration");
      v37 = *((_QWORD *)&v98 + 1);
    }
    else
    {
      v37 = 0;
      v101 = 0;
      v99 = 0u;
      v100 = 0u;
      v98 = 0u;
    }
    v38 = *v21;
    v39 = *v22;
    v40 = *v23;
    v41 = *v90;
    v42 = *v89;
    if ((v27 & 1) != 0)
      v43 = 1;
    else
      v43 = objc_msgSend(v19, "_searchResultsType");
    objc_msgSend(v19, "_composedRouteForRouteLine");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v40 << 16;
    if (v44)
      v45 = 0x10000;
    v46 = v45 | (v41 << 24);
    v47 = v39 << 8;
    if (v37 == 4)
      v47 = 512;
    v48 = ((v42 << 40) | (unint64_t)(v43 << 32)) >> 32;
    v49 = v94;
    *((_WORD *)v94 + 2) = v48;
    *v94 = (v46 | v47) & 0xFFFFFF00 | v38;
    v50 = 1;
  }
  else
  {
    v95 = (char *)malloc_type_malloc(0xCuLL, 0x1000040274DC3F3uLL);
    v31 = v7;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    objc_msgSend(v31, "_customFeatureAnnotations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v103;
      while (2)
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v103 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "representation") == 2)
          {
            LOBYTE(v33) = 1;
            goto LABEL_57;
          }
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
        if (v33)
          continue;
        break;
      }
    }
LABEL_57:

    if (v7)
    {
      objc_msgSend(v31, "_cartographicConfiguration");
      v51 = *((_QWORD *)&v98 + 1);
    }
    else
    {
      v51 = 0;
      v101 = 0;
      v99 = 0u;
      v100 = 0u;
      v98 = 0u;
    }
    v52 = *v14;
    v53 = v14[1];
    v54 = v14[2];
    v55 = v14[3];
    v56 = v14[5];
    if ((v33 & 1) != 0)
      v57 = 1;
    else
      v57 = objc_msgSend(v31, "_searchResultsType");
    objc_msgSend(v31, "_composedRouteForRouteLine");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v54 << 16;
    if (v58)
      v59 = 0x10000;
    v60 = v59 | (v55 << 24);
    v61 = v53 << 8;
    if (v51 == 4)
      v61 = 512;
    *((_WORD *)v95 + 2) = ((v56 << 40) | (unint64_t)(v57 << 32)) >> 32;
    *(_DWORD *)v95 = v60 | v52 | v61;
    v62 = v31;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    objc_msgSend(v62, "_customFeatureAnnotations");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v103;
      while (2)
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v103 != v65)
            objc_enumerationMutation(v63);
          v67 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v67, "representation") == 2)
          {
            LOBYTE(v64) = 1;
            goto LABEL_78;
          }
        }
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
        if (v64)
          continue;
        break;
      }
    }
LABEL_78:
    v68 = (unsigned __int8 *)MEMORY[0x1E0DC6600];

    if (v7)
    {
      objc_msgSend(v62, "_cartographicConfiguration");
      v69 = *((_QWORD *)&v98 + 1);
    }
    else
    {
      v69 = 0;
      v101 = 0;
      v99 = 0u;
      v100 = 0u;
      v98 = 0u;
    }
    v70 = *v68;
    v71 = v68[1];
    v72 = v68[2];
    v73 = v68[3];
    v74 = v68[5];
    if ((v64 & 1) != 0)
      v75 = 1;
    else
      v75 = objc_msgSend(v62, "_searchResultsType");
    objc_msgSend(v62, "_composedRouteForRouteLine");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = v72 << 16;
    if (v76)
      v77 = 0x10000;
    v78 = v77 | (v73 << 24);
    v79 = v71 << 8;
    if (v69 == 4)
      v79 = 512;
    v49 = v95;
    *((_WORD *)v95 + 5) = ((v74 << 40) | (unint64_t)(v75 << 32)) >> 32;
    *(_DWORD *)(v95 + 6) = v78 | v70 | v79;
    v50 = 2;
  }
  objc_msgSend(v7, "traitCollection");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "displayScale");
  v82 = v81;

  objc_msgSend(v7, "size");
  v85 = (void *)objc_msgSend(a1, "initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:", v93, objc_msgSend(v7, "signpostId"), _VKMapTypeForMKCartographicConfiguration((uint64_t *)v96), v49, v50, v92, v83, v84, v82);
  free(v49);
  if (v85)
  {
    objc_msgSend(v85, "_mapkit_configureWithOptions:configuration:scale:", v7, v96, v82);
    v86 = v85;
  }

  return v85;
}

- (uint64_t)_mapkit_configureLabelSizesForContentSizeCategory:()MapKitAdditions
{
  return objc_msgSend(a1, "setLabelScaleFactor:", labelScaleFactorForContentSizeCategory(a3));
}

- (uint64_t)_mapkit_configureFromDefaults
{
  return objc_msgSend(a1, "setLocalizeLabels:", GEOConfigGetBOOL());
}

@end

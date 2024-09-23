@implementation VKMapViewAccessibilityElementManager

- (id)_gatherVisibleLabelMarkersForMapView:(id)a3
{
  objc_msgSend(a3, "safeValueForKey:", CFSTR("labelMarkers"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_gatherVisibleTilesForMapView:(id)a3
{
  id v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v6 = a3;
  v3 = v6;
  AXPerformSafeBlock();
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __70__VKMapViewAccessibilityElementManager__gatherVisibleTilesForMapView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("roadLabelTilesInScene"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_descriptionForTransitNodeLabel:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v27, "imageKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v8, "dataType") == 2)
        {
          objc_msgSend(v8, "relatedText");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            v10 = objc_msgSend(v3, "indexOfObject:", v9);
            if (v10 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array", 0x7FFFFFFFFFFFFFFFLL);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v9);
              objc_msgSend(v28, "addObject:", v11);
            }
            else
            {
              objc_msgSend(v28, "objectAtIndexedSubscript:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v8, "text");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "length"))
              objc_msgSend(v11, "addObject:", v12);

          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  v13 = objc_msgSend(v3, "count");
  if (v13)
  {
    v14 = 0;
    for (j = 0; j != v13; ++j)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", j, v25, v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", j);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD17C8];
      if (objc_msgSend(v17, "count") == 1)
        v19 = CFSTR("TRANSIT_LINE_FORMAT_SINGULAR");
      else
        v19 = CFSTR("TRANSIT_LINE_FORMAT_PLURAL");
      AXVectorKitLocString(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AXLabelForElements();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", v20, v16, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v22;
      v26 = CFSTR("__AXStringForVariablesSentinel");
      __AXStringForVariables();
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v23;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_descriptionForTransitLineLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "relatedTexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "imageKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "shieldText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x24BDD17C8];
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    v12 = CFSTR("TRANSIT_LINE_FORMAT_PLURAL");
  else
    v12 = CFSTR("TRANSIT_LINE_FORMAT_SINGULAR");
  AXVectorKitLocString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_descriptionForRouteTransitNodeLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = a3;
  objc_msgSend(v22, "imageKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v23 = 0;
    v8 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v10, "dataType") == 3)
        {
          objc_msgSend(v10, "relatedText");
          v11 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "text");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v5;
          v5 = (void *)v12;
        }
        else
        {
          if (objc_msgSend(v10, "dataType") != 4)
            continue;
          objc_msgSend(v10, "relatedText");
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "text");
          v15 = objc_claimAutoreleasedReturnValue();
          v13 = v23;
          v11 = (uint64_t)v4;
          v6 = (void *)v14;
          v23 = (void *)v15;
        }

        v4 = (void *)v11;
      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v7)
        goto LABEL_15;
    }
  }
  v23 = 0;
LABEL_15:

  if (objc_msgSend(v4, "length")
    && objc_msgSend(v5, "length")
    && objc_msgSend(v6, "length")
    && objc_msgSend(v23, "length"))
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(CFSTR("TRANSIT_TRANSFER_FORMAT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v17, v4, v5, v6, v23);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXVectorKitLocString(CFSTR("TRANSIT_ROUTE_NODE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

  v20 = v19;
  return v20;
}

- (id)_accessibilityElementsForMapView:(id)a3 mapViewBounds:(id)a4 visibleLabels:(id)a5 visibleTiles:(id)a6 existingElements:(id)a7
{
  double var3;
  double var2;
  double var1;
  double var0;
  char v15;
  char v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint64_t *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  VKMapViewAccessibilityElementManager *v55;
  id v56;
  uint64_t *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v72 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__3;
  v68 = __Block_byref_object_dispose__3;
  v69 = (id)objc_opt_new();
  if (UIAccessibilityIsVoiceOverRunning() && (objc_msgSend(v36, "accessibilityMapTypeSupportsAccessibility") & 1) == 0)
  {
    v31 = (id)v65[5];
  }
  else
  {
    v15 = objc_msgSend(v36, "accessibilityMapTypeShouldShowTransit");
    v16 = objc_msgSend(v36, "accessibilityOnlyShowRouteNodesDuringTransit");
    v17 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke;
    v53[3] = &unk_2503C53E8;
    v62 = v15;
    v63 = v16;
    v58 = var0;
    v59 = var1;
    v60 = var2;
    v61 = var3;
    v18 = v36;
    v54 = v18;
    v55 = self;
    v56 = v33;
    v57 = &v64;
    objc_msgSend(v35, "enumerateObjectsUsingBlock:", v53);
    if (UIAccessibilityIsVoiceOverRunning())
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v20 = v35;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v50 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v24, "text");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "length")
              && (objc_msgSend(v24, "hasBusinessID") & 1) == 0
              && (objc_msgSend(v24, "isOneWayArrow") & 1) == 0
              && (objc_msgSend(v24, "isTrafficIncident") & 1) == 0
              && (objc_msgSend(v24, "isTransit") & 1) == 0
              && (objc_msgSend(v24, "isTransitLine") & 1) == 0)
            {
              objc_msgSend(v19, "addObject:", v25);
            }

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
        }
        while (v21);
      }

      v41[0] = v17;
      v41[1] = 3221225472;
      v41[2] = __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke_2;
      v41[3] = &unk_2503C5410;
      v41[4] = self;
      v44 = &v64;
      v45 = var0;
      v46 = var1;
      v47 = var2;
      v48 = var3;
      v42 = v18;
      v26 = v19;
      v43 = v26;
      objc_msgSend(v34, "enumerateObjectsUsingBlock:", v41);

    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v27 = v34;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v70, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v27);
          AXPerformBlockAsynchronouslyOnMainThread();
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v70, 16);
      }
      while (v28);
    }

    v31 = (id)v65[5];
  }
  _Block_object_dispose(&v64, 8);

  return v31;
}

void __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  _BOOL8 v6;
  int v8;
  unsigned int v9;
  int v10;
  _BOOL8 IsPointOfInterest;
  int IsVenueButton;
  uint64_t IsRouteEta;
  int v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  os_log_type_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  VKPointFeatureAccessibilityElement *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  os_log_type_t v37;
  void *v38;
  char v39;
  void *v40;
  os_log_type_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  os_log_type_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t i;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  void *v77;
  void *v78;
  os_log_t v79;
  void *v80;
  uint64_t v81;
  const __CFString *v82;
  const __CFString *v83;
  __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  int v93;
  os_log_t v94;
  os_log_t v95;
  os_log_t v96;
  os_log_t v97;
  os_log_t oslog;
  uint8_t v99[4];
  void *v100;
  __int128 buf;
  double v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "featureType");
  v5 = objc_msgSend(v3, "featureType");
  v6 = objc_msgSend(v3, "featureType") == 7 || objc_msgSend(v3, "featureType") == 9;
  v8 = v4 == 5 || v5 == 6 || v6;
  v93 = v8;
  v9 = objc_msgSend(v3, "isCluster");
  v10 = objc_msgSend(v3, "isClusterChild");
  IsPointOfInterest = AXVKLabelMarkerIsPointOfInterest(v3);
  IsVenueButton = AXVKLabelMarkerIsVenueButton(v3);
  IsRouteEta = AXVKLabelMarkerIsRouteEta(v3);
  v14 = objc_msgSend(v3, "isRouteWaypoint");
  if (!*(_BYTE *)(a1 + 96))
  {
    if (!(IsPointOfInterest | v9 | IsRouteEta | v14))
    {
      objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "ignoreLogging");

      if ((v23 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE006F8], "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v18 = objc_claimAutoreleasedReturnValue();

        v25 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v18, v25))
        {
          AXColorizeFormatLog();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, v25))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v27;
            _os_log_impl(&dword_232B35000, v18, v25, "%{public}@", (uint8_t *)&buf, 0xCu);
          }

        }
        goto LABEL_42;
      }
      goto LABEL_83;
    }
    goto LABEL_28;
  }
  if (*(_BYTE *)(a1 + 97))
  {
    if (v4 != 5 || (objc_msgSend(v3, "isOnRoute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "ignoreLogging");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE006F8], "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v18, v19))
        {
          AXColorizeFormatLog();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, v19))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v21;
            _os_log_impl(&dword_232B35000, v18, v19, "%{public}@", (uint8_t *)&buf, 0xCu);
          }

        }
LABEL_42:

        goto LABEL_83;
      }
      goto LABEL_83;
    }
LABEL_28:
    objc_msgSend(v3, "coordinate");
    VKPointForVKLocationCoordinate2D();
    *(_QWORD *)&buf = v28;
    *((_QWORD *)&buf + 1) = v29;
    v102 = v30;
    if ((VKRectContainsPoint() & 1) != 0)
    {
      v31 = -[VKPointFeatureAccessibilityElement initWithAccessibilityContainer:]([VKPointFeatureAccessibilityElement alloc], "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 32));
      oslog = &v31->super.super.super.super;
      if (v31)
      {
        -[VKPointFeatureAccessibilityElement setLocation:](v31, "setLocation:", buf, v102);
        objc_msgSend(v3, "text");
        v90 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "featureAnnotation");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4 == 5)
        {
          v32 = *(void **)(a1 + 40);
          v33 = (void *)v90;
          if (*(_BYTE *)(a1 + 97))
            objc_msgSend(v32, "_descriptionForRouteTransitNodeLabel:", v3);
          else
            objc_msgSend(v32, "_descriptionForTransitNodeLabel:", v3);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v48;
          v82 = CFSTR("__AXStringForVariablesSentinel");
          __AXStringForVariables();
          v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
          goto LABEL_54;
        }
        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 40), "_descriptionForTransitLineLabel:", v3);
          v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
          v48 = (void *)v90;
LABEL_55:

LABEL_56:
          objc_msgSend(v92, "accessibilityLabel", v78, v82, v85);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (v91)
          {
            v79 = v95;
            v83 = CFSTR("__AXStringForVariablesSentinel");
            __AXStringForVariables();
            v55 = objc_claimAutoreleasedReturnValue();

            v56 = v55;
          }
          else
          {
            v56 = v95;
          }
          v96 = v56;
          if (-[NSObject hasPrefix:](v56, "hasPrefix:", CFSTR("♥"), v79, v83))
          {
            AXVectorKitLocString(CFSTR("POI_FAVORITE"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject stringByReplacingCharactersInRange:withString:](v96, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(CFSTR("♥"), "length"), &stru_2503C5610);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = CFSTR("__AXStringForVariablesSentinel");
            __AXStringForVariables();
            v58 = objc_claimAutoreleasedReturnValue();

            v96 = (os_log_t)v58;
          }
          if (IsVenueButton)
          {
            AXVectorKitLocString(CFSTR("LOOK_INSIDE"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = CFSTR("__AXStringForVariablesSentinel");
            __AXStringForVariables();
            v59 = objc_claimAutoreleasedReturnValue();

            v96 = (os_log_t)v59;
          }
          if ((_DWORD)IsRouteEta)
          {
            objc_msgSend(v3, "routeInfo");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            NSClassFromString(CFSTR("VKAlternateRouteInfo"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
              AXVectorKitLocString(CFSTR("ALTERNATE_ROUTE_LABEL"));
            else
              AXVectorKitLocString(CFSTR("ACTIVE_ROUTE_LABEL"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "etaDescription", v80, v84);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "etaText");
            v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v86 = CFSTR("__AXStringForVariablesSentinel");
            v80 = v88;
            __AXStringForVariables();
            v62 = objc_claimAutoreleasedReturnValue();

            v60 = v62;
          }
          else
          {
            v60 = v96;
          }
          v94 = v60;
          -[NSObject setAccessibilityLabel:](oslog, "setAccessibilityLabel:", v80, v84, v86);
          -[NSObject setIsPOI:](oslog, "setIsPOI:", IsPointOfInterest);
          -[NSObject setIsTransitStop:](oslog, "setIsTransitStop:", v4 == 5);
          -[NSObject setIsTransitLine:](oslog, "setIsTransitLine:", v6);
          -[NSObject setIsRouteEta:](oslog, "setIsRouteEta:", IsRouteEta);
          objc_msgSend(v3, "locale");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setAccessibilityLanguage:](oslog, "setAccessibilityLanguage:", v63);

          objc_msgSend(v3, "waypointInfo");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v64, "safeUnsignedIntegerForKey:", CFSTR("waypointIndex"));
          AXCFormattedString();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setAccessibilityIdentifier:](oslog, "setAccessibilityIdentifier:", v65, v81);

          v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "init");
          for (i = 0; i < objc_msgSend(v3, "countFeatureIDs"); ++i)
          {
            v68 = objc_msgSend(v3, "featureIDs");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(v68 + 8 * i));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "addObject:", v69);

          }
          -[NSObject setFeatureIds:](oslog, "setFeatureIds:", v66);
          if (!v93 || *(_BYTE *)(a1 + 96))
          {
            v70 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", oslog);
            v71 = *(void **)(a1 + 48);
            v72 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            if (!v71 || v70 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v72, "addObject:", oslog);
            }
            else
            {
              objc_msgSend(v71, "objectAtIndexedSubscript:");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "addObject:", v73);

            }
          }
          -[NSObject setSortKey:](oslog, "setSortKey:", objc_msgSend(v3, "sortKey"));

LABEL_79:
LABEL_80:

          goto LABEL_81;
        }
        if (v5 == 6)
        {
          v99[0] = 0;
          objc_opt_class();
          objc_msgSend(v3, "iconImageKeys");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "firstObject");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "shieldText");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "relatedTexts");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "firstObject");
          v53 = objc_claimAutoreleasedReturnValue();

          v82 = (const __CFString *)v53;
          v85 = CFSTR("__AXStringForVariablesSentinel");
          v78 = v48;
          v54 = (void *)v90;
          __AXStringForVariables();
          v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v9)
          {
            v74 = objc_msgSend(v3, "clusterFeatureCount");
            v75 = v74;
            v76 = v74 - 1;
            if (v74 <= 1)
            {
              v78 = (void *)v74;
              _AXAssert();
              v95 = (os_log_t)v90;
              goto LABEL_56;
            }
            v97 = (os_log_t)MEMORY[0x24BDD17C8];
            AXVectorKitLocString(CFSTR("CLUSTER_FEATURE_COUNT_FORMAT"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v76;
            v33 = (void *)v90;
            -[NSObject localizedStringWithFormat:](v97, "localizedStringWithFormat:", v48, v75, v90, v87);
            v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
            goto LABEL_54;
          }
          if (v10)
          {
            v33 = (void *)v90;
            objc_msgSend(v92, "safeValueForKey:", CFSTR("_subtext"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v48;
            v82 = CFSTR("__AXStringForVariablesSentinel");
            __AXStringForVariables();
            v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
            goto LABEL_54;
          }
          NSClassFromString(CFSTR("_MKAnnotationViewCustomFeatureAnnotation"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v95 = (os_log_t)v90;
            goto LABEL_56;
          }
          objc_opt_class();
          objc_msgSend(v92, "safeValueForKey:", CFSTR("annotationView"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v48)
          {
            v95 = (os_log_t)v90;
            goto LABEL_55;
          }
          v54 = (void *)v90;
          objc_msgSend(v48, "accessibilityLabel");
          v53 = objc_claimAutoreleasedReturnValue();
          v78 = (void *)v53;
          v82 = CFSTR("__AXStringForVariablesSentinel");
          __AXStringForVariables();
          v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
        }

        v33 = (void *)v53;
LABEL_54:

        goto LABEL_55;
      }
      objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "ignoreLogging");

      if ((v45 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE006F8], "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v94 = (os_log_t)objc_claimAutoreleasedReturnValue();

        v47 = AXOSLogLevelFromAXLogLevel();
        if (!os_log_type_enabled(v94, v47))
        {
LABEL_81:

          goto LABEL_82;
        }
        AXColorizeFormatLog();
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, v47))
        {
          *(_DWORD *)v99 = 138543362;
          v100 = v91;
          _os_log_impl(&dword_232B35000, v94, v47, "%{public}@", v99, 0xCu);
        }
        goto LABEL_79;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "ignoreLogging");

      if ((v35 & 1) != 0)
        goto LABEL_83;
      objc_msgSend(MEMORY[0x24BE006F8], "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      oslog = (os_log_t)objc_claimAutoreleasedReturnValue();

      v37 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(oslog, v37))
      {
        AXColorizeFormatLog();
        v94 = (os_log_t)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, v37))
        {
          *(_DWORD *)v99 = 138543362;
          v100 = v92;
          _os_log_impl(&dword_232B35000, oslog, v37, "%{public}@", v99, 0xCu);
        }
        goto LABEL_80;
      }
    }
LABEL_82:

    goto LABEL_83;
  }
  if (IsPointOfInterest | v93 | v9)
    goto LABEL_28;
  objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "ignoreLogging");

  if ((v39 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006F8], "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v18 = objc_claimAutoreleasedReturnValue();

    v41 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v41))
    {
      AXColorizeFormatLog();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, v41))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v43;
        _os_log_impl(&dword_232B35000, v18, v41, "%{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
    goto LABEL_42;
  }
LABEL_83:

}

void __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id obj;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_processVisibleTile:accessibilityElements:mapViewBounds:mapView:roadLabels:", a2, &obj, *(_QWORD *)(a1 + 40), v2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke_3(uint64_t a1)
{
  objc_setAssociatedObject(*(id *)(a1 + 32), &_MapTileModelKey, 0, 0);
  objc_setAssociatedObject(*(id *)(a1 + 32), &_TileInScene, 0, 0);
}

- (void)_processVisibleTile:(id)a3 accessibilityElements:(id *)a4 mapViewBounds:(id)a5 mapView:(id)a6 roadLabels:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  objc_msgSend(v11, "safeValueForKey:", CFSTR("localizeLabels"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "BOOLValue");

  -[VKMapViewAccessibilityElementManager explorationState](self, "explorationState");
  v14 = v10;
  v15 = v12;
  v16 = v11;
  AXPerformSafeBlock();

}

void __115__VKMapViewAccessibilityElementManager__processVisibleTile_accessibilityElements_mapViewBounds_mapView_roadLabels___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  char v10;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __115__VKMapViewAccessibilityElementManager__processVisibleTile_accessibilityElements_mapViewBounds_mapView_roadLabels___block_invoke_2;
  v5[3] = &unk_2503C5438;
  v9 = *(_BYTE *)(a1 + 64);
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 65);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "enumerateVisibleRoadsUsingBlock:", v5);

}

void __115__VKMapViewAccessibilityElementManager__processVisibleTile_accessibilityElements_mapViewBounds_mapView_roadLabels___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  VKRoadFeatureAccessibilityElement *v4;
  double v5;
  id v6;

  v6 = a2;
  if (!*(_BYTE *)(a1 + 56))
  {
    if ((AXVKRoadShouldBeVisible(v6, *(void **)(a1 + 32)) & 1) == 0)
      goto LABEL_15;
    if (!*(_BYTE *)(a1 + 56))
      goto LABEL_11;
  }
  if (objc_msgSend(v6, "roadClass") == 8
    || objc_msgSend(v6, "formOfWay") == 6
    || objc_msgSend(v6, "formOfWay") == 7
    || objc_msgSend(v6, "formOfWay") == 8
    || objc_msgSend(v6, "formOfWay") == 12
    || objc_msgSend(v6, "formOfWay") == 21)
  {
LABEL_11:
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  v4 = -[VKMultiSectionFeatureAccessibilityElement initWithAccessibilityContainer:feature:ignoreMissingName:useLocalizedLabels:]([VKRoadFeatureAccessibilityElement alloc], "initWithAccessibilityContainer:feature:ignoreMissingName:useLocalizedLabels:", *(_QWORD *)(a1 + 40), v6, v3, *(unsigned __int8 *)(a1 + 57));
  if (v4)
  {
    *(float *)&v5 = AXVKStrokeWidthForRoad(v6, *(void **)(a1 + 40));
    -[VKFeatureAccessibilityElement setStrokeWidth:](v4, "setStrokeWidth:", v5);
    -[VKRoadFeatureAccessibilityElement setTravelDirection:](v4, "setTravelDirection:", objc_msgSend(v6, "travelDirection"));
    -[VKFeatureAccessibilityElement setIsPOI:](v4, "setIsPOI:", 0);
    objc_msgSend(**(id **)(a1 + 48), "addObject:", v4);
  }

LABEL_15:
}

- (void)_consolidateAccessibilityElements:(id)a3
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = (void *)objc_opt_new();
  for (i = 0; i < objc_msgSend(v9, "count"); ++i)
  {
    objc_msgSend(v9, "objectAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isRoad"))
    {
      objc_msgSend(v5, "trueLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v3, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "addFeaturesFromElement:", v5);
          objc_msgSend(v9, "removeObjectAtIndex:", i--);
        }
        else
        {
          objc_msgSend(v3, "setObject:forKey:", v5, v6);
        }

      }
    }

  }
}

- (void)_sortAccessibilityElements:(id)a3 mapView:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "accessibilityMapTypeShouldShowTransit"))
    AXVKTransitRouteElementComparator();
  else
    AXVKMapElementComparator();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingComparator:", v6);

}

- (void)_filterAccessibilityElements:(id)a3 zoomLevel:(float)a4 mapView:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  double MidX;
  double MidY;
  char isKindOfClass;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Maps"));

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v16, "accessibilityFrame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v16, "accessibilityPath");
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v26 = objc_msgSend(v25, "CGPath");

        v49.origin.x = v18;
        v49.origin.y = v20;
        v49.size.width = v22;
        v49.size.height = v24;
        LODWORD(v25) = CGRectIsEmpty(v49);
        v50.origin.x = v18;
        v50.origin.y = v20;
        v50.size.width = v22;
        v50.size.height = v24;
        if (((v25 | CGRectIsNull(v50)) & 1) == 0 && v26)
        {
          objc_msgSend(v8, "_accessibilityParentView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "window");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = v16;
            if (!v11
              || -[VKMapViewAccessibilityElementManager roadHasMapAncestor:inWindow:](self, "roadHasMapAncestor:inWindow:", v29, v28))
            {
              objc_msgSend(v40, "addObject:", v29);
            }

          }
          else
          {
            v51.origin.x = v18;
            v51.origin.y = v20;
            v51.size.width = v22;
            v51.size.height = v24;
            MidX = CGRectGetMidX(v51);
            v52.origin.x = v18;
            v52.origin.y = v20;
            v52.size.width = v22;
            v52.size.height = v24;
            MidY = CGRectGetMidY(v52);
            if (!v11
              || -[VKMapViewAccessibilityElementManager hitPointHasMapAncestor:inWindow:](self, "hitPointHasMapAncestor:inWindow:", v28, MidX, MidY))
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v33 = v42;
              if ((isKindOfClass & 1) != 0)
              {
                if (objc_msgSend(v16, "isPOI"))
                  v33 = v39;
                else
                  v33 = v42;
              }
              objc_msgSend(v33, "addObject:", v16);
            }
          }

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v13);
  }

  v34 = _maximumVisiblePOIs(a4);
  if (objc_msgSend(v39, "count") <= v34)
  {
    objc_msgSend(v38, "addObjectsFromArray:", v39);
  }
  else
  {
    objc_msgSend(v39, "sortUsingComparator:", &__block_literal_global_6);
    objc_msgSend(v39, "subarrayWithRange:", 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObjectsFromArray:", v35);

  }
  v36 = _maximumVisibleRoads(a4);
  if (objc_msgSend(v40, "count") <= v36)
  {
    objc_msgSend(v38, "addObjectsFromArray:", v40);
  }
  else
  {
    objc_msgSend(v40, "sortUsingComparator:", &__block_literal_global_254);
    objc_msgSend(v40, "subarrayWithRange:", 0, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObjectsFromArray:", v37);

  }
  objc_msgSend(v38, "addObjectsFromArray:", v42);
  objc_msgSend(v12, "removeAllObjects");
  objc_msgSend(v12, "addObjectsFromArray:", v38);

}

uint64_t __87__VKMapViewAccessibilityElementManager__filterAccessibilityElements_zoomLevel_mapView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  double v22;
  CGFloat v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  double Width;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = a3;
  objc_msgSend(a2, "accessibilityFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "accessibilityFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  Width = CGRectGetWidth(v32);
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  Height = CGRectGetHeight(v33);
  v34.origin.x = v14;
  v34.origin.y = v16;
  v34.size.width = v18;
  v34.size.height = v20;
  v22 = CGRectGetWidth(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  v23 = CGRectGetHeight(v35);
  v24 = Width;
  v25 = Height;
  v26 = sqrtf((float)(v24 * v24) + (float)(v25 * v25));
  v27 = v22;
  *(float *)&v23 = v23;
  v28 = sqrtf((float)(v27 * v27) + (float)(*(float *)&v23 * *(float *)&v23));
  if (v26 > v28)
    v29 = -1;
  else
    v29 = v26 < v28;

  return v29;
}

uint64_t __87__VKMapViewAccessibilityElementManager__filterAccessibilityElements_zoomLevel_mapView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  double v22;
  CGFloat v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  double Width;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = a3;
  objc_msgSend(a2, "accessibilityFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "accessibilityFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  Width = CGRectGetWidth(v32);
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  Height = CGRectGetHeight(v33);
  v34.origin.x = v14;
  v34.origin.y = v16;
  v34.size.width = v18;
  v34.size.height = v20;
  v22 = CGRectGetWidth(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  v23 = CGRectGetHeight(v35);
  v24 = Width;
  v25 = Height;
  v26 = sqrtf((float)(v24 * v24) + (float)(v25 * v25));
  v27 = v22;
  *(float *)&v23 = v23;
  v28 = sqrtf((float)(v27 * v27) + (float)(*(float *)&v23 * *(float *)&v23));
  if (v26 > v28)
    v29 = -1;
  else
    v29 = v26 < v28;

  return v29;
}

- (BOOL)roadHasMapAncestor:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = *((id *)a3 + 19);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "CGPointValue");
              if (-[VKMapViewAccessibilityElementManager hitPointHasMapAncestor:inWindow:](self, "hitPointHasMapAncestor:inWindow:", v6))
              {

                v16 = 1;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 0;
    }
    while (v8);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (BOOL)hitPointHasMapAncestor:(CGPoint)a3 inWindow:(id)a4
{
  double y;
  double x;
  id v6;
  void *EventForSceneReferencePoint;
  void *v8;
  Class v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:", x, y);
  EventForSceneReferencePoint = (void *)UIAccessibilityCreateEventForSceneReferencePoint();
  objc_msgSend(v6, "hitTest:withEvent:", EventForSceneReferencePoint, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = NSClassFromString(CFSTR("MKMapView"));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__VKMapViewAccessibilityElementManager_hitPointHasMapAncestor_inWindow___block_invoke;
  v13[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v13[4] = v9;
  objc_msgSend(v8, "_accessibilityFindAncestor:startWithSelf:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  return v11;
}

uint64_t __72__VKMapViewAccessibilityElementManager_hitPointHasMapAncestor_inWindow___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_boundsForMapView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  objc_msgSend(a3, "accessibilityBounds");
  result.var3 = v6;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerForMapView:(id)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_msgSend(a3, "accessibilityCenter");
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (int64_t)_orientationForMapView:(id)a3
{
  return objc_msgSend(a3, "accessibilityOrientation");
}

- (double)_yawForMapView:(id)a3
{
  double result;

  objc_msgSend(a3, "accessibilityYaw");
  return result;
}

- (float)_zoomForMapView:(id)a3
{
  float result;

  objc_msgSend(a3, "accessibilityZoomLevel");
  return result;
}

- (BOOL)_isValidBoundsForMapView:(id)a3 bounds:(id)a4
{
  double var3;
  double var2;
  double var1;
  double var0;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;

  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  -[VKMapViewAccessibilityElementManager _boundsForMapView:](self, "_boundsForMapView:", v9);
  LOBYTE(self) = AXVKRectEqualToRect(var0, var1, var2, var3, v10, v11, v12, v13);

  return (char)self;
}

- (BOOL)_isValidOrientationForMapView:(id)a3 orientation:(int64_t)a4
{
  return -[VKMapViewAccessibilityElementManager _orientationForMapView:](self, "_orientationForMapView:", a3) == a4;
}

- (BOOL)_isValidYawForMapView:(id)a3 yaw:(double)a4
{
  id v6;
  double v7;
  double v8;
  BOOL v9;

  v6 = a3;
  -[VKMapViewAccessibilityElementManager _yawForMapView:](self, "_yawForMapView:", v6);
  v8 = v7;
  v9 = (!objc_msgSend(v6, "accessibilityIsInTourGuideMode")
     || !AXVKIsInvalidLocationDegrees(a4) && !AXVKIsInvalidLocationDegrees(v8))
    && AXVKLocationDegreesEqualToLocationDegrees(a4, v8);

  return v9;
}

- (void)accessibilityMapsExplorationBeginFromCurrentLocation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDDB0C0], "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocation");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "latLng");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lat");
  v6 = v5;
  objc_msgSend(v10, "latLng");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lng");
  v9 = v8;

  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromLocationCoordinate:](self, "accessibilityMapsExplorationBeginFromLocationCoordinate:", v6, v9);
}

- (void)accessibilityMapsExplorationBeginFromLocationCoordinate:(id)a3
{
  double v3;
  double v4;
  double var0;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t j;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  double v32;
  double v33;
  float v34;
  float v35;
  double v36;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  void *v42;
  double var1;
  uint64_t v44;
  uint64_t v45;
  id obj;
  uint64_t i;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  var1 = a3.var1;
  var0 = a3.var0;
  v66 = *MEMORY[0x24BDAC8D0];
  -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityConvertCoordinateToWindow:", var0, var1);
  v9 = v8;
  v11 = v10;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[VKMapViewAccessibilityElementManager accessibilityElements](self, "accessibilityElements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v44)
  {
    v42 = 0;
    v12 = 1.79769313e308;
    v45 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v60 != v45)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v49 = v13;
          -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            v58 = 0;
            objc_opt_class();
            objc_msgSend(v49, "accessibilityContainer");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
              abort();
            if (!v17)
              _AXAssert();
            -[VKMapViewAccessibilityElementManager setCurrentMapView:](self, "setCurrentMapView:", v17, *(_QWORD *)&v40, *(_QWORD *)&v41);
            objc_msgSend(v17, "accessibilityConvertCoordinateToWindow:", var0, var1);
            v9 = v18;
            v11 = v19;

          }
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          objc_msgSend(v49, "featureSet", *(_QWORD *)&v40, *(_QWORD *)&v41);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v20;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v55;
            v23 = 1.79769313e308;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v55 != v22)
                  objc_enumerationMutation(v48);
                objc_msgSend(v49, "pointsFromFeatureWrapper:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = 0u;
                v53 = 0u;
                v50 = 0u;
                v51 = 0u;
                v26 = v25;
                v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
                if (v27)
                {
                  v28 = *(_QWORD *)v51;
                  do
                  {
                    for (k = 0; k != v27; ++k)
                    {
                      if (*(_QWORD *)v51 != v28)
                        objc_enumerationMutation(v26);
                      v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
                      -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "CGPointValue");
                      objc_msgSend(v31, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v9, v11, v32, v33);
                      v35 = v34;

                      v36 = v35;
                      if (v23 > v36)
                      {
                        objc_msgSend(v30, "CGPointValue");
                        v3 = v37;
                        v4 = v38;
                        v23 = v36;
                      }
                    }
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
                  }
                  while (v27);
                }

              }
              v20 = v48;
              v21 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
            }
            while (v21);
          }
          else
          {
            v23 = 1.79769313e308;
          }

          if (v23 >= v12)
          {
            v23 = v12;
          }
          else
          {
            v39 = v49;

            v40 = v4;
            v41 = v3;
            v42 = v39;
          }

          v12 = v23;
        }
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v44);
  }
  else
  {
    v42 = 0;
  }

  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromPoint:withRoad:](self, "accessibilityMapsExplorationBeginFromPoint:withRoad:", v42, v41, v40);
}

- (void)accessibilityMapsExplorationBeginFromRoad:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  id *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;
  CGPoint v47;
  CGRect v48;

  v46 = *MEMORY[0x24BDAC8D0];
  v43 = 0;
  v33 = (id *)a3;
  objc_opt_class();
  objc_msgSend(v33, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    _AXAssert();
  -[VKMapViewAccessibilityElementManager setCurrentMapView:](self, "setCurrentMapView:", v34);
  -[VKMapViewAccessibilityElementManager explorationLastTouchPoint](self, "explorationLastTouchPoint");
  v7 = v6;
  v8 = v5;
  if (v6 == *MEMORY[0x24BDBEFB0] && v5 == *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v33[19];
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v10)
    {
      v31 = *(_QWORD *)v40;
      do
      {
        v30 = v10;
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v36;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v36 != v15)
                  objc_enumerationMutation(v13);
                v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "bounds");
                v20 = v19;
                v22 = v21;
                v24 = v23;
                v26 = v25;
                objc_msgSend(v17, "CGPointValue");
                v47.x = v27;
                v47.y = v28;
                v48.origin.x = v20;
                v48.origin.y = v22;
                v48.size.width = v24;
                v48.size.height = v26;
                v29 = CGRectContainsPoint(v48, v47);

                if (v29)
                {
                  objc_msgSend(v17, "CGPointValue");
                  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromPoint:withRoad:](self, "accessibilityMapsExplorationBeginFromPoint:withRoad:", v33);

                  goto LABEL_26;
                }
              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
              if (v14)
                continue;
              break;
            }
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v10);
    }

  }
  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromPoint:withRoad:](self, "accessibilityMapsExplorationBeginFromPoint:withRoad:", v33, v7, v8);
LABEL_26:

}

- (void)accessibilityMapsExplorationBeginFromPoint:(CGPoint)a3 withRoad:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VKRoadFeatureAccessibilityElement *v12;
  VKRoadFeatureAccessibilityElement *v13;
  void *v14;
  void *v15;
  void *v16;
  AXVKExplorationVertexElement *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  AXVKExplorationVertexElement *v23;
  _QWORD v24[3];

  y = a3.y;
  x = a3.x;
  v24[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("AXCollapseMapsChromeNotification"), 0);

  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationEnd](self, "accessibilityMapsExplorationEnd");
  -[VKMapViewAccessibilityElementManager setExplorationState:](self, "setExplorationState:", 1);
  objc_msgSend(v7, "adjacentIntersectorsForPoint:isStart:", 1, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "featureWrapper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibilityElementManager roadElementForFeatureWrapper:](self, "roadElementForFeatureWrapper:", v11);
    v12 = (VKRoadFeatureAccessibilityElement *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v13 = [VKRoadFeatureAccessibilityElement alloc];
      -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "featureWrapper");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "feature");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[VKMultiSectionFeatureAccessibilityElement initWithAccessibilityContainer:feature:ignoreMissingName:useLocalizedLabels:](v13, "initWithAccessibilityContainer:feature:ignoreMissingName:useLocalizedLabels:", v14, v16, 1, 1);

      if (!v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    if (v12)
    {
      v17 = [AXVKExplorationVertexElement alloc];
      objc_msgSend(v10, "coordinates");
      v19 = v18;
      v21 = v20;
      v24[0] = v7;
      v24[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[AXVKExplorationVertexElement initWithCoordinates:betweenRoads:](v17, "initWithCoordinates:betweenRoads:", v22, v19, v21);

      -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationContinueWithVertex:](self, "accessibilityMapsExplorationContinueWithVertex:", v23);
    }
    goto LABEL_9;
  }
  _AXLogWithFacility();
LABEL_10:

}

- (void)accessibilityMapsExplorationContinueWithVertexIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[VKMapViewAccessibilityElementManager neighborExplorationElements](self, "neighborExplorationElements");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "count");

  if (v5 > a3)
  {
    -[VKMapViewAccessibilityElementManager neighborExplorationElements](self, "neighborExplorationElements");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vertex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationContinueWithVertex:](self, "accessibilityMapsExplorationContinueWithVertex:", v7);

  }
}

- (void)accessibilityMapsExplorationContinueWithVertex:(id)a3
{
  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationContinueWithVertex:fromVertex:](self, "accessibilityMapsExplorationContinueWithVertex:fromVertex:", a3, self->_currentExplorationVertex);
}

- (void)accessibilityMapsExplorationContinueWithVertex:(id)a3 fromVertex:(id)a4
{
  void *v5;
  float v6;
  float v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[VKMapViewAccessibilityElementManager setExplorationState:](self, "setExplorationState:", 1);
  -[VKMapViewAccessibilityElementManager setCurrentExplorationVertex:](self, "setCurrentExplorationVertex:", v12);
  objc_msgSend(v12, "setIsComputed:", 0);
  -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewAccessibilityElementManager explorationZoomLevel](self, "explorationZoomLevel");
  v7 = v6;
  objc_msgSend(v12, "coordinates");
  objc_msgSend(v5, "accessibilitySetMapZoomLevel:center:yaw:completionHandler:", 0, v7, v8, v9, 0.0);

  +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewAccessibilityElementManager currentExplorationVertex](self, "currentExplorationVertex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentExplorationVertex:", v11);

}

- (void)accessibilityMapsExplorationBacktrack
{
  void *v3;
  id v4;

  -[NSMutableArray lastObject](self->_lastExplorationVertices, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSMutableArray count](self->_lastExplorationVertices, "count") < 2)
  {
    if (!v4)
    {
      v3 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_lastExplorationVertices, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_lastExplorationVertices, "count") - 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v3)
    {
      -[NSMutableArray removeLastObject](self->_lastExplorationVertices, "removeLastObject");
      -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationContinueWithVertex:fromVertex:](self, "accessibilityMapsExplorationContinueWithVertex:fromVertex:", v4, v3);
      -[NSMutableArray removeLastObject](self->_lastExplorationVertices, "removeLastObject");
      goto LABEL_8;
    }
LABEL_6:
    v3 = 0;
    -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationContinueWithVertex:](self, "accessibilityMapsExplorationContinueWithVertex:", v4);
  }
LABEL_8:

}

- (void)addNeighborsAsRelevantFeaturesForVertex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  VKExplorationAccessibilityElement *v11;
  void *v12;
  VKExplorationAccessibilityElement *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VKMapViewAccessibilityElementManager neighborExplorationElements](self, "neighborExplorationElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "neighbors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [VKExplorationAccessibilityElement alloc];
        -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[VKExplorationAccessibilityElement initWithAccessibilityContainer:andVertex:](v11, "initWithAccessibilityContainer:andVertex:", v12, v10);

        -[VKMapViewAccessibilityElementManager neighborExplorationElements](self, "neighborExplorationElements");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)accessibilityMapsExplorationEnd
{
  id v3;
  id v4;

  -[VKMapViewAccessibilityElementManager neighborExplorationElements](self, "neighborExplorationElements");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[VKMapViewAccessibilityElementManager setCurrentExplorationVertex:](self, "setCurrentExplorationVertex:", 0);
  -[NSMutableArray removeAllObjects](self->_lastExplorationVertices, "removeAllObjects");
  -[VKMapViewAccessibilityElementManager setExplorationState:](self, "setExplorationState:", 0);
  -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VKMapViewAccessibilityElementManager updateAccessibilityElementsForMapView:](self, "updateAccessibilityElementsForMapView:");

}

- (void)computeVertex:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  AXVKExplorationVertexElement *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  AXVKExplorationVertexElement *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  VKRoadFeatureAccessibilityElement *v26;
  void *v27;
  VKRoadFeatureAccessibilityElement *v28;
  void *v29;
  void *v30;
  void *v31;
  AXVKExplorationVertexElement *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  AXVKExplorationEdgeElement *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *v62;
  _QWORD v63[2];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  -[VKMapViewAccessibilityElementManager roadsForVertex:](self, "roadsForVertex:", v49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setRoads:", v4);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v49, "roads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v59;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v45);
        objc_msgSend(v49, "getScreenPoint");
        objc_msgSend(v5, "adjacentIntersectorsForPoint:isStart:", 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "count"))
        {
          v47 = v5;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v46 = v44;
          v6 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
          if (v6)
          {
            v48 = *(_QWORD *)v55;
            do
            {
              v7 = 0;
              do
              {
                if (*(_QWORD *)v55 != v48)
                  objc_enumerationMutation(v46);
                v8 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v7);
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                objc_msgSend(v49, "neighbors");
                v9 = (AXVKExplorationVertexElement *)objc_claimAutoreleasedReturnValue();
                v10 = -[AXVKExplorationVertexElement countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
                if (v10)
                {
                  v11 = *(_QWORD *)v51;
LABEL_14:
                  v12 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v51 != v11)
                      objc_enumerationMutation(v9);
                    v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v12);
                    -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "coordinates");
                    objc_msgSend(v14, "accessibilityConvertCoordinateToWindow:");
                    v16 = v15;
                    v18 = v17;

                    objc_msgSend(v13, "getScreenPoint");
                    if (vabdd_f64(v16, v20) < 0.001 && vabdd_f64(v18, v19) < 0.001)
                      break;
                    if (v10 == ++v12)
                    {
                      v10 = -[AXVKExplorationVertexElement countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
                      if (v10)
                        goto LABEL_14;
                      goto LABEL_21;
                    }
                  }
                }
                else
                {
LABEL_21:

                  if ((objc_msgSend(v8, "isDeadEnd") & 1) != 0)
                  {
                    v21 = [AXVKExplorationVertexElement alloc];
                    objc_msgSend(v8, "coordinates");
                    v23 = v22;
                    v25 = v24;
                    v62 = v47;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
                    v26 = (VKRoadFeatureAccessibilityElement *)objc_claimAutoreleasedReturnValue();
                    v9 = -[AXVKExplorationVertexElement initWithCoordinates:betweenRoads:](v21, "initWithCoordinates:betweenRoads:", v26, v23, v25);
                  }
                  else
                  {
                    objc_msgSend(v8, "featureWrapper");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[VKMapViewAccessibilityElementManager roadElementForFeatureWrapper:](self, "roadElementForFeatureWrapper:", v27);
                    v26 = (VKRoadFeatureAccessibilityElement *)objc_claimAutoreleasedReturnValue();

                    if (!v26)
                    {
                      v28 = [VKRoadFeatureAccessibilityElement alloc];
                      -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v8, "featureWrapper");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "feature");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = -[VKMultiSectionFeatureAccessibilityElement initWithAccessibilityContainer:feature:ignoreMissingName:useLocalizedLabels:](v28, "initWithAccessibilityContainer:feature:ignoreMissingName:useLocalizedLabels:", v29, v31, 1, 1);

                    }
                    v32 = [AXVKExplorationVertexElement alloc];
                    objc_msgSend(v8, "coordinates");
                    v34 = v33;
                    v36 = v35;
                    v63[0] = v47;
                    v63[1] = v26;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v9 = -[AXVKExplorationVertexElement initWithCoordinates:betweenRoads:](v32, "initWithCoordinates:betweenRoads:", v37, v34, v36);

                  }
                  v38 = -[AXVKExplorationEdgeElement initWithRoad:betweenFirstVertex:andSecondVertex:]([AXVKExplorationEdgeElement alloc], "initWithRoad:betweenFirstVertex:andSecondVertex:", v47, v49, v9);
                  objc_msgSend(v49, "edges");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "addObject:", v38);

                  -[AXVKExplorationVertexElement edges](v9, "edges");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "addObject:", v38);

                }
                ++v7;
              }
              while (v7 != v6);
              v6 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
            }
            while (v6);
          }

        }
        ++v45;
      }
      while (v45 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v43);
  }

  objc_msgSend(v49, "setIsComputed:", 1);
}

- (void)setCurrentExplorationVertex:(id)a3
{
  AXVKExplorationVertexElement *v5;
  AXVKExplorationVertexElement *currentExplorationVertex;
  VKExplorationAccessibilityElement *v7;
  void *v8;
  VKExplorationAccessibilityElement *v9;
  VKExplorationAccessibilityElement *currentExplorationElement;
  void *v11;
  AXVKExplorationVertexElement *v12;

  v5 = (AXVKExplorationVertexElement *)a3;
  currentExplorationVertex = self->_currentExplorationVertex;
  v12 = v5;
  if (currentExplorationVertex != v5)
  {
    if (currentExplorationVertex)
    {
      -[AXVKExplorationVertexElement setIsCurrent:](currentExplorationVertex, "setIsCurrent:", 0);
      -[NSMutableArray addObject:](self->_lastExplorationVertices, "addObject:", self->_currentExplorationVertex);
      if ((unint64_t)-[NSMutableArray count](self->_lastExplorationVertices, "count") >= 6)
        -[NSMutableArray removeObjectAtIndex:](self->_lastExplorationVertices, "removeObjectAtIndex:", 0);
    }
    objc_storeStrong((id *)&self->_currentExplorationVertex, a3);
    if (v12)
    {
      v7 = [VKExplorationAccessibilityElement alloc];
      -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[VKExplorationAccessibilityElement initWithAccessibilityContainer:andVertex:](v7, "initWithAccessibilityContainer:andVertex:", v8, v12);
      currentExplorationElement = self->_currentExplorationElement;
      self->_currentExplorationElement = v9;

    }
    else
    {
      v8 = self->_currentExplorationElement;
      self->_currentExplorationElement = 0;
    }

    -[AXVKExplorationVertexElement setIsCurrent:](self->_currentExplorationVertex, "setIsCurrent:", 1);
    +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCurrentExplorationVertex:", v12);

  }
}

- (void)setExplorationState:(int64_t)a3
{
  id v4;

  self->_explorationState = a3;
  -[VKMapViewAccessibilityElementManager delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "explorationStateChanged:", a3);

}

- (id)roadElementForFeatureWrapper:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  char IsSameRoad;
  uint64_t v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[VKMapViewAccessibilityElementManager accessibilityElements](self, "accessibilityElements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v17 = v5;
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v8, "featureSet");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v21;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v21 != v11)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "feature");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "feature");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                IsSameRoad = GEOMultiSectionFeatureIsSameRoad();

                if ((IsSameRoad & 1) != 0)
                {

                  goto LABEL_21;
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v10)
                continue;
              break;
            }
          }

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v8 = 0;
    }
    while (v5);
  }
  else
  {
    v8 = 0;
  }
LABEL_21:

  return v8;
}

- (CGPoint)adjacentPointToPoint:(CGPoint)a3 withOtherPoint:(CGPoint)a4 onRoad:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v9 = a5;
  objc_msgSend(v9, "consolidatedAndOrderedFeatures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "featureAndPointIndicesForPoint:", v8, v7);
  v13 = v12;
  v14 = objc_msgSend(v9, "featureAndPointIndicesForPoint:", x, y);
  if (v11 != -1 && v11 == v14)
  {
    v16 = v15;
    objc_msgSend(v10, "objectAtIndex:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 <= v13)
    {
      if (v16 >= v13)
      {
        v22 = *MEMORY[0x24BDBEFB0];
        v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v17, "objectAtIndex:", v13 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGPointValue");
    }
    else
    {
      objc_msgSend(v17, "objectAtIndex:", v13 + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGPointValue");
    }
    v22 = v20;
    v23 = v21;

    goto LABEL_10;
  }
  v22 = *MEMORY[0x24BDBEFB0];
  v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
LABEL_11:

  v24 = v22;
  v25 = v23;
  result.y = v25;
  result.x = v24;
  return result;
}

- (id)accessibilityMapsExplorationCurrentRoadsWithAngles
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  float v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  -[VKMapViewAccessibilityElementManager currentExplorationVertex](self, "currentExplorationVertex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getScreenPoint");
  v5 = v4;
  v7 = v6;

  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[VKMapViewAccessibilityElementManager lastExplorationVertices](self, "lastExplorationVertices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (double *)MEMORY[0x24BDBEFB0];
  if (v11)
  {
    -[VKMapViewAccessibilityElementManager currentExplorationVertex](self, "currentExplorationVertex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibilityElementManager edgeBetweenVertex:andVertex:](self, "edgeBetweenVertex:andVertex:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "getScreenPoint");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v14, "road");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibilityElementManager adjacentPointToPoint:withOtherPoint:onRoad:](self, "adjacentPointToPoint:withOtherPoint:onRoad:", v19, v5, v7, v16, v18);
    v8 = v20;
    v9 = v21;

    if (v8 == *v12 && v9 == v12[1])
    {
      objc_msgSend(v11, "getScreenPoint");
      v8 = v22;
      v9 = v23;
    }

  }
  v24 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[VKMapViewAccessibilityElementManager neighborExplorationElements](self, "neighborExplorationElements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v64 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (v11)
        {
          -[VKMapViewAccessibilityElementManager currentExplorationVertex](self, "currentExplorationVertex");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "vertex");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[VKMapViewAccessibilityElementManager edgeBetweenVertex:andVertex:](self, "edgeBetweenVertex:andVertex:", v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "vertex");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "getScreenPoint");
          v34 = v33;
          v36 = v35;
          objc_msgSend(v31, "road");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[VKMapViewAccessibilityElementManager adjacentPointToPoint:withOtherPoint:onRoad:](self, "adjacentPointToPoint:withOtherPoint:onRoad:", v37, v5, v7, v34, v36);
          v39 = v38;
          v41 = v40;

          if (v39 == *MEMORY[0x24BDBEFB0] && v41 == *(double *)(MEMORY[0x24BDBEFB0] + 8))
          {
            objc_msgSend(v28, "vertex");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "getScreenPoint");
            v39 = v44;
            v41 = v45;

          }
          -[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v8, v9, v5, v7, v39, v41);
          v47 = v46;
          *(float *)&v46 = v41 - v7;
          v48 = v39 - v5;
          v49 = atan2f(*(float *)&v46, v48);

          v50 = v49;
        }
        else
        {
          objc_msgSend(v28, "vertex");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "getScreenPoint");
          v53 = v52;
          v55 = v54;

          v56 = v55 - v7;
          v57 = v53 - v5;
          v50 = atan2f(v56, v57);
          v47 = v50;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v50);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v58;
        -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationStringForElement:withRelativeAngle:](self, "accessibilityMapsExplorationStringForElement:withRelativeAngle:", v28, v47);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v59;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v60);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v25);
  }

  return v24;
}

- (id)accessibilityMapsExplorationStringForElement:(id)a3 withRelativeAngle:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[VKMapViewAccessibilityElementManager lastExplorationVertices](self, "lastExplorationVertices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = CFSTR("DOUBLE_BACK");
    if (a4 >= 0.392699082 && a4 < 5.89048623)
    {
      if (a4 >= 1.17809725)
      {
        if (a4 >= 1.96349541)
        {
          if (a4 >= 2.74889357)
          {
            if (a4 >= 3.53429174)
            {
              if (a4 >= 4.3196899)
              {
                if (a4 >= 5.10508806)
                {
                  if (a4 >= 5.89048623)
                  {
                    v11 = 0;
                    goto LABEL_19;
                  }
                  v10 = CFSTR("HARD_LEFT");
                }
                else
                {
                  v10 = CFSTR("LEFT");
                }
              }
              else
              {
                v10 = CFSTR("SLIGHT_LEFT");
              }
            }
            else
            {
              v10 = CFSTR("CONTINUE_STRAIGHT");
            }
          }
          else
          {
            v10 = CFSTR("SLIGHT_RIGHT");
          }
        }
        else
        {
          v10 = CFSTR("RIGHT");
        }
      }
      else
      {
        v10 = CFSTR("HARD_RIGHT");
      }
    }
    AXVectorKitLocString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v12 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(CFSTR("DIRECTION_FORMAT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v14);

  }
  objc_msgSend(v6, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v15);

  return v7;
}

- (id)edgeBetweenVertex:(id)a3 andVertex:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a3, "edges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v10, "vertices", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v11);
              if (*(id *)(*((_QWORD *)&v17 + 1) + 8 * j) == v5)
              {
                v15 = v10;

                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v7);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (double)accessibilityDistanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4 onRoad:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  float v32;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v10 = a5;
  objc_msgSend(v10, "consolidatedAndOrderedFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "featureAndPointIndicesForPoint:", v8, v7);
  v14 = v13;
  v15 = objc_msgSend(v10, "featureAndPointIndicesForPoint:", x, y);
  v17 = -1.0;
  if (v12 != -1 && v12 == v15)
  {
    v18 = v16;
    objc_msgSend(v11, "objectAtIndex:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 >= v18)
      v20 = v18;
    else
      v20 = v14;
    if (v14 > v18)
      v18 = v14;
    v17 = 0.0;
    if (v20 < v18)
    {
      do
      {
        objc_msgSend(v19, "objectAtIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "CGPointValue");
        v23 = v22;
        v25 = v24;

        objc_msgSend(v19, "objectAtIndex:", ++v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "CGPointValue");
        v28 = v27;
        v30 = v29;

        -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v23, v25, v28, v30);
        v17 = v17 + v32;

      }
      while (v18 != v20);
    }

  }
  return v17;
}

- (id)accessibilityVisiblePOIsBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4 onRoad:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  float v29;
  float v30;
  double v31;
  double i;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  float v50;
  char v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[2];
  _BYTE v74[128];
  uint64_t v75;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v75 = *MEMORY[0x24BDAC8D0];
  v57 = a5;
  v64 = (void *)objc_opt_new();
  v68 = (void *)objc_opt_new();
  objc_msgSend(v57, "consolidatedAndOrderedFeatures");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v57, "featureAndPointIndicesForPoint:", v8, v7);
  v65 = v11;
  v12 = v10;
  v13 = objc_msgSend(v57, "featureAndPointIndicesForPoint:", x, y);
  v60 = v14;
  v15 = 0;
  if (v12 != -1 && v12 == v13)
  {
    objc_msgSend(v59, "objectAtIndex:", v12);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65 != v60)
    {
      v17 = 1;
      if (v65 >= v60)
        v17 = -1;
      v58 = v17;
      v18 = v65;
      do
      {
        v66 = v18;
        objc_msgSend(v61, "objectAtIndex:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "CGPointValue");
        v67 = v20;
        v22 = v21;

        objc_msgSend(v61, "objectAtIndex:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "CGPointValue");
        v25 = v24;
        v27 = v26;

        -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v67, v22, v25, v27);
        v30 = v29;

        v31 = v67;
        v62 = (v27 - v22) / v30 * 50.0;
        v63 = (v25 - v67) / v30 * 50.0;
        for (i = v22; ; i = v62 + i)
        {
          -[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v67, v22, v25, v27, v31, i);
          if (v33 != 0.0)
            break;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          -[VKMapViewAccessibilityElementManager accessibilityElements](self, "accessibilityElements");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v70;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v70 != v36)
                  objc_enumerationMutation(v34);
                v38 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v39 = v38;
                  if ((objc_msgSend(v39, "isPOI") & 1) != 0)
                  {
                    objc_msgSend(v39, "location");
                    VKLocationCoordinate2DForVKPoint();
                    v41 = v40;
                    v43 = v42;
                    -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "accessibilityConvertCoordinateToWindow:", v41, v43);
                    v46 = v45;
                    v48 = v47;

                    -[VKMapViewAccessibilityElementManager currentMapView](self, "currentMapView");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v46, v48, v31, i);
                    if (v50 <= 50.0)
                    {
                      v51 = objc_msgSend(v68, "containsObject:", v39);

                      if ((v51 & 1) == 0)
                      {
                        -[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v67, v22, v25, v27, v46, v48);
                        v53 = v52;
                        if (v66 != v65
                          || (-[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v25, v27, v67, v22, v46, v48), v54 <= 1.57079633)|| v54 >= 4.71238898)
                        {
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v53);
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          v73[0] = v55;
                          v73[1] = v39;
                          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v64, "addObject:", v56);

                          objc_msgSend(v68, "addObject:", v39);
                        }
                      }
                    }
                    else
                    {

                    }
                  }

                }
              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
            }
            while (v35);
          }

          v31 = v63 + v31;
        }
        v18 = v66 + v58;
      }
      while (v66 + v58 != v60);
    }
    v15 = v64;

  }
  return v15;
}

- (id)accessibilityMapsExplorationDescriptionForAdjacentPOIs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v3, "count");
  if (v6 >= 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v11 = v10;

      objc_msgSend(v3, "objectAtIndex:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accessibilityLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 <= 3.14159265)
        v15 = v4;
      else
        v15 = v5;
      v16 = v15;
      objc_msgSend(v16, "addObject:", v14);

      ++v7;
    }
    while (v6 != v7);
  }
  if ((unint64_t)objc_msgSend(v4, "count") > 2)
    v17 = 3;
  else
    v17 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "subarrayWithRange:", 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatAndListWithElements();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") > 2)
    v20 = 3;
  else
    v20 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "subarrayWithRange:", 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatAndListWithElements();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_opt_new();
  if (objc_msgSend(v19, "length"))
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(CFSTR("ON_LEFT_FORMAT"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v25, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendString:", v26);

  }
  if (objc_msgSend(v22, "length"))
  {
    v27 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(CFSTR("ON_RIGHT_FORMAT"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", v28, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendString:", v29);

  }
  return v23;
}

- (id)accessibilityMapsExplorationCurrentIntersectionDescription
{
  return (id)objc_opt_new();
}

- (id)accessibilityMapsExplorationChangeVerbosityIncreasing:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = -[VKMapViewAccessibilityElementManager verbosityLevel](self, "verbosityLevel");
  if (v5 == 2)
  {
    AXVectorKitLocString(CFSTR("VERBOSITY_HIGH"));
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = !v3;
  }
  else
  {
    v6 = v5;
    if (v5 == 1)
    {
      AXVectorKitLocString(CFSTR("VERBOSITY_AVERAGE"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v3)
        v6 = 2;
      else
        v6 = 0;
    }
    else
    {
      if (v5)
      {
        v8 = 0;
        goto LABEL_13;
      }
      AXVectorKitLocString(CFSTR("VERBOSITY_LOW"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v3)
        v6 = 1;
      else
        v6 = 2;
    }
  }
  v8 = (void *)v7;
LABEL_13:
  -[VKMapViewAccessibilityElementManager setVerbosityLevel:](self, "setVerbosityLevel:", v6);
  return v8;
}

- (double)accessibilityAngleWithThreePointsFirst:(CGPoint)a3 second:(CGPoint)a4 third:(CGPoint)a5 inRadians:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  double result;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  CGPoint v16;
  CGPoint v17;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v14 = 0.0;
  v15 = 0.0;
  AXVKMathGetVectorAndDistanceForPoints(&v15, &v14, a3, a4);
  v12 = 0;
  v13 = 0.0;
  v16.x = x;
  v16.y = y;
  v17.x = v10;
  v17.y = v9;
  AXVKMathGetVectorAndDistanceForPoints(&v13, (long double *)&v12, v16, v17);
  result = v15 - v13;
  if (v15 - v13 < 0.0)
    result = v15 - v13 + 360.0;
  if (v6)
    return result / 180.0 * 3.14159265;
  return result;
}

- (id)roadsForVertex:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  objc_msgSend(v4, "getScreenPoint");
  v6 = v5;
  v8 = v7;
  -[VKMapViewAccessibilityElementManager accessibilityElements](self, "accessibilityElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = (id)objc_opt_new();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__VKMapViewAccessibilityElementManager_roadsForVertex___block_invoke;
  v14[3] = &unk_2503C5508;
  v14[5] = v6;
  v14[6] = v8;
  v14[4] = &v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  if (!objc_msgSend((id)v16[5], "count"))
    _AXAssert();
  if (objc_msgSend((id)v16[5], "count"))
  {
    v11 = (id)v16[5];
  }
  else
  {
    objc_msgSend(v4, "roads");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __55__VKMapViewAccessibilityElementManager_roadsForVertex___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40), *(double *)(a1 + 48)) & 1) != 0
     || (objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + 1.0, *(double *)(a1 + 48) + 1.0) & 1) != 0
     || (objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + 1.0, *(double *)(a1 + 48) + -1.0) & 1) != 0
     || (objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + -1.0, *(double *)(a1 + 48) + 1.0) & 1) != 0
     || objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + -1.0, *(double *)(a1 + 48) + -1.0)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  }

}

- (id)accessibilityElementsForMapView:(id)a3
{
  NSObject *properties_queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  properties_queue = self->_properties_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__VKMapViewAccessibilityElementManager_accessibilityElementsForMapView___block_invoke;
  v6[3] = &unk_2503C5268;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(properties_queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__VKMapViewAccessibilityElementManager_accessibilityElementsForMapView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityElements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- ($01BB1521EC52D44A8E7628F5261DCEC8)boundsForMapView:(id)a3
{
  NSObject *properties_queue;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)();
  void *v18;
  __int128 v19;
  __int128 v20;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x5012000000;
  v16 = __Block_byref_object_copy__305;
  v17 = __Block_byref_object_dispose__306;
  v18 = &unk_232B640CA;
  v19 = 0u;
  v20 = 0u;
  properties_queue = self->_properties_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__VKMapViewAccessibilityElementManager_boundsForMapView___block_invoke;
  v12[3] = &unk_2503C5268;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(properties_queue, v12);
  v4 = v14[6];
  v5 = v14[7];
  v6 = v14[8];
  v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

uint64_t __57__VKMapViewAccessibilityElementManager_boundsForMapView___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  v3[9] = v7;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerForMapView:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *properties_queue;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  __n128 (*v15)(__n128 *, __n128 *);
  uint64_t (*v16)();
  void *v17;
  uint64_t v18;
  uint64_t v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4012000000;
  v15 = __Block_byref_object_copy__308;
  v16 = __Block_byref_object_dispose__309;
  v18 = 0;
  v19 = 0;
  v17 = &unk_232B640CA;
  VKLocationCoordinate2DMake();
  v18 = v4;
  v19 = v5;
  properties_queue = self->_properties_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__VKMapViewAccessibilityElementManager_centerForMapView___block_invoke;
  v11[3] = &unk_2503C5268;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(properties_queue, v11);
  v7 = v13[6];
  v8 = v13[7];
  _Block_object_dispose(&v12, 8);
  v9 = v7;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

uint64_t __57__VKMapViewAccessibilityElementManager_centerForMapView___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "center");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 48) = v4;
  *(_QWORD *)(v3 + 56) = v5;
  return result;
}

- (int64_t)orientationForMapView:(id)a3
{
  NSObject *properties_queue;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  properties_queue = self->_properties_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__VKMapViewAccessibilityElementManager_orientationForMapView___block_invoke;
  v6[3] = &unk_2503C5268;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(properties_queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __62__VKMapViewAccessibilityElementManager_orientationForMapView___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "orientation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)yawForMapView:(id)a3
{
  NSObject *properties_queue;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  properties_queue = self->_properties_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__VKMapViewAccessibilityElementManager_yawForMapView___block_invoke;
  v6[3] = &unk_2503C5268;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(properties_queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __54__VKMapViewAccessibilityElementManager_yawForMapView___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "yaw");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)updateAccessibilityElementsForMapView:(id)a3
{
  -[VKMapViewAccessibilityElementManager updateAccessibilityElementsForMapView:isRetry:](self, "updateAccessibilityElementsForMapView:isRetry:", a3, 0);
}

- (void)updateAccessibilityElementsForMapView:(id)a3 isRetry:(BOOL)a4
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    _AXAssert();
  _AXLogWithFacility();
  v5 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[5];
  _QWORD block[14];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  objc_msgSend(*(id *)(a1 + 32), "_boundsForMapView:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_centerForMapView:", *(_QWORD *)(a1 + 40));
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(*(id *)(a1 + 32), "_orientationForMapView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_yawForMapView:", *(_QWORD *)(a1 + 40));
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "_zoomForMapView:", *(_QWORD *)(a1 + 40));
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "_gatherVisibleLabelMarkersForMapView:", *(_QWORD *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_gatherVisibleTilesForMapView:", *(_QWORD *)(a1 + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v21 = *(void **)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v21, "accessibilityElements");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_accessibilityElementsForMapView:mapViewBounds:visibleLabels:visibleTiles:existingElements:", v22, v19, v20, v23, v3, v5, v7, v9);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v43[5];
  v43[5] = v24;

  objc_msgSend(*(id *)(a1 + 32), "_consolidateAccessibilityElements:", v43[5]);
  objc_msgSend(*(id *)(a1 + 32), "_sortAccessibilityElements:mapView:", v43[5], *(_QWORD *)(a1 + 40));
  LODWORD(v26) = v18;
  objc_msgSend(*(id *)(a1 + 32), "_filterAccessibilityElements:zoomLevel:mapView:", v43[5], *(_QWORD *)(a1 + 40), v26);
  LODWORD(v23) = objc_msgSend(*(id *)(a1 + 32), "_isValidBoundsForMapView:bounds:", *(_QWORD *)(a1 + 40), v3, v5, v7, v9);
  LODWORD(v21) = objc_msgSend(*(id *)(a1 + 32), "_isValidOrientationForMapView:orientation:", *(_QWORD *)(a1 + 40), v14);
  if ((v23 & v21 & objc_msgSend(*(id *)(a1 + 32), "_isValidYawForMapView:yaw:", *(_QWORD *)(a1 + 40), v16)) == 1)
  {
    LOBYTE(v38) = 1;
    _AXLogWithFacility();
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(NSObject **)(v27 + 96);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_2;
    block[3] = &unk_2503C5530;
    block[4] = v27;
    block[5] = &v42;
    *(double *)&block[6] = v3;
    *(double *)&block[7] = v5;
    *(double *)&block[8] = v7;
    *(double *)&block[9] = v9;
    block[10] = v11;
    block[11] = v13;
    block[12] = v14;
    *(double *)&block[13] = v16;
    dispatch_sync(v28, block);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v38, CFSTR("Update request succeeded"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "explorationState") == 1)
    {
      v30 = *(void **)(a1 + 32);
      objc_msgSend(v30, "currentExplorationVertex");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "computeVertex:", v31);

      v32 = *(void **)(a1 + 32);
      objc_msgSend(v32, "currentExplorationVertex");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addNeighborsAsRelevantFeaturesForVertex:", v33);

      objc_msgSend(*(id *)(a1 + 32), "setExplorationState:", 2);
      objc_msgSend(*(id *)(a1 + 32), "currentExplorationElement");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v34, CFSTR("AXVKUpdateAccessibilityElementsFocusedElementKey"));

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "postNotificationName:object:userInfo:", CFSTR("UpdateAccessibilityElementsComplete"), *(_QWORD *)(a1 + 32), v29);

  }
  else
  {
    _AXLogWithFacility();
    v36 = *(_QWORD *)(a1 + 32);
    v37 = *(NSObject **)(v36 + 96);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_3;
    v40[3] = &unk_2503C4FE0;
    v40[4] = v36;
    dispatch_sync(v37, v40);
    v39 = *(id *)(a1 + 40);
    AXPerformBlockOnMainThreadAfterDelay();

  }
  _Block_object_dispose(&v42, 8);

}

uint64_t __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAccessibilityElements:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setOrientation:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "setYaw:", *(double *)(a1 + 104));
  return objc_msgSend(*(id *)(a1 + 32), "setUpdating:", 0);
}

uint64_t __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUpdating:", 0);
}

uint64_t __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityElementsForMapView:isRetry:", *(_QWORD *)(a1 + 40), 1);
}

- (VKMapViewAccessibilityElementManager)init
{
  VKMapViewAccessibilityElementManager *v2;
  VKMapViewAccessibilityElementManager *v3;
  double v4;
  double v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *properties_queue;
  AXVKExplorationVertexElement *currentExplorationVertex;
  uint64_t v9;
  NSMutableArray *lastExplorationVertices;
  uint64_t v11;
  NSMutableArray *neighborExplorationElements;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKMapViewAccessibilityElementManager;
  v2 = -[VKMapViewAccessibilityElementManager init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_bounds.x0 = 0u;
    *(_OWORD *)&v2->_bounds.y0 = 0u;
    VKLocationCoordinate2DMake();
    v3->_center.latitude = v4;
    v3->_center.longitude = v5;
    v3->_orientation = 1;
    v3->_yaw = 0.0;
    v3->_updating = 0;
    v6 = dispatch_queue_create("com.maps.accessibility.properties", 0);
    properties_queue = v3->_properties_queue;
    v3->_properties_queue = (OS_dispatch_queue *)v6;

    *(_OWORD *)&v3->_explorationState = xmmword_232B5BE90;
    currentExplorationVertex = v3->_currentExplorationVertex;
    v3->_currentExplorationVertex = 0;

    v9 = objc_opt_new();
    lastExplorationVertices = v3->_lastExplorationVertices;
    v3->_lastExplorationVertices = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    neighborExplorationElements = v3->_neighborExplorationElements;
    v3->_neighborExplorationElements = (NSMutableArray *)v11;

    v3->_explorationZoomLevel = 18.0;
  }
  return v3;
}

- (VKMapViewAccessibilityElementManagerDelegate)delegate
{
  return (VKMapViewAccessibilityElementManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)explorationZoomLevel
{
  return self->_explorationZoomLevel;
}

- (void)setExplorationZoomLevel:(float)a3
{
  self->_explorationZoomLevel = a3;
}

- (CGPoint)explorationLastTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_explorationLastTouchPoint.x;
  y = self->_explorationLastTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setExplorationLastTouchPoint:(CGPoint)a3
{
  self->_explorationLastTouchPoint = a3;
}

- (int64_t)explorationState
{
  return self->_explorationState;
}

- (int64_t)verbosityLevel
{
  return self->_verbosityLevel;
}

- (void)setVerbosityLevel:(int64_t)a3
{
  self->_verbosityLevel = a3;
}

- (AXVKExplorationVertexElement)currentExplorationVertex
{
  return self->_currentExplorationVertex;
}

- (NSMutableArray)lastExplorationVertices
{
  return self->_lastExplorationVertices;
}

- (void)setLastExplorationVertices:(id)a3
{
  objc_storeStrong((id *)&self->_lastExplorationVertices, a3);
}

- (VKExplorationAccessibilityElement)currentExplorationElement
{
  return self->_currentExplorationElement;
}

- (void)setCurrentExplorationElement:(id)a3
{
  objc_storeStrong((id *)&self->_currentExplorationElement, a3);
}

- (NSMutableArray)neighborExplorationElements
{
  return self->_neighborExplorationElements;
}

- (void)setNeighborExplorationElements:(id)a3
{
  objc_storeStrong((id *)&self->_neighborExplorationElements, a3);
}

- (NSArray)accessibilityElements
{
  return self->_accessibilityElements;
}

- (void)setAccessibilityElements:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityElements, a3);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)bounds
{
  double x0;
  double x1;
  double y0;
  double y1;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  x0 = self->_bounds.x0;
  x1 = self->_bounds.x1;
  y0 = self->_bounds.y0;
  y1 = self->_bounds.y1;
  result.var3 = y1;
  result.var2 = y0;
  result.var1 = x1;
  result.var0 = x0;
  return result;
}

- (void)setBounds:(id)a3
{
  self->_bounds = ($2785BDE8E87B0E5EAD863C2AFF5498A8)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)center
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_center.latitude;
  longitude = self->_center.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCenter:(id)a3
{
  self->_center = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (OS_dispatch_queue)properties_queue
{
  return self->_properties_queue;
}

- (void)setProperties_queue:(id)a3
{
  objc_storeStrong((id *)&self->_properties_queue, a3);
}

- (VKMapView)currentMapView
{
  return (VKMapView *)objc_loadWeakRetained((id *)&self->_currentMapView);
}

- (void)setCurrentMapView:(id)a3
{
  objc_storeWeak((id *)&self->_currentMapView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentMapView);
  objc_storeStrong((id *)&self->_properties_queue, 0);
  objc_storeStrong((id *)&self->_accessibilityElements, 0);
  objc_storeStrong((id *)&self->_neighborExplorationElements, 0);
  objc_storeStrong((id *)&self->_currentExplorationElement, 0);
  objc_storeStrong((id *)&self->_lastExplorationVertices, 0);
  objc_storeStrong((id *)&self->_currentExplorationVertex, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

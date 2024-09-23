@implementation GEOSearchFoundationFeedbackListener

- (GEOSearchFoundationFeedbackListener)initWithClientType:(unint64_t)a3
{
  GEOSearchFoundationFeedbackListener *v4;
  int v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOSearchFoundationFeedbackListener;
  v4 = -[GEOSearchFoundationFeedbackListener init](&v8, sel_init);
  if (v4)
  {
    v5 = 0;
    v6 = 702;
    switch(a3)
    {
      case 0uLL:
        goto LABEL_6;
      case 1uLL:
        goto LABEL_5;
      case 2uLL:
        v6 = 701;
        goto LABEL_5;
      case 3uLL:
        v6 = 803;
LABEL_5:
        +[GEOUserSession setInitialShareSessionWithMaps:](GEOUserSession, "setInitialShareSessionWithMaps:", 1);
        v5 = v6;
LABEL_6:
        v4->_uiTarget = v5;
        break;
      default:
        break;
    }
    SearchFoundationLibrary();
  }
  return v4;
}

- (void)didRankSections:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *mapsResultsIdentifiers;
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "sections");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_mapsResultIdentifiersFromSections:", v8);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mapsResultsIdentifiers = self->_mapsResultsIdentifiers;
  self->_mapsResultsIdentifiers = v6;

}

+ (id)_mapsResultIdentifiersFromSections:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v14, "result");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "mapsData");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v14, "result");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v18);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)resultsDidBecomeVisible:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  GEOMapsServerMetadata *v8;
  __objc2_class **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  __objc2_class *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  GEOMapsServerMetadata *v41;
  void *v42;
  void *v43;
  GEOMapsSearchResult *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id obj;
  GEOMapsServerMetadata *v51;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_33;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v3, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (!v56)
  {

    v8 = 0;
    v7 = 0;
    goto LABEL_32;
  }
  v7 = 0;
  v8 = 0;
  v55 = *(_QWORD *)v60;
  v9 = off_1E1BED000;
  v49 = v3;
  obj = v6;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v60 != v55)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v10);
      objc_msgSend(v11, "mapsData", v49);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (self->_uiTarget == 701)
        {
          objc_msgSend(v11, "mapsData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:](GEOMapItemStorage, "mapItemStorageForSerializedPlaceData:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          if (v14)
            goto LABEL_17;
          v15 = objc_alloc(v9[319]);
          objc_msgSend(v11, "mapsData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithData:", v16);

          if (!v17)
            goto LABEL_22;
        }
        else
        {
          v18 = objc_alloc(v9[319]);
          objc_msgSend(v11, "mapsData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v18, "initWithData:", v19);

          if (!v17)
          {
            objc_msgSend(v11, "mapsData");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:](GEOMapItemStorage, "mapItemStorageForSerializedPlaceData:", v31);
            v14 = objc_claimAutoreleasedReturnValue();

            if (!v14)
              goto LABEL_22;
LABEL_17:
            v58 = v7;
            v32 = v9[319];
            v33 = (double)(unint64_t)objc_msgSend(v3, "timestamp");
            objc_msgSend(v3, "results");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)v14;
            -[__objc2_class actionDetailsWithMapItem:timestamp:resultIndex:targetID:](v32, "actionDetailsWithMapItem:timestamp:resultIndex:targetID:", v14, objc_msgSend(v34, "indexOfObject:", v11), 0, v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = v11;
            objc_msgSend(v11, "card");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "cardSections");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "firstObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "punchoutOptions");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "preferredOpenableURL");
            v41 = v8;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "absoluteString");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v35;
            objc_msgSend(v35, "setActionUrl:", v43);

            v8 = v41;
            v30 = 1;
            if (!v41)
              goto LABEL_18;
            goto LABEL_19;
          }
        }
        v58 = v7;
        v51 = v8;
        -[__objc2_class actionDetailsWithDetails:timestamp:](v9[319], "actionDetailsWithDetails:timestamp:", v17, (double)(unint64_t)objc_msgSend(v3, "timestamp"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "results");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setResultIndex:", objc_msgSend(v21, "indexOfObject:", v11));

        v57 = v11;
        objc_msgSend(v11, "card");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cardSections");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "punchoutOptions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "preferredOpenableURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "absoluteString");
        v28 = v3;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setActionUrl:", v29);

        v54 = v20;
        if (v20)
        {
          v30 = 0;
          v53 = 0;
          v8 = v51;
          if (!v51)
LABEL_18:
            v8 = objc_alloc_init(GEOMapsServerMetadata);
LABEL_19:
          v44 = objc_alloc_init(GEOMapsSearchResult);
          v9 = off_1E1BED000;
          if (v30)
          {
            -[GEOMapsSearchResult setMuid:](v44, "setMuid:", objc_msgSend(v53, "_muid"));
            objc_msgSend(v53, "geoAddress");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOMapsSearchResult setAddress:](v44, "setAddress:", v45);

            objc_msgSend(v53, "_identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "mapsIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOMapsSearchResult setMapsId:](v44, "setMapsId:", v47);

          }
          -[GEOMapsSearchResult setPlaceActionDetails:](v44, "setPlaceActionDetails:", v54);
          -[GEOMapsServerMetadata addMapsSearchResult:](v8, "addMapsSearchResult:", v44);

          v3 = v49;
          v11 = v57;
          v7 = v58;
LABEL_22:
          if (v7)
            goto LABEL_24;
LABEL_23:
          objc_msgSend(v11, "userInput");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        v8 = v51;
        v11 = v57;
        v7 = v58;
        v9 = off_1E1BED000;
        v3 = v28;
        if (!v58)
          goto LABEL_23;
      }
LABEL_24:
      ++v10;
    }
    while (v56 != v10);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    v56 = v48;
  }
  while (v48);

  if (v8)
    objc_msgSend(getGEOAPPortalClass(), "captureUserAction:target:value:mapsServerMetadata:", 2015, self->_uiTarget, v7, v8);
LABEL_32:

LABEL_33:
}

- (GEOSearchFoundationFeedbackListener)init
{
  GEOSearchFoundationFeedbackListener *result;

  result = (GEOSearchFoundationFeedbackListener *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

+ (id)feedbackListenerForParsec
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__GEOSearchFoundationFeedbackListener_feedbackListenerForParsec__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBCD00 != -1)
    dispatch_once(&qword_1ECDBCD00, block);
  return (id)_MergedGlobals_344;
}

void __64__GEOSearchFoundationFeedbackListener_feedbackListenerForParsec__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Spotlight")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
  {
    v3 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.siri")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithClientType:", v3);
  v5 = (void *)_MergedGlobals_344;
  _MergedGlobals_344 = v4;

}

- (id)traits
{
  void *v2;
  void *v3;

  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didEngageSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "mapsData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          LODWORD(v12) = 0;
          objc_msgSend(getGEOAPPortalClass(), "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", 16001, self->_uiTarget, 0, 0, 0, 0, (double)(unint64_t)objc_msgSend(v4, "timestamp"), 0, 0, 0, 0, v12, 0, 0, 0, 0);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)didEngageResult:(id)a3
{
  void *v4;
  void *v5;
  uint64_t uiTarget;
  NSUInteger v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  double v21;
  void *v22;
  GEOPlaceActionDetails *v23;
  void *v24;
  void *v25;
  GEOPlaceActionDetails *v26;
  void *v27;
  void *v28;
  void *v29;
  id GEOAPPortalClass;
  double v31;
  void *v32;
  uint64_t v33;
  id v34;

  v34 = a3;
  objc_msgSend(v34, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  uiTarget = self->_uiTarget;
  v7 = -[NSArray indexOfObject:](self->_mapsResultsIdentifiers, "indexOfObject:", v5);
  objc_msgSend(v34, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "card");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cardSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "punchoutOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredOpenableURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "result");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mapsData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (objc_msgSend(v34, "actionEngaged"))
    {
      if (objc_msgSend(v34, "actionTarget") == 1)
      {
        v17 = 6003;
      }
      else if (objc_msgSend(v34, "actionTarget") == 2)
      {
        v17 = 6009;
      }
      else if (objc_msgSend(v34, "actionTarget") == 3)
      {
        v17 = 6045;
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 2007;
    }
    v23 = [GEOPlaceActionDetails alloc];
    objc_msgSend(v34, "result");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "mapsData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[GEOPlaceActionDetails initWithData:](v23, "initWithData:", v25);

    if (v26)
    {
      +[GEOPlaceActionDetails actionDetailsWithDetails:timestamp:](GEOPlaceActionDetails, "actionDetailsWithDetails:timestamp:", v26, (double)(unint64_t)objc_msgSend(v34, "timestamp"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setResultIndex:", v7);
      objc_msgSend(v14, "absoluteString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setActionUrl:", v27);

      objc_msgSend(getGEOAPPortalClass(), "captureUserAction:target:value:placeActionDetails:", v17, uiTarget, 0, v22);
    }
    else
    {
      objc_msgSend(v34, "result");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "mapsData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:](GEOMapItemStorage, "mapItemStorageForSerializedPlaceData:", v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      GEOAPPortalClass = getGEOAPPortalClass();
      v31 = (double)(unint64_t)objc_msgSend(v34, "timestamp");
      objc_msgSend(v14, "absoluteString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = 0;
      objc_msgSend(GEOAPPortalClass, "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", v17, uiTarget, 0, v22, v7, 0, v31, 0, 0, v32, 0, v33, 0, 0, 0, 0);

    }
    goto LABEL_16;
  }
  objc_msgSend(v14, "host");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("maps.apple.com"));

  if (v19)
  {
    v20 = getGEOAPPortalClass();
    v21 = (double)(unint64_t)objc_msgSend(v34, "timestamp");
    objc_msgSend(v14, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 0;
    objc_msgSend(v20, "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", 16001, uiTarget, 0, 0, v7, 0, v21, 0, 0, v22, 0, v33, 0, 0, 0, 0);
LABEL_16:

  }
}

- (void)didEngageCardSection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t uiTarget;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  id GEOAPPortalClass;
  double v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "mapsData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "punchoutOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredOpenableURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      uiTarget = self->_uiTarget;
      objc_msgSend(v5, "cardId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "actionTarget") == 1)
      {
        objc_msgSend(v25, "cardSection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 6003;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "action");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "shouldSearchDirectionsAlongCurrentRoute");

          if (v17)
            v15 = 3001;
          else
            v15 = 6003;
        }

      }
      else if (objc_msgSend(v25, "actionTarget") == 2)
      {
        v15 = 6009;
      }
      else if (objc_msgSend(v25, "actionTarget") == 3)
      {
        v15 = 6045;
      }
      else
      {
        v15 = 2007;
      }
      if (objc_msgSend(v13, "length"))
        v18 = -[NSArray indexOfObject:](self->_resultCardIdentifiers, "indexOfObject:", v13);
      else
        v18 = 0xFFFFFFFFLL;
      objc_msgSend(v7, "mapsData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOMapItemStorage mapItemStorageForSerializedPlaceData:](GEOMapItemStorage, "mapItemStorageForSerializedPlaceData:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      GEOAPPortalClass = getGEOAPPortalClass();
      v22 = (double)(unint64_t)objc_msgSend(v25, "timestamp");
      objc_msgSend(v11, "absoluteString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = 0;
      objc_msgSend(GEOAPPortalClass, "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", v15, uiTarget, 0, v20, v18, 0, v22, 0, 0, v23, 0, v24, 0, 0, 0, 0);

    }
  }

}

- (void)didPerformCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend(v4, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v6 = (void *)qword_1ECDBCD08;
  v29 = qword_1ECDBCD08;
  if (!qword_1ECDBCD08)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getSFRequestAppClipInstallCommandClass_block_invoke;
    v24 = &unk_1E1C03348;
    v25 = &v26;
    __getSFRequestAppClipInstallCommandClass_block_invoke((uint64_t)&v21);
    v6 = (void *)v27[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v26, 8);
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "command");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 116;
LABEL_13:
    objc_msgSend(getGEOAPPortalClass(), "captureUserAction:target:value:", v13, self->_uiTarget, v12);

    goto LABEL_14;
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v14 = (void *)qword_1ECDBCD10;
  v29 = qword_1ECDBCD10;
  if (!qword_1ECDBCD10)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getSFCallCommandClass_block_invoke;
    v24 = &unk_1E1C03348;
    v25 = &v26;
    __getSFCallCommandClass_block_invoke((uint64_t)&v21);
    v14 = (void *)v27[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v26, 8);
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    v12 = 0;
    v13 = 6009;
    goto LABEL_13;
  }
  objc_msgSend(v4, "command");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v18 = (void *)qword_1ECDBCD18;
  v29 = qword_1ECDBCD18;
  if (!qword_1ECDBCD18)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getSFBeginMapsRoutingCommandClass_block_invoke;
    v24 = &unk_1E1C03348;
    v25 = &v26;
    __getSFBeginMapsRoutingCommandClass_block_invoke((uint64_t)&v21);
    v18 = (void *)v27[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v26, 8);
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0)
  {
    v12 = 0;
    v13 = 6003;
    goto LABEL_13;
  }
LABEL_14:

}

- (void)cardViewDidAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *resultCardIdentifiers;
  uint64_t v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "cardSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "mapsData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend((id)objc_opt_class(), "_identifiersFromCardSections:", v5);
        v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
        resultCardIdentifiers = self->_resultCardIdentifiers;
        self->_resultCardIdentifiers = v11;

        LODWORD(v13) = 0;
        objc_msgSend(getGEOAPPortalClass(), "capturePlaceCardUserAction:target:value:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:commingledRichProviderIds:", 2015, self->_uiTarget, 0, 0, 0xFFFFFFFFLL, 0, (double)(unint64_t)objc_msgSend(v14, "timestamp"), 0, 0, 0, 0, v13, 0, 0, 0, 0);
      }
    }

  }
}

+ (id)_identifiersFromCardSections:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "nextCard", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cardId");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (const __CFString *)v11;
        else
          v13 = &stru_1E1C241D0;
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCardIdentifiers, 0);
  objc_storeStrong((id *)&self->_mapsResultsIdentifiers, 0);
}

@end

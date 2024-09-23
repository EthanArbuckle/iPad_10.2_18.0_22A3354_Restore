@implementation GEOPlaceDataRequester

void __100__GEOPlaceDataRequester_startWithRequest_traits_timeout_auditToken_throttleToken_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double Current;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  id *v36;
  id *v37;
  void *v38;
  uint64_t v39;
  id *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v57;
  void *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v57 = a3;
  v5 = v4;
  if (v5)
  {
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "datasetAbStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshDatasetABStatus:", v7);

  }
  Current = CFAbsoluteTimeGetCurrent();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v58 = v5;
  objc_msgSend(v5, "legacyPlaceResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v76 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v14, "setFirstSeenTimestamp:", Current);
        +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          -[GEOPDPlaceInfo _readCenter](v15);
          if (*(_QWORD *)(v16 + 40))
          {
            -[GEOPDPlaceInfo center]((id *)v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "coordinate");
            v18 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

            if (v18)
              v19 = 2;
            else
              v19 = 1;
            objc_msgSend(v14, "setReferenceFrame:", v19);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
    }
    while (v11);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v58, "mapsResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v72 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
        if (objc_msgSend(v25, "resultType") == 1)
        {
          objc_msgSend(v25, "place");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setFirstSeenTimestamp:", Current);
          +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            -[GEOPDPlaceInfo _readCenter](v27);
            if (*(_QWORD *)(v28 + 40))
            {
              -[GEOPDPlaceInfo center]((id *)v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "coordinate");
              v30 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

              if (v30)
                v31 = 2;
              else
                v31 = 1;
              objc_msgSend(v26, "setReferenceFrame:", v31);
            }
          }

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v22);
  }

  v32 = v58;
  objc_msgSend(v58, "globalResult");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (_QWORD *)v33;
    -[GEOPDPlaceGlobalResult _readAutocompleteResult](v33);
    v35 = v34[8];

    if (!v35)
      goto LABEL_57;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v58, "globalResult");
    v36 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult autocompleteResult](v36);
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDAutocompleteResult sections](v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v38;
    v61 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    if (v61)
    {
      v60 = *(_QWORD *)v68;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v68 != v60)
            objc_enumerationMutation(obj);
          v62 = v39;
          v40 = *(id **)(*((_QWORD *)&v67 + 1) + 8 * v39);
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          -[GEOPDAutocompleteResultSection entries](v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v64;
            do
            {
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v64 != v44)
                  objc_enumerationMutation(v41);
                v46 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
                if (objc_msgSend(v46, "hasBusiness"))
                {
                  objc_msgSend(v46, "business");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "place");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", v48);
                  v49 = objc_claimAutoreleasedReturnValue();

                  if (v49)
                  {
                    -[GEOPDPlaceInfo _readCenter](v49);
                    if (*(_QWORD *)(v49 + 40))
                    {
                      -[GEOPDPlaceInfo center]((id *)v49);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "coordinate");
                      v51 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

                      if (v51)
                        v52 = 2;
                      else
                        v52 = 1;
                      objc_msgSend(v46, "business");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "place");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "setReferenceFrame:", v52);

                    }
                  }

                }
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
            }
            while (v43);
          }

          v39 = v62 + 1;
        }
        while (v62 + 1 != v61);
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      }
      while (v61);
    }

  }
  else
  {

  }
  v32 = v58;
LABEL_57:
  v55 = *(_QWORD *)(a1 + 32);
  if (v55)
    (*(void (**)(uint64_t, void *, id))(v55 + 16))(v55, v32, v57);

}

+ (id)sharedInstance
{
  if (_MergedGlobals_47 != -1)
    dispatch_once(&_MergedGlobals_47, &__block_literal_global_46);
  return (id)qword_1EDF4FC18;
}

- (id)_validateResponse:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;
  id *v11;
  _DWORD *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  id *v19;
  _DWORD *v20;
  int v21;
  void *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _DWORD *v27;
  int v28;
  _BOOL8 v29;
  void *v30;

  v3 = a3;
  v4 = objc_msgSend(v3, "status");
  v5 = 0;
  if (v4 > 19)
  {
    if (v4 != 20)
    {
      if (v4 != 30)
      {
        if (v4 == 60)
        {
          v6 = (void *)MEMORY[0x1E0CB35C8];
          v7 = CFSTR("Received version mismatch from server");
          v8 = -28;
LABEL_21:
          objc_msgSend(v6, "GEOErrorWithCode:reason:", v8, v7);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        goto LABEL_20;
      }
      goto LABEL_36;
    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (id)*MEMORY[0x1E0C9AFA8];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Received no results status from server"), v10);

    if (objc_msgSend(v3, "requestType") != 10)
    {
      if (objc_msgSend(v3, "requestType") == 1)
      {
        objc_msgSend(v3, "globalResult");
        v19 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult searchResult](v19);
        v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = v25[31];

          if ((v26 & 0x80) != 0)
          {
            v22 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v3, "globalResult");
            v19 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPlaceGlobalResult searchResult](v19);
            v23 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = 242;
              goto LABEL_32;
            }
LABEL_39:
            v29 = 0;
            goto LABEL_33;
          }
LABEL_35:
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -8, v9);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_36;
        }
      }
      else
      {
        if (objc_msgSend(v3, "requestType") != 12)
          goto LABEL_35;
        objc_msgSend(v3, "globalResult");
        v19 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult categorySearchResult](v19);
        v27 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = v27[46];

          if ((v28 & 0x10) != 0)
          {
            v22 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v3, "globalResult");
            v19 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPlaceGlobalResult categorySearchResult](v19);
            v23 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = 182;
              goto LABEL_32;
            }
            goto LABEL_39;
          }
          goto LABEL_35;
        }
      }
LABEL_37:
      v23 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v3, "globalResult");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult autocompleteResult](v11);
    v12 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12[26];

      if ((v13 & 0x100) == 0)
        goto LABEL_16;
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "globalResult");
      v11 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceGlobalResult autocompleteResult](v11);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = *(_BYTE *)(v15 + 101) != 0;
      else
        v17 = 0;
      objc_msgSend(v14, "numberWithBool:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("ShouldDisplayNoResults"));

    }
    else
    {
      v16 = 0;
    }

LABEL_16:
    objc_msgSend(v3, "globalResult");
    v19 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult autocompleteResult](v19);
    v20 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20[26];

      if ((v21 & 0x10) != 0)
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "globalResult");
        v19 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult autocompleteResult](v19);
        v23 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = 97;
LABEL_32:
          v29 = v23[v24] != 0;
LABEL_33:
          objc_msgSend(v22, "numberWithBool:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("ShouldEnableRAPForNoResults"));

LABEL_34:
          goto LABEL_35;
        }
        goto LABEL_39;
      }
      goto LABEL_35;
    }
    goto LABEL_37;
  }
  if (v4)
  {
    if (v4 == 5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = CFSTR("Received invalid request status from server");
      v8 = -10;
      goto LABEL_21;
    }
LABEL_20:
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = CFSTR("Received failure status from server");
    v8 = -7;
    goto LABEL_21;
  }
LABEL_36:

  return v5;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 timeout:(double)a5 auditToken:(id)a6 throttleToken:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  GEOLocalTime *v23;
  void *v24;
  GEOLocalTime *v25;
  void *v26;
  NSObject *v27;
  GEOPlaceDataRequestConfig *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v17 = a7;
  v18 = a4;
  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_mapsAbClientMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAbClientMetadata:", v20);

  objc_msgSend(v15, "bundleId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.Maps"));

  if ((_DWORD)v20)
  {
    v23 = [GEOLocalTime alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[GEOLocalTime initWithDate:](v23, "initWithDate:", v24);
    objc_msgSend(v14, "analyticMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRequestTime:", v25);

  }
  GEOFindOrCreateLog("com.apple.greentea", "GEO");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO) && objc_msgSend(v14, "hasGreenTeaWithValue:", 1))
    GEOGreenTeaLog(v27, (uint64_t)"Place Lookup", v15);

  if (GEOConfigGetBOOL(GeoServicesConfig_ValidateSensitiveFieldsAtSend_PlaceRequest, (uint64_t)off_1EDF4DD88)&& GEOPDPlaceRequestHasSensitiveFields(v14, 0))
  {
    objc_msgSend(v14, "clearSensitiveFields:", 0);
  }
  v28 = -[GEOPlaceDataRequestConfig initWithTimeout:request:traits:]([GEOPlaceDataRequestConfig alloc], "initWithTimeout:request:traits:", v14, v18, a5);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __100__GEOPlaceDataRequester_startWithRequest_traits_timeout_auditToken_throttleToken_completionHandler___block_invoke;
  v30[3] = &unk_1E1BFFB70;
  v31 = v16;
  v29 = v16;
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:", v14, v18, v15, v28, v17, 0, v30);

}

void __39__GEOPlaceDataRequester_sharedInstance__block_invoke()
{
  GEOPlaceDataRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOPlaceDataRequester);
  v1 = (void *)qword_1EDF4FC18;
  qword_1EDF4FC18 = (uint64_t)v0;

}

- (GEOPlaceDataRequester)init
{
  GEOPlaceDataRequester *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEOPlaceDataRequester;
  v2 = -[GEOServiceRequester init](&v4, sel_init);
  if (v2)
    -[GEOServiceRequester setOfflineOperationClass:](v2, "setOfflineOperationClass:", objc_opt_class());
  return v2;
}

@end

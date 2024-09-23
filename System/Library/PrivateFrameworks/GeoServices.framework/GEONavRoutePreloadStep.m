@implementation GEONavRoutePreloadStep

- (GEONavRoutePreloadStep)init
{
  return -[GEONavRoutePreloadStep initWithAuditToken:highZoomMetrosAvailabilityFetcher:assetMetadataFetcher:preloaderSignpostID:](self, "initWithAuditToken:highZoomMetrosAvailabilityFetcher:assetMetadataFetcher:preloaderSignpostID:", 0, 0, 0, 0);
}

- (GEONavRoutePreloadStep)initWithAuditToken:(id)a3 highZoomMetrosAvailabilityFetcher:(id)a4 assetMetadataFetcher:(id)a5 preloaderSignpostID:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  GEONavRoutePreloadStep *v14;
  GEONavRoutePreloadStep *v15;
  NSObject *v16;
  GEONavRoutePreloadStep *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GEONavRoutePreloadStep;
  v14 = -[GEONavRoutePreloadStep init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_auditToken, a3);
    objc_storeStrong((id *)&v15->_sprMetrosAvailabilityFetcher, a4);
    objc_storeStrong((id *)&v15->_assetMetadataFetcher, a5);
    v15->_parentSignpostID = a6;
    GEOGetRoutePreloaderLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v15->_signpostID = os_signpost_id_generate(v16);

    v17 = v15;
  }

  return v15;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GEONavRoutePreloadStep: %p> routeIdx:%f loading:%d loaded:%d errCount:%lu lifetimeErrCount:%lu"), self, *(_QWORD *)&self->routeIdx, (*((unsigned __int8 *)self + 76) >> 1) & 1, (*((unsigned __int8 *)self + 76) >> 2) & 1, self->_errorCount, self->_lifetimeErrorCount);
}

- (BOOL)okToLoad
{
  return (*((_BYTE *)self + 76) & 6) == 0 && self->_errorCount == 0;
}

- (BOOL)hasError
{
  return self->_errorCount != 0;
}

- (BOOL)hasLifetimeError
{
  return self->_lifetimeErrorCount != 0;
}

- (void)resetErrors
{
  self->_errorCount = 0;
}

- (double)networkDataRateKB
{
  double v2;
  unint64_t v3;

  v2 = self->endTime - self->startTime;
  HIDWORD(v3) = 1051772663;
  if (v2 < 0.000001)
    return 100000.0;
  LODWORD(v3) = self->bytesLoadedFromNetwork;
  return (double)v3 / 1000.0 / v2;
}

- (void)encounteredErrors:(id)a3
{
  *(int32x2_t *)&self->_errorCount = vadd_s32(*(int32x2_t *)&self->_errorCount, (int32x2_t)0x100000001);
}

- (void)loadWithCallbackQueue:(id)a3 requireWiFi:(BOOL)a4 willLoadHandler:(id)a5 progressHandler:(id)a6 finishedHandler:(id)a7 errorHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t signpostID;
  unint64_t parentSignpostID;
  dispatch_group_t v21;
  uint64_t v22;
  NSMutableDictionary *wantedTiles;
  id v24;
  void *v25;
  GEOTileKeyList *v26;
  GEOTileKeyList *v27;
  NSMutableDictionary *v28;
  GEOTileKeyList *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t (**v34)(_QWORD, _QWORD);
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  GEOSPRMetroAvailabilityFetcher *sprMetrosAvailabilityFetcher;
  GEOMapAssetMetadataFetcher *assetMetadataFetcher;
  GEOTileKeyList *assetMetadataTiles;
  uint64_t v43;
  id v44;
  NSObject *v45;
  id v46;
  GEOTileKeyList *v47;
  id v48;
  id v49;
  NSObject *v50;
  uint64_t (**v51)(_QWORD, _QWORD);
  GEOTileKeyList *v52;
  id v53;
  id v54;
  id v55;
  NSObject *v56;
  NSObject *group;
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v63[5];
  id v64;
  GEOTileKeyList *v65;
  id v66;
  id v67;
  _QWORD block[5];
  GEOTileKeyList *v69;
  id v70;
  NSObject *v71;
  NSObject *v72;
  id v73;
  id v74;
  _BYTE *v75;
  BOOL v76;
  _QWORD v77[4];
  id v78;
  NSObject *v79;
  _BYTE *v80;
  _QWORD v81[4];
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  GEONavRoutePreloadStep *v85;
  uint64_t (**v86)(_QWORD, _QWORD);
  _QWORD v87[4];
  NSObject *v88;
  GEONavRoutePreloadStep *v89;
  GEOTileKeyList *v90;
  id v91;
  NSObject *v92;
  id v93;
  id v94;
  BOOL v95;
  _QWORD v96[5];
  GEOTileKeyList *v97;
  id v98;
  NSObject *v99;
  NSObject *v100;
  id v101;
  id v102;
  uint64_t *v103;
  BOOL v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  BOOL v108;
  _QWORD v109[5];
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  _BYTE buf[24];
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v58 = a7;
  v59 = a8;
  *((_BYTE *)self + 76) |= 2u;
  self->startTime = CFAbsoluteTimeGetCurrent();
  self->bytesLoadedFromNetwork = 0;
  if (self->_assetMetadataFetcher)
    v16 = -[GEOTileKeyList count](self->assetMetadataTiles, "count") != 0;
  else
    v16 = 0;
  GEOGetRoutePreloaderLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    parentSignpostID = self->_parentSignpostID;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = parentSignpostID;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v18, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "PreloadStep", "parent_signpost=%llu", buf, 0xCu);
  }

  v21 = dispatch_group_create();
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v113 = 0;
  v22 = MEMORY[0x1E0C809B0];
  wantedTiles = self->wantedTiles;
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke;
  v109[3] = &unk_1E1C07B70;
  v109[4] = &v110;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wantedTiles, "enumerateKeysAndObjectsUsingBlock:", v109);
  v24 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v25 = (void *)objc_msgSend(v24, "initWithCapacity:", v111[3]);
  v26 = [GEOTileKeyList alloc];
  v27 = -[GEOTileKeyList initWithMaxCapacity:](v26, "initWithMaxCapacity:", v111[3]);
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = v16;
  v28 = self->wantedTiles;
  v96[0] = v22;
  v96[1] = 3221225472;
  v96[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_2;
  v96[3] = &unk_1E1C07B98;
  v103 = &v105;
  v96[4] = self;
  v104 = a4;
  v29 = v27;
  v97 = v29;
  v30 = v25;
  v98 = v30;
  v31 = v13;
  v99 = v31;
  v32 = v21;
  v100 = v32;
  v60 = v14;
  v101 = v60;
  v61 = v15;
  v102 = v61;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v28, "enumerateKeysAndObjectsUsingBlock:", v96);
  if (*((_BYTE *)v106 + 24) && self->_sprMetrosAvailabilityFetcher)
  {
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_3;
    v87[3] = &unk_1E1C07BE8;
    v56 = v31;
    v88 = v56;
    v89 = self;
    v95 = a4;
    v52 = v29;
    v90 = v52;
    v55 = v30;
    v91 = v55;
    v33 = v32;
    v92 = v33;
    v54 = v60;
    v93 = v54;
    v53 = v61;
    v94 = v53;
    v34 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v87);
    if (v16)
      v35 = dispatch_group_create();
    else
      v35 = 0;
    group = v35;
    if (self->_metrosSupported)
    {
      v36 = ((uint64_t (**)(_QWORD, BOOL))v34)[2](v34, self->_metrosSupported == 2);
      if (!v36)
      {
LABEL_24:
        if (v16)
        {
          v51 = v34;
          dispatch_group_enter(v33);
          dispatch_group_enter(v35);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v115 = __Block_byref_object_copy__28;
          v116 = __Block_byref_object_dispose__28;
          v117 = 0;
          assetMetadataFetcher = self->_assetMetadataFetcher;
          v50 = v33;
          assetMetadataTiles = self->assetMetadataTiles;
          v43 = MEMORY[0x1E0C809B0];
          v77[0] = MEMORY[0x1E0C809B0];
          v77[1] = 3221225472;
          v77[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_9;
          v77[3] = &unk_1E1C07C38;
          v44 = v55;
          v78 = v44;
          v80 = buf;
          v45 = v35;
          v79 = v45;
          -[GEOMapAssetMetadataFetcher fetchAssetMetadataForMetadataKeys:callbackQueue:completionHandler:](assetMetadataFetcher, "fetchAssetMetadataForMetadataKeys:callbackQueue:completionHandler:", assetMetadataTiles, v56, v77);
          block[0] = v43;
          block[1] = 3221225472;
          block[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_11;
          block[3] = &unk_1E1C07C60;
          block[4] = self;
          v75 = buf;
          v76 = a4;
          v69 = v52;
          v70 = v44;
          v71 = v56;
          v72 = v50;
          v73 = v54;
          v74 = v53;
          dispatch_group_notify(v45, v71, block);

          v34 = v51;
          _Block_object_dispose(buf, 8);

          v35 = group;
        }

        goto LABEL_27;
      }
      GEOGetRoutePreloaderLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = "NO";
        if (self->_metrosSupported == 2)
          v38 = "YES";
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v36;
        _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_DEBUG, "[NavStrategy] Feature availability is known: %s. Loading %llu relevant tiles", buf, 0x16u);
      }
    }
    else
    {
      GEOGetRoutePreloaderLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v39, OS_LOG_TYPE_DEBUG, "[NavStrategy] Some tiles are conditional on feature availability. Determining availability for step", buf, 2u);
      }

      dispatch_group_enter(v33);
      if (group)
        dispatch_group_enter(group);
      sprMetrosAvailabilityFetcher = self->_sprMetrosAvailabilityFetcher;
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_7;
      v81[3] = &unk_1E1C07C10;
      v82 = v55;
      v83 = v33;
      v84 = group;
      v85 = self;
      v86 = v34;
      -[GEOSPRMetroAvailabilityFetcher determineAvailabilityForCoordinate:callbackQueue:completionHandler:](sprMetrosAvailabilityFetcher, "determineAvailabilityForCoordinate:callbackQueue:completionHandler:", v56, v81, self->coord.latitude, self->coord.longitude);

      v37 = v82;
    }

    v35 = group;
    goto LABEL_24;
  }
LABEL_27:
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_13;
  v63[3] = &unk_1E1C07C88;
  v63[4] = self;
  v64 = v30;
  v65 = v29;
  v66 = v59;
  v67 = v58;
  v46 = v58;
  v47 = v29;
  v48 = v59;
  v49 = v30;
  dispatch_group_notify(v32, v31, v63);

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v110, 8);

}

uint64_t __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(a2, "unsignedIntegerValue") & 3) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  else
    objc_msgSend(*(id *)(a1 + 32), "_loadTiles:requireWiFi:unsuccessfulKeysAccumulator:errorsAccumulator:queue:group:willLoadHandler:progressHandler:", v5, *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

uint64_t __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_4;
  v8[3] = &unk_1E1C07BC0;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(v3 + 32);
  v8[1] = 3221225472;
  v16 = a2;
  v15 = &v18;
  v8[4] = v3;
  v17 = *(_BYTE *)(a1 + 88);
  v9 = v4;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 80);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  char v5;
  id v6;

  v6 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if ((v5 & 1) != 0 && *(_BYTE *)(a1 + 96) || (v5 & 2) != 0 && !*(_BYTE *)(a1 + 96))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += objc_msgSend(v6, "count");
    objc_msgSend(*(id *)(a1 + 32), "_loadTiles:requireWiFi:unsuccessfulKeysAccumulator:errorsAccumulator:queue:group:willLoadHandler:progressHandler:", v6, *(unsigned __int8 *)(a1 + 97), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  }

}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  char *v5;
  NSObject *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    GEOGetRoutePreloaderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "[NavStrategy] Failed to determine feature availability: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    if (a2)
      v7 = 2;
    else
      v7 = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 56) + 112) = v7;
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    GEOGetRoutePreloaderLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = "NO";
      if (a2)
        v10 = "YES";
      v12 = 136315394;
      v13 = v10;
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "[NavStrategy] Determined feature availability: %s. Loading %llu relevant tiles", (uint8_t *)&v12, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  v11 = *(NSObject **)(a1 + 48);
  if (v11)
    dispatch_group_leave(v11);

}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    GEOGetRoutePreloaderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "[NavStrategy] Failed to determine assets to preload: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 112))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "keysForMetroAvailability:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 112) == 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");
    GEOGetRoutePreloaderLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        v7 = objc_msgSend(v2, "count");
        _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "[NavStrategy] Loading %llu relevant assets", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_loadTiles:requireWiFi:unsuccessfulKeysAccumulator:errorsAccumulator:queue:group:willLoadHandler:progressHandler:", v2, *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "[NavStrategy] Step requires no external assets", buf, 2u);
      }

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) &= ~2u;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = objc_msgSend(*(id *)(a1 + 40), "count");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(v5 + 76);
  if (v4)
  {
    *(_BYTE *)(v5 + 76) = v6 & 0xFB;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    *(_BYTE *)(v5 + 76) = v6 | 4;
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 56) = CFAbsoluteTimeGetCurrent();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  GEOGetRoutePreloaderLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v9 + 128);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v11 = *(unsigned int *)(v9 + 64);
    v12 = 134349056;
    v13 = v11;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PreloadStep", "BytesDownloaded=%{public}llu", (uint8_t *)&v12, 0xCu);
  }

}

- (void)_loadTiles:(id)a3 requireWiFi:(BOOL)a4 unsuccessfulKeysAccumulator:(id)a5 errorsAccumulator:(id)a6 queue:(id)a7 group:(id)a8 willLoadHandler:(id)a9 progressHandler:(id)a10
{
  _BOOL4 v14;
  id v16;
  NSObject *v17;
  unsigned int (**v18)(id, _QWORD);
  uint64_t v19;
  GEOTileKeyList *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  _BYTE *v24;
  void *v25;
  GEOApplicationAuditToken *auditToken;
  unsigned int (**v27)(id, _QWORD);
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  GEOApplicationAuditToken *v46;
  _BOOL4 v47;
  GEONavRoutePreloadStep *v48;
  id obj;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  GEOTileKeyList *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  NSObject *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  GEONavRoutePreloadStep *v72;
  NSObject *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v14 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v16 = a5;
  v56 = a6;
  v58 = a7;
  v17 = a8;
  v18 = (unsigned int (**)(id, _QWORD))a9;
  v55 = a10;
  GEOTileLoaderClientIdentifier(self);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v14;
  v19 = 519;
  if (v14)
    v19 = 527;
  v53 = (id)v19;
  v20 = objc_alloc_init(GEOTileKeyList);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v50;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v21)
  {
    v22 = v21;
    v51 = *(_QWORD *)v76;
    v48 = self;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v76 != v51)
          objc_enumerationMutation(obj);
        v24 = *(_BYTE **)(*((_QWORD *)&v75 + 1) + 8 * i);
        if (!v18 || v18[2](v18, *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i)))
        {
          dispatch_group_enter(v17);
          +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          auditToken = self->_auditToken;
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke;
          v69[3] = &unk_1E1C07CB0;
          v70 = v56;
          v71 = v16;
          v72 = self;
          v74 = v55;
          v73 = v17;
          objc_msgSend(v25, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", v24, 0x3FFFFFFFLL, v57, v53, 3, auditToken, v58, 0, v69);

          if ((*v24 & 0x7F) == 2)
          {
            v27 = v18;
            v28 = v16;
            v29 = v22;
            +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "activeTileGroup");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E1E81088);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "regionalResourceKeysForTileKey:scale:scenarios:", v24, 0, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v34 = v33;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v66;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v66 != v37)
                    objc_enumerationMutation(v34);
                  -[GEOTileKeyList addKey:](v20, "addKey:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
              }
              while (v36);
            }

            v22 = v29;
            v16 = v28;
            v18 = v27;
            self = v48;
          }

        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v22);
  }
  v52 = v16;

  v63 = 0u;
  v64 = 0u;
  if (v47)
    v39 = 523;
  else
    v39 = 515;
  v61 = 0uLL;
  v62 = 0uLL;
  v54 = v20;
  v40 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v62 != v42)
          objc_enumerationMutation(v54);
        v44 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
        dispatch_group_enter(v17);
        +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = self->_auditToken;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke_19;
        v59[3] = &unk_1E1C07CD8;
        v60 = v17;
        objc_msgSend(v45, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", v44, 0x3FFFFFFFLL, v57, v39, 3, v46, v58, 0, v59);

      }
      v41 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    }
    while (v41);
  }

}

void __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, void *a6)
{
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a5;
  objc_msgSend(a6, "objectForKey:", CFSTR("GEOTileLoadResultSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
    objc_msgSend(*(id *)(a1 + 40), "addKey:", a2);
  }
  else if (v11 == 2)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 64) += a4;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke_19(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)cancel
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t signpostID;
  uint64_t bytesLoadedFromNetwork;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 76) & 2) != 0)
  {
    GEOTileLoaderClientIdentifier(self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelAllForClient:", v3);

    *((_BYTE *)self + 76) &= ~2u;
    GEOGetRoutePreloaderLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      bytesLoadedFromNetwork = self->bytesLoadedFromNetwork;
      v9 = 134349056;
      v10 = bytesLoadedFromNetwork;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v6, OS_SIGNPOST_INTERVAL_END, signpostID, "PreloadStep", "Result=Canceled BytesDownloaded=%{public}llu", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_sprMetrosAvailabilityFetcher, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->assetMetadataTiles, 0);
  objc_storeStrong((id *)&self->wantedTiles, 0);
}

@end

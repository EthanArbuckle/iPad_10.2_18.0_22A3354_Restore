@implementation GEOSPRMetroAvailabilityFetcher

- (GEOSPRMetroAvailabilityFetcher)init
{
  return -[GEOSPRMetroAvailabilityFetcher initWithTileLoader:auditToken:](self, "initWithTileLoader:auditToken:", 0, 0);
}

- (GEOSPRMetroAvailabilityFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4
{
  return -[GEOSPRMetroAvailabilityFetcher initWithTileLoader:auditToken:forceDisableMetros:](self, "initWithTileLoader:auditToken:forceDisableMetros:", a3, a4, 0);
}

- (GEOSPRMetroAvailabilityFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4 forceDisableMetros:(BOOL)a5
{
  id v8;
  id v9;
  GEOSPRMetroAvailabilityFetcher *v10;
  GEOTileLoader *v11;
  GEOTileLoader *tileLoader;
  uint64_t v13;
  geo_isolater *isolation;
  GEOSPRMetroAvailabilityFetcher *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOSPRMetroAvailabilityFetcher;
  v10 = -[GEOSPRMetroAvailabilityFetcher init](&v17, sel_init);
  if (v10)
  {
    if (v8)
    {
      v11 = (GEOTileLoader *)v8;
    }
    else
    {
      +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
      v11 = (GEOTileLoader *)objc_claimAutoreleasedReturnValue();
    }
    tileLoader = v10->_tileLoader;
    v10->_tileLoader = v11;

    objc_storeStrong((id *)&v10->_auditToken, a4);
    v13 = geo_isolater_create();
    isolation = v10->_isolation;
    v10->_isolation = (geo_isolater *)v13;

    v10->_forceDisableMetros = a5;
    v15 = v10;
  }

  return v10;
}

- (void)determineAvailabilityForCoordinate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  NSObject *v9;
  id v10;
  void *v11;
  _BOOL4 forceDisableMetros;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  char v19;
  char v20;
  uint64_t v21;
  unsigned int v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  GEOTileLoader *tileLoader;
  GEOApplicationAuditToken *auditToken;
  _QWORD v33[5];
  id v34;
  double v35;
  double v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD block[5];
  id v42;
  __int128 *v43;
  double v44;
  double v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(_QWORD *);
  void *v50;
  GEOSPRMetroAvailabilityFetcher *v51;
  __int128 *v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  __int128 v59;
  uint64_t v60;

  var1 = a3.var1;
  var0 = a3.var0;
  v60 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "supportsAdvancedMap"))
  {

    goto LABEL_11;
  }
  forceDisableMetros = self->_forceDisableMetros;

  if (forceDisableMetros)
  {
LABEL_11:
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke;
    v39[3] = &unk_1E1C05D48;
    v40 = v10;
    dispatch_async(v9, v39);
    v15 = v40;
    goto LABEL_12;
  }
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeTileGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeTileSetForStyle:size:scale:", 61, 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v15, "availableTilesCount"))
  {
    v16 = GEOTilePointForCoordinate(var0, var1, 20.0);
    v18 = v17;
    v19 = objc_msgSend(v15, "maximumZoomLevelForMapPoint:");
    v20 = objc_msgSend(v15, "size");
    v21 = objc_msgSend(v15, "scale");
    v22 = objc_msgSend(v15, "style");
    v23 = (double)(1 << v19) * 0.0000000037252903;
    v24 = vcvtmd_u64_f64(v16 * v23) | 0x3E30000000000000;
    *(_QWORD *)((char *)&v54 + 1) = (v24 << 46) | ((unint64_t)(v19 & 0x3F) << 40);
    LOBYTE(v54) = 2;
    *((_QWORD *)&v26 + 1) = ((unint64_t)(vcvtmd_u64_f64(v18 * v23) & 0x3FFFFFF) << 8) | (v24 >> 18) | ((unint64_t)(v22 & 0x3FFF) << 34) | ((unint64_t)(v20 & 0xF) << 48) | (v21 << 52);
    *(_QWORD *)&v26 = v24 << 46;
    v25 = v26 >> 56;
    if (v22 <= 0x19 && ((1 << v22) & 0x200101C) != 0)
      v27 = 128;
    else
      v27 = (unint64_t)(v22 == 26) << 7;
    *(_QWORD *)&v59 = v27 | v54 & 0xFFFFFFFFFFFFFF7FLL;
    *((_QWORD *)&v59 + 1) = v25;
    *(_QWORD *)&v54 = 0;
    *((_QWORD *)&v54 + 1) = &v54;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__60;
    v57 = __Block_byref_object_dispose__60;
    v58 = 0;
    v28 = MEMORY[0x1E0C809B0];
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_4;
    v50 = &unk_1E1C05BB8;
    v53 = v59;
    v51 = self;
    v52 = &v54;
    geo_isolate_sync_data();
    if (*(_QWORD *)(*((_QWORD *)&v54 + 1) + 40))
    {
      block[0] = v28;
      block[1] = 3221225472;
      block[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2_5;
      block[3] = &unk_1E1C0F560;
      v44 = var0;
      v45 = var1;
      block[4] = self;
      v43 = &v54;
      v46 = v59;
      v42 = v10;
      dispatch_async(v9, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      GEOTileLoaderClientIdentifier(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      auditToken = self->_auditToken;
      tileLoader = self->_tileLoader;
      v33[0] = v28;
      v33[1] = 3221225472;
      v33[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_3;
      v33[3] = &unk_1E1C0F5B0;
      v33[4] = self;
      v34 = v10;
      v35 = var0;
      v36 = var1;
      -[GEOTileLoader loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:](tileLoader, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", &v59, 2147483646, v30, 3, 4, auditToken, v9, 0, v33);

    }
    _Block_object_dispose(&v54, 8);

  }
  else
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2;
    v37[3] = &unk_1E1C05D48;
    v38 = v10;
    dispatch_async(v9, v37);

  }
LABEL_12:

}

uint64_t __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_4(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)a1[4];
  v2 = (void *)v1[7];
  if (v2)
  {
    v4 = v1[5];
    v3 = v1[6];
    if (v4 == a1[6] && v3 == a1[7])
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v2);
  }
}

uint64_t __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2_5(uint64_t a1)
{
  -[GEOSPRMetroAvailabilityFetcher _determineAvailabilityForCoordinate:fromMetadataTile:metadataTileKey:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a1 + 72, *(double *)(a1 + 56), *(double *)(a1 + 64));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (uint64_t)_determineAvailabilityForCoordinate:(uint64_t)a3 fromMetadataTile:(double)a4 metadataTileKey:(double)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t v24[16];

  v9 = a2;
  v10 = v9;
  if (!a1)
    goto LABEL_15;
  v11 = objc_msgSend(v9, "daVinciMetaData");
  v12 = v11;
  if (!v11 || !*(_WORD *)(v11 + 8))
    goto LABEL_15;
  v13 = GEOTilePointForCoordinate(a4, a5, 20.0);
  v15 = v14;
  v16 = GEOMapRectForGEOTileKey(a3);
  v20 = 0;
  if (fabs(v16) != INFINITY && fabs(v17) != INFINITY && v13 >= v16 && v13 < v16 + v18 && v15 >= v17 && v15 < v17 + v19)
  {
    v21 = *(unsigned __int16 *)(v12 + 8);
    v22 = vcvtmd_u64_f64((v13 - v16) / v18 * (double)v21)
        + vcvtmd_u64_f64((v15 - v17) / v19 * (double)v21) * v21;
    if (v22 < (v21 * v21))
    {
      v20 = (*(unsigned __int8 *)(*(_QWORD *)(v12 + 24) + v22) >> 1) & 1;
      goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: cellIndex < metadata->size * metadata->size", v24, 2u);
    }
LABEL_15:
    v20 = 0;
  }
LABEL_12:

  return v20;
}

void __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  GEOVectorTile *v10;
  GEOVectorTile *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(v8, "decodedRepresentation");
    v10 = (GEOVectorTile *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_4;
    v17 = 0;
    objc_msgSend(v8, "readDataWithError:", &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (GEOVectorTile *)v17;
    if (!v15)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_5;
    }
    v10 = -[GEOVectorTile initWithVMP4:localizationData:tileKey:]([GEOVectorTile alloc], "initWithVMP4:localizationData:tileKey:", v15, 0, a2);

    if (v10)
    {
LABEL_4:
      v11 = v10;
      geo_isolate_sync_data();
      v12 = -[GEOSPRMetroAvailabilityFetcher _determineAvailabilityForCoordinate:fromMetadataTile:metadataTileKey:](*(_QWORD *)(a1 + 32), v11, a2, *(double *)(a1 + 48), *(double *)(a1 + 56));
      (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v12, 0, v13, v14);

    }
    else
    {
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Missing metadata tile"));
      v11 = (GEOVectorTile *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, GEOVectorTile *))(v16 + 16))(v16, 0, v11);
    }
LABEL_5:

    goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_6:

}

void __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_OWORD *)*(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoadedTile, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end

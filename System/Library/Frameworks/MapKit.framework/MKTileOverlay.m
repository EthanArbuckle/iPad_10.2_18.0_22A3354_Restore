@implementation MKTileOverlay

- (void)_assignProviderID
{
  self->_providerID = +[_MKOverlayTileRequester registerDataSource:](_MKOverlayTileRequester, "registerDataSource:", self);
}

- (MKTileOverlay)init
{
  return -[MKTileOverlay initWithURLTemplate:](self, "initWithURLTemplate:", 0);
}

- (MKTileOverlay)initWithURLTemplate:(NSString *)URLTemplate
{
  NSString *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v4 = URLTemplate;
  v21.receiver = self;
  v21.super_class = (Class)MKTileOverlay;
  v5 = -[MKTileOverlay init](&v21, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    objc_msgSend(v5, "_assignProviderID");
    *((int64x2_t *)v5 + 1) = vdupq_n_s64(0x4070000000000000uLL);
    v5[32] = 0;
    *(_OWORD *)(v5 + 40) = xmmword_18B2AEF60;
    v8 = objc_alloc_init(MEMORY[0x1E0D275B8]);
    v9 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v8;

    objc_msgSend(*((id *)v5 + 8), "setMaxCapacity:", 512);
    objc_msgSend(*((id *)v5 + 8), "setMaxCost:", 0x400000);
    v10 = objc_alloc_init(MEMORY[0x1E0D275B8]);
    v11 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v10;

    objc_msgSend(*((id *)v5 + 9), "setMaxCapacity:", -1);
    objc_msgSend(*((id *)v5 + 9), "setMaxCost:", -1);
    v12 = geo_isolater_create();
    v13 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v12;

    v14 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
    v15 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v14;

    objc_initWeak(&location, v5);
    v16 = *((_QWORD *)v5 + 12);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __37__MKTileOverlay_initWithURLTemplate___block_invoke;
    v18[3] = &unk_1E20DF4A8;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v16, v18);
    dispatch_activate(*((dispatch_object_t *)v5 + 12));
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return (MKTileOverlay *)v5;
}

void __37__MKTileOverlay_initWithURLTemplate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_receivedMemoryNotification");

}

- (void)dealloc
{
  NSObject *minimumLifetimeTileCacheEvictionTimer;
  objc_super v4;

  +[_MKOverlayTileRequester unregisterDataSource:](_MKOverlayTileRequester, "unregisterDataSource:", self->_providerID);
  dispatch_source_cancel((dispatch_source_t)self->_memoryNotificationEventSource);
  minimumLifetimeTileCacheEvictionTimer = self->_minimumLifetimeTileCacheEvictionTimer;
  if (minimumLifetimeTileCacheEvictionTimer)
    dispatch_source_cancel(minimumLifetimeTileCacheEvictionTimer);
  v4.receiver = self;
  v4.super_class = (Class)MKTileOverlay;
  -[MKTileOverlay dealloc](&v4, sel_dealloc);
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  v2 = 268435456.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 268435456.0;
  result.var1.var1 = v5;
  result.var1.var0 = v2;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v4;
  CLLocationCoordinate2D result;

  v4 = CLLocationCoordinate2DMake(0.0, 0.0);
  longitude = v4.longitude;
  latitude = v4.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSURL)URLForTilePath:(MKTileOverlayPath *)path
{
  NSMutableString *v4;
  CGFloat contentScaleFactor;
  NSMutableString *v6;
  void *v7;
  void *v8;

  v4 = (NSMutableString *)-[NSString mutableCopy](self->_URLTemplate, "mutableCopy");
  fillTemplate(v4, CFSTR("{x}"), path->x);
  fillTemplate(v4, CFSTR("{y}"), path->y);
  fillTemplate(v4, CFSTR("{z}"), path->z);
  contentScaleFactor = path->contentScaleFactor;
  v6 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&contentScaleFactor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{scale}"), v7, 0, 0, -[NSMutableString length](v6, "length"));

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (void)loadTileAtPath:(MKTileOverlayPath *)path result:(void *)result
{
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _OWORD v17[2];

  v6 = result;
  v7 = *(_OWORD *)&path->z;
  v17[0] = *(_OWORD *)&path->x;
  v17[1] = v7;
  -[MKTileOverlay URLForTilePath:](self, "URLForTilePath:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v8, 1, 120.0);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__MKTileOverlay_loadTileAtPath_result___block_invoke;
  v14[3] = &unk_1E20DF4D0;
  v14[4] = self;
  v11 = v8;
  v15 = v11;
  v12 = v6;
  v16 = v12;
  objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v9, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

}

void __39__MKTileOverlay_loadTileAtPath_result___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
    NSLog(CFSTR("%@: Error loading URL %@: %@"), a1[4], a1[5], v8);
  (*(void (**)(void))(a1[6] + 16))();

}

- (uint64_t)_keyForPath:(uint64_t)a3
{
  double v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[9];

  v5 = *(double *)(a3 + 24);
  +[_MKOverlayTileRequester tileProviderIdentifier](_MKOverlayTileRequester, "tileProviderIdentifier");
  *(_WORD *)v10 = GEOTileKeyMakeEmpty();
  v6 = v10[1] & 0x3F | (*(_DWORD *)a3 << 6);
  if (objc_msgSend(a1, "isGeometryFlipped"))
  {
    v7 = *(_QWORD *)(a3 + 16);
    v8 = ~*(_QWORD *)(a3 + 8) + (1 << v7);
    if (v8 < 0)
      v8 = -v8;
  }
  else
  {
    v8 = *(_QWORD *)(a3 + 8);
    v7 = *(_QWORD *)(a3 + 16);
  }
  *(_QWORD *)&v10[1] = v7 & 0x3F | ((unint64_t)v5 << 58) | v6 & 0xFFFFFFC0 | ((unint64_t)(v8 & 0x3FFFFFF) << 32) & 0x3FFFFFFFFFFFFC0;
  return *(_QWORD *)v10;
}

- (void)_loadTile:(uint64_t)a3 result:(void *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  _MKOverlayTileLoader();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileLoaderClientIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__MKTileOverlay__loadTile_result___block_invoke;
  v10[3] = &unk_1E20DF4F8;
  v10[4] = a1;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v7, "loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:", a3, 2147483646, v8, 3, 1, MEMORY[0x1E0C80D38], 0, v10);

}

void __34__MKTileOverlay__loadTile_result___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a5;
  v11 = a6;
  if (v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTile:forKey:cost:", v12, a2, objc_msgSend(v12, "length"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setTile:forKey:cost:", v12, a2, 0);
    objc_msgSend(*(id *)(a1 + 32), "_scheduleMinLifetimeCacheCleanupIfNecessary");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_receivedMemoryNotification
{
  -[GEOTileCache removeAllObjects](self->_minimumLifetimeTileCache, "removeAllObjects");
}

- (void)_scheduleMinLifetimeCacheCleanupIfNecessary
{
  geo_isolate_sync();
}

void __60__MKTileOverlay__scheduleMinLifetimeCacheCleanupIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id location;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 88))
  {
    *(_BYTE *)(v1 + 104) = 1;
  }
  else
  {
    objc_initWeak(&location, (id)v1);
    objc_copyWeak(&v6, &location);
    v3 = geo_dispatch_timer_create_on_qos();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

    dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 88));
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __60__MKTileOverlay__scheduleMinLifetimeCacheCleanupIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_minLifetimeCacheCleanupFired");

}

- (void)_minLifetimeCacheCleanupFired
{
  uint64_t v3;
  GEOTileCache *minimumLifetimeTileCache;
  uint64_t v5;
  _QWORD v6[11];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v6[5] = MEMORY[0x1E0C809B0];
  v6[6] = 3221225472;
  v6[7] = __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke;
  v6[8] = &unk_1E20DF520;
  v6[9] = self;
  v6[10] = &v7;
  geo_isolate_sync();
  GEOMachAbsoluteTimeGetCurrent();
  minimumLifetimeTileCache = self->_minimumLifetimeTileCache;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke_2;
  v6[3] = &__block_descriptor_40_e739_B32__0r___GEOTileKey_b7b1_____GEOStandardTileKey_b40b6b26b26b14b4b4___GEOGloriaQuadIDTileKey_b6b64b14b4______b10b10b12_I____GEORegionalResourceKey_b32b8b6b8b8b1b57___GEOSputnikMetadataKey_b32b24b14b8b42___GEOFlyoverKey_b6b26b26b8b24b14b8b8___GEOTransitLineSelectionKey_b6b25b25b64___GEOPolygonSelectionKey_b6b25b25b64___GEORoadSelectionKey_b6b25b25b64___GEOContourLinesKey_b6b26b26b4b8b50___GEOTileOverlayKey_b6b26b26b8b32b16b6___GEOIdentifiedResourceKey_QCCb1b39___GEOMuninMeshKey_b64b32b16b5b3___GEOVisualLocalizationTrackKey_SCb16b6b26b26b22___GEOVisualLocalizationMetadataKey_b6b9b25b6b26b26b22___GEOVisualLocalizationDataKey_QCb5b21b21b1___GEOS2TileKey_b6b26b26b3b14b4b4b37___GEOLiveTileKey_b6b26b26b14b4b4b4b36___8__GEOTileData_16d24l;
  v6[4] = v5;
  -[GEOTileCache removeTilesMatchingPredicate:](minimumLifetimeTileCache, "removeTilesMatchingPredicate:", v6);
  if (*((_BYTE *)v8 + 24))
    -[MKTileOverlay _scheduleMinLifetimeCacheCleanupIfNecessary](self, "_scheduleMinLifetimeCacheCleanupIfNecessary");
  _Block_object_dispose(&v7, 8);
}

void __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 88);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v2 + 104);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
}

BOOL __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke_2(uint64_t a1, double a2)
{
  double v2;

  v2 = *(double *)(a1 + 32) - a2;
  if (v2 < 0.0)
    v2 = -v2;
  return v2 > 10.0;
}

- (int)_zoomLevelForScale:(double)a3
{
  double v4;
  int v5;
  int v6;

  -[MKTileOverlay tileSize](self, "tileSize");
  v5 = (int)log2(268435456.0 / v4);
  v6 = v5 + vcvtmd_s64_f64(log2(a3) + 0.5);
  return v6 & ~(v6 >> 31);
}

- (id)_tilesInMapRect:(id)a3 zoomScale:(double)a4 contentScale:(double)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double height;
  double width;
  signed int v22;
  signed int v23;
  uint64_t v24;
  int v25;
  int v26;
  _BOOL4 v27;
  int v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  MKTileOverlayTile *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  double v42;
  signed int v43;
  signed int v44;
  id v45;
  double v47;
  double v48;
  _QWORD v49[4];
  _QWORD v50[4];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  MKMapRect v54;
  MKMapRect v55;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v53 = *MEMORY[0x1E0C80C00];
  v11 = -[MKTileOverlay _zoomLevelForScale:](self, "_zoomLevelForScale:", a4);
  -[MKTileOverlay boundingMapRect](self, "boundingMapRect");
  v47 = v13;
  v48 = v12;
  v15 = v14;
  v17 = v16;
  if (-[MKTileOverlay minimumZ](self, "minimumZ") <= v11
    && (v18 = v11, -[MKTileOverlay maximumZ](self, "maximumZ") >= v11))
  {
    v42 = v8;
    width = self->_tileSize.width;
    height = self->_tileSize.height;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v22 = vcvtmd_s64_f64(v9 * a4 / width);
    v23 = vcvtmd_s64_f64((v9 + var0) * a4 / width);
    if (v22 <= v23)
    {
      v44 = vcvtmd_s64_f64(v42 * a4 / height);
      v24 = v22;
      v41 = v23 + 1;
      v43 = vcvtmd_s64_f64((v42 + var1) * a4 / height);
      v25 = (-1 << v11) + 1;
      do
      {
        if (v44 <= v43)
        {
          v26 = v44;
          do
          {
            v27 = -[MKTileOverlay isGeometryFlipped](self, "isGeometryFlipped");
            v28 = v25 + v26;
            if (v25 + v26 < 0)
              v28 = -v28;
            if (v27)
              v29 = v28;
            else
              v29 = v26;
            v30 = self->_tileSize.width;
            v31 = self->_tileSize.height;
            v32 = v30 * (double)(int)v24 / a4;
            v33 = v31 * (double)v26 / a4;
            v34 = v30 / a4;
            v35 = v31 / a4;
            v54.origin.x = v32;
            v54.origin.y = v33;
            v54.size.width = v34;
            v54.size.height = v35;
            v55.origin.y = v47;
            v55.origin.x = v48;
            v55.size.width = v15;
            v55.size.height = v17;
            if (MKMapRectIntersectsRect(v54, v55))
            {
              v36 = objc_alloc_init(MKTileOverlayTile);
              -[MKTileOverlayTile setFrame:](v36, "setFrame:", v32, v33, v34, v35);
              -[MKTileOverlayTile setScale:](v36, "setScale:", a4);
              v50[0] = v24;
              v50[1] = v29;
              v50[2] = v18;
              *(double *)&v50[3] = a5;
              -[MKTileOverlayTile setPath:](v36, "setPath:", v50);
              v51 = 0;
              v52 = 0;
              v49[0] = v24;
              v49[1] = v29;
              v49[2] = v18;
              *(double *)&v49[3] = a5;
              v51 = (uint64_t)-[MKTileOverlay _keyForPath:](self, "_keyForPath:", v49);
              v52 = v37;
              _MKOverlayTileLoader();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "cachedTileForKey:", &v51);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "data");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[MKTileOverlayTile setImage:](v36, "setImage:", v40);

              objc_msgSend(v45, "addObject:", v36);
            }
            ++v26;
          }
          while (v43 + 1 != v26);
        }
        ++v24;
      }
      while (v41 != (_DWORD)v24);
    }
  }
  else
  {
    v45 = 0;
  }
  return v45;
}

- (void)_flushCaches
{
  void *v3;

  _MKOverlayTileLoader();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAllCaches");

  -[GEOTileCache removeAllObjects](self->_tileCache, "removeAllObjects");
  -[GEOTileCache removeAllObjects](self->_minimumLifetimeTileCache, "removeAllObjects");
}

- (CGSize)tileSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_tileSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTileSize:(CGSize)tileSize
{
  CGSize v3;

  v3 = tileSize;
  objc_copyStruct(&self->_tileSize, &v3, 16, 1, 0);
}

- (NSString)URLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isGeometryFlipped
{
  return self->_geometryFlipped;
}

- (void)setGeometryFlipped:(BOOL)geometryFlipped
{
  self->_geometryFlipped = geometryFlipped;
}

- (NSInteger)minimumZ
{
  return self->_minimumZ;
}

- (void)setMinimumZ:(NSInteger)minimumZ
{
  self->_minimumZ = minimumZ;
}

- (NSInteger)maximumZ
{
  return self->_maximumZ;
}

- (void)setMaximumZ:(NSInteger)maximumZ
{
  self->_maximumZ = maximumZ;
}

- (BOOL)canReplaceMapContent
{
  return self->_canReplaceMapContent;
}

- (void)setCanReplaceMapContent:(BOOL)canReplaceMapContent
{
  self->_canReplaceMapContent = canReplaceMapContent;
}

- (unsigned)_providerID
{
  return self->_providerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_minimumLifetimeTileCacheEvictionTimer, 0);
  objc_storeStrong((id *)&self->_minimumLifetimeTileCacheEvictionTimerIsolation, 0);
  objc_storeStrong((id *)&self->_minimumLifetimeTileCache, 0);
  objc_storeStrong((id *)&self->_tileCache, 0);
  objc_storeStrong((id *)&self->_URLTemplate, 0);
}

@end

@implementation MKMapSnapshotOptions

- ($F9C4767691F2EDF2F3162F5FE7B1523A)_resolvedCartographicConfigurationWithAuditToken:(SEL)a3
{
  id v6;
  int v7;
  _BOOL4 v8;
  MKMapElevationStyle v9;
  _BOOL4 v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  int64_t var3;
  unsigned int BOOL;
  uint64_t v20;
  int64_t v21;
  $F9C4767691F2EDF2F3162F5FE7B1523A *result;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_QWORD *)&retstr->var6 = 0;
  +[MKMapConfiguration _cartographicConfigurationForMapConfiguration:](MKMapConfiguration, "_cartographicConfigurationForMapConfiguration:", self->_preferredConfiguration);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((MapKitFeature_IsEnabled_SPRForMapSnapshots() & 1) != 0)
    {
      v7 = -[MKMapConfiguration _allowsTerrainModePromotion](self->_preferredConfiguration, "_allowsTerrainModePromotion");
      v8 = -[MKMapSnapshotOptions _overlaysRequireModernMap](self, "_overlaysRequireModernMap");
      if (v7)
      {
        v9 = -[MKMapConfiguration elevationStyle](self->_preferredConfiguration, "elevationStyle");
        v7 = _MKLinkedOnOrAfterReleaseSet(3595);
        if (v9 == MKMapElevationStyleRealistic)
        {
          v10 = -[MKMapSnapshotOptions _overlaysSupportElevation](self, "_overlaysSupportElevation");
          v11 = 1;
          if (!v6)
          {
LABEL_6:
            objc_msgSend(MEMORY[0x1E0D26EF8], "currentProcessAuditToken");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_10;
          }
LABEL_9:
          v12 = v6;
LABEL_10:
          v13 = v12;
          v14 = (void *)MEMORY[0x1E0D272C0];
          objc_msgSend(v12, "offlineCohortId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "activeStateForCohortId:", v15);

          if (v16 >= 2u)
          {
            if (v16 == 2)
            {
              retstr->var2 = 0;
              retstr->var3 = 0;
LABEL_24:

              goto LABEL_25;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              v23[0] = 67109120;
              v23[1] = v16;
              _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v23, 8u);
            }
          }
          var3 = retstr->var3;
          BOOL = GEOConfigGetBOOL();
          v20 = 3;
          if (!v7)
            v20 = var3;
          if ((v11 & v10) != 0)
            v20 = 1;
          if (v8 | BOOL)
            v21 = BOOL;
          else
            v21 = v20;
          retstr->var3 = v21;
          goto LABEL_24;
        }
      }
    }
    else
    {
      v8 = -[MKMapSnapshotOptions _overlaysRequireModernMap](self, "_overlaysRequireModernMap");
      v7 = 0;
    }
    v11 = 0;
    v10 = 0;
    if (!v6)
      goto LABEL_6;
    goto LABEL_9;
  }
LABEL_25:

  return result;
}

- (BOOL)_overlaysRequireModernMap
{
  void *v2;
  BOOL v3;

  -[MKMapSnapshotOptions _allOverlays](self, "_allOverlays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MKStandardMapConfiguration _overlaysRequireModernMap:](MKStandardMapConfiguration, "_overlaysRequireModernMap:", v2);

  return v3;
}

- (id)_allOverlays
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MKMapSnapshotOptions _allOverlayRenderers](self, "_allOverlayRenderers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "overlay");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_allOverlayRenderers
{
  void *v3;
  void *v4;
  void *v5;

  -[MKMapSnapshotOptions _overlayRenderersForOverlayLevel:](self, "_overlayRenderersForOverlayLevel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapSnapshotOptions _overlayRenderersForOverlayLevel:](self, "_overlayRenderersForOverlayLevel:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_overlayRenderersForOverlayLevel:(int64_t)a3
{
  NSMutableDictionary *overlayRenderers;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  overlayRenderers = self->_overlayRenderers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](overlayRenderers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v5;

  return v7;
}

- (MKMapSnapshotOptions)init
{
  MKMapSnapshotOptions *v2;
  MKMapSnapshotOptions *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UITraitCollection *traitCollection;
  MKStandardMapConfiguration *v8;
  MKMapConfiguration *preferredConfiguration;
  double v10;
  double v11;
  double v12;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double width;
  void *v23;
  NSObject *v24;
  __int128 v25;
  MKMapSnapshotOptions *v26;
  _QWORD v28[4];
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)MKMapSnapshotOptions;
  v2 = -[MKMapSnapshotOptions init](&v29, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_size = (CGSize)vdupq_n_s64(0x4070000000000000uLL);
    v4 = (void *)MEMORY[0x1E0CEAB40];
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screenScale");
    objc_msgSend(v4, "traitCollectionWithDisplayScale:");
    v6 = objc_claimAutoreleasedReturnValue();
    traitCollection = v3->_traitCollection;
    v3->_traitCollection = (UITraitCollection *)v6;

    *(_WORD *)&v3->_useSnapshotService = 257;
    v8 = objc_alloc_init(MKStandardMapConfiguration);
    preferredConfiguration = v3->_preferredConfiguration;
    v3->_preferredConfiguration = &v8->super;

    v10 = MKDefaultCoordinateRegion();
    v3->_region.center.latitude = v10;
    v3->_region.center.longitude = v11;
    v3->_region.span.latitudeDelta = v12;
    v3->_region.span.longitudeDelta = v13;
    if (v11 < -180.0
      || v11 > 180.0
      || v10 < -90.0
      || v10 > 90.0
      || v12 < 0.0
      || v12 > 180.0
      || v13 < 0.0
      || v13 > 360.0)
    {
      CLLocationCoordinate2DMake(37.3328, -122.029);
      GEOCoordinateRegionMakeWithDistance();
      v3->_region.center.latitude = v14;
      v3->_region.center.longitude = v15;
      v3->_region.span.latitudeDelta = v16;
      v3->_region.span.longitudeDelta = v17;
    }
    GEOMapRectForCoordinateRegion();
    v3->_mapRect.origin.x = v18;
    v3->_mapRect.origin.y = v19;
    v3->_mapRect.size.width = v20;
    v3->_mapRect.size.height = v21;
    *(double *)v28 = v18;
    *(double *)&v28[1] = v19;
    *(double *)&v28[2] = v20;
    *(double *)&v28[3] = v21;
    width = v3->_size.width;
    *(float *)&width = width;
    *(float *)&v19 = v3->_size.height;
    *(float *)&width = *(float *)&width / *(float *)&v19;
    +[MKMapCamera _cameraLookingAtGEOMapRect:aspectRatio:](MKMapCamera, "_cameraLookingAtGEOMapRect:aspectRatio:", v28, width);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions _setCamera:](v3, "_setCamera:", v23);

    *(_DWORD *)&v3->_showsPointLabels = 16843009;
    MKGetSnapshotLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v3->_signpostId = os_signpost_id_generate(v24);

    v25 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&v3->_edgeInsets.top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&v3->_edgeInsets.bottom = v25;
    v3->_showsAppleLogo = 1;
    v26 = v3;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  $2AEA816EAF9616B0E64737FB4BB06332 span;
  $D4775485B13497D55C4F339E01923D43 size;
  __int128 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  span = self->_region.span;
  *(CLLocationCoordinate2D *)(v4 + 48) = self->_region.center;
  *($2AEA816EAF9616B0E64737FB4BB06332 *)(v4 + 64) = span;
  size = self->_mapRect.size;
  *($69B62588CC25CB7767350DB9F5F34ADF *)(v4 + 16) = self->_mapRect.origin;
  *($D4775485B13497D55C4F339E01923D43 *)(v4 + 32) = size;
  *(CGSize *)(v4 + 112) = self->_size;
  v7 = *(_OWORD *)&self->_edgeInsets.bottom;
  *(_OWORD *)(v4 + 136) = *(_OWORD *)&self->_edgeInsets.top;
  *(_OWORD *)(v4 + 152) = v7;
  *(_BYTE *)(v4 + 96) = self->_showsPointLabels;
  *(_BYTE *)(v4 + 97) = self->_showsRoadLabels;
  *(_BYTE *)(v4 + 98) = self->_showsRoadShields;
  *(_BYTE *)(v4 + 99) = self->_showsBuildings;
  *(_BYTE *)(v4 + 100) = self->_showsVenues;
  *(_BYTE *)(v4 + 101) = self->_showsAppleLogo;
  v8 = (void *)-[MKMapCamera copy](self->_camera, "copy");
  objc_msgSend((id)v4, "_setCamera:", v8);

  *(_QWORD *)(v4 + 88) = self->_mode;
  *(_BYTE *)(v4 + 102) = self->_rendersInBackground;
  *(_BYTE *)(v4 + 103) = self->_useSnapshotService;
  *(_BYTE *)(v4 + 104) = self->_snapshotServiceSerialPerProcess;
  v9 = -[UITraitCollection copy](self->_traitCollection, "copy");
  v10 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v9;

  v11 = -[NSArray copy](self->_customFeatureAnnotations, "copy");
  v12 = *(void **)(v4 + 272);
  *(_QWORD *)(v4 + 272) = v11;

  v13 = -[NSArray copy](self->_annotationViews, "copy");
  v14 = *(void **)(v4 + 264);
  *(_QWORD *)(v4 + 264) = v13;

  *(_BYTE *)(v4 + 257) = self->_searchResultsType;
  *(_QWORD *)(v4 + 168) = self->_signpostId;
  objc_storeStrong((id *)(v4 + 176), self->_routeContext);
  objc_storeStrong((id *)(v4 + 184), self->_routeOverlay);
  objc_storeStrong((id *)(v4 + 192), self->_composedRouteForRouteLine);
  objc_storeStrong((id *)(v4 + 200), self->_auditToken);
  *(_BYTE *)(v4 + 208) = self->_allowsSimultaneousLightDarkSnapshots;
  v15 = -[MKMapConfiguration copy](self->_preferredConfiguration, "copy");
  v16 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v15;

  v17 = -[NSMutableDictionary mutableCopy](self->_overlayRenderers, "mutableCopy");
  v18 = *(void **)(v4 + 216);
  *(_QWORD *)(v4 + 216) = v17;

  objc_storeStrong((id *)(v4 + 224), self->_selectedTrailID);
  objc_storeStrong((id *)(v4 + 232), self->_selectedTrailName);
  objc_storeStrong((id *)(v4 + 240), self->_selectedTrailLocale);
  return (id)v4;
}

- (BOOL)_snapshotServiceSerialPerProcess
{
  return self->_snapshotServiceSerialPerProcess;
}

- (GEOApplicationAuditToken)_auditToken
{
  return self->_auditToken;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __40__MKMapSnapshotOptions__prepareToSubmit__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
}

- (MKMapSnapshotOptions)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  MKMapSnapshotOptions *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v76;
  NSUInteger sizep[2];
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  _BYTE v82[7];
  NSUInteger v83;
  objc_super v84;

  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)MKMapSnapshotOptions;
  v5 = -[MKMapSnapshotOptions init](&v84, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traitCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 16);
    *((_QWORD *)v5 + 16) = v6;

    if (!*((_QWORD *)v5 + 16))
    {
      v8 = (void *)MEMORY[0x1E0CEAB40];
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
      objc_msgSend(v8, "traitCollectionWithDisplayScale:");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)v5 + 16);
      *((_QWORD *)v5 + 16) = v9;

    }
    v5[104] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("snapshotServiceSerialPerProcess"));
    v5[96] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsPointLabels"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("showsRoadLabels")))
      v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsRoadLabels"));
    else
      v11 = 1;
    v5[97] = v11;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("showsRoadShields")))
      v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsRoadShields"));
    else
      v13 = 1;
    v5[98] = v13;
    objc_msgSend(v5, "setShowsBuildings:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsBuildings")));
    v5[100] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsVenues"));
    v5[208] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsSimultaneousLightDarkSnapshots"));
    v5[101] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsAppleLogo"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      sizep[0] = 0;
      NSGetSizeAndAlignment((const char *)objc_msgSend(objc_retainAutorelease(v14), "objCType"), sizep, 0);
      if (sizep[0] != 16)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v24);

        v12 = 0;
LABEL_49:

        goto LABEL_50;
      }
    }
    objc_msgSend(v15, "CGSizeValue");
    *((_QWORD *)v5 + 14) = v16;
    *((_QWORD *)v5 + 15) = v17;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeInsets"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v83 = 0;
      v20 = objc_retainAutorelease(v18);
      NSGetSizeAndAlignment((const char *)objc_msgSend(v20, "objCType"), &v83, 0);
      if (v83 != 32)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v41);

        v12 = 0;
LABEL_48:

        goto LABEL_49;
      }
      v21 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      *(_OWORD *)sizep = *MEMORY[0x1E0CEB4B0];
      v78 = v21;
      objc_msgSend(v20, "getValue:size:", sizep, 32);
      v22 = *(_OWORD *)sizep;
      v23 = v78;
    }
    else
    {
      v22 = *MEMORY[0x1E0CEB4B0];
      v23 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    }
    *(_OWORD *)(v5 + 136) = v22;
    *(_OWORD *)(v5 + 152) = v23;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("camera"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCamera:", v25);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mapRectOriginX"));
    *((_QWORD *)v5 + 2) = v26;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mapRectOriginY"));
    *((_QWORD *)v5 + 3) = v27;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mapRectSizeWidth"));
    *((_QWORD *)v5 + 4) = v28;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mapRectSizeHeight"));
    *((_QWORD *)v5 + 5) = v29;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regionCenterLat"));
    *((_QWORD *)v5 + 6) = v30;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regionCenterLong"));
    *((_QWORD *)v5 + 7) = v31;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regionSpanLatDelta"));
    *((_QWORD *)v5 + 8) = v32;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regionSpanLongDelta"));
    *((_QWORD *)v5 + 9) = v33;
    *(_DWORD *)((char *)&v83 + 3) = 0;
    LODWORD(v83) = 0;
    v76 = v19;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mapStyle")))
    {
      v34 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapStyle"));
      v35 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapEmphasis"));
      v36 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapProjection"));
      v37 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terrainMode"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mapkitUsage")))
        v38 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapkitUsage"));
      else
        v38 = 1;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mapkitClientMode")))
        v39 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapkitClientMode"));
      else
        v39 = 0;
      v40 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("gridOnly"));
    }
    else if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mapType")))
    {
      _MKCartographicConfigurationForMapType(objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapType")), (uint64_t)sizep);
      v34 = sizep[0];
      v35 = sizep[1];
      v37 = *((_QWORD *)&v78 + 1);
      v36 = v78;
      v38 = v79;
      v39 = v80;
      v40 = v81;
      LODWORD(v83) = *(_DWORD *)v82;
      *(_DWORD *)((char *)&v83 + 3) = *(_DWORD *)&v82[3];
    }
    else
    {
      v40 = 0;
      v39 = 0;
      v37 = 0;
      v36 = 0;
      v34 = 0;
      v38 = 1;
      v35 = 1;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("preferredConfiguration")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredConfiguration"));
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)*((_QWORD *)v5 + 10);
      *((_QWORD *)v5 + 10) = v42;
    }
    else
    {
      sizep[0] = v34;
      sizep[1] = v35;
      *(_QWORD *)&v78 = v36;
      *((_QWORD *)&v78 + 1) = v37;
      v79 = v38;
      v80 = v39;
      v81 = v40;
      *(_DWORD *)v82 = v83;
      *(_DWORD *)&v82[3] = *(_DWORD *)((char *)&v83 + 3);
      +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:](MKMapConfiguration, "_mapConfigurationWithCartographicConfiguration:", sizep);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)*((_QWORD *)v5 + 10);
      *((_QWORD *)v5 + 10) = v44;

      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pointOfInterestFilter")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointOfInterestFilter"));
        v46 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("showsPointsOfInterest"))
          || (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsPointsOfInterest")) & 1) != 0)
        {
          goto LABEL_39;
        }
        +[MKPointOfInterestFilter filterExcludingAllCategories](MKPointOfInterestFilter, "filterExcludingAllCategories");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v43 = (void *)v46;
      objc_msgSend(*((id *)v5 + 10), "set_pointOfInterestFilter:", v46);
    }

LABEL_39:
    *((_QWORD *)v5 + 11) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    v5[257] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("searchResultsType"));
    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    objc_msgSend(v47, "setWithObjects:", v48, v49, v50, v51, v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("customFeatureAnnotations"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setCustomFeatureAnnotations:", v54);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostId"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v55)
      *((_QWORD *)v5 + 21) = objc_msgSend(v55, "unsignedLongLongValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)*((_QWORD *)v5 + 25);
    *((_QWORD *)v5 + 25) = v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("composedRouteForRouteLine"));
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v59;

    v61 = (void *)MEMORY[0x1E0C99E60];
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    v64 = objc_opt_class();
    objc_msgSend(v61, "setWithObjects:", v62, v63, v64, objc_opt_class(), 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v65, CFSTR("overlayRenderers"));
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)*((_QWORD *)v5 + 27);
    *((_QWORD *)v5 + 27) = v66;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectedTrailID")))
    {
      v68 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("selectedTrailID"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v68);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = (void *)*((_QWORD *)v5 + 28);
      *((_QWORD *)v5 + 28) = v69;

    }
    v19 = v76;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectedTrailName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedTrailName"));
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = (void *)*((_QWORD *)v5 + 29);
      *((_QWORD *)v5 + 29) = v71;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectedTrailLocale")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedTrailLocale"));
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = (void *)*((_QWORD *)v5 + 30);
      *((_QWORD *)v5 + 30) = v73;

    }
    v12 = v5;

    goto LABEL_48;
  }
  v12 = 0;
LABEL_50:

  return v12;
}

- (void)_setCustomFeatureAnnotations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setShowsBuildings:(BOOL)showsBuildings
{
  char v5;
  uint64_t v6;

  if (_MKLinkedOnOrAfterReleaseSet(3595))
  {
    v5 = 0;
    if (showsBuildings)
      goto LABEL_9;
  }
  else
  {
    v5 = GEOConfigGetBOOL() ^ 1;
    if (showsBuildings)
      goto LABEL_9;
  }
  if ((v5 & 1) == 0)
  {
    -[MKMapSnapshotOptions _cartographicConfiguration](self, "_cartographicConfiguration");
    if (v6 == 2)
    {
      showsBuildings = 0;
    }
    else
    {
      NSLog(CFSTR("WARNING: Setting MKMapSnapshotter.Options showsBuildings to false is no longer supported."));
      showsBuildings = 1;
    }
  }
LABEL_9:
  self->_showsBuildings = showsBuildings;
}

- (void)setCamera:(MKMapCamera *)camera
{
  void *v4;
  CGFloat width;
  float height;
  MKMapCamera *v7;
  MKMapRect v8;

  v7 = camera;
  if (-[MKMapCamera _validate](v7, "_validate"))
  {
    v4 = (void *)-[MKMapCamera copy](v7, "copy");
    -[MKMapSnapshotOptions _setCamera:](self, "_setCamera:", v4);

    width = self->_size.width;
    *(float *)&width = width;
    height = self->_size.height;
    *(float *)&width = *(float *)&width / height;
    -[MKMapCamera _enclosingGEOMapRectForAspectRatio:](self->_camera, "_enclosingGEOMapRectForAspectRatio:", width);
    self->_mapRect = ($8D326A409DE759287A73E3EC6ECA4C4F)v8;
    self->_region = ($81FBFA6FC28C00D72B6EC59C78D6FC53)MKCoordinateRegionForMapRect(v8);
    self->_mode = 2;
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOComposedRoute *composedRouteForRouteLine;
  void *v10;
  NSNumber *selectedTrailID;
  NSString *selectedTrailName;
  NSString *selectedTrailLocale;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_camera, CFSTR("camera"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_traitCollection, CFSTR("traitCollection"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_snapshotServiceSerialPerProcess, CFSTR("snapshotServiceSerialPerProcess"));
  -[MKMapConfiguration _pointOfInterestFilter](self->_preferredConfiguration, "_pointOfInterestFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pointOfInterestFilter"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_showsPointLabels, CFSTR("showsPointLabels"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsRoadLabels, CFSTR("showsRoadLabels"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsRoadShields, CFSTR("showsRoadShields"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsBuildings, CFSTR("showsBuildings"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsVenues, CFSTR("showsVenues"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsSimultaneousLightDarkSnapshots, CFSTR("allowsSimultaneousLightDarkSnapshots"));
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  -[MKMapSnapshotOptions _cartographicConfiguration](self, "_cartographicConfiguration");
  objc_msgSend(v4, "encodeInteger:forKey:", (_QWORD)v14, CFSTR("mapStyle"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((_QWORD *)&v14 + 1), CFSTR("mapEmphasis"));
  objc_msgSend(v4, "encodeInteger:forKey:", (_QWORD)v15, CFSTR("mapProjection"));
  objc_msgSend(v4, "encodeBool:forKey:", v17, CFSTR("gridOnly"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((_QWORD *)&v15 + 1), CFSTR("terrainMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", (_QWORD)v16, CFSTR("mapkitUsage"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((_QWORD *)&v16 + 1), CFSTR("mapkitClientMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", _MKMapTypeForCartographicConfiguration((uint64_t *)&v14), CFSTR("mapType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredConfiguration, CFSTR("preferredConfiguration"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsAppleLogo, CFSTR("showsAppleLogo"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", self->_size.width, self->_size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("size"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_edgeInsets, "{UIEdgeInsets=dddd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("edgeInsets"));

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("mapRectOriginX"), self->_mapRect.origin.x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("mapRectOriginY"), self->_mapRect.origin.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("mapRectSizeWidth"), self->_mapRect.size.width);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("mapRectSizeHeight"), self->_mapRect.size.height);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("regionCenterLat"), self->_region.center.latitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("regionCenterLong"), self->_region.center.longitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("regionSpanLatDelta"), self->_region.span.latitudeDelta);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("regionSpanLongDelta"), self->_region.span.longitudeDelta);
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_mode), CFSTR("mode"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_searchResultsType, CFSTR("searchResultsType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_customFeatureAnnotations, CFSTR("customFeatureAnnotations"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_signpostId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("signpostId"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_auditToken, CFSTR("auditToken"));
  composedRouteForRouteLine = self->_composedRouteForRouteLine;
  if (composedRouteForRouteLine)
    objc_msgSend(v4, "encodeObject:forKey:", composedRouteForRouteLine, CFSTR("composedRouteForRouteLine"));
  -[MKMapSnapshotOptions _encodableOverlayRenderers](self, "_encodableOverlayRenderers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("overlayRenderers"));
  selectedTrailID = self->_selectedTrailID;
  if (selectedTrailID)
    objc_msgSend(v4, "encodeInt64:forKey:", -[NSNumber unsignedLongLongValue](selectedTrailID, "unsignedLongLongValue"), CFSTR("selectedTrailID"));
  selectedTrailName = self->_selectedTrailName;
  if (selectedTrailName)
    objc_msgSend(v4, "encodeObject:forKey:", selectedTrailName, CFSTR("selectedTrailName"));
  selectedTrailLocale = self->_selectedTrailLocale;
  if (selectedTrailLocale)
    objc_msgSend(v4, "encodeObject:forKey:", selectedTrailLocale, CFSTR("selectedTrailLocale"));

}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (GEOComposedRoute)_composedRouteForRouteLine
{
  return self->_composedRouteForRouteLine;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (MKMapType)mapType
{
  __int128 v3;

  -[MKMapSnapshotOptions _cartographicConfiguration](self, "_cartographicConfiguration", 0, 0, 0, 0, 0, 0, 0);
  return _MKMapTypeForCartographicConfiguration((uint64_t *)&v3);
}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfiguration
{
  return -[MKMapSnapshotOptions _resolvedCartographicConfigurationWithAuditToken:](self, "_resolvedCartographicConfigurationWithAuditToken:", 0);
}

- (CGFloat)scale
{
  CGFloat result;

  -[UITraitCollection displayScale](self->_traitCollection, "displayScale");
  return result;
}

- (VKRouteOverlay)_routeOverlay
{
  return self->_routeOverlay;
}

- (VKRouteContext)_routeContext
{
  return self->_routeContext;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSArray)_customFeatureAnnotations
{
  return self->_customFeatureAnnotations;
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (BOOL)showsBuildings
{
  return self->_showsBuildings;
}

- (MKCoordinateRegion)region
{
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  MKCoordinateRegion result;

  latitude = self->_region.center.latitude;
  longitude = self->_region.center.longitude;
  latitudeDelta = self->_region.span.latitudeDelta;
  longitudeDelta = self->_region.span.longitudeDelta;
  result.span.longitudeDelta = longitudeDelta;
  result.span.latitudeDelta = latitudeDelta;
  result.center.longitude = longitude;
  result.center.latitude = latitude;
  return result;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return -[MKMapConfiguration _pointOfInterestFilter](self->_preferredConfiguration, "_pointOfInterestFilter");
}

- (NSArray)annotationViews
{
  return self->_annotationViews;
}

- (int64_t)_viewportMode
{
  return self->_mode;
}

- (BOOL)_useSnapshotService
{
  return self->_useSnapshotService;
}

- (BOOL)_showsVenues
{
  return self->_showsVenues;
}

- (BOOL)_showsRoadShields
{
  return self->_showsRoadShields;
}

- (BOOL)_showsRoadLabels
{
  return self->_showsRoadLabels;
}

- (BOOL)_showsPointLabels
{
  return self->_showsPointLabels;
}

- (NSNumber)_selectedTrailID
{
  return self->_selectedTrailID;
}

- (unsigned)_searchResultsType
{
  return self->_searchResultsType;
}

- (BOOL)_rendersInBackground
{
  return self->_rendersInBackground;
}

- (void)_prepareToSubmit
{
  void *v3;
  void *v4;
  uint64_t v5;
  UITraitCollection *traitCollection;
  UITraitCollection *v7;
  UITraitCollection *v8;
  _QWORD v9[5];

  if ((unint64_t)(-[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle") - 1) >= 2
    && !self->_allowsSimultaneousLightDarkSnapshots)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceStyle") == 2)
      v5 = 2;
    else
      v5 = 1;

    traitCollection = self->_traitCollection;
    if (traitCollection)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40__MKMapSnapshotOptions__prepareToSubmit__block_invoke;
      v9[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
      v9[4] = v5;
      -[UITraitCollection traitCollectionByModifyingTraits:](traitCollection, "traitCollectionByModifyingTraits:", v9);
      v7 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", v5);
      v7 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    }
    v8 = self->_traitCollection;
    self->_traitCollection = v7;

  }
}

- (id)_encodableOverlayRenderers
{
  void *v3;
  NSMutableDictionary *overlayRenderers;
  id v5;
  _QWORD v7[4];
  id v8;

  if (!self->_overlayRenderers)
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_overlayRenderers, "count"));
  overlayRenderers = self->_overlayRenderers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__MKMapSnapshotOptions__encodableOverlayRenderers__block_invoke;
  v7[3] = &unk_1E20DF600;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](overlayRenderers, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (UIEdgeInsets)_edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFeatureAnnotations, 0);
  objc_storeStrong((id *)&self->_annotationViews, 0);
  objc_storeStrong((id *)&self->_kvoProxy, 0);
  objc_storeStrong((id *)&self->_selectedTrailLocale, 0);
  objc_storeStrong((id *)&self->_selectedTrailName, 0);
  objc_storeStrong((id *)&self->_selectedTrailID, 0);
  objc_storeStrong((id *)&self->_overlayRenderers, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_composedRouteForRouteLine, 0);
  objc_storeStrong((id *)&self->_routeOverlay, 0);
  objc_storeStrong((id *)&self->_routeContext, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_preferredConfiguration, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

- (void)setRegion:(MKCoordinateRegion)region
{
  CLLocationDegrees longitudeDelta;
  CLLocationDegrees latitudeDelta;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat width;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];

  longitudeDelta = region.span.longitudeDelta;
  latitudeDelta = region.span.latitudeDelta;
  if (region.center.longitude < -180.0
    || region.center.longitude > 180.0
    || region.center.latitude < -90.0
    || region.center.latitude > 90.0
    || region.span.latitudeDelta < 0.0
    || region.span.latitudeDelta > 180.0
    || region.span.longitudeDelta < 0.0
    || region.span.longitudeDelta > 360.0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&region.center.latitude, *(_QWORD *)&region.center.longitude);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v17, *(_QWORD *)&latitudeDelta, *(_QWORD *)&longitudeDelta);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringWithFormat:", CFSTR("Invalid Region %@"), v18);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise");

  }
  else
  {
    self->_region = ($81FBFA6FC28C00D72B6EC59C78D6FC53)region;
    GEOMapRectForCoordinateRegion();
    self->_mapRect.origin.x = v6;
    self->_mapRect.origin.y = v7;
    self->_mapRect.size.width = v8;
    self->_mapRect.size.height = v9;
    GEOMapRectForCoordinateRegion();
    v21[0] = v10;
    v21[1] = v11;
    v21[2] = v12;
    v21[3] = v13;
    width = self->_size.width;
    *(float *)&width = width;
    *(float *)&v11 = self->_size.height;
    *(float *)&width = *(float *)&width / *(float *)&v11;
    +[MKMapCamera _cameraLookingAtGEOMapRect:aspectRatio:](MKMapCamera, "_cameraLookingAtGEOMapRect:aspectRatio:", v21, width);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions _setCamera:](self, "_setCamera:", v15);

    self->_mode = 0;
  }
}

- (void)setSize:(CGSize)size
{
  int64_t mode;
  id v4;

  if (size.width * size.height == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set a zero area size."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise");

  }
  else
  {
    self->_size = size;
    mode = self->_mode;
    switch(mode)
    {
      case 2:
        -[MKMapSnapshotOptions setCamera:](self, "setCamera:", self->_camera);
        break;
      case 1:
        -[MKMapSnapshotOptions setMapRect:](self, "setMapRect:", self->_mapRect.origin.x, self->_mapRect.origin.y, self->_mapRect.size.width, self->_mapRect.size.height);
        break;
      case 0:
        -[MKMapSnapshotOptions setRegion:](self, "setRegion:", self->_region.center.latitude, self->_region.center.longitude, self->_region.span.latitudeDelta, self->_region.span.longitudeDelta);
        break;
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[MKMapSnapshotOptions _removeCameraKVO](self, "_removeCameraKVO");
  v3.receiver = self;
  v3.super_class = (Class)MKMapSnapshotOptions;
  -[MKMapSnapshotOptions dealloc](&v3, sel_dealloc);
}

void __50__MKMapSnapshotOptions__encodableOverlayRenderers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v15 = a1;
  v24 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EDFCF118, v15))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          MKGetSnapshotLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v22 = v14;
            _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "Unable to encode overlay renderer of class %@ as it is not conforming to NSSecureCoding. This encoding will be lossy.", buf, 0xCu);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(v15 + 32), "setObject:forKeyedSubscript:", v5, v16);
}

- (void)setScale:(CGFloat)scale
{
  UITraitCollection *traitCollection;
  double v6;
  UITraitCollection *v7;
  UITraitCollection *v8;
  UITraitCollection *v9;
  _QWORD v10[5];

  traitCollection = self->_traitCollection;
  if (traitCollection)
  {
    -[UITraitCollection displayScale](traitCollection, "displayScale");
    if (v6 == scale)
      return;
    v7 = self->_traitCollection;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__MKMapSnapshotOptions_setScale___block_invoke;
    v10[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    *(CGFloat *)&v10[4] = scale;
    -[UITraitCollection traitCollectionByModifyingTraits:](v7, "traitCollectionByModifyingTraits:", v10);
    v8 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithDisplayScale:", scale);
    v8 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  v9 = self->_traitCollection;
  self->_traitCollection = v8;

}

uint64_t __33__MKMapSnapshotOptions_setScale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayScale:", *(double *)(a1 + 32));
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
  double v4;
  UITraitCollection *v5;
  UITraitCollection *v6;
  UITraitCollection *v7;

  v7 = traitCollection;
  -[UITraitCollection displayScale](v7, "displayScale");
  if (v4 == 0.0)
  {
    -[UITraitCollection traitCollectionByModifyingTraits:](v7, "traitCollectionByModifyingTraits:", &__block_literal_global_98);
    v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v7;
  }
  v6 = self->_traitCollection;
  self->_traitCollection = v5;

}

void __43__MKMapSnapshotOptions_setTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenScale");
  objc_msgSend(v2, "setDisplayScale:");

}

- (void)_setCamera:(id)a3
{
  MKMapCamera *v4;
  _MKKVOProxy *v5;
  _MKKVOProxy *kvoProxy;
  MKMapCamera *camera;

  v4 = (MKMapCamera *)a3;
  if (!self->_kvoProxy)
  {
    v5 = -[_MKKVOProxy initWithDelegate:]([_MKKVOProxy alloc], "initWithDelegate:", self);
    kvoProxy = self->_kvoProxy;
    self->_kvoProxy = v5;

  }
  -[MKMapSnapshotOptions _removeCameraKVO](self, "_removeCameraKVO");
  camera = self->_camera;
  self->_camera = v4;

  -[MKMapSnapshotOptions _addCameraKVO](self, "_addCameraKVO");
}

- (void)_removeCameraKVO
{
  -[_MKKVOProxy removeObserverForObject:forKeyPath:context:](self->_kvoProxy, "removeObserverForObject:forKeyPath:context:", self->_camera, CFSTR("altitude"), MKCameraKVOContext);
  -[_MKKVOProxy removeObserverForObject:forKeyPath:context:](self->_kvoProxy, "removeObserverForObject:forKeyPath:context:", self->_camera, CFSTR("pitch"), MKCameraKVOContext);
  -[_MKKVOProxy removeObserverForObject:forKeyPath:context:](self->_kvoProxy, "removeObserverForObject:forKeyPath:context:", self->_camera, CFSTR("heading"), MKCameraKVOContext);
  -[_MKKVOProxy removeObserverForObject:forKeyPath:context:](self->_kvoProxy, "removeObserverForObject:forKeyPath:context:", self->_camera, CFSTR("centerCoordinate"), MKCameraKVOContext);
  -[_MKKVOProxy removeObserverForObject:forKeyPath:context:](self->_kvoProxy, "removeObserverForObject:forKeyPath:context:", self->_camera, CFSTR("centerCoordinateDistance"), MKCameraKVOContext);
}

- (void)_addCameraKVO
{
  -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_kvoProxy, "addObserverForObject:forKeyPath:options:context:", self->_camera, CFSTR("altitude"), 0, MKCameraKVOContext);
  -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_kvoProxy, "addObserverForObject:forKeyPath:options:context:", self->_camera, CFSTR("pitch"), 0, MKCameraKVOContext);
  -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_kvoProxy, "addObserverForObject:forKeyPath:options:context:", self->_camera, CFSTR("heading"), 0, MKCameraKVOContext);
  -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_kvoProxy, "addObserverForObject:forKeyPath:options:context:", self->_camera, CFSTR("centerCoordinate"), 0, MKCameraKVOContext);
  -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_kvoProxy, "addObserverForObject:forKeyPath:options:context:", self->_camera, CFSTR("centerCoordinateDistance"), 0, MKCameraKVOContext);
}

- (void)setMapRect:(MKMapRect)mapRect
{
  $D4775485B13497D55C4F339E01923D43 size;
  CGFloat width;
  void *v6;
  _OWORD v7[2];

  self->_mapRect = ($8D326A409DE759287A73E3EC6ECA4C4F)mapRect;
  self->_region = ($81FBFA6FC28C00D72B6EC59C78D6FC53)MKCoordinateRegionForMapRect(mapRect);
  size = self->_mapRect.size;
  v7[0] = self->_mapRect.origin;
  v7[1] = size;
  width = self->_size.width;
  *(float *)&width = width;
  *(float *)&size.width = self->_size.height;
  *(float *)&width = *(float *)&width / *(float *)&size.width;
  +[MKMapCamera _cameraLookingAtGEOMapRect:aspectRatio:](MKMapCamera, "_cameraLookingAtGEOMapRect:aspectRatio:", v7, width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapSnapshotOptions _setCamera:](self, "_setCamera:", v6);

  self->_mode = 1;
}

- (void)_setUseSnapshotService:(BOOL)a3
{
  if (self->_useSnapshotService != a3)
    self->_useSnapshotService = a3;
}

- (BOOL)_overlaysSupportElevation
{
  _BOOL4 v3;
  void *v4;
  BOOL v5;

  v3 = _MKLinkedOnOrAfterReleaseSet(3595);
  if (v3)
  {
    -[MKMapSnapshotOptions _allOverlays](self, "_allOverlays");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[MKStandardMapConfiguration _overlaysSupportElevation:](MKStandardMapConfiguration, "_overlaysSupportElevation:", v4);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_setCartographicConfiguration:(id *)a3
{
  __int128 v4;
  void *v5;
  _OWORD v6[3];
  uint64_t v7;

  v4 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->var4;
  v7 = *(_QWORD *)&a3->var6;
  +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:](MKMapConfiguration, "_mapConfigurationWithCartographicConfiguration:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setInternalStateFromMapConfiguration:", self->_preferredConfiguration);
  -[MKMapSnapshotOptions setPreferredConfiguration:](self, "setPreferredConfiguration:", v5);

}

- (void)setMapType:(MKMapType)mapType
{
  void *v4;
  _OWORD v5[3];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  _MKCartographicConfigurationForMapType(mapType, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  v6 = v10;
  +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:](MKMapConfiguration, "_mapConfigurationWithCartographicConfiguration:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setInternalStateFromMapConfiguration:", self->_preferredConfiguration);
  -[MKMapSnapshotOptions setPreferredConfiguration:](self, "setPreferredConfiguration:", v4);

}

- (BOOL)_showsPointsOfInterest
{
  void *v2;
  void *v3;
  int v4;

  -[MKMapConfiguration _pointOfInterestFilter](self->_preferredConfiguration, "_pointOfInterestFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "_excludesAllCategories") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (void)setShowsPointsOfInterest:(BOOL)showsPointsOfInterest
{
  id v4;

  if (showsPointsOfInterest)
  {
    -[MKMapConfiguration set_pointOfInterestFilter:](self->_preferredConfiguration, "set_pointOfInterestFilter:", 0);
  }
  else
  {
    +[MKPointOfInterestFilter filterExcludingAllCategories](MKPointOfInterestFilter, "filterExcludingAllCategories");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MKMapConfiguration set_pointOfInterestFilter:](self->_preferredConfiguration, "set_pointOfInterestFilter:", v4);

  }
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  -[MKMapConfiguration set_pointOfInterestFilter:](self->_preferredConfiguration, "set_pointOfInterestFilter:", pointOfInterestFilter);
}

- (BOOL)_showsNightMode
{
  return -[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle") == UIUserInterfaceStyleDark;
}

- (void)_setShowsNightMode:(BOOL)a3
{
  UITraitCollection *traitCollection;
  UITraitCollection *v5;
  UITraitCollection *v6;
  _QWORD v7[4];
  BOOL v8;

  traitCollection = self->_traitCollection;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__MKMapSnapshotOptions__setShowsNightMode___block_invoke;
  v7[3] = &__block_descriptor_33_e27_v16__0___UIMutableTraits__8l;
  v8 = a3;
  -[UITraitCollection traitCollectionByModifyingTraits:](traitCollection, "traitCollectionByModifyingTraits:", v7);
  v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  v6 = self->_traitCollection;
  self->_traitCollection = v5;

}

uint64_t __43__MKMapSnapshotOptions__setShowsNightMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setUserInterfaceStyle:", v2);
}

- (BOOL)isEqual:(id)a3
{
  MKMapSnapshotOptions *v4;
  MKMapSnapshotOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 allowsSimultaneousLightDarkSnapshots;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = (MKMapSnapshotOptions *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MKMapSnapshotOptions camera](self, "camera");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapSnapshotOptions camera](v5, "camera");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqual:", v7))
      {
        LOBYTE(v11) = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[MKMapSnapshotOptions preferredConfiguration](self, "preferredConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapSnapshotOptions preferredConfiguration](v5, "preferredConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v9)
        || (v10 = -[MKMapSnapshotOptions showsBuildings](self, "showsBuildings"),
            v10 != -[MKMapSnapshotOptions showsBuildings](v5, "showsBuildings")))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[MKMapSnapshotOptions pointOfInterestFilter](self, "pointOfInterestFilter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapSnapshotOptions pointOfInterestFilter](v5, "pointOfInterestFilter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = v13;
      if (v14 | v15)
      {
        LODWORD(v11) = objc_msgSend((id)v14, "isEqual:", v15);

        if (!(_DWORD)v11)
          goto LABEL_28;
      }
      -[MKMapSnapshotOptions size](self, "size");
      v17 = v16;
      v19 = v18;
      -[MKMapSnapshotOptions size](v5, "size");
      LOBYTE(v11) = 0;
      if (v17 != v21 || v19 != v20)
      {
LABEL_28:

        goto LABEL_29;
      }
      -[MKMapSnapshotOptions traitCollection](self, "traitCollection");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "displayScale");
      v23 = v22;
      -[MKMapSnapshotOptions traitCollection](v5, "traitCollection");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "displayScale");
      if (v23 != v24)
      {
        LOBYTE(v11) = 0;
        goto LABEL_27;
      }
      -[MKMapSnapshotOptions traitCollection](self, "traitCollection");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v52, "userInterfaceStyle");
      -[MKMapSnapshotOptions traitCollection](v5, "traitCollection");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 != objc_msgSend(v51, "userInterfaceStyle"))
        goto LABEL_24;
      -[MKMapSnapshotOptions _edgeInsets](v5, "_edgeInsets");
      LOBYTE(v11) = 0;
      if (self->_edgeInsets.left != v29
        || self->_edgeInsets.top != v26
        || self->_edgeInsets.right != v28
        || self->_edgeInsets.bottom != v27)
      {
        goto LABEL_25;
      }
      allowsSimultaneousLightDarkSnapshots = self->_allowsSimultaneousLightDarkSnapshots;
      if (allowsSimultaneousLightDarkSnapshots != -[MKMapSnapshotOptions _allowsSimultaneousLightDarkSnapshots](v5, "_allowsSimultaneousLightDarkSnapshots"))
      {
LABEL_24:
        LOBYTE(v11) = 0;
LABEL_25:

LABEL_27:
        goto LABEL_28;
      }
      -[MKMapSnapshotOptions _selectedTrailID](self, "_selectedTrailID");
      v31 = objc_claimAutoreleasedReturnValue();
      -[MKMapSnapshotOptions _selectedTrailID](v5, "_selectedTrailID");
      v49 = (void *)v31;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((void *)v31 != v50)
      {
        -[MKMapSnapshotOptions _selectedTrailID](self, "_selectedTrailID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapSnapshotOptions _selectedTrailID](v5, "_selectedTrailID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v32;
        if (!objc_msgSend(v32, "isEqual:", v46))
        {
          LOBYTE(v11) = 0;
          v33 = v49;
          goto LABEL_41;
        }
      }
      -[MKMapSnapshotOptions _selectedTrailName](self, "_selectedTrailName");
      v35 = objc_claimAutoreleasedReturnValue();
      -[MKMapSnapshotOptions _selectedTrailName](v5, "_selectedTrailName");
      v48 = (void *)v35;
      v45 = objc_claimAutoreleasedReturnValue();
      if (v35 == v45
        || (-[MKMapSnapshotOptions _selectedTrailName](self, "_selectedTrailName"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            -[MKMapSnapshotOptions _selectedTrailName](v5, "_selectedTrailName"),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v44 = v36,
            objc_msgSend(v36, "isEqualToString:", v43)))
      {
        -[MKMapSnapshotOptions _selectedTrailLocale](self, "_selectedTrailLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapSnapshotOptions _selectedTrailLocale](v5, "_selectedTrailLocale");
        v38 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v38)
        {

          LOBYTE(v11) = 1;
        }
        else
        {
          v42 = (void *)v38;
          -[MKMapSnapshotOptions _selectedTrailLocale](self, "_selectedTrailLocale");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKMapSnapshotOptions _selectedTrailLocale](v5, "_selectedTrailLocale");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v11;
          LOBYTE(v11) = objc_msgSend(v40, "isEqualToString:");

        }
        v37 = (void *)v45;
        if (v48 == (void *)v45)
        {
LABEL_40:

          v33 = v49;
          if (v49 == v50)
          {
LABEL_42:

            goto LABEL_25;
          }
LABEL_41:

          goto LABEL_42;
        }
      }
      else
      {
        v37 = (void *)v45;
        LOBYTE(v11) = 0;
      }

      goto LABEL_40;
    }
    LOBYTE(v11) = 0;
  }
LABEL_31:

  return (char)v11;
}

- (void)_setOverlayRenderers:(id)a3 forOverlayLevel:(int64_t)a4
{
  NSMutableDictionary *overlayRenderers;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  overlayRenderers = self->_overlayRenderers;
  if (!overlayRenderers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_overlayRenderers;
    self->_overlayRenderers = v7;

    overlayRenderers = self->_overlayRenderers;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](overlayRenderers, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)_setSelectedTrailWithId:(id)a3 name:(id)a4 locale:(id)a5
{
  NSNumber *v8;
  NSString *v9;
  NSString *v10;
  NSNumber *selectedTrailID;
  NSString *selectedTrailName;
  NSString *v13;
  NSString *selectedTrailLocale;
  NSNumber *v15;

  v8 = (NSNumber *)a3;
  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  selectedTrailID = self->_selectedTrailID;
  self->_selectedTrailID = v8;
  v15 = v8;

  selectedTrailName = self->_selectedTrailName;
  self->_selectedTrailName = v9;
  v13 = v9;

  selectedTrailLocale = self->_selectedTrailLocale;
  self->_selectedTrailLocale = v10;

}

- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  CGFloat width;
  float height;
  MKMapRect v9;

  if ((void *)MKCameraKVOContext == a6)
  {
    width = self->_size.width;
    *(float *)&width = width;
    height = self->_size.height;
    *(float *)&width = *(float *)&width / height;
    -[MKMapCamera _enclosingGEOMapRectForAspectRatio:](self->_camera, "_enclosingGEOMapRectForAspectRatio:", a3, a4, a5, width);
    self->_mapRect = ($8D326A409DE759287A73E3EC6ECA4C4F)v9;
    self->_region = ($81FBFA6FC28C00D72B6EC59C78D6FC53)MKCoordinateRegionForMapRect(v9);
    self->_mode = 2;
  }
}

- (MKMapRect)mapRect
{
  double x;
  double y;
  double width;
  double height;
  MKMapRect result;

  x = self->_mapRect.origin.x;
  y = self->_mapRect.origin.y;
  width = self->_mapRect.size.width;
  height = self->_mapRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreferredConfiguration:(MKMapConfiguration *)preferredConfiguration
{
  objc_setProperty_nonatomic_copy(self, a2, preferredConfiguration, 80);
}

- (BOOL)usingRect
{
  return self->_usingRect;
}

- (void)_setShowsPointLabels:(BOOL)a3
{
  self->_showsPointLabels = a3;
}

- (void)_setShowsRoadLabels:(BOOL)a3
{
  self->_showsRoadLabels = a3;
}

- (void)_setShowsRoadShields:(BOOL)a3
{
  self->_showsRoadShields = a3;
}

- (void)_setShowsVenues:(BOOL)a3
{
  self->_showsVenues = a3;
}

- (BOOL)_allowsSimultaneousLightDarkSnapshots
{
  return self->_allowsSimultaneousLightDarkSnapshots;
}

- (void)_setAllowsSimultaneousLightDarkSnapshots:(BOOL)a3
{
  self->_allowsSimultaneousLightDarkSnapshots = a3;
}

- (BOOL)_showsAppleLogo
{
  return self->_showsAppleLogo;
}

- (void)_setShowsAppleLogo:(BOOL)a3
{
  self->_showsAppleLogo = a3;
}

- (void)_setSnapshotServiceSerialPerProcess:(BOOL)a3
{
  self->_snapshotServiceSerialPerProcess = a3;
}

- (void)_setRendersInBackground:(BOOL)a3
{
  self->_rendersInBackground = a3;
}

- (void)setAnnotationViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void)_setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void)_setRouteContext:(id)a3
{
  objc_storeStrong((id *)&self->_routeContext, a3);
}

- (void)_setRouteOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_routeOverlay, a3);
}

- (void)_setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void)_setComposedRouteForRouteLine:(id)a3
{
  objc_storeStrong((id *)&self->_composedRouteForRouteLine, a3);
}

- (NSString)_selectedTrailName
{
  return self->_selectedTrailName;
}

- (NSString)_selectedTrailLocale
{
  return self->_selectedTrailLocale;
}

- (void)_setSearchResultsType:(unsigned __int8)a3
{
  self->_searchResultsType = a3;
}

@end

@implementation MKAnnotatedMapSnapshotter

- (MKAnnotatedMapSnapshotter)initWithMapItems:(id)a3 mapSize:(CGSize)a4 useSnapshotService:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  MKAnnotatedMapSnapshotter *v10;
  uint64_t v11;
  NSArray *mapItems;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKAnnotatedMapSnapshotter;
  v10 = -[MKAnnotatedMapSnapshotter init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    mapItems = v10->_mapItems;
    v10->_mapItems = (NSArray *)v11;

    v10->_mapSize.width = width;
    v10->_mapSize.height = height;
    v10->_useSnapshotService = a5;
    -[MKAnnotatedMapSnapshotter _initSnapshotterWithMapItems](v10, "_initSnapshotterWithMapItems");
  }

  return v10;
}

- (void)_initSnapshotterWithMapItems
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _MKAnnotationViewCustomFeatureAnnotation *v15;
  MKAnnotatedMapSnapshotter *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  _MKCartographicMapConfiguration *v20;
  _MKCartographicMapConfiguration *v21;
  MKStandardMapConfiguration *v22;
  MKMapSnapshotOptions *v23;
  MKMapSnapshotOptions *snapshotOptions;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MKAnnotatedMapSnapshotter *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;
  MKMapRect v43;
  MKCoordinateRegion v44;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = self;
  v3 = self->_mapItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = objc_alloc(MEMORY[0x1E0DC64D8]);
        objc_msgSend(v8, "_coordinate");
        v10 = (void *)objc_msgSend(v9, "initWithCoordinate:");
        objc_msgSend(v8, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setText:locale:", v11, 0);

        objc_msgSend(v8, "_styleAttributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

        if (v13
          || (objc_msgSend(MEMORY[0x1E0D270A8], "markerStyleAttributes"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = (void *)objc_msgSend(v14, "copy"),
              v14,
              v13))
        {
          v35 = xmmword_18B2A9E60;
          objc_msgSend(v13, "replaceAttributes:count:", &v35, 2);
          objc_msgSend(v10, "setStyleAttributes:", v13);

        }
        v15 = objc_alloc_init(_MKAnnotationViewCustomFeatureAnnotation);
        objc_msgSend(v8, "_coordinate");
        -[_MKAnnotationViewCustomFeatureAnnotation setCoordinate:](v15, "setCoordinate:");
        -[_MKAnnotationViewCustomFeatureAnnotation setCustomFeature:](v15, "setCustomFeature:", v10);
        objc_msgSend(v30, "addObject:", v15);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v5);
  }

  if (MapKitFeature_IsEnabled_SPRForMapSnapshots())
  {
    v16 = v29;
    v17 = -[NSArray count](v29->_mapItems, "count") == 1;
  }
  else
  {
    v17 = 0;
    v16 = v29;
  }
  -[NSArray firstObject](v16->_mapItems, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "_isMapItemTypeTransit");

  if (v19)
  {
    v20 = [_MKCartographicMapConfiguration alloc];
    v35 = xmmword_18B2AFE10;
    v36 = 0;
    v37 = 0;
    v39 = 0;
    v40 = 0;
    v38 = 1;
    v21 = -[_MKCartographicMapConfiguration initWithCartographicConfiguration:](v20, "initWithCartographicConfiguration:", &v35);
  }
  else
  {
    v22 = objc_alloc_init(MKStandardMapConfiguration);
    v21 = (_MKCartographicMapConfiguration *)v22;
    if (v17)
      -[MKMapConfiguration setElevationStyle:](v22, "setElevationStyle:", 1);
  }
  v23 = objc_alloc_init(MKMapSnapshotOptions);
  snapshotOptions = v16->_snapshotOptions;
  v16->_snapshotOptions = v23;

  -[MKMapSnapshotOptions setPreferredConfiguration:](v16->_snapshotOptions, "setPreferredConfiguration:", v21);
  -[MKMapSnapshotOptions setSize:](v16->_snapshotOptions, "setSize:", v16->_mapSize.width, v16->_mapSize.height);
  if (v17)
  {
    -[NSArray firstObject](v16->_mapItems, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKMapCamera cameraLookingAtMapItem:forViewSize:allowPitch:](MKMapCamera, "cameraLookingAtMapItem:forViewSize:allowPitch:", v25, 1, v16->_mapSize.width, v16->_mapSize.height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions setCamera:](v16->_snapshotOptions, "setCamera:", v26);

  }
  else
  {
    v43.origin.x = mapRectContainingMapItems(v16->_mapItems, v16->_mapSize.width, v16->_mapSize.height);
    v44 = MKCoordinateRegionForMapRect(v43);
    -[MKMapSnapshotOptions setRegion:](v16->_snapshotOptions, "setRegion:", v44.center.latitude, v44.center.longitude, v44.span.latitudeDelta, v44.span.longitudeDelta);
  }
  -[MKMapSnapshotOptions _setShowsAppleLogo:](v16->_snapshotOptions, "_setShowsAppleLogo:", 0);
  -[MKAnnotatedMapSnapshotter traitCollection](v16, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[MKAnnotatedMapSnapshotter traitCollection](v16, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions setTraitCollection:](v16->_snapshotOptions, "setTraitCollection:", v28);

  }
  -[MKMapSnapshotOptions _setRendersInBackground:](v16->_snapshotOptions, "_setRendersInBackground:", 1);
  -[MKMapSnapshotOptions _setUseSnapshotService:](v16->_snapshotOptions, "_setUseSnapshotService:", v16->_useSnapshotService);
  -[MKMapSnapshotOptions _setShowsVenues:](v16->_snapshotOptions, "_setShowsVenues:", 1);
  -[MKMapSnapshotOptions _setCustomFeatureAnnotations:](v16->_snapshotOptions, "_setCustomFeatureAnnotations:", v30);
  -[MKMapSnapshotOptions _setSearchResultsType:](v16->_snapshotOptions, "_setSearchResultsType:", 1);
  -[MKMapSnapshotOptions _setAllowsSimultaneousLightDarkSnapshots:](v16->_snapshotOptions, "_setAllowsSimultaneousLightDarkSnapshots:", 1);

}

- (MKMapCamera)camera
{
  return -[MKMapSnapshotOptions camera](self->_snapshotOptions, "camera");
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v5;

  v5 = (UITraitCollection *)a3;
  if (self->_traitCollection != v5)
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    -[MKMapSnapshotOptions setTraitCollection:](self->_snapshotOptions, "setTraitCollection:", v5);
  }

}

- (void)startWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  MKMapSnapshotter *snapshotter;
  MKMapSnapshotter *v9;
  MKMapSnapshotter *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  snapshotter = self->_snapshotter;
  if (!snapshotter)
  {
    v9 = -[MKMapSnapshotter initWithOptions:]([MKMapSnapshotter alloc], "initWithOptions:", self->_snapshotOptions);
    v10 = self->_snapshotter;
    self->_snapshotter = v9;

    snapshotter = self->_snapshotter;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__MKAnnotatedMapSnapshotter_startWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E20DC400;
  v13 = v7;
  v11 = v7;
  -[MKMapSnapshotter startWithQueue:completionHandler:](snapshotter, "startWithQueue:completionHandler:", v6, v12);

}

uint64_t __62__MKAnnotatedMapSnapshotter_startWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startWithCompletionHandler:(id)a3
{
  -[MKAnnotatedMapSnapshotter startWithQueue:completionHandler:](self, "startWithQueue:completionHandler:", MEMORY[0x1E0C80D38], a3);
}

- (BOOL)isLoading
{
  return -[MKMapSnapshotter isLoading](self->_snapshotter, "isLoading");
}

- (void)cancel
{
  -[MKMapSnapshotter cancel](self->_snapshotter, "cancel");
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshotOptions, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end

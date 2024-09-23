@implementation _MKStaticMapView

- (_MKStaticMapView)initWithFrame:(CGRect)a3
{
  return -[_MKStaticMapView initWithFrame:locationManager:](self, "initWithFrame:locationManager:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_MKStaticMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _MKStaticMapView *v10;
  MKLocationManager *v11;
  int v12;
  void *v13;
  void *v14;
  MKMapSnapshotOptions *v15;
  MKMapSnapshotOptions *snapshotOptions;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIImageView *v23;
  UIImageView *imageView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MKAnnotationManager *v33;
  MKAnnotationManager *annotationManager;
  MKAnnotationContainerView *v35;
  MKAnnotationContainerView *annotationContainer;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableOrderedSet *v46;
  NSMutableOrderedSet *v47;
  NSMutableOrderedSet *v48;
  NSMutableOrderedSet *v49;
  uint64_t v50;
  NSMapTable *overlaysToRenderers;
  uint64_t v52;
  NSMapTable *mapItemCustomFeaturesToMapItems;
  uint64_t v54;
  NSMapTable *mapItemsToMapItemCustomFeatures;
  MKStandardMapConfiguration *v56;
  MKMapConfiguration *preferredConfiguration;
  void *v58;
  id v59;
  _MKStaticMapView *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  MKLocationManager *v67;
  id v68;
  objc_super v69;
  _QWORD v70[2];
  _QWORD v71[4];
  _QWORD v72[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v72[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v69.receiver = self;
  v69.super_class = (Class)_MKStaticMapView;
  v10 = -[_MKStaticMapView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v68 = v9;
    if (v9
      && (v11 = -[MKLocationManager initWithCLLocationManager:]([MKLocationManager alloc], "initWithCLLocationManager:", v9)) != 0)
    {
      v12 = 0;
      v67 = v11;
      v13 = v11;
    }
    else
    {
      +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      v12 = 1;
    }
    objc_storeStrong((id *)&v10->_locationManager, v13);
    if (v12)

    objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("CartographyBackgroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStaticMapView setBackgroundColor:](v10, "setBackgroundColor:", v14);

    v15 = objc_alloc_init(MKMapSnapshotOptions);
    snapshotOptions = v10->_snapshotOptions;
    v10->_snapshotOptions = v15;

    -[_MKStaticMapView traitCollection](v10, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions setTraitCollection:](v10->_snapshotOptions, "setTraitCollection:", v17);

    -[_MKStaticMapView bounds](v10, "bounds");
    v19 = v18;
    -[_MKStaticMapView bounds](v10, "bounds");
    if (v19 * v20 > 0.0)
    {
      -[_MKStaticMapView bounds](v10, "bounds", v19 * v20);
      -[MKMapSnapshotOptions setSize:](v10->_snapshotOptions, "setSize:", v21, v22);
    }
    v23 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    imageView = v10->_imageView;
    v10->_imageView = v23;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v10->_imageView, "setContentMode:", 4);
    -[_MKStaticMapView addSubview:](v10, "addSubview:", v10->_imageView);
    v25 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerXAnchor](v10->_imageView, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStaticMapView centerXAnchor](v10, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v28;
    -[UIImageView centerYAnchor](v10->_imageView, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStaticMapView centerYAnchor](v10, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v32);

    v33 = objc_alloc_init(MKAnnotationManager);
    annotationManager = v10->_annotationManager;
    v10->_annotationManager = v33;

    -[MKAnnotationManager setContainer:](v10->_annotationManager, "setContainer:", v10);
    -[MKAnnotationManager setDelegate:](v10->_annotationManager, "setDelegate:", v10);
    v35 = objc_alloc_init(MKAnnotationContainerView);
    annotationContainer = v10->_annotationContainer;
    v10->_annotationContainer = v35;

    -[MKAnnotationContainerView setDelegate:](v10->_annotationContainer, "setDelegate:", v10);
    -[MKAnnotationContainerView setTranslatesAutoresizingMaskIntoConstraints:](v10->_annotationContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKStaticMapView addSubview:](v10, "addSubview:", v10->_annotationContainer);
    v62 = (void *)MEMORY[0x1E0CB3718];
    -[MKAnnotationContainerView topAnchor](v10->_annotationContainer, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStaticMapView topAnchor](v10, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v64;
    -[MKAnnotationContainerView leftAnchor](v10->_annotationContainer, "leftAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStaticMapView leftAnchor](v10, "leftAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v38;
    -[MKAnnotationContainerView rightAnchor](v10->_annotationContainer, "rightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStaticMapView rightAnchor](v10, "rightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v41;
    -[MKAnnotationContainerView bottomAnchor](v10->_annotationContainer, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStaticMapView bottomAnchor](v10, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "activateConstraints:", v45);

    v46 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v47 = v10->_overlays[0];
    v10->_overlays[0] = v46;

    v48 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v49 = v10->_overlays[1];
    v10->_overlays[1] = v48;

    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 10);
    overlaysToRenderers = v10->_overlaysToRenderers;
    v10->_overlaysToRenderers = (NSMapTable *)v50;

    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 10);
    mapItemCustomFeaturesToMapItems = v10->_mapItemCustomFeaturesToMapItems;
    v10->_mapItemCustomFeaturesToMapItems = (NSMapTable *)v52;

    v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 10);
    mapItemsToMapItemCustomFeatures = v10->_mapItemsToMapItemCustomFeatures;
    v10->_mapItemsToMapItemCustomFeatures = (NSMapTable *)v54;

    v56 = objc_alloc_init(MKStandardMapConfiguration);
    preferredConfiguration = v10->_preferredConfiguration;
    v10->_preferredConfiguration = &v56->super;

    -[MKMapConfiguration _addObserver:options:context:](v10->_preferredConfiguration, "_addObserver:options:context:", v10, 0, _MergedGlobals_1_0);
    v10->_canShowGrid = 1;
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (id)-[_MKStaticMapView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v58, sel_traitEnvironment_didChangeTraitCollection_);

    v60 = v10;
    v9 = v68;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_MKStaticMapView;
  -[_MKStaticMapView dealloc](&v2, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  _BOOL4 v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_MKStaticMapView frame](self, "frame");
  v10 = height != v9 || width != v8;
  self->_changingSize = v10;
  v11.receiver = self;
  v11.super_class = (Class)_MKStaticMapView;
  -[_MKStaticMapView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  self->_changingSize = 0;
  if (v10)
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  _BOOL4 v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_MKStaticMapView bounds](self, "bounds");
  v10 = height != v9 || width != v8;
  self->_changingSize = v10;
  v11.receiver = self;
  v11.super_class = (Class)_MKStaticMapView;
  -[_MKStaticMapView setBounds:](&v11, sel_setBounds_, x, y, width, height);
  self->_changingSize = 0;
  if (v10)
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
}

- (NSArray)annotations
{
  return -[MKAnnotationManager annotations](self->_annotationManager, "annotations");
}

- (void)beginUpdates
{
  uint8_t v2[16];

  if (self->_batchingEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: !_batchingEnabled", v2, 2u);
    }
  }
  else
  {
    self->_batchingEnabled = 1;
  }
}

- (void)endUpdates
{
  uint8_t v2[16];

  if (self->_batchingEnabled)
  {
    self->_batchingEnabled = 0;
    if (self->_batchHasChanges)
    {
      self->_batchHasChanges = 0;
      -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _batchingEnabled", v2, 2u);
  }
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKStaticMapView;
  -[_MKStaticMapView layoutMarginsDidChange](&v9, sel_layoutMarginsDidChange);
  -[_MKStaticMapView layoutMargins](self, "layoutMargins");
  if (!self->_changingSize)
  {
    v7 = v4 == self->_lastSnapshotLayoutMargins.left;
    if (v3 != self->_lastSnapshotLayoutMargins.top)
      v7 = 0;
    v8 = v6 == self->_lastSnapshotLayoutMargins.right && v7;
    if (v5 != self->_lastSnapshotLayoutMargins.bottom)
      v8 = 0;
    if (self->_honorsLayoutMargins && !v8)
      -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 0);
  }
}

- ($DC1C8D958DDC8D67D0023B74A9319680)region
{
  return ($DC1C8D958DDC8D67D0023B74A9319680 *)-[MKMapSnapshotOptions region](self->_snapshotOptions, "region");
}

- (void)setRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v12;
  float64x2_t *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float64x2_t v18;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v12 = -[MKMapSnapshotOptions _viewportMode](self->_snapshotOptions, "_viewportMode", a3);
  v13 = (float64x2_t *)MEMORY[0x1E0CEB4B0];
  if (v12
    || (-[MKMapSnapshotOptions region](self->_snapshotOptions, "region"), vabdd_f64(v10, v17) >= 0.00000000999999994)
    || vabdd_f64(v9, v14) >= 0.00000000999999994
    || vabdd_f64(v8, v15) >= 0.00000000999999994
    || vabdd_f64(v7, v16) >= 0.00000000999999994
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_additionalEdgeInsets.top, *v13), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_additionalEdgeInsets.bottom, v13[1]))), 0xFuLL))) & 1) == 0)
  {
    -[MKMapSnapshotOptions setRegion:](self->_snapshotOptions, "setRegion:", v10, v9, v8, v7);
    v18 = v13[1];
    *(float64x2_t *)&self->_additionalEdgeInsets.top = *v13;
    *(float64x2_t *)&self->_additionalEdgeInsets.bottom = v18;
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
    -[MKAnnotationContainerView updateAnnotationViewsForReason:](self->_annotationContainer, "updateAnnotationViewsForReason:", 1);
  }
}

- ($FD2884BA735A6398BD92EEF91FE53E55)visibleMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  -[MKMapSnapshotOptions mapRect](self->_snapshotOptions, "mapRect");
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (void)setVisibleMapRect:(id)a3
{
  -[_MKStaticMapView setVisibleMapRect:edgePadding:](self, "setVisibleMapRect:edgePadding:", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
}

- (void)setVisibleMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double var1;
  double var0;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v10 = a3.var0.var1;
  v11 = a3.var0.var0;
  if (-[MKMapSnapshotOptions _viewportMode](self->_snapshotOptions, "_viewportMode") != 1
    || ((-[MKMapSnapshotOptions mapRect](self->_snapshotOptions, "mapRect"), v11 == v16)
      ? (v17 = v10 == v13)
      : (v17 = 0),
        v17 ? (v18 = var0 == v14) : (v18 = 0),
        v18 ? (v19 = var1 == v15) : (v19 = 0),
        !v19
     || (left == self->_additionalEdgeInsets.left ? (v20 = top == self->_additionalEdgeInsets.top) : (v20 = 0),
         v20 ? (v21 = right == self->_additionalEdgeInsets.right) : (v21 = 0),
         v21 ? (v22 = bottom == self->_additionalEdgeInsets.bottom) : (v22 = 0),
         !v22)))
  {
    -[MKMapSnapshotOptions setMapRect:](self->_snapshotOptions, "setMapRect:", v11, v10, var0, var1);
    self->_additionalEdgeInsets.top = top;
    self->_additionalEdgeInsets.left = left;
    self->_additionalEdgeInsets.bottom = bottom;
    self->_additionalEdgeInsets.right = right;
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
    -[MKAnnotationContainerView updateAnnotationViewsForReason:](self->_annotationContainer, "updateAnnotationViewsForReason:", 1);
  }
}

- (MKMapCamera)camera
{
  return -[MKMapSnapshotOptions camera](self->_snapshotOptions, "camera");
}

- (void)setCamera:(id)a3
{
  int64_t v4;
  double *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  __int128 v9;
  double v10;
  double bottom;
  id v12;

  v12 = a3;
  v4 = -[MKMapSnapshotOptions _viewportMode](self->_snapshotOptions, "_viewportMode");
  v5 = (double *)MEMORY[0x1E0CEB4B0];
  if (v4 == 2)
  {
    -[MKMapSnapshotOptions camera](self->_snapshotOptions, "camera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v6)
      && (self->_additionalEdgeInsets.left == v5[1] ? (v7 = self->_additionalEdgeInsets.top == *v5) : (v7 = 0),
          v7 ? (v8 = self->_additionalEdgeInsets.right == v5[3]) : (v8 = 0),
          v8))
    {
      v10 = v5[2];
      bottom = self->_additionalEdgeInsets.bottom;

      if (bottom == v10)
        goto LABEL_12;
    }
    else
    {

    }
  }
  -[MKMapSnapshotOptions setCamera:](self->_snapshotOptions, "setCamera:", v12);
  v9 = *((_OWORD *)v5 + 1);
  *(_OWORD *)&self->_additionalEdgeInsets.top = *(_OWORD *)v5;
  *(_OWORD *)&self->_additionalEdgeInsets.bottom = v9;
  -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
  -[MKAnnotationContainerView updateAnnotationViewsForReason:](self->_annotationContainer, "updateAnnotationViewsForReason:", 1);
LABEL_12:

}

- (void)setSelectedTrailWithId:(id)a3 name:(id)a4 locale:(id)a5
{
  -[MKMapSnapshotOptions _setSelectedTrailWithId:name:locale:](self->_snapshotOptions, "_setSelectedTrailWithId:name:locale:", a3, a4, a5);
  -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4
{
  double longitude;
  double latitude;
  MKMapSnapshot *snapshot;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  longitude = a3.longitude;
  latitude = a3.latitude;
  snapshot = self->_snapshot;
  if (!snapshot)
    snapshot = self->_gridSnapshot;
  v8 = a4;
  -[MKMapSnapshot pointForCoordinate:](snapshot, "pointForCoordinate:", latitude, longitude);
  -[_MKStaticMapView convertPoint:toView:](self, "convertPoint:toView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CLLocationCoordinate2D)convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4
{
  double v4;
  double v5;
  CLLocationCoordinate2D result;

  v4 = *MEMORY[0x1E0C9E500];
  v5 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  result.longitude = v5;
  result.latitude = v4;
  return result;
}

- (void)setPreferredConfiguration:(id)a3
{
  MKMapConfiguration *preferredConfiguration;
  uint64_t v5;
  id v6;
  MKMapConfiguration *v7;
  MKMapConfiguration *v8;

  preferredConfiguration = self->_preferredConfiguration;
  if (preferredConfiguration != a3)
  {
    v5 = _MergedGlobals_1_0;
    v6 = a3;
    -[MKMapConfiguration _removeObserver:context:](preferredConfiguration, "_removeObserver:context:", self, v5);
    v7 = (MKMapConfiguration *)objc_msgSend(v6, "copy");

    v8 = self->_preferredConfiguration;
    self->_preferredConfiguration = v7;

    -[MKMapConfiguration _addObserver:options:context:](self->_preferredConfiguration, "_addObserver:options:context:", self, 0, _MergedGlobals_1_0);
    -[MKMapSnapshotOptions setPreferredConfiguration:](self->_snapshotOptions, "setPreferredConfiguration:", self->_preferredConfiguration);
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)_MergedGlobals_1_0 == a6)
  {
    -[MKMapSnapshotOptions setPreferredConfiguration:](self->_snapshotOptions, "setPreferredConfiguration:", self->_preferredConfiguration);
LABEL_6:
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
    goto LABEL_7;
  }
  if ((void *)qword_1EDFB2778 == a6)
  {
    -[_MKStaticMapView _updateSnapshotOptionsWithOverlayRenderers](self, "_updateSnapshotOptionsWithOverlayRenderers");
    goto LABEL_6;
  }
  v13.receiver = self;
  v13.super_class = (Class)_MKStaticMapView;
  -[_MKStaticMapView observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_7:

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;

  -[_MKStaticMapView traitCollection](self, "traitCollection", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapSnapshotOptions setTraitCollection:](self->_snapshotOptions, "setTraitCollection:", v5);

  -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
}

- (unint64_t)_incrementSnapshotGeneration
{
  MKMapSnapshotter *currentSnapshotter;
  MKMapSnapshot *snapshot;
  MKMapSnapshot *gridSnapshot;
  unint64_t result;

  -[MKMapSnapshotter cancel](self->_currentSnapshotter, "cancel");
  currentSnapshotter = self->_currentSnapshotter;
  self->_currentSnapshotter = 0;

  snapshot = self->_snapshot;
  self->_snapshot = 0;

  gridSnapshot = self->_gridSnapshot;
  self->_gridSnapshot = 0;

  result = self->_snapshotGeneration + 1;
  self->_snapshotGeneration = result;
  return result;
}

- (void)_displayGridWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  double v5;
  double v6;
  double v7;
  MKMapSnapshotOptions *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  MKMapSnapshotter *v13;
  MKMapSnapshotter *currentSnapshotter;
  unint64_t snapshotGeneration;
  MKMapSnapshotter *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  unint64_t v19;

  v4 = (void (**)(_QWORD))a3;
  -[_MKStaticMapView bounds](self, "bounds");
  v6 = v5;
  -[_MKStaticMapView bounds](self, "bounds");
  if (v6 * v7 == 0.0
    || (-[UIImageView setImage:](self->_imageView, "setImage:", 0, v6 * v7),
        -[_MKStaticMapView _hideAllAnnotations](self, "_hideAllAnnotations"),
        !self->_canShowGrid))
  {
    v4[2](v4);
  }
  else
  {
    v8 = objc_alloc_init(MKMapSnapshotOptions);
    -[_MKStaticMapView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions setTraitCollection:](v8, "setTraitCollection:", v9);

    -[_MKStaticMapView bounds](self, "bounds");
    -[MKMapSnapshotOptions setSize:](v8, "setSize:", v10, v11);
    -[MKMapSnapshotOptions setMapType:](v8, "setMapType:", 105);
    -[MKMapSnapshotOptions camera](self->_snapshotOptions, "camera");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions setCamera:](v8, "setCamera:", v12);

    v13 = -[MKMapSnapshotter initWithOptions:]([MKMapSnapshotter alloc], "initWithOptions:", v8);
    currentSnapshotter = self->_currentSnapshotter;
    self->_currentSnapshotter = v13;

    snapshotGeneration = self->_snapshotGeneration;
    v16 = self->_currentSnapshotter;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54___MKStaticMapView__displayGridWithCompletionHandler___block_invoke;
    v17[3] = &unk_1E20DC700;
    v19 = snapshotGeneration;
    v17[4] = self;
    v18 = v4;
    -[MKMapSnapshotter startWithQueue:completionHandler:](v16, "startWithQueue:completionHandler:", MEMORY[0x1E0C80D38], v17);

  }
}

- (void)_updateSnapshot:(BOOL)a3
{
  _BOOL4 v4;
  unint64_t v5;
  id WeakRetained;
  char v7;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  _QWORD v13[6];

  if (self->_batchingEnabled)
  {
    self->_batchHasChanges = 1;
    return;
  }
  v4 = a3;
  v5 = -[_MKStaticMapView _incrementSnapshotGeneration](self, "_incrementSnapshotGeneration");
  if (!self->_loading)
  {
    self->_loading = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "mapViewWillStartLoadingMap:", self);

    }
  }
  if (self->_honorsLayoutMargins)
  {
    -[_MKStaticMapView layoutMargins](self, "layoutMargins");
    self->_lastSnapshotLayoutMargins.top = v9;
    self->_lastSnapshotLayoutMargins.left = v10;
    self->_lastSnapshotLayoutMargins.bottom = v11;
    self->_lastSnapshotLayoutMargins.right = v12;
  }
  if (self->_showsUserLocation && !self->_isUpdatingUserLocation)
  {
    -[_MKStaticMapView _startUpdatingUserLocation](self, "_startUpdatingUserLocation");
    if (v4)
      goto LABEL_11;
LABEL_14:
    -[_MKStaticMapView _startSnapshotRequest](self, "_startSnapshotRequest");
    return;
  }
  if (!v4)
    goto LABEL_14;
LABEL_11:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36___MKStaticMapView__updateSnapshot___block_invoke;
  v13[3] = &unk_1E20D7DC0;
  v13[4] = self;
  v13[5] = v5;
  -[_MKStaticMapView _displayGridWithCompletionHandler:](self, "_displayGridWithCompletionHandler:", v13);
}

- (void)_startSnapshotRequest
{
  unint64_t snapshotGeneration;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double top;
  double v17;
  double left;
  double v19;
  double bottom;
  double v21;
  double right;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  MKMapSnapshotter *v37;
  MKMapSnapshotter *currentSnapshotter;
  MKMapSnapshotter *v39;
  id v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  snapshotGeneration = self->_snapshotGeneration;
  -[_MKStaticMapView bounds](self, "bounds");
  v5 = v4;
  -[_MKStaticMapView bounds](self, "bounds");
  if (v5 * v6 == 0.0)
  {
    if (self->_loading)
    {
      self->_loading = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v40 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v40, "mapViewDidFinishLoadingMap:", self);

      }
    }
  }
  else
  {
    -[_MKStaticMapView bounds](self, "bounds", v5 * v6);
    -[MKMapSnapshotOptions setSize:](self->_snapshotOptions, "setSize:", v9, v10);
    v11 = *MEMORY[0x1E0CEB4B0];
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    if (self->_honorsLayoutMargins)
    {
      -[_MKStaticMapView layoutMargins](self, "layoutMargins");
      top = v15 + self->_additionalEdgeInsets.top;
      left = v17 + self->_additionalEdgeInsets.left;
      bottom = v19 + self->_additionalEdgeInsets.bottom;
      right = v21 + self->_additionalEdgeInsets.right;
    }
    else
    {
      top = self->_additionalEdgeInsets.top;
      left = self->_additionalEdgeInsets.left;
      bottom = self->_additionalEdgeInsets.bottom;
      right = self->_additionalEdgeInsets.right;
    }
    -[MKMapSnapshotOptions _setEdgeInsets:](self->_snapshotOptions, "_setEdgeInsets:", v11 + top, v12 + left, v14 + bottom, v13 + right);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[MKMapSnapshotOptions _customFeatureAnnotations](self->_snapshotOptions, "_customFeatureAnnotations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v23, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v26);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[MKAnnotationContainerView annotationViews](self->_annotationContainer, "annotationViews");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v43 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          if (objc_msgSend(v35, "isProvidingCustomFeature"))
          {
            objc_msgSend(v35, "customFeatureAnnotation");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v36);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v32);
    }

    -[MKMapSnapshotOptions _setCustomFeatureAnnotations:](self->_snapshotOptions, "_setCustomFeatureAnnotations:", v23);
    v37 = -[MKMapSnapshotter initWithOptions:]([MKMapSnapshotter alloc], "initWithOptions:", self->_snapshotOptions);
    currentSnapshotter = self->_currentSnapshotter;
    self->_currentSnapshotter = v37;

    v39 = self->_currentSnapshotter;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __41___MKStaticMapView__startSnapshotRequest__block_invoke;
    v41[3] = &unk_1E20DC728;
    v41[4] = self;
    v41[5] = snapshotGeneration;
    -[MKMapSnapshotter startWithQueue:completionHandler:](v39, "startWithQueue:completionHandler:", MEMORY[0x1E0C80D38], v41);

  }
}

- (void)_hideAllAnnotations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_userLocation)
    -[MKAnnotationManager removeAnnotation:](self->_annotationManager, "removeAnnotation:");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[MKAnnotationContainerView annotationViews](self->_annotationContainer, "annotationViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setHidden:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_showAllAnnotations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_userLocation)
    -[MKAnnotationManager addAnnotation:](self->_annotationManager, "addAnnotation:");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[MKAnnotationContainerView annotationViews](self->_annotationContainer, "annotationViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setHidden:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addAnnotation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MKStaticMapView addAnnotations:](self, "addAnnotations:", v6, v7, v8);
  }
}

- (void)addAnnotations:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    -[MKAnnotationManager addAnnotations:](self->_annotationManager, "addAnnotations:", v4);

}

- (void)removeAnnotation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MKStaticMapView removeAnnotations:](self, "removeAnnotations:", v6, v7, v8);
  }
}

- (void)removeAnnotations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          if (*(MKUserLocation **)(*((_QWORD *)&v11 + 1) + 8 * v10) != self->_userLocation)
            objc_msgSend(v5, "addObject:", (_QWORD)v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[MKAnnotationManager removeAnnotations:](self->_annotationManager, "removeAnnotations:", v5);
  }

}

- (void)selectAnnotation:(id)a3 animated:(BOOL)a4
{
  self->_userLocationSelected = 0;
  -[MKAnnotationManager selectAnnotation:animated:](self->_annotationManager, "selectAnnotation:animated:", a3, a4);
}

- (void)selectUserLocationAnimated:(BOOL)a3
{
  self->_userLocationSelected = 1;
  if (self->_userLocationView)
    -[MKAnnotationManager selectAnnotation:animated:](self->_annotationManager, "selectAnnotation:animated:", self->_userLocation, a3);
}

- (id)viewForAnnotation:(id)a3
{
  return -[MKAnnotationManager representationForAnnotation:](self->_annotationManager, "representationForAnnotation:", a3);
}

- (NSArray)overlays
{
  NSMutableOrderedSet **overlays;
  void *v3;
  void *v4;
  void *v5;

  overlays = self->_overlays;
  -[NSMutableOrderedSet array](self->_overlays[0], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](overlays[1], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)addOverlays:(id)a3
{
  id v4;

  v4 = a3;
  -[_MKStaticMapView addOverlays:level:](self, "addOverlays:level:", v4, +[MKOverlayContainerView _defaultOverlayLevel](MKOverlayContainerView, "_defaultOverlayLevel"));

}

- (void)addOverlays:(id)a3 level:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  char v13;
  id v14;
  uint64_t v15;
  id v16;
  NSMutableOrderedSet *v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v16 = v6;
    v17 = self->_overlays[a4];
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v19 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v19)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[_MKStaticMapView removeOverlay:](self, "removeOverlay:", v10, v16);
          -[NSMapTable objectForKey:](self->_overlaysToRenderers, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            -[_MKStaticMapView _removeKVOForOverlayRenderer:](self, "_removeKVOForOverlayRenderer:", v11);
          -[NSMapTable removeObjectForKey:](self->_overlaysToRenderers, "removeObjectForKey:", v10);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v13 = objc_opt_respondsToSelector();

          if ((v13 & 1) != 0)
          {
            -[NSMutableOrderedSet addObject:](v17, "addObject:", v10);
            v14 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v14, "mapView:rendererForOverlay:", self, v10);
            v15 = objc_claimAutoreleasedReturnValue();

            -[_MKStaticMapView _addKVOForOverlayRenderer:](self, "_addKVOForOverlayRenderer:", v15);
            -[NSMapTable setObject:forKey:](self->_overlaysToRenderers, "setObject:forKey:", v15, v10);
            v11 = (void *)v15;
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    -[_MKStaticMapView _updateSnapshotOptionsWithOverlayRenderers](self, "_updateSnapshotOptionsWithOverlayRenderers");
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);

    v6 = v16;
  }

}

- (void)_addKVOForOverlayRenderer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  overlayRendererKVOKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(NSString **)(*((_QWORD *)&v11 + 1) + 8 * i);
        NSSelectorFromString(v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v10, 0, qword_1EDFB2778, (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_removeKVOForOverlayRenderer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  overlayRendererKVOKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(NSString **)(*((_QWORD *)&v11 + 1) + 8 * i);
        NSSelectorFromString(v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, v10, qword_1EDFB2778, (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)removeOverlays:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[_MKStaticMapView removeOverlay:](self, "removeOverlay:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[_MKStaticMapView _updateSnapshotOptionsWithOverlayRenderers](self, "_updateSnapshotOptionsWithOverlayRenderers");
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
  }

}

- (void)removeOverlay:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  NSMutableOrderedSet *v7;
  id v8;

  v8 = a3;
  v4 = 0;
  v5 = 1;
  while (1)
  {
    v6 = v5;
    v7 = self->_overlays[v4];
    if (-[NSMutableOrderedSet containsObject:](v7, "containsObject:", v8))
      break;

    v5 = 0;
    v4 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_6;
  }
  -[NSMutableOrderedSet removeObject:](v7, "removeObject:", v8);
  -[NSMapTable removeObjectForKey:](self->_overlaysToRenderers, "removeObjectForKey:", v8);

LABEL_6:
}

- (void)_updateSnapshotOptionsWithOverlayRenderers
{
  uint64_t v3;
  char v4;
  char v5;
  NSMutableOrderedSet *v6;
  id v7;
  NSMutableOrderedSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableOrderedSet **overlays;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = 0;
  v20 = *MEMORY[0x1E0C80C00];
  overlays = self->_overlays;
  v4 = 1;
  do
  {
    v5 = v4;
    v6 = overlays[v3];
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[NSMapTable objectForKey:](self->_overlaysToRenderers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[MKMapSnapshotOptions _setOverlayRenderers:forOverlayLevel:](self->_snapshotOptions, "_setOverlayRenderers:forOverlayLevel:", v7, v3);
    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
}

- (id)rendererForOverlay:(id)a3
{
  return -[NSMapTable objectForKey:](self->_overlaysToRenderers, "objectForKey:", a3);
}

- (BOOL)hasUserLocation
{
  void *v2;
  BOOL v3;

  -[MKUserLocation location](self->_userLocation, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setShowsUserLocation:(BOOL)a3
{
  void *v4;
  MKUserLocation *userLocation;

  if (self->_showsUserLocation != a3)
  {
    self->_showsUserLocation = a3;
    if (!a3)
      goto LABEL_7;
    -[UIImageView image](self->_imageView, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_MKStaticMapView _startUpdatingUserLocation](self, "_startUpdatingUserLocation");
      return;
    }
    if (!self->_showsUserLocation)
    {
LABEL_7:
      -[_MKStaticMapView _stopUpdatingUserLocation](self, "_stopUpdatingUserLocation");
      if (self->_userLocation)
      {
        -[MKAnnotationManager removeAnnotation:](self->_annotationManager, "removeAnnotation:");
        userLocation = self->_userLocation;
        self->_userLocation = 0;

      }
    }
  }
}

- (void)_startUpdatingUserLocation
{
  self->_isUpdatingUserLocation = 1;
  -[MKLocationManager startLocationUpdateWithObserver:](self->_locationManager, "startLocationUpdateWithObserver:", self);
}

- (void)_stopUpdatingUserLocation
{
  self->_isUpdatingUserLocation = 0;
  -[MKLocationManager stopLocationUpdateWithObserver:](self->_locationManager, "stopLocationUpdateWithObserver:", self);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  void *v5;
  MKUserLocation *userLocation;
  void *v7;
  double v8;
  double v9;
  MKUserLocation *v10;
  MKUserLocation *v11;
  void *v12;
  MKAnnotationView *v13;
  MKAnnotationView *v14;
  MKAnnotationView *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  _MKStaticMapView *v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "lastLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  userLocation = self->_userLocation;
  if (userLocation)
  {
    v7 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(v4, "expectedGpsUpdateInterval");
    v9 = v8;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __51___MKStaticMapView_locationManagerUpdatedLocation___block_invoke;
    v19 = &unk_1E20D7E58;
    v20 = self;
    v21 = v5;
    objc_msgSend(v7, "_mapkit_animateWithDuration:animations:completion:", &v16, 0, v9);

  }
  else
  {
    v10 = objc_alloc_init(MKUserLocation);
    v11 = self->_userLocation;
    self->_userLocation = v10;

    -[MKUserLocation setLocation:](self->_userLocation, "setLocation:", v5);
  }
  objc_msgSend(v5, "course", v16, v17, v18, v19, v20);
  -[MKUserLocation setCourse:](self->_userLocation, "setCourse:");
  if (!userLocation)
  {
    -[UIImageView image](self->_imageView, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[MKAnnotationManager addAnnotation:](self->_annotationManager, "addAnnotation:", self->_userLocation);
  }
  v13 = self->_userLocationView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = 0;
      goto LABEL_13;
    }
    -[MKAnnotationView _mkUserLocationView](v13, "_mkUserLocationView");
    v14 = (MKAnnotationView *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
LABEL_13:

  objc_msgSend(v4, "expectedGpsUpdateInterval");
  -[MKAnnotationView updateStateFromLocation:duration:](v15, "updateStateFromLocation:duration:", v5);

}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  MKAnnotationView *v4;
  MKAnnotationView *v5;
  MKAnnotationView *v6;

  v4 = self->_userLocationView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[MKAnnotationView _mkUserLocationView](v4, "_mkUserLocationView");
    v5 = (MKAnnotationView *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  -[MKAnnotationView locationManagerFailedToUpdateLocation](v6, "locationManagerFailedToUpdateLocation");
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)locationManagerUpdatedLimitsPrecisionState:(id)a3
{
  MKAnnotationView *v4;
  MKAnnotationView *v5;
  MKAnnotationView *v6;
  id v7;

  v7 = a3;
  v4 = self->_userLocationView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = v4;
      goto LABEL_8;
    }
    -[MKAnnotationView _mkUserLocationView](v4, "_mkUserLocationView");
    v5 = (MKAnnotationView *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (v6)
  {
    -[MKAnnotationView _setShouldShowDynamicLocationAnimations:](v6, "_setShouldShowDynamicLocationAnimations:", objc_msgSend(v7, "isAuthorizedForPreciseLocation"));
LABEL_8:

  }
}

- (void)addAnnotationRepresentation:(id)a3 allowAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  MKUserLocation *v9;
  MKUserLocation *userLocation;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  id v16;
  id v17;
  void *v18;
  NSMutableArray *currentUpdateAddedAnnotations;
  NSMutableArray *v20;
  NSMutableArray *v21;
  uint8_t v22[16];

  v4 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "_setStaticMapView:", self);
    objc_msgSend(v8, "annotation");
    v9 = (MKUserLocation *)objc_claimAutoreleasedReturnValue();
    userLocation = self->_userLocation;

    if (v9 != userLocation)
    {
LABEL_16:
      -[MKAnnotationContainerView addAnnotationView:allowAnimation:](self->_annotationContainer, "addAnnotationView:allowAnimation:", v8, v4);
      currentUpdateAddedAnnotations = self->_currentUpdateAddedAnnotations;
      if (!currentUpdateAddedAnnotations)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v21 = self->_currentUpdateAddedAnnotations;
        self->_currentUpdateAddedAnnotations = v20;

        currentUpdateAddedAnnotations = self->_currentUpdateAddedAnnotations;
      }
      -[NSMutableArray addObject:](currentUpdateAddedAnnotations, "addObject:", v8);

      goto LABEL_19;
    }
    objc_storeStrong((id *)&self->_userLocationView, a3);
    v11 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
LABEL_9:

        -[MKUserLocation location](self->_userLocation, "location");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateStateFromLocation:duration:", v14, 0.0);

        v15 = -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation");
        v16 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v18 = 0;
            goto LABEL_15;
          }
          objc_msgSend(v16, "_mkUserLocationView");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;
LABEL_15:

        objc_msgSend(v18, "_setShouldShowDynamicLocationAnimations:", v15);
        -[MKAnnotationContainerView setUserLocationView:](self->_annotationContainer, "setUserLocationView:", v16);
        goto LABEL_16;
      }
      objc_msgSend(v11, "_mkUserLocationView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [representation isKindOfClass:MKAnnotationView.class]", v22, 2u);
  }
LABEL_19:

}

- (void)removeAnnotationRepresentation:(id)a3
{
  id v4;
  MKAnnotationView *v5;
  uint8_t v6[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (MKAnnotationView *)v4;
    if (-[MKAnnotationView isProvidingCustomFeature](v5, "isProvidingCustomFeature"))
      self->_currentUpdateRemovedCustomFeatureAnnotation = 1;
    -[MKAnnotationView _setStaticMapView:](v5, "_setStaticMapView:", 0);
    if (self->_userLocationView == v5)
    {
      self->_userLocationView = 0;

      -[MKAnnotationContainerView setUserLocationView:](self->_annotationContainer, "setUserLocationView:", 0);
    }
    -[MKAnnotationContainerView removeAnnotationView:](self->_annotationContainer, "removeAnnotationView:", v5);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [representation isKindOfClass:MKAnnotationView.class]", v6, 2u);
  }

}

- (void)selectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKAnnotationContainerView *annotationContainer;
  id v6;

  v4 = a4;
  annotationContainer = self->_annotationContainer;
  objc_msgSend(a3, "viewRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationContainerView selectAnnotationView:animated:](annotationContainer, "selectAnnotationView:animated:", v6, v4);

}

- (void)deselectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKAnnotationContainerView *annotationContainer;
  id v6;

  v4 = a4;
  annotationContainer = self->_annotationContainer;
  objc_msgSend(a3, "viewRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationContainerView deselectAnnotationView:animated:](annotationContainer, "deselectAnnotationView:animated:", v6, v4);

}

- (void)moveAnnotationRepresentation:(id)a3 fromCoordinate:(CLLocationCoordinate2D)a4 animated:(BOOL)a5 duration:(double)a6
{
  id v7;
  uint8_t v8[16];

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKAnnotationContainerView updateAnnotationView:](self->_annotationContainer, "updateAnnotationView:", v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [annotationRepresentation isKindOfClass:MKAnnotationView.class]", v8, 2u);
  }

}

- (id)annotationRectTest
{
  return &__block_literal_global_78;
}

- (id)annotationCoordinateTest
{
  return &__block_literal_global_44;
}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  return 0;
}

- (void)annotationManager:(id)a3 didAddAnnotationRepresentations:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (*(MKAnnotationView **)(*((_QWORD *)&v11 + 1) + 8 * i) == self->_userLocationView)
        {
          if (self->_userLocationSelected)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __70___MKStaticMapView_annotationManager_didAddAnnotationRepresentations___block_invoke;
            block[3] = &unk_1E20D7D98;
            block[4] = self;
            dispatch_async(MEMORY[0x1E0C80D38], block);
          }
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)annotationManagerDidChangeVisibleAnnotationRepresentations:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  _BOOL8 currentUpdateRemovedCustomFeatureAnnotation;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MKAnnotationContainerView updateAnnotationViewsForReason:](self->_annotationContainer, "updateAnnotationViewsForReason:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MKAnnotationContainerView annotationViews](self->_annotationContainer, "annotationViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "_performStateUpdatesIfNeeded");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_currentUpdateAddedAnnotations;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    while (2)
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "isProvidingCustomFeature", (_QWORD)v15) & 1) != 0)
        {

          currentUpdateRemovedCustomFeatureAnnotation = self->_currentUpdateRemovedCustomFeatureAnnotation;
          goto LABEL_19;
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (self->_currentUpdateRemovedCustomFeatureAnnotation)
  {
    currentUpdateRemovedCustomFeatureAnnotation = 1;
LABEL_19:
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", currentUpdateRemovedCustomFeatureAnnotation, (_QWORD)v15);
  }
  -[NSMutableArray removeAllObjects](self->_currentUpdateAddedAnnotations, "removeAllObjects", (_QWORD)v15);
  self->_currentUpdateRemovedCustomFeatureAnnotation = 0;
}

- (id)annotationManager:(id)a3 representationForAnnotation:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "mapView:viewForAnnotation:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)annotationManager:(id)a3 canSelectAnnotationRepresentation:(id)a4
{
  return 1;
}

- (BOOL)annotationContainerShouldAlignToPixels:(id)a3
{
  return 1;
}

- (BOOL)annotationContainerIsRotated:(id)a3
{
  void *v3;
  double v4;
  BOOL v5;

  -[MKMapSnapshotOptions camera](self->_snapshotOptions, "camera", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heading");
  v5 = v4 != 0.0;

  return v5;
}

- (id)annotationContainer:(id)a3 requestAddingClusterForAnnotationViews:(id)a4
{
  return 0;
}

- (double)annotationContainer:(id)a3 pinDropDistanceForCoordinate:(CLLocationCoordinate2D)a4 maxDistance:(double *)a5
{
  double v7;
  double v8;
  uint64_t v9;

  -[_MKStaticMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, a4.latitude, a4.longitude);
  v8 = v7;
  if (a5)
  {
    -[_MKStaticMapView bounds](self, "bounds");
    *(_QWORD *)a5 = v9;
  }
  return v8;
}

- (CGRect)visibleRectInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[_MKStaticMapView bounds](self, "bounds");
  -[_MKStaticMapView convertRect:toView:](self, "convertRect:toView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)annotationContainer:(id)a3 isAnnotationView:(id)a4 validForDisplayAtPoint:(CGPoint)a5
{
  return fabs(a5.x) != INFINITY && fabs(a5.y) != INFINITY;
}

- (NSArray)mapItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MKMapSnapshotOptions _customFeatureAnnotations](self->_snapshotOptions, "_customFeatureAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MKMapSnapshotOptions _customFeatureAnnotations](self->_snapshotOptions, "_customFeatureAnnotations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSMapTable objectForKey:](self->_mapItemCustomFeaturesToMapItems, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v13;
}

- (void)addMapItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  _MKMapItemCustomFeature *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKMapSnapshotOptions _customFeatureAnnotations](self->_snapshotOptions, "_customFeatureAnnotations");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v18 = v7;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_mapItemsToMapItemCustomFeatures, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = -[_MKMapItemCustomFeature initWithMapItem:]([_MKMapItemCustomFeature alloc], "initWithMapItem:", v14);
          -[NSMapTable setObject:forKey:](self->_mapItemCustomFeaturesToMapItems, "setObject:forKey:", v14, v16);
          -[NSMapTable setObject:forKey:](self->_mapItemsToMapItemCustomFeatures, "setObject:forKey:", v16, v14);
          objc_msgSend(v8, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    v17 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v17, "addObjectsFromArray:", v8);
    -[MKMapSnapshotOptions _setCustomFeatureAnnotations:](self->_snapshotOptions, "_setCustomFeatureAnnotations:", v17);
    -[MKMapSnapshotOptions _setSearchResultsType:](self->_snapshotOptions, "_setSearchResultsType:", 1);
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);

  }
}

- (void)removeMapItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKMapSnapshotOptions _customFeatureAnnotations](self->_snapshotOptions, "_customFeatureAnnotations");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v17 = v7;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_mapItemsToMapItemCustomFeatures, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[NSMapTable removeObjectForKey:](self->_mapItemCustomFeaturesToMapItems, "removeObjectForKey:", v14);
          -[NSMapTable removeObjectForKey:](self->_mapItemsToMapItemCustomFeatures, "removeObjectForKey:", v13);
          objc_msgSend(v8, "addObject:", v14);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v8, "count"))
  {
    v15 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v15, "removeObjectsInArray:", v8);
    -[MKMapSnapshotOptions _setCustomFeatureAnnotations:](self->_snapshotOptions, "_setCustomFeatureAnnotations:", v15);
    -[_MKStaticMapView mapItems](self, "mapItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions _setSearchResultsType:](self->_snapshotOptions, "_setSearchResultsType:", objc_msgSend(v16, "count") != 0);

    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
  }

}

- (void)deselectMapItem:(id)a3
{
  void *v4;
  id v5;

  -[NSMapTable objectForKey:](self->_mapItemsToMapItemCustomFeatures, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "deselect");
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
    v4 = v5;
  }

}

- (void)selectMapItem:(id)a3
{
  void *v4;
  id v5;

  -[NSMapTable objectForKey:](self->_mapItemsToMapItemCustomFeatures, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "select");
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", 1);
    v4 = v5;
  }

}

- (_MKStaticMapViewDelegate)delegate
{
  return (_MKStaticMapViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (BOOL)honorsLayoutMargins
{
  return self->_honorsLayoutMargins;
}

- (void)setHonorsLayoutMargins:(BOOL)a3
{
  self->_honorsLayoutMargins = a3;
}

- (BOOL)canShowGrid
{
  return self->_canShowGrid;
}

- (void)setCanShowGrid:(BOOL)a3
{
  self->_canShowGrid = a3;
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_preferredConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentUpdateAddedAnnotations, 0);
  objc_storeStrong((id *)&self->_userLocationView, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_mapItemsToMapItemCustomFeatures, 0);
  objc_storeStrong((id *)&self->_mapItemCustomFeaturesToMapItems, 0);
  objc_storeStrong((id *)&self->_overlaysToRenderers, 0);
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_overlays[i], 0);
  objc_storeStrong((id *)&self->_annotationContainer, 0);
  objc_storeStrong((id *)&self->_annotationManager, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_gridSnapshot, 0);
  objc_storeStrong((id *)&self->_currentSnapshotter, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_snapshotOptions, 0);
}

@end

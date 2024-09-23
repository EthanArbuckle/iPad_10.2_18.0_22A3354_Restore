@implementation MKMapView

- (NSArray)overlays
{
  return -[MKOverlayContainerView overlays](self->_overlayContainer, "overlays");
}

- (BOOL)annotationContainerShouldAlignToPixels:(id)a3
{
  if ((-[VKMapView iconsShouldAlignToPixels](self->_mapView, "iconsShouldAlignToPixels", a3) & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
}

- (BOOL)annotationContainer:(id)a3 isAnnotationView:(id)a4 validForDisplayAtPoint:(CGPoint)a5
{
  double v5;
  double v6;
  id v10;

  v5 = fabs(a5.x);
  v6 = fabs(a5.y);
  if (v5 == INFINITY || v6 == INFINITY)
    return 0;
  if (self->_cachedVenueIDWithFocus)
  {
    v10 = (id)objc_msgSend(a4, "annotation", a3, INFINITY, a5.y, v5, v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v10, "venueID") == self->_cachedVenueIDWithFocus
      && (unsigned __int16)self->_cachedDisplayedFloorOrdinalForVenueWithFocus != (unsigned __int16)objc_msgSend(v10, "venueFloorOrdinal"))
    {
      return 0;
    }
  }
  return 1;
}

- (void)_updateScrollContainerView:(BOOL)a3 forReason:(int64_t)a4
{
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
  int v17;
  float v18;
  double v19;
  int v20;
  float v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CATransform3D *v45;
  CATransform3D *v46;
  void *v47;
  void *v48;
  MKAnnotationContainerView *annotationContainer;
  double v50;
  void *v51;
  void *v52;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;
  CATransform3D v56;

  -[MKMapView _zoomScale](self, "_zoomScale");
  v8 = v7;
  -[MKMapView _centerMapPoint](self, "_centerMapPoint");
  v10 = v8 * v9;
  v12 = v8 * v11;
  -[MKMapView bounds](self, "bounds");
  v14 = v10 - v13 * 0.5;
  -[MKMapView bounds](self, "bounds");
  v16 = v12 - v15 * 0.5;
  -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
  LODWORD(v10) = v17;
  -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
  v19 = (float)((float)(*(float *)&v10 - v18) * 0.5) - v16;
  -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
  LODWORD(v16) = v20;
  -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
  v22 = (float)((float)(*(float *)&v16 - v21) * 0.5) - v14;
  if (-[VKMapView iconsShouldAlignToPixels](self->_mapView, "iconsShouldAlignToPixels"))
  {
    -[MKMapView window](self, "window");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_5;
    v24 = (void *)v23;
    -[MKMapView window](self, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "screen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scale");
    v28 = v27;

    if (v28 == 1.0)
    {
LABEL_5:
      v22 = round(v22);
      v19 = round(v19);
    }
    else
    {
      v29 = floor(v22);
      v22 = v29 + round((v22 - v29) * v28) / v28;
      v30 = floor(v19);
      v19 = v30 + round((v19 - v30) * v28) / v28;
    }
  }
  if (!a3)
  {
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_CA_setDisableActions:", 1);

  }
  -[UIView layer](self->_scrollContainerView, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDoubleBounds:", 0.0, 0.0, v8 * 268435456.0, v8 * 268435456.0);
  objc_msgSend(v32, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v32, "setDoublePosition:", v22, v19);
  -[MKMapView _centerMapPoint](self, "_centerMapPoint");
  v34 = v33;
  v36 = v35;
  v37 = v8 * v33;
  v38 = v8 * v35;
  -[VKMapView presentationYaw](self->_mapView, "presentationYaw");
  v40 = v39 * -0.0174532925;
  v41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v56.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v56.m33 = v41;
  v42 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v56.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v56.m43 = v42;
  v43 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v56.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v56.m13 = v43;
  v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v56.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v56.m23 = v44;
  CATransform3DTranslate_((CATransform3D *)&off_18B2A9000, &v56, v37, v38, 0.0);
  CATransform3DRotate_(v45, &v56, v40, 0.0, 0.0, 1.0);
  CATransform3DTranslate_(v46, &v56, -(v8 * v34), -(v8 * v36), 0.0);
  v55 = v56;
  objc_msgSend(v32, "setTransform:", &v55);
  if (!a3)
  {
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_CA_setDisableActions:", 0);

  }
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_CA_setDisableActions:", 1);

  -[MKAnnotationContainerView setAnnotationViewsRotationRadians:animation:](self->_annotationContainer, "setAnnotationViewsRotationRadians:animation:", 0, -v40);
  annotationContainer = self->_annotationContainer;
  -[VKMapView pitch](self->_mapView, "pitch");
  -[MKAnnotationContainerView setMapPitchRadians:](annotationContainer, "setMapPitchRadians:", v50 * 0.0174532925);
  -[MKAnnotationContainerView updateAnnotationViewsForReason:](self->_annotationContainer, "updateAnnotationViewsForReason:", a4);
  -[MKOverlayContainerView layer](self->_overlayContainer, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAnchorPoint:", 0.0, 0.0);
  CATransform3DMakeScale(&v54, v8, v8, 1.0);
  v53 = v54;
  objc_msgSend(v51, "setTransform:", &v53);
  objc_msgSend(v51, "setDoublePosition:", 0.0, 0.0);
  -[MKOverlayContainerView setMapZoomScale:](self->_overlayContainer, "setMapZoomScale:", v8);
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_CA_setDisableActions:", 0);

}

- (BOOL)_canShowControls
{
  double v3;
  double v4;
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

  -[MKMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (qword_1EDFB79D0 != -1)
    dispatch_once(&qword_1EDFB79D0, &__block_literal_global_266);
  return v6 - (v8 + v12) >= *(double *)&qword_1EDFB79C8 && v4 - (v10 + v14) >= *(double *)&qword_1EDFB79C0;
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

- (BOOL)_roomForCompass
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGRect v15;
  CGRect v16;

  -[MKMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKMapView _compassDiameter](self, "_compassDiameter");
  v12 = v11;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v13 = v12 + v12;
  if (CGRectGetWidth(v15) < v13)
    return 0;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  return CGRectGetHeight(v16) >= v13;
}

- (double)_compassDiameter
{
  return MKCompassViewDiameterForSize(self->_compassViewSize);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerMapPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[MKMapView centerCoordinate](self, "centerCoordinate");
  v4 = MKTilePointForCoordinate(v2, v3, 21.0);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[VKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (double)_zoomScale
{
  double v2;

  -[MKMapView _zoomLevel](self, "_zoomLevel");
  return 1.0 / exp2(21.0 - v2);
}

- (double)_zoomLevel
{
  double result;

  -[VKMapView currentZoomLevelForTileSize:](self->_mapView, "currentZoomLevelForTileSize:", 128);
  return result;
}

uint64_t __31__MKMapView_annotationRectTest__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id *WeakRetained;
  id *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[84], "annotationRectTest");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (*(uint64_t (**)(uint64_t, double, double, double, double))(v11 + 16))(v11, a2 * 0.0000000037252903, 1.0 - (a3 + a5) * 0.0000000037252903, (a2 + a4) * 0.0000000037252903, 1.0 - a3 * 0.0000000037252903);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)annotationRectTest
{
  id annotationRectTest;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  annotationRectTest = self->_annotationRectTest;
  if (!annotationRectTest)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__MKMapView_annotationRectTest__block_invoke;
    v7[3] = &unk_1E20D8920;
    objc_copyWeak(&v8, &location);
    v4 = (void *)objc_msgSend(v7, "copy");
    v5 = self->_annotationRectTest;
    self->_annotationRectTest = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    annotationRectTest = self->_annotationRectTest;
  }
  return (id)MEMORY[0x18D778DB8](annotationRectTest, a2);
}

- (id)annotationCoordinateTest
{
  id annotationCoordinateTest;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  annotationCoordinateTest = self->_annotationCoordinateTest;
  if (!annotationCoordinateTest)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MKMapView_annotationCoordinateTest__block_invoke;
    v7[3] = &unk_1E20D8948;
    objc_copyWeak(&v8, &location);
    v4 = (void *)objc_msgSend(v7, "copy");
    v5 = self->_annotationCoordinateTest;
    self->_annotationCoordinateTest = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    annotationCoordinateTest = self->_annotationCoordinateTest;
  }
  return (id)MEMORY[0x18D778DB8](annotationCoordinateTest, a2);
}

- (BOOL)_mapViewHasUpdatedCamera
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CLLocationCoordinate2D v13;

  -[VKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v13 = CLLocationCoordinate2DMake(v3, v4);
  -[VKMapView yaw](self->_mapView, "yaw");
  v6 = v5;
  -[VKMapView pitch](self->_mapView, "pitch");
  v8 = v7;
  -[VKMapView altitude](self->_mapView, "altitude");
  v10 = v9;
  CLLocationCoordinate2DGetDistanceFrom();
  if (fabs(v11) <= 0.00000011920929
    && vabdd_f64(self->_oldHeading, v6) <= 0.00000011920929
    && vabdd_f64(self->_oldPitch, v8) <= 0.00000011920929
    && vabdd_f64(self->_oldAltitude, v10) <= 0.00000011920929)
  {
    return 0;
  }
  self->_oldCenterCoordinate = v13;
  self->_oldHeading = v6;
  self->_oldPitch = v8;
  self->_oldAltitude = v10;
  return 1;
}

- (VKMapView)_mapLayer
{
  return self->_mapView;
}

uint64_t __37__MKMapView_annotationCoordinateTest__block_invoke(uint64_t a1, double a2, double a3)
{
  id *WeakRetained;
  id *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[84], "annotationCoordinateTest");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (*(uint64_t (**)(uint64_t, double, double))(v7 + 16))(v7, a2, a3);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)annotationManagerDidChangeVisibleAnnotationRepresentations:(id)a3
{
  -[MKAnnotationContainerView finishAddingAndRemovingAnnotationViews](self->_annotationContainer, "finishAddingAndRemovingAnnotationViews", a3);
}

- (NSArray)_annotationViews
{
  return -[MKAnnotationManager annotationRepresentations](self->_annotationManager, "annotationRepresentations");
}

- (void)registerClass:(Class)viewClass forAnnotationViewWithReuseIdentifier:(NSString *)identifier
{
  -[MKAnnotationManager registerClass:forRepresentationReuseIdentifier:](self->_annotationManager, "registerClass:forRepresentationReuseIdentifier:", viewClass, identifier);
}

- (BOOL)_isShowingCuratedElevatedGround
{
  return -[VKMapView isShowingCuratedElevatedGround](self->_mapView, "isShowingCuratedElevatedGround");
}

- (void)_setEdgeInsets:(UIEdgeInsets)a3
{
  -[MKMapView _setEdgeInsets:explicit:](self, "_setEdgeInsets:explicit:", 1, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)removeOverlays:(NSArray *)overlays
{
  -[MKOverlayContainerView removeOverlays:](self->_overlayContainer, "removeOverlays:", overlays);
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 26);
}

- (id)_camera
{
  return self->_camera;
}

- (void)_setCompassInsets:(UIEdgeInsets)a3
{
  -[MKMapView _setCompassInsets:animated:](self, "_setCompassInsets:animated:", 1, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)mapLayerDidStartLoadingTiles:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  id v9;

  v9 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v7 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    -[MKMapViewDelegate mapViewWillStartLoadingMap:](v8, "mapViewWillStartLoadingMap:", self);

  }
}

- (void)_setCompassInsets:(UIEdgeInsets)a3 animated:(BOOL)a4
{
  self->_compassInsets = a3;
  -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", a4);
  if (self->_scaleVisibility != 1)
    -[MKMapView _updateScalePosition](self, "_updateScalePosition");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKMapView bounds](self, "bounds");
  if (v9 == width && v8 == height)
  {
    v15.receiver = self;
    v15.super_class = (Class)MKMapView;
    -[MKMapView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  }
  else
  {
    -[MKMapView _sizeWillChange](self, "_sizeWillChange");
    -[MKMapView centerCoordinate](self, "centerCoordinate");
    v12 = v11;
    v14 = v13;
    v16.receiver = self;
    v16.super_class = (Class)MKMapView;
    -[MKMapView setBounds:](&v16, sel_setBounds_, x, y, width, height);
    -[MKMapView _sizeDidChangeWithCenterCoordinate:](self, "_sizeDidChangeWithCenterCoordinate:", v12, v14);
  }
}

- (void)_sizeWillChange
{
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  -[MKAnnotationContainerView suppressUpdates](self->_annotationContainer, "suppressUpdates");
}

- (void)_sizeDidChangeWithCenterCoordinate:(CLLocationCoordinate2D)a3
{
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[MKMapView _updateContentBounds](self, "_updateContentBounds", a3.latitude, a3.longitude);
  -[MKMapView _updateScrollContainerView:forReason:](self, "_updateScrollContainerView:forReason:", 1, 1);
  -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility");
  -[MKMapView _updateTrackingVisibility](self, "_updateTrackingVisibility");
  -[MKMapView _updatePitchButtonVisibility](self, "_updatePitchButtonVisibility");
  -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 1);
  -[MKMapView _updateAppleLogoVisibility](self, "_updateAppleLogoVisibility");
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    v4 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke_2;
    v5[3] = &unk_1E20D82F8;
    objc_msgSend(v4, "animateWithDuration:animations:completion:", v6, v5);
  }
  else
  {
    -[MKAnnotationContainerView stopSuppressingUpdates](self->_annotationContainer, "stopSuppressingUpdates");
  }
  *(_QWORD *)&self->_flags &= ~0x800000uLL;
  -[MKMapView _performWhenSizedBlocks](self, "_performWhenSizedBlocks");
  if ((objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters") & 1) == 0)
    -[MKAnnotationContainerView updateAnnotationViewsForReason:](self->_annotationContainer, "updateAnnotationViewsForReason:", 1);
  if (self->_forceLayoutOnBoundsChange)
    -[VKMapView _forceLayoutForSuspensionSnapShot](self->_mapView, "_forceLayoutForSuspensionSnapShot");
}

- (void)mapLayerDidDraw:(id)a3
{
  uint64_t flags;
  uint64_t v5;
  void (**v6)(_QWORD);
  id selectAnnotationViewAfterRedrawBlock;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  flags = (uint64_t)self->_flags;
  *(_QWORD *)&self->_flags = flags & 0xFFFFFFFBFFFFFFFFLL;
  if ((flags & 0x800000) == 0)
  {
    if (-[MKMapView _mapViewHasUpdatedCamera](self, "_mapViewHasUpdatedCamera"))
      v5 = 1;
    else
      v5 = 2;
    -[MKMapView _updateScrollContainerView:forReason:](self, "_updateScrollContainerView:forReason:", 0, v5);
  }
  if (self->_selectAnnotationViewAfterRedrawBlock)
  {
    v6 = (void (**)(_QWORD))MEMORY[0x18D778DB8]();
    selectAnnotationViewAfterRedrawBlock = self->_selectAnnotationViewAfterRedrawBlock;
    self->_selectAnnotationViewAfterRedrawBlock = 0;

    v6[2](v6);
  }
  if ((*(_QWORD *)&self->_flags & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
      v10 = CFSTR("\n| external zoom: %.1f");
    else
      v10 = CFSTR("\n| e: %.1f");
    objc_msgSend(v14, "consoleString:", v9 == 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView _zoomLevel](self, "_zoomLevel");
    objc_msgSend(v11, "stringByAppendingFormat:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextView setText:](self->_vectorKitDebugView, "setText:", v13);
    -[MKMapView _updateVectorKitConsoleFrameWithEdgeInsets](self, "_updateVectorKitConsoleFrameWithEdgeInsets");

  }
}

- (void)_updateContentBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MidX;
  CGRect v12;
  CGRect v13;

  -[MKMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setBounds:](self->_contentView, "setBounds:");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  CGRectGetMidY(v13);
  -[UIView setCenter:](self->_contentView, "setCenter:", MKIntegralCenterForView(self->_contentView, MidX));
  -[MKBasicMapView setFrame:](self->_basicMapView, "setFrame:", v4, v6, v8, v10);
  -[MKBasicMapView layoutIfNeeded](self->_basicMapView, "layoutIfNeeded");
  -[MKAnnotationContainerView setFrame:](self->_annotationContainer, "setFrame:", v4, v6, v8, v10);
}

- (void)_performWhenSizedBlocks
{
  NSMutableArray *whenSizedBlocks;
  NSMutableArray *v3;

  whenSizedBlocks = self->_whenSizedBlocks;
  self->_whenSizedBlocks = 0;
  v3 = whenSizedBlocks;

  -[NSMutableArray makeObjectsPerformSelector:](v3, "makeObjectsPerformSelector:", sel_perform);
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  $5D7CD00554919180459D56D22149BB92 *p_flags;
  uint64_t flags;
  void (**v6)(_QWORD);
  id showCalloutAfterRegionChangeBlock;

  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  *(_QWORD *)&self->_flags = flags & 0xFFFFFFF7FFFFFBFFLL | 0x400;
  -[MKMapView _didChangeRegionMidstream:](self, "_didChangeRegionMidstream:", 0);
  *(_QWORD *)p_flags &= ~0x400uLL;
  -[MKMapView _clearFixedUserLocation](self, "_clearFixedUserLocation");
  if (self->_showCalloutAfterRegionChangeBlock)
  {
    v6 = (void (**)(_QWORD))MEMORY[0x18D778DB8]();
    showCalloutAfterRegionChangeBlock = self->_showCalloutAfterRegionChangeBlock;
    self->_showCalloutAfterRegionChangeBlock = 0;

    v6[2](v6);
  }
  if (-[MKMapView _automaticallySnapsToNorth](self, "_automaticallySnapsToNorth"))
  {
    if ((flags & 0x100000000000000) != 0)
      -[MKMapView _snapToNorthIfNecessary](self, "_snapToNorthIfNecessary");
  }
}

- (void)mapLayerDidChangeVisibleRegion
{
  MKMapViewDelegate *v3;
  MKMapViewDelegate *v4;
  char v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  void *v8;
  id v9;

  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  -[MKMapView _didChangeRegionMidstream:](self, "_didChangeRegionMidstream:", 1);
  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v3 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v3 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v6 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    -[MKMapViewDelegate mapViewDidChangeVisibleRegion:](v6, "mapViewDidChangeVisibleRegion:", self);

  }
  objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "mapView:viewPortUpdated:", self, -[MKMapView _geoCoordinateRegionForOffline](self));
    v8 = v9;
  }

}

- (void)_willChangeRegionAnimated:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  char v12;
  MKMapViewDelegate *v13;
  MKMapViewDelegate *v14;

  v4 = 2049;
  if (!a3)
    v4 = 1;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  -[MKMapView _dropDraggingAnnotationView:](self, "_dropDraggingAnnotationView:", 1);
  -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
  -[MKMapView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[MKMapView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("__mapkit_regionSentinel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "integerValue") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("__mapkit_regionSentinel"));

  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v10 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v13 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v13 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    -[MKMapViewDelegate mapView:regionWillChangeAnimated:](v13, "mapView:regionWillChangeAnimated:", self, (*(_QWORD *)&self->_flags >> 11) & 1);

  }
}

- (void)_didChangeRegionMidstream:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  uint64_t flags;
  _BOOL4 v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  char v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  char v14;
  MKMapView *v15;
  uint64_t v16;
  uint64_t v17;
  MKMapViewDelegate *v18;
  MKMapViewDelegate *v19;
  char v20;
  MKMapViewDelegate *v21;
  MKMapViewDelegate *v22;

  if (self->_cartographicConfiguration.projection == 1)
    LODWORD(v5) = 1;
  else
    v5 = (*(_QWORD *)&self->_flags >> 35) & 1;
  if (_MKLinkedOnOrAfterReleaseSet(2824))
    -[MKMapCamera _mapViewStateChanged](self->_camera, "_mapViewStateChanged");
  if (a3)
  {
    if (!(_DWORD)v5)
      goto LABEL_11;
  }
  else
  {
    *(_QWORD *)&self->_flags &= 0xFEFFFFFFFFFFFFFELL;
    -[MKMapView _updateCameraState](self, "_updateCameraState");
    -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
    -[MKMapView _updateRotationAttributes](self, "_updateRotationAttributes");
    -[MKMapView _updateEffects](self, "_updateEffects");
    -[MKOverlayContainerView addAndRemoveOverlayViews](self->_overlayContainer, "addAndRemoveOverlayViews");
  }
  -[MKAnnotationManager updateVisibleAnnotations](self->_annotationManager, "updateVisibleAnnotations");
LABEL_11:
  -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 1);
  -[MKMapView _updateScale](self, "_updateScale");
  -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility");
  -[MKMapView _updateTrackingVisibility](self, "_updateTrackingVisibility");
  -[MKMapView _updatePitchButtonVisibility](self, "_updatePitchButtonVisibility");
  v8 = self->_userTrackingMode
    && (-[MKUserLocation location](self->_userLocation, "location"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6)
    && (-[VKMapView isAnimatingToTrackAnnotation](self->_mapView, "isAnimatingToTrackAnnotation") & 1) == 0
    && (*(_QWORD *)&self->_flags & 0x8000001800000) == 0
    && !-[MKBasicMapView isChangingViewSize](self->_basicMapView, "isChangingViewSize")
    && (flags = (uint64_t)self->_flags, (flags & 0x1000000000000) == 0)
    && (flags & 0x2000000000000) == 0;
  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v9 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    if (!v8)
      goto LABEL_40;
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v12 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    v14 = -[MKMapViewDelegate _mapViewCanChangeUserTrackingModeWhenRegionDidChange:](v12, "_mapViewCanChangeUserTrackingModeWhenRegionDidChange:", self);

    if ((v14 & 1) == 0)
      goto LABEL_40;
  }
  else if (!v8)
  {
    goto LABEL_40;
  }
  if (!-[MKMapView _isUserLocationViewCentered:](self, "_isUserLocationViewCentered:", 30.0))
  {
    v15 = self;
    v16 = 0;
    v17 = 0;
    goto LABEL_39;
  }
  if (self->_userTrackingMode == 2
    && !-[MKMapView _isUserLocationViewCentered:](self, "_isUserLocationViewCentered:", 5.0))
  {
    v15 = self;
    v16 = 1;
    v17 = 1;
LABEL_39:
    -[MKMapView _setUserTrackingMode:animated:fromTrackingButton:](v15, "_setUserTrackingMode:animated:fromTrackingButton:", v16, v17, 0);
  }
LABEL_40:
  -[MKMapView _postDidChangeZoomNotificationIfNeeded](self, "_postDidChangeZoomNotificationIfNeeded");
  if (!a3)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v18 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v18 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v21 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v21 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v22 = v21;
      -[MKMapViewDelegate mapView:regionDidChangeAnimated:](v21, "mapView:regionDidChangeAnimated:", self, (*(_QWORD *)&self->_flags >> 11) & 1);

    }
  }
}

- (MKMapViewDelegate)_safeDelegate
{
  return (MKMapViewDelegate *)objc_loadWeakRetained((id *)&self->_safeDelegate);
}

- (void)_setEdgeInsets:(UIEdgeInsets)a3 explicit:(BOOL)a4
{
  double right;
  double bottom;
  double left;
  double top;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VKMapView *mapView;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  BOOL v29;
  MKDebugLocationConsole *debugLocationConsole;
  MKMapViewDelegate *v31;
  MKMapViewDelegate *v32;
  char v33;
  MKMapViewDelegate *v34;
  MKMapViewDelegate *v35;
  double v36;
  _QWORD v37[4];
  id v38;
  id location;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = 0x1000000;
  if (a4)
    v9 = 0x10001000000;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v9;
  v10 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  v15 = v10;
  if (!self->_suspendPropagatingEdgeInsetsCount)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
      v36 = v16;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationTimingFunction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapView layer](self, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB37E8];
      -[MKMapView layer](self, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForKey:", CFSTR("__mapkit_edgeInsetsSentinel"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v21, "integerValue") ^ 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forKey:", v22, CFSTR("__mapkit_edgeInsetsSentinel"));

      objc_initWeak(&location, self);
      mapView = self->_mapView;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __37__MKMapView__setEdgeInsets_explicit___block_invoke;
      v37[3] = &unk_1E20D8398;
      objc_copyWeak(&v38, &location);
      *(float *)&v24 = top;
      *(float *)&v25 = left;
      *(float *)&v26 = bottom;
      *(float *)&v27 = right;
      -[VKMapView setEdgeInsets:duration:timingFunction:completionHandler:](mapView, "setEdgeInsets:duration:timingFunction:completionHandler:", v17, v37, v24, v25, v26, v27, v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);

    }
    else
    {
      *(float *)&v11 = top;
      *(float *)&v12 = left;
      *(float *)&v13 = bottom;
      *(float *)&v14 = right;
      -[VKMapView setEdgeInsets:](self->_mapView, "setEdgeInsets:", v11, v12, v13, v14);
    }
  }
  v28 = self->_edgeInsets.left == left;
  if (self->_edgeInsets.top != top)
    v28 = 0;
  if (self->_edgeInsets.right != right)
    v28 = 0;
  v29 = self->_edgeInsets.bottom == bottom && v28;
  self->_edgeInsets.top = top;
  self->_edgeInsets.left = left;
  self->_edgeInsets.bottom = bottom;
  self->_edgeInsets.right = right;
  -[NSLayoutConstraint setConstant:](self->_edgeInsetsTopConstraint, "setConstant:", top);
  -[NSLayoutConstraint setConstant:](self->_edgeInsetsLeftConstraint, "setConstant:", left);
  -[NSLayoutConstraint setConstant:](self->_edgeInsetsRightConstraint, "setConstant:", -right);
  -[NSLayoutConstraint setConstant:](self->_edgeInsetsBottomConstraint, "setConstant:", -bottom);
  debugLocationConsole = self->_debugLocationConsole;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  -[MKDebugLocationConsole updateFrameWithEdgeInsets:](debugLocationConsole, "updateFrameWithEdgeInsets:");
  -[MKMapView _updateVectorKitConsoleFrameWithEdgeInsets](self, "_updateVectorKitConsoleFrameWithEdgeInsets");
  -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility");
  -[MKMapView _updateTrackingVisibility](self, "_updateTrackingVisibility");
  -[MKMapView _updatePitchButtonVisibility](self, "_updatePitchButtonVisibility");
  -[MKMapView _updateAppleLogoVisibility](self, "_updateAppleLogoVisibility");
  -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 1);
  -[MKMapView _updateScalePosition](self, "_updateScalePosition");
  -[MKMapView _currentEnvironmentNameFrame](self, "_currentEnvironmentNameFrame");
  -[_MKEnvironmentLabel setFrame:](self->_debugCurrentEnvironmentLabel, "setFrame:");
  -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", 0);
  -[MKMapView _layoutAttribution](self, "_layoutAttribution");
  -[MKAnnotationContainerView visibleCenteringRectChanged](self->_annotationContainer, "visibleCenteringRectChanged");
  if (!v15 || self->_suspendPropagatingEdgeInsetsCount)
    *(_QWORD *)&self->_flags &= ~0x1000000uLL;
  if (!v29)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v31 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v31 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v34 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v34 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v35 = v34;
      -[MKMapViewDelegate mapViewDidChangeEdgeInsets:](v34, "mapViewDidChangeEdgeInsets:", self);

    }
  }
}

- (void)_updateTrackingVisibility
{
  _BOOL8 v3;
  uint64_t v4;

  if (-[MKMapView _roomForCompass](self, "_roomForCompass")
    && -[MKMapView showsUserTrackingButton](self, "showsUserTrackingButton"))
  {
    v3 = -[MKMapView _roomForCompass](self, "_roomForCompass");
    v4 = 1;
  }
  else
  {
    v4 = 0;
    v3 = 1;
  }
  -[MKMapView _setTrackingButtonVisible:animationAllowed:](self, "_setTrackingButtonVisible:animationAllowed:", v4, v3);
}

- (void)_updatePitchButtonVisibility
{
  int64_t pitchButtonVisibility;
  _BOOL4 v4;
  _BOOL8 v5;
  _BOOL8 v6;

  pitchButtonVisibility = self->_pitchButtonVisibility;
  v4 = -[MKMapView _roomForCompass](self, "_roomForCompass");
  v5 = pitchButtonVisibility != 1 && v4;
  v6 = !v5 || -[MKMapView _roomForCompass](self, "_roomForCompass");
  -[MKMapView _setPitchButtonVisible:animationAllowed:](self, "_setPitchButtonVisible:animationAllowed:", v5, v6);
}

- (void)_showOrHideScaleIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  int64_t scaleVisibility;
  uint64_t v8;
  unsigned int v9;
  unint64_t flags;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  uint64_t v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;

  v3 = a3;
  v5 = -[MKMapView _canShowControls](self, "_canShowControls");
  v6 = v5;
  scaleVisibility = self->_scaleVisibility;
  if (scaleVisibility)
  {
    if (scaleVisibility == 2)
    {
      LODWORD(v8) = 0;
      v9 = 1;
    }
    else
    {
      v9 = 0;
      LODWORD(v8) = 0;
    }
  }
  else
  {
    flags = (unint64_t)self->_flags;
    v9 = (flags >> 22) & 1;
    v8 = (flags >> 57) & 1;
  }
  if (v8 | v9)
    v11 = v5;
  else
    v11 = 0;
  v12 = v11 && -[MKMapView _shouldDisplayScaleForCurrentRegion](self, "_shouldDisplayScaleForCurrentRegion");
  if (self->_scaleUpdateNotificationObserversCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("MKMapViewShouldUpdateScaleNotification"), self);

  }
  if (self->_scaleVisible != v12)
  {
    self->_scaleVisible = v12;
    -[MKMapView scaleView](self, "scaleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
    {
      objc_msgSend(v14, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[MKMapView addSubview:](self, "addSubview:", v15);
        -[MKMapView _updateScalePosition](self, "_updateScalePosition");
        -[MKMapView _updateScale](self, "_updateScale");
      }
    }
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __41__MKMapView__showOrHideScaleIfNecessary___block_invoke;
    v30[3] = &unk_1E20D8578;
    v30[4] = self;
    v18 = v15;
    v31 = v18;
    v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](v30);
    v24 = v17;
    v25 = 3221225472;
    v26 = __41__MKMapView__showOrHideScaleIfNecessary___block_invoke_2;
    v27 = &unk_1E20D8320;
    v29 = v12;
    v20 = v18;
    v28 = v20;
    v21 = MEMORY[0x18D778DB8](&v24);
    v22 = (void *)v21;
    if (v3)
    {
      v23 = 0.349999994;
      if (v6)
        v23 = 0.699999988;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x10000, v21, v19, v23, 0.0, v24, v25, v26, v27);
    }
    else
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
      v19[2](v19, 1);
    }

  }
}

- (void)_updateCompassVisibility
{
  double v3;
  double v4;
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  char v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;

  -[VKMapView presentationYaw](self->_mapView, "presentationYaw");
  v4 = v3;
  v5 = -[MKMapView _canShowControls](self, "_canShowControls");
  v6 = -[MKMapView canShowCompass](self, "canShowCompass");
  v7 = !v6 || -[MKMapView _roomForCompass](self, "_roomForCompass");
  self->_lastPossiblyVisible = -[MKMapView canPossiblyShowCompassForInternalControl:](self, "canPossiblyShowCompassForInternalControl:", 0);
  -[MKMapView _setCompassVisible:animationAllowed:force:](self, "_setCompassVisible:animationAllowed:force:", v6, v7, !v5);
  if (vabdd_f64(v4, self->_lastYaw) >= 2.22044605e-16)
  {
    -[MKCompassView setMapHeading:](self->_compassView, "setMapHeading:", v4);
    self->_lastYaw = v4;
    -[MKMapView _postDidUpdateYawNotification](self, "_postDidUpdateYawNotification");
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v8 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v11 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      -[MKMapViewDelegate mapView:didUpdateYaw:](v11, "mapView:didUpdateYaw:", self, self->_lastYaw);

    }
  }
}

- (BOOL)canPossiblyShowCompassForInternalControl:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double v8;

  v3 = a3;
  v5 = -[MKMapView _roomForCompass](self, "_roomForCompass");
  if (v5)
  {
    v6 = !v3 || -[MKMapView _canShowControls](self, "_canShowControls");
    if (qword_1EDFB79A8 != -1)
      dispatch_once(&qword_1EDFB79A8, &__block_literal_global_263);
    if (!byte_1EDFB7991
      || -[MKMapView userTrackingMode](self, "userTrackingMode") != MKUserTrackingModeFollowWithHeading)
    {
      -[VKMapView presentationYaw](self->_mapView, "presentationYaw");
      if (!v6)
      {
        LOBYTE(v5) = 0;
        return v5;
      }
      v8 = v7;
      if (-[MKMapView userTrackingMode](self, "userTrackingMode") != MKUserTrackingModeFollowWithHeading)
      {
        LOBYTE(v5) = fabs(v8) > 2.0;
        return v5;
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (MKUserTrackingMode)userTrackingMode
{
  return self->_userTrackingMode;
}

- (BOOL)canShowCompass
{
  _BOOL4 v3;

  v3 = -[MKMapView _roomForCompass](self, "_roomForCompass");
  if (v3)
  {
    v3 = -[MKMapView canPossiblyShowCompassForInternalControl:](self, "canPossiblyShowCompassForInternalControl:", 1);
    if (v3)
    {
      v3 = -[MKMapView isCompassEnabled](self, "isCompassEnabled");
      if (v3)
        LOBYTE(v3) = !-[MKMapView _isCompassSuppressedForFloorPicker](self, "_isCompassSuppressedForFloorPicker");
    }
  }
  return v3;
}

- (void)_setCompassVisible:(BOOL)a3 animationAllowed:(BOOL)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  BOOL v19;

  if (self->_compassVisible != a3)
  {
    v5 = a4;
    v6 = a3;
    if (!self->_compassVisible || (*(_QWORD *)&self->_flags & 0x20000000) == 0 || a5)
    {
      v8 = !_MKLinkedOnOrAfterReleaseSet(2824);
      v9 = v8 & v5;
      if (!v8 && v5)
        v9 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
      self->_compassVisible = v6;
      if (v6)
      {
        -[MKCompassView superview](self->_compassView, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v11 = _MKLinkedOnOrAfterReleaseSet(3595);
          -[MKMapView compassView](self, "compassView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v11)
          {
            objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

            -[MKMapView _controlStackView](self, "_controlStackView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKMapView compassView](self, "compassView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addArrangedSubview:", v14);

          }
          else
          {
            -[MKMapView addSubview:](self, "addSubview:", v12);
          }

        }
        -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", v9);
        if ((v9 & 1) == 0)
        {
          -[MKCompassView layer](self->_compassView, "layer");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeAnimationForKey:", CFSTR("controlVisibility"));

          return;
        }
      }
      else
      {
        -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", v9);
        if ((v9 & 1) == 0)
        {
          -[MKCompassView removeFromSuperview](self->_compassView, "removeFromSuperview");
          -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", 0);
          return;
        }
      }
      -[MKMapView _commonVisibilityAnimation:](self, "_commonVisibilityAnimation:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKCompassView layer](self->_compassView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__MKMapView__setCompassVisible_animationAllowed_force___block_invoke;
      v18[3] = &unk_1E20D8348;
      v19 = v6;
      v18[4] = self;
      objc_msgSend(v16, "_mapkit_addAnimation:forKey:completion:", v15, CFSTR("controlVisibility"), v18);

    }
  }
}

- (void)_setTrackingButtonVisible:(BOOL)a3 animationAllowed:(BOOL)a4
{
  MKUserTrackingButton *trackingButton;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_userTrackingVisible != a3)
  {
    self->_userTrackingVisible = a3;
    trackingButton = self->_trackingButton;
    if (a3)
    {
      v6 = a4;
      -[MKUserTrackingButton superview](trackingButton, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[MKMapView _controlStackView](self, "_controlStackView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapView _userTrackingButton](self, "_userTrackingButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertArrangedSubview:atIndex:", v9, 0);

        -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", v6);
      }
    }
    else
    {
      -[MKUserTrackingButton removeFromSuperview](trackingButton, "removeFromSuperview", a3, a4);
    }
  }
}

- (void)_setPitchButtonVisible:(BOOL)a3 animationAllowed:(BOOL)a4
{
  MKPitchButton *pitchButton;
  _BOOL8 v6;
  void *v7;
  _BOOL8 userTrackingVisible;
  void *v9;
  void *v10;

  if (self->_pitchButtonVisible != a3)
  {
    self->_pitchButtonVisible = a3;
    pitchButton = self->_pitchButton;
    if (a3)
    {
      v6 = a4;
      -[MKPitchButton superview](pitchButton, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        userTrackingVisible = self->_userTrackingVisible;
        -[MKMapView _controlStackView](self, "_controlStackView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapView _pitchButton](self, "_pitchButton");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertArrangedSubview:atIndex:", v10, userTrackingVisible);

        -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", v6);
      }
    }
    else
    {
      -[MKPitchButton removeFromSuperview](pitchButton, "removeFromSuperview", a3, a4);
    }
  }
}

- (BOOL)showsUserTrackingButton
{
  return self->_showsUserTrackingButton;
}

- (void)_updateStackViewPosition
{
  uint64_t v3;
  double v4;
  double v5;
  UIEdgeInsets *p_compassInsets;
  uint64_t v7;
  double v8;

  if (self->_controlStackView)
  {
    -[MKMapView bringSubviewToFront:](self, "bringSubviewToFront:");
    -[NSLayoutConstraint setConstant:](self->_controlStackWidthConstraint, "setConstant:", MKCompassViewDiameterForSize(self->_compassViewSize));
    v3 = -[MKMapView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[MKMapView _edgeInsets](self, "_edgeInsets");
    p_compassInsets = &self->_compassInsets;
    v7 = 8;
    if (!v3)
    {
      v7 = 24;
      v4 = v5;
    }
    -[NSLayoutConstraint setConstant:](self->_controlStackHorizontalPositionConstraint, "setConstant:", -*(double *)((char *)&p_compassInsets->top + v7) - v4);
    -[MKMapView _edgeInsets](self, "_edgeInsets");
    -[NSLayoutConstraint setConstant:](self->_controlStackVerticalPositionConstraint, "setConstant:", v8 + p_compassInsets->top);
  }
}

- (void)_updateControlsPosition:(BOOL)a3
{
  if (_MKLinkedOnOrAfterReleaseSet(3595))
    -[MKMapView _updateStackViewPosition](self, "_updateStackViewPosition");
  else
    -[MKMapView _updateCompassPositionClassic](self, "_updateCompassPositionClassic");
}

- (void)_layoutAttribution
{
  double v3;
  double v4;
  double v5;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double left;
  double bottom;
  double right;
  void *v17;
  unsigned int v18;
  double v19;
  unsigned int v20;
  double v21;
  char v22;
  int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  MKAppleLogoView *appleLogoImageView;
  double MaxX;
  double v62;
  MKAppleLogoView *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  double x;
  double y;
  double width;
  double height;
  double v73;
  double v74;
  double v75;
  double v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  int attributionCorner;
  double v88;
  double v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  NSObject *v99;
  BOOL v100;
  int v101;
  int v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  uint8_t buf[4];
  uint64_t v109;
  uint64_t v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v110 = *MEMORY[0x1E0C80C00];
  -[MKMapView bounds](self, "bounds");
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] != v5 || v4 != v3)
  {
    v7 = -[UIView _mapkit_userInterfaceDirection](self, "_mapkit_userInterfaceDirection", *MEMORY[0x1E0C9D820], v4);
    -[MKMapView _edgeInsets](self, "_edgeInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    left = self->_attributionInsets.left;
    bottom = self->_attributionInsets.bottom;
    right = self->_attributionInsets.right;
    if (_MKLinkedOnOrAfterReleaseSet(2310)
      && (-[UIImageView superview](self->_attributionBadgeView, "superview"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      if (GEOConfigGetBOOL() && _MKLinkedOnOrAfterReleaseSet(3595))
      {
        v100 = v7 == 0;
        v101 = 8;
        v102 = 4;
      }
      else
      {
        v100 = v7 == 0;
        v101 = 4;
        v102 = 8;
      }
      if (v100)
        v18 = v102;
      else
        v18 = v101;
      v19 = 10.0;
    }
    else
    {
      if (v7)
        v18 = 8;
      else
        v18 = 4;
      v19 = 11.0;
    }
    if (!GEOConfigGetBOOL() || (v20 = v18, !_MKLinkedOnOrAfterReleaseSet(3595)))
    {
      if (v18 == 8)
        v20 = 4;
      else
        v20 = 8;
    }
    v21 = v11 + bottom;
    v105 = v9 + left;
    v106 = v13 + right;
    v22 = -[MKMapView _compassInsetEdges](self, "_compassInsetEdges");
    if ((v22 & 1) != 0)
      v23 = 1;
    else
      v23 = 4;
    if ((v22 & 1) != 0)
      v24 = 2;
    else
      v24 = 8;
    if ((v22 & 2) == 0)
      v23 = v24;
    if (v18 == 8)
      v25 = 4;
    else
      v25 = 8;
    if (v23 == v18)
      v26 = v25;
    else
      v26 = v18;
    -[MKAppleLogoView superview](self->_appleLogoImageView, "superview");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = v11 + bottom;
    if (!v27)
    {
LABEL_46:
      -[MKAttributionLabel superview](self->_attributionLabel, "superview");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
        goto LABEL_69;
      -[MKMapView bounds](self, "bounds");
      v52 = v51;
      v54 = v53;
      v56 = v55;
      -[MKAttributionLabel frame](self->_attributionLabel, "frame");
      v58 = v56 - v57 + -10.0 - v21;
      if ((_DWORD)v26 == 4)
      {
        v59 = v105 + v19;
        appleLogoImageView = self->_appleLogoImageView;
        if (appleLogoImageView && v20 == 4)
        {
          -[MKAppleLogoView frame](appleLogoImageView, "frame");
          v59 = v59 + v19 + CGRectGetWidth(v114);
        }
      }
      else
      {
        v115.origin.x = v52;
        v115.origin.y = v56 - v57 + -10.0 - v21;
        v115.size.width = v54;
        v115.size.height = v56;
        MaxX = CGRectGetMaxX(v115);
        -[MKAttributionLabel frame](self->_attributionLabel, "frame");
        v59 = MaxX - (v106 + v19 + v62);
        v63 = self->_appleLogoImageView;
        if (v63 && v20 == 8)
        {
          -[MKAppleLogoView frame](v63, "frame");
          v59 = v59 - CGRectGetWidth(v116);
        }
      }
      -[MKAttributionLabel frame](self->_attributionLabel, "frame");
      v66 = v64;
      v67 = v65;
      if ((*(_QWORD *)&self->_flags & 0x10000000000) == 0)
      {
        if ((_DWORD)v26 == 4)
          v68 = 2;
        else
          v68 = 8;
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v68, v59, v58, v64, v65);
        x = v117.origin.x;
        y = v117.origin.y;
        width = v117.size.width;
        height = v117.size.height;
        if (CGRectIsNull(v117))
        {
          -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 4, v59, v58, v66, v67);
          x = v73;
          y = v74;
          width = v75;
          height = v76;
        }
        v118.origin.x = x;
        v118.origin.y = y;
        v118.size.width = width;
        v118.size.height = height;
        if (!CGRectIsNull(v118))
          goto LABEL_65;
        MKGetMKMapViewLog();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v109 = v26;
          _os_log_impl(&dword_18B0B0000, v77, OS_LOG_TYPE_DEBUG, "Could not inset legal attribution from corner %lu", buf, 0xCu);
        }

      }
      x = v59;
      y = v58;
      width = v66;
      height = v67;
LABEL_65:
      -[MKAttributionLabel setFrame:](self->_attributionLabel, "setFrame:", x, y, width, height);
      if ((_DWORD)v26 == 8)
        v78 = 9;
      else
        v78 = 12;
      -[MKAttributionLabel setAutoresizingMask:](self->_attributionLabel, "setAutoresizingMask:", v78);
      v21 = v107;
LABEL_69:
      -[UIImageView superview](self->_attributionBadgeView, "superview");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v79)
        return;
      -[UIImageView sizeToFit](self->_attributionBadgeView, "sizeToFit");
      -[UIImageView frame](self->_attributionBadgeView, "frame");
      v81 = v80;
      v83 = v82;
      if (self->_attributionCorner == 4)
      {
        v84 = v105 + 4.0;
      }
      else
      {
        -[MKMapView bounds](self, "bounds");
        v84 = v85 - v81 + -4.0 - v106;
      }
      -[MKAttributionLabel superview](self->_attributionLabel, "superview");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (v86 && (attributionCorner = self->_attributionCorner, v86, (_DWORD)v26 == attributionCorner))
      {
        -[MKAttributionLabel frame](self->_attributionLabel, "frame");
        v88 = CGRectGetMinY(v119) - v83 + -4.0;
      }
      else
      {
        -[MKMapView bounds](self, "bounds");
        v88 = v89 - v83 + -4.0 - v21;
      }
      if ((*(_QWORD *)&self->_flags & 0x10000000000) == 0)
      {
        if ((_DWORD)v26 == 4)
          v90 = 8;
        else
          v90 = 2;
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v90, v84, v88, v81, v83);
        v91 = v120.origin.x;
        v92 = v120.origin.y;
        v93 = v120.size.width;
        v94 = v120.size.height;
        if (CGRectIsNull(v120))
        {
          -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 4, v84, v88, v81, v83);
          v91 = v95;
          v92 = v96;
          v93 = v97;
          v94 = v98;
        }
        v121.origin.x = v91;
        v121.origin.y = v92;
        v121.size.width = v93;
        v121.size.height = v94;
        if (!CGRectIsNull(v121))
          goto LABEL_88;
        MKGetMKMapViewLog();
        v99 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v109 = v26;
          _os_log_impl(&dword_18B0B0000, v99, OS_LOG_TYPE_DEBUG, "Could not inset legal attribution from corner %lu", buf, 0xCu);
        }

      }
      v91 = v84;
      v92 = v88;
      v93 = v81;
      v94 = v83;
LABEL_88:
      -[UIImageView setFrame:](self->_attributionBadgeView, "setFrame:", v91, v92, v93, v94);
      return;
    }
    -[MKMapView bounds](self, "bounds");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[MKAppleLogoView frame](self->_appleLogoImageView, "frame");
    v36 = v35;
    v37 = v34;
    v38 = v33 - v34 + -7.0 - v21;
    if (v20 == 4)
    {
      v39 = v105 + 10.0;
    }
    else
    {
      v111.origin.x = v29;
      v111.origin.y = v33 - v34 + -7.0 - v21;
      v111.size.width = v31;
      v111.size.height = v33;
      v39 = CGRectGetMaxX(v111) - (v106 + v36 + 10.0);
    }
    v103 = v19;
    if ((*(_QWORD *)&self->_flags & 0x10000000000) == 0)
    {
      if (v20 == 4)
        v40 = 2;
      else
        v40 = 8;
      -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v40, v39, v38, v36, v37, *(_QWORD *)&v19);
      v41 = v112.origin.x;
      v42 = v112.origin.y;
      v43 = v112.size.width;
      v44 = v112.size.height;
      if (CGRectIsNull(v112))
      {
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 4, v39, v38, v36, v37);
        v41 = v45;
        v42 = v46;
        v43 = v47;
        v44 = v48;
      }
      v113.origin.x = v41;
      v113.origin.y = v42;
      v113.size.width = v43;
      v113.size.height = v44;
      if (!CGRectIsNull(v113))
        goto LABEL_45;
      MKGetMKMapViewLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v109 = v20;
        _os_log_impl(&dword_18B0B0000, v49, OS_LOG_TYPE_DEBUG, "Could not inset logo attribution from corner %lu", buf, 0xCu);
      }

    }
    v41 = v39;
    v42 = v38;
    v43 = v36;
    v44 = v37;
LABEL_45:
    -[MKAppleLogoView setFrame:](self->_appleLogoImageView, "setFrame:", v41, v42, v43, v44, *(_QWORD *)&v103);
    v21 = v107;
    v19 = v104;
    goto LABEL_46;
  }
}

- (void)_updateAppleLogoVisibility
{
  id *p_appleLogoImageView;
  MKAppleLogoView *appleLogoImageView;
  MKAppleLogoView *v5;
  id v6;
  void *v7;
  uint64_t v8;
  MKAppleLogoView *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  _QWORD v18[4];
  MKAppleLogoView *v19;
  MKMapView *v20;
  _QWORD v21[4];
  MKAppleLogoView *v22;

  if (_MKLinkedOnOrAfterReleaseSet(2310))
  {
    if ((*(_QWORD *)&self->_flags & 0x4000000) == 0 || self->_attributionBadgeView)
    {
      p_appleLogoImageView = (id *)&self->_appleLogoImageView;
      appleLogoImageView = self->_appleLogoImageView;
      if (!appleLogoImageView)
        return;
      goto LABEL_5;
    }
    v10 = -[MKMapView _canShowAppleLogo](self, "_canShowAppleLogo");
    p_appleLogoImageView = (id *)&self->_appleLogoImageView;
    appleLogoImageView = self->_appleLogoImageView;
    if (((v10 ^ (appleLogoImageView == 0)) & 1) == 0)
    {
      if (!v10)
      {
LABEL_5:
        v5 = appleLogoImageView;
        v6 = *p_appleLogoImageView;
        *p_appleLogoImageView = 0;

        v7 = (void *)MEMORY[0x1E0CEABB0];
        v8 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __39__MKMapView__updateAppleLogoVisibility__block_invoke;
        v21[3] = &unk_1E20D7D98;
        v22 = v5;
        v18[0] = v8;
        v18[1] = 3221225472;
        v18[2] = __39__MKMapView__updateAppleLogoVisibility__block_invoke_2;
        v18[3] = &unk_1E20D8578;
        v19 = v22;
        v20 = self;
        v9 = v22;
        objc_msgSend(v7, "_mapkit_animateWithDuration:animations:completion:", v21, v18, 0.200000003);

        return;
      }
      if (GEOConfigGetBOOL())
      {
        v11 = -[MKAppleLogoLabel initForMapType:forDarkMode:]([MKAppleLogoLabel alloc], "initForMapType:forDarkMode:", -[MKMapView mapType](self, "mapType"), -[MKMapView _showsNightMode](self, "_showsNightMode"));
        v12 = *p_appleLogoImageView;
        *p_appleLogoImageView = v11;

        objc_msgSend(*p_appleLogoImageView, "intrinsicContentSize");
        self->_appleLogoImageWidth = v13;
      }
      else
      {
        v14 = -[MKAppleLogoImageView initForMapType:forDarkMode:]([MKAppleLogoImageView alloc], "initForMapType:forDarkMode:", -[MKMapView mapType](self, "mapType"), -[MKMapView _showsNightMode](self, "_showsNightMode"));
        v15 = *p_appleLogoImageView;
        *p_appleLogoImageView = v14;

        objc_msgSend(*p_appleLogoImageView, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "size");
        self->_appleLogoImageWidth = v17;

      }
      -[MKMapView addSubview:](self, "addSubview:", *p_appleLogoImageView);
      -[MKMapView _layoutAttribution](self, "_layoutAttribution");
    }
  }
}

- (void)_updateVectorKitConsoleFrameWithEdgeInsets
{
  float v3;
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  double v13;

  if (self->_vectorKitDebugView)
  {
    -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
    v4 = v3;
    -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
    v6 = v5;
    -[MKMapView bounds](self, "bounds");
    v8 = v7;
    -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
    v10 = v8 - v9;
    -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
    v12 = v10 - v11;
    -[UITextView contentSize](self->_vectorKitDebugView, "contentSize");
    -[UITextView setFrame:](self->_vectorKitDebugView, "setFrame:", v4, v6, v12, v13);
  }
}

- (void)_updateScalePosition
{
  MKScaleView *scaleView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double x;
  double y;
  double width;
  double height;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  double v50;
  double v51;
  uint8_t buf[4];
  unint64_t v53;
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v54 = *MEMORY[0x1E0C80C00];
  scaleView = self->_scaleView;
  if (scaleView)
  {
    -[MKScaleView intrinsicContentSize](scaleView, "intrinsicContentSize");
    v5 = v4;
    v50 = v6;
    -[MKScaleView alignmentRectInsets](self->_scaleView, "alignmentRectInsets");
    v8 = v7;
    v10 = v9;
    v51 = v11;
    v13 = v12;
    v14 = -[MKMapView _compassInsetEdges](self, "_compassInsetEdges");
    -[MKMapView _edgeInsets](self, "_edgeInsets");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[MKMapView bounds](self, "bounds");
    if (*MEMORY[0x1E0C9D820] != v24 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v23)
    {
      v26 = v13 + v5 + v10;
      v27 = v50 + v8;
      -[MKMapView bounds](self, "bounds");
      v29 = v18 + v28;
      v31 = v16 + v30;
      v33 = v32 - (v18 + v22);
      v35 = v34 - (v16 + v20);
      v36 = -[MKMapView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      if ((v14 & 8) != 0)
      {
        -[MKScaleView setLegendAlignment:](self->_scaleView, "setLegendAlignment:", v36 == 1);
        v56.origin.x = v29;
        v56.origin.y = v31;
        v56.size.width = v33;
        v56.size.height = v35;
        v37 = CGRectGetMinX(v56) + 12.0;
      }
      else
      {
        -[MKScaleView setLegendAlignment:](self->_scaleView, "setLegendAlignment:", v36 != 1);
        v55.origin.x = v29;
        v55.origin.y = v31;
        v55.size.width = v33;
        v55.size.height = v35;
        v37 = CGRectGetMaxX(v55) - (v26 + 12.0);
      }
      v38 = v51 + v27;
      v57.origin.x = v29;
      v57.origin.y = v31;
      v57.size.width = v33;
      v57.size.height = v35;
      v39 = CGRectGetMinY(v57) + 10.0;
      if ((*(_QWORD *)&self->_flags & 0x10000000000) == 0)
      {
        if ((v14 & 8) != 0)
          v40 = 2;
        else
          v40 = 8;
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v40, v37, v39, v26, v38);
        x = v58.origin.x;
        y = v58.origin.y;
        width = v58.size.width;
        height = v58.size.height;
        if (CGRectIsNull(v58))
        {
          -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 1, v37, v39, v26, v38);
          x = v45;
          y = v46;
          width = v47;
          height = v48;
        }
        v59.origin.x = x;
        v59.origin.y = y;
        v59.size.width = width;
        v59.size.height = height;
        if (!CGRectIsNull(v59))
          goto LABEL_20;
        MKGetMKMapViewLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v53 = v14;
          _os_log_impl(&dword_18B0B0000, v49, OS_LOG_TYPE_DEBUG, "Could not inset scale from edge %lu", buf, 0xCu);
        }

      }
      x = v37;
      y = v39;
      width = v26;
      height = v38;
LABEL_20:
      -[MKScaleView setFrame:](self->_scaleView, "setFrame:", x, y, width, height);
    }
  }
}

- (unint64_t)_compassInsetEdges
{
  if (self->_explicitCompassInsetEdges)
    return self->_compassInsetEdges;
  if (-[UIView _mapkit_userInterfaceDirection](self, "_mapkit_userInterfaceDirection"))
    return 3;
  return 9;
}

- (void)_updateIconsShouldAlignToPixels
{
  int v3;
  _BOOL8 v4;

  v3 = -[VKMapView iconsShouldAlignToPixels](self->_mapView, "iconsShouldAlignToPixels");
  v4 = -[MKMapView _iconsShouldAlignToPixels](self, "_iconsShouldAlignToPixels");
  -[VKMapView setIconsShouldAlignToPixels:](self->_mapView, "setIconsShouldAlignToPixels:", v4);
  if (v3 != v4)
    -[VKMapView setNeedsDisplay](self->_mapView, "setNeedsDisplay");
}

- (BOOL)_iconsShouldAlignToPixels
{
  BOOL v3;
  uint64_t flags;
  BOOL result;

  result = (!-[MKMapView _isHandlingUserEvent](self, "_isHandlingUserEvent")
         || (-[VKMapView isPitched](self->_mapView, "isPitched") & 1) == 0
         && ((*(_QWORD *)&self->_flags & 0x20400000) == 0
           ? (v3 = (*(_QWORD *)&self->_flags & 0x4008) == 16392)
           : (v3 = 1),
             !v3))
        && self->_userTrackingMode != 2
        && (flags = (uint64_t)self->_flags, (flags & 0x4801) != 0x801)
        && (flags & 0x80000000000000) == 0;
  return result;
}

- (BOOL)_isHandlingUserEvent
{
  return -[VKMapView isGesturing](self->_mapView, "isGesturing");
}

- (void)_updateScale
{
  int64_t scaleVisibility;
  double v4;
  CGRect v5;

  scaleVisibility = self->_scaleVisibility;
  if ((scaleVisibility == 2 || !scaleVisibility && (*(_QWORD *)&self->_flags & 0x400000) != 0) && self->_scaleVisible)
  {
    -[MKMapView bounds](self, "bounds");
    -[MKMapView _distanceFromPoint:toPoint:fromView:withPrecision:](self, "_distanceFromPoint:toPoint:fromView:withPrecision:", self, 1, 1.0, 1.0, CGRectGetMaxX(v5) + -1.0, 1.0);
    if (v4 > 0.0)
      -[MKScaleView setDistanceInMeters:](self->_scaleView, "setDistanceInMeters:");
  }
}

- (void)_postDidChangeZoomNotificationIfNeeded
{
  double v3;
  double v4;
  double v5;
  double lastNotifiedZoomSize;
  BOOL v7;
  BOOL v8;
  id v9;

  if (self->_zoomUpdateNotificationObserversCount)
  {
    GEOConfigGetDouble();
    v4 = v3;
    -[MKMapView _zoomLevel](self, "_zoomLevel");
    lastNotifiedZoomSize = self->_lastNotifiedZoomSize;
    v7 = lastNotifiedZoomSize >= v4 || v5 <= v4;
    if (!v7 || (lastNotifiedZoomSize > v4 ? (v8 = v5 < v4) : (v8 = 0), v8))
    {
      self->_lastNotifiedZoomSize = v5;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("MKMapViewDidChangeZoomNotification"), self);

    }
  }
}

- (CGRect)_currentEnvironmentNameFrame
{
  double v3;
  double v4;
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
  double v17;
  double v18;
  UITextView *vectorKitDebugView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat MaxX;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect result;

  -[MKMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v12 = v11;
  v14 = v6 + v13;
  v16 = v11 + v15;
  v18 = v10 - (v13 + v17);
  vectorKitDebugView = self->_vectorKitDebugView;
  if (vectorKitDebugView)
  {
    -[UITextView bounds](vectorKitDebugView, "bounds");
    v14 = v14 + v20;
    -[UITextView bounds](self->_vectorKitDebugView, "bounds");
    v18 = v18 - v21;
  }
  v22 = v4 + v12;
  v23 = v8 - v16;
  -[_MKEnvironmentLabel bounds](self->_debugCurrentEnvironmentLabel, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "userInterfaceIdiom");

  v34 = v22;
  v35 = v14;
  v36 = v23;
  v37 = v18;
  if (v33 == 2)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v34);
    v39 = v25;
    v40 = MaxX + -4.0;
    v46.origin.x = v39;
    v46.origin.y = v27;
    v46.size.width = v29;
    v46.size.height = v31;
    v41 = v40 - CGRectGetWidth(v46);
  }
  else
  {
    v41 = CGRectGetMinX(*(CGRect *)&v34) + 4.0;
  }
  v47.origin.x = v22;
  v47.origin.y = v14;
  v47.size.width = v23;
  v47.size.height = v18;
  v42 = CGRectGetMinY(v47) + 4.0;
  v43 = v41;
  v44 = v29;
  v45 = v31;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v42;
  result.origin.x = v43;
  return result;
}

- (void)_updateEffects
{
  unint64_t suspendedEffectsCount;
  NSTimer *v4;
  NSTimer *v5;
  void *v6;
  CFAbsoluteTime Current;
  NSTimer *startEffectsTimer;

  suspendedEffectsCount = self->_suspendedEffectsCount;
  if (suspendedEffectsCount == 1)
  {
    startEffectsTimer = self->_startEffectsTimer;
    if (startEffectsTimer)
      CFRunLoopTimerSetNextFireDate((CFRunLoopTimerRef)startEffectsTimer, 3153600000.0);
    -[MKMapView _updateShouldDisplayEffects](self, "_updateShouldDisplayEffects");
  }
  else if (!suspendedEffectsCount)
  {
    if (!self->_startEffectsTimer)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self->_internal, sel_startEffects, 0, 1, 3153600000.0);
      v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v5 = self->_startEffectsTimer;
      self->_startEffectsTimer = v4;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addTimer:forMode:", self->_startEffectsTimer, *MEMORY[0x1E0C99748]);

    }
    Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate((CFRunLoopTimerRef)self->_startEffectsTimer, Current + 0.1);
  }
}

- (void)_updateCameraState
{
  -[MKMapCamera _updateState](self->_camera, "_updateState");
}

- (void)_updateRotationAttributes
{
  if (-[MKMapView _updateRotationSupported](self, "_updateRotationSupported"))
    -[MKMapView _updateContentBounds](self, "_updateContentBounds");
}

- (void)_dropDraggingAnnotationView:(BOOL)a3
{
  uint64_t flags;
  uint64_t v5;

  flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000000) != 0)
  {
    v5 = 4;
    if (!a3)
      v5 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFEFFFFFFFFFFFFBLL | v5;
    -[MKAnnotationContainerView _dropDraggingAnnotationViewAnimated:](self->_annotationContainer, "_dropDraggingAnnotationViewAnimated:", !a3);
    -[MKAnnotationManager setDraggedAnnotation:](self->_annotationManager, "setDraggedAnnotation:", 0);
  }
}

- (void)_clearFixedUserLocation
{
  if ((*(_QWORD *)&self->_flags & 0x400) == 0)
    -[MKUserLocation setFixedLocation:](self->_userLocation, "setFixedLocation:", 0);
}

- (BOOL)_automaticallySnapsToNorth
{
  return self->_automaticallySnapsToNorth;
}

- (void)addAnnotations:(NSArray *)annotations
{
  -[MKAnnotationManager addAnnotations:](self->_annotationManager, "addAnnotations:", annotations);
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 13);
}

- (void)_setAttributionInsets:(UIEdgeInsets)a3
{
  self->_attributionInsets = a3;
  -[MKMapView _layoutAttribution](self, "_layoutAttribution");
}

- (void)mapLayerCanEnter3DModeDidChange:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  char v8;
  uint64_t v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  id v12;

  v3 = a3;
  v5 = -[MKMapView isPitchEnabled](self, "isPitchEnabled");
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v6 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = v5 & v3;
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    -[MKMapViewDelegate mapView:canEnter3DModeDidChange:](v11, "mapView:canEnter3DModeDidChange:", self, v9);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("MKMapViewCanEnter3DDidChangeNotification"), self);

}

- (void)_updateScrollingAndGestures
{
  -[MKMapGestureController setScrollEnabled:](self->_gestureController, "setScrollEnabled:", -[MKMapView isScrollEnabled](self, "isScrollEnabled"));
  -[MKMapGestureController setZoomEnabled:](self->_gestureController, "setZoomEnabled:", -[MKMapView isZoomEnabled](self, "isZoomEnabled"));
  -[MKMapGestureController setRotationEnabled:](self->_gestureController, "setRotationEnabled:", -[MKMapView isRotateEnabled](self, "isRotateEnabled"));
  -[MKMapGestureController setTiltEnabled:](self->_gestureController, "setTiltEnabled:", -[MKMapView isPitchEnabled](self, "isPitchEnabled"));
  -[MKMapView _updateFallbackTileLoading](self, "_updateFallbackTileLoading");
}

- (BOOL)isPitchEnabled
{
  VKMapView *mapView;

  if ((*(_QWORD *)&self->_flags & 0x100000000) == 0)
    return 0;
  mapView = self->_mapView;
  if (mapView)
    return -[VKMapView isPitchable](mapView, "isPitchable");
  else
    return 1;
}

- (BOOL)_isPitched
{
  return -[VKMapView isPitched](self->_mapView, "isPitched");
}

- (BOOL)_canEnter3DMode
{
  int v3;

  v3 = -[VKMapView canEnter3DMode](self->_mapView, "canEnter3DMode");
  if (v3)
    LOBYTE(v3) = -[MKMapView isPitchEnabled](self, "isPitchEnabled");
  return v3;
}

- (BOOL)isZoomEnabled
{
  return (*(_QWORD *)&self->_flags >> 20) & 1;
}

- (BOOL)isScrollEnabled
{
  return (*(_QWORD *)&self->_flags >> 13) & 1;
}

- (BOOL)isRotateEnabled
{
  return (*(_QWORD *)&self->_flags >> 31) & 1;
}

- (void)_setPreferredConfiguration:(id)a3 onInit:(BOOL)a4
{
  _BOOL8 v4;
  MKMapConfiguration *v6;
  _BOOL4 v7;
  MKMapConfiguration *v8;
  MKMapConfiguration *preferredConfiguration;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = (MKMapConfiguration *)a3;
  if (self->_preferredConfiguration != v6)
  {
    -[MKMapView _unregisterConfigurationObservers](self, "_unregisterConfigurationObservers");
    v7 = -[MKMapView _shouldDeselectMapFeatureForNewPreferredConfiguration:](self, "_shouldDeselectMapFeatureForNewPreferredConfiguration:", v6);
    v8 = (MKMapConfiguration *)-[MKMapConfiguration copy](v6, "copy");
    preferredConfiguration = self->_preferredConfiguration;
    self->_preferredConfiguration = v8;

    -[MKMapView _registerConfigurationObservers](self, "_registerConfigurationObservers");
    if (v7)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[MKMapView selectedAnnotations](self, "selectedAnnotations", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[MKMapView deselectAnnotation:animated:](self, "deselectAnnotation:animated:", v15, 0);
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

    }
  }
  -[MKMapView _updateShowsTraffic](self, "_updateShowsTraffic");
  -[MKMapView _updatePointOfInterestFilter](self, "_updatePointOfInterestFilter");
  -[MKMapView _updateShowsHiking](self, "_updateShowsHiking");
  -[MKMapView _updateCartographicConfigurationOnInit:](self, "_updateCartographicConfigurationOnInit:", v4);

}

- (void)_updateShowsTraffic
{
  _BOOL8 v3;

  v3 = -[MKMapConfiguration _showsTraffic](self->_preferredConfiguration, "_showsTraffic");
  -[MKBasicMapView updateStatsForTrafficEnabledTime](self->_basicMapView, "updateStatsForTrafficEnabledTime");
  -[MKBasicMapView updateStatsForEnablingTraffic:](self->_basicMapView, "updateStatsForEnablingTraffic:", v3);
  -[VKMapView setTrafficEnabled:](self->_mapView, "setTrafficEnabled:", v3);
}

- (void)_updateShowsHiking
{
  _BOOL8 v3;
  _BOOL8 v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (objc_opt_respondsToSelector() & 1) != 0
    && -[MKMapConfiguration _showsHiking](self->_preferredConfiguration, "_showsHiking");
  v4 = (objc_opt_respondsToSelector() & 1) != 0
    && -[MKMapConfiguration _showsTopographicFeatures](self->_preferredConfiguration, "_showsTopographicFeatures");
  MKGetMKMapViewLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109376;
    v6[1] = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "MKMapView: Setting hiking feature - showsHiking: %d - withTopographicFeatures: %d", (uint8_t *)v6, 0xEu);
  }

  -[VKMapView setShowsHiking:withTopographicFeatures:](self->_mapView, "setShowsHiking:withTopographicFeatures:", v3, v4);
}

- (void)_updatePointOfInterestFilter
{
  void *v3;
  id v4;

  -[MKMapConfiguration _pointOfInterestFilter](self->_preferredConfiguration, "_pointOfInterestFilter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_includesAllCategories"))
  {
    -[VKMapView setPointsOfInterestFilter:](self->_mapView, "setPointsOfInterestFilter:", 0);
  }
  else
  {
    objc_msgSend(v4, "_geoPOICategoryFilter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView setPointsOfInterestFilter:](self->_mapView, "setPointsOfInterestFilter:", v3);

  }
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 8);

}

- (void)_updateCartographicConfigurationOnInit:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  MKMapElevationStyle v6;
  _BOOL4 v7;
  MKOverlayContainerView *overlayContainer;
  int v9;
  int v10;
  unsigned int BOOL;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[3];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v3 = a3;
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  +[MKMapConfiguration _cartographicConfigurationForMapConfiguration:](MKMapConfiguration, "_cartographicConfigurationForMapConfiguration:", self->_preferredConfiguration);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v5 = -[MKOverlayContainerView requiresModernMap](self->_overlayContainer, "requiresModernMap");
  if ((_UIApplicationIsExtension() & 1) != 0
    || !-[MKMapConfiguration _allowsTerrainModePromotion](self->_preferredConfiguration, "_allowsTerrainModePromotion"))
  {
    v7 = 0;
  }
  else
  {
    v6 = -[MKMapConfiguration elevationStyle](self->_preferredConfiguration, "elevationStyle");
    v7 = _MKLinkedOnOrAfterReleaseSet(3338);
    if (v6 == MKMapElevationStyleRealistic)
    {
      overlayContainer = self->_overlayContainer;
      if (overlayContainer)
      {
        v9 = -[MKOverlayContainerView supportsElevation](overlayContainer, "supportsElevation");
        v10 = 1;
      }
      else
      {
        v10 = 1;
        v9 = 1;
      }
      goto LABEL_9;
    }
  }
  v10 = 0;
  v9 = 0;
LABEL_9:
  BOOL = GEOConfigGetBOOL();
  v12 = 3;
  if (!v7)
    v12 = *((_QWORD *)&v17 + 1);
  if ((v10 & v9) != 0)
    v12 = 1;
  if (v5 | BOOL)
    v13 = BOOL;
  else
    v13 = v12;
  *((_QWORD *)&v17 + 1) = v13;
LABEL_17:
  v14[0] = v16;
  v14[1] = v17;
  v14[2] = v18;
  v15 = v19;
  -[MKMapView _setCartographicConfiguration:onInit:animated:](self, "_setCartographicConfiguration:onInit:animated:", v14, v3, 1);
}

- (void)_countUsageForAnnotationViewsIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKMapView _createAnnotationViewSetIfNeeded](self, "_createAnnotationViewSetIfNeeded");
  if (-[NSMutableSet count](self->_annotationViewEventSet, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v5)
    {
      v6 = v5;
      v23 = *(_QWORD *)v33;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v7);
        v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = self->_annotationViewEventSet;
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v29;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v10);
              -[MKMapView _countUsageOfTypeIfNeeded:forAnnotationView:countedEventTypes:](self, "_countUsageOfTypeIfNeeded:forAnnotationView:countedEventTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v14++), "integerValue"), v8, v9);
            }
            while (v12 != v14);
            v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v12);
        }

        if (v9)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v15 = v9;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v25;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(v15);
                -[NSMutableSet removeObject:](self->_annotationViewEventSet, "removeObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19++));
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
            }
            while (v17);
          }

        }
        v20 = -[NSMutableSet count](self->_annotationViewEventSet, "count");

        if (!v20)
          break;
        if (++v7 == v6)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

    v4 = v21;
  }

}

- (void)_countUsageOfTypeIfNeeded:(unint64_t)a3 forAnnotationView:(id)a4 countedEventTypes:(id)a5
{
  id v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  id v16;

  v16 = a4;
  v8 = a5;
  switch(a3)
  {
    case '*':
      objc_msgSend(v16, "displayPriority");
      v10 = v9;
      objc_msgSend((id)objc_opt_class(), "_defaultDisplayPriority");
      if (v10 != v11)
        goto LABEL_15;
      break;
    case '+':
      if ((objc_msgSend(v16, "isDraggable") & 1) != 0)
        goto LABEL_15;
      break;
    case ',':
      if (objc_msgSend(v16, "collisionMode"))
        goto LABEL_15;
      break;
    case '-':
      objc_msgSend(v16, "clusteringIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case '.':
      if ((objc_msgSend(v16, "canShowCallout") & 1) != 0)
        break;
      goto LABEL_15;
    case '/':
      objc_msgSend(v16, "detailCalloutAccessoryView");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v13 = (void *)v12;
      if (v12)
        goto LABEL_13;
      break;
    case '0':
    case '1':
    case '3':
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_15;
      break;
    case '2':
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v16, "annotation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      goto LABEL_15;
    case '4':
      objc_msgSend(v16, "annotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_16;
LABEL_13:

LABEL_15:
      -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", a3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v13);
LABEL_16:

      break;
    default:
      break;
  }

}

- (void)_updateHeading:(id)a3 animated:(BOOL)a4
{
  double v5;
  float v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  MKMapViewDelegate *v16;
  MKMapViewDelegate *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "heading");
  *(float *)&v5 = v5;
  v6 = roundf(*(float *)&v5);
  -[MKLocationManager headingUpdateTimeInterval](self->_locationManager, "headingUpdateTimeInterval");
  v8 = v7;
  -[MKMapView userLocation](self, "userLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpectedHeadingUpdateInterval:", v8);

  if (v21)
  {
    objc_msgSend(v21, "headingAccuracy");
    v11 = v10;
    -[MKMapView userLocationView](self, "userLocationView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v12, "_mkUserLocationView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
LABEL_8:

    objc_msgSend(v14, "setHeadingAccuracy:", v11);
  }
  -[MKMapView userLocation](self, "userLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHeading:", v21);

  if (v6 != -1.0 && vabdd_f64(v6, self->_heading) >= 0.001)
  {
    self->_heading = v6;
    -[MKMapView _updateHeadingIndicatorAnimated:](self, "_updateHeadingIndicatorAnimated:", 1);
    if ((*(_QWORD *)&self->_flags & 0x4000000000000000) != 0)
    {
      if (qword_1ECE2D8B0 != -1)
        dispatch_once(&qword_1ECE2D8B0, &__block_literal_global_12);
      if (_MergedGlobals_130)
      {
        v16 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v16 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;
      -[MKMapView userLocation](self, "userLocation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapViewDelegate mapView:didUpdateUserLocation:](v17, "mapView:didUpdateUserLocation:", self, v18);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", 0x1E20E0C80, self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("MKUserTrackingViewDidUpdateUserLocationNotification"), self);

  }
}

- (void)removeAnnotations:(NSArray *)annotations
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  id v12;

  v11 = annotations;
  -[MKMapView userLocation](self, "userLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray containsObject:](v11, "containsObject:", v4);

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    -[MKMapView userLocation](self, "userLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray arrayByExcludingObjectsInArray:](v11, "arrayByExcludingObjectsInArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v9;
  }
  else
  {
    v10 = v11;
  }
  v12 = v10;
  -[MKAnnotationManager removeAnnotations:](self->_annotationManager, "removeAnnotations:", v10);
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 15);

}

- (MKUserLocation)userLocation
{
  MKUserLocation *userLocation;
  MKMapView *v3;
  MKUserLocation *v4;
  MKUserLocation *v5;

  userLocation = self->_userLocation;
  if (!userLocation)
  {
    v3 = self;
    v4 = objc_alloc_init(MKUserLocation);
    v5 = v3->_userLocation;
    v3->_userLocation = v4;

    userLocation = v3->_userLocation;
  }
  return userLocation;
}

- (MKAnnotationView)userLocationView
{
  return -[MKAnnotationContainerView userLocationView](self->_annotationContainer, "userLocationView");
}

- (void)_updateShouldDisplayEffects
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (-[MKMapView effectsEnabled](self, "effectsEnabled"))
    v3 = (*(_QWORD *)&self->_flags >> 43) & 1;
  else
    v3 = 0;
  -[MKAnnotationContainerView userLocationView](self->_annotationContainer, "userLocationView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v6, "_mkUserLocationView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_10:

  objc_msgSend(v5, "setEffectsEnabled:", v3);
}

- (BOOL)effectsEnabled
{
  _BOOL8 v2;

  if (self->_suspendedEffectsCount)
    LOBYTE(v2) = 0;
  else
    return (*(_QWORD *)&self->_flags >> 4) & 1;
  return v2;
}

- (void)_updateHeadingIndicatorAnimated:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  -[MKUserLocation heading](self->_userLocation, "heading", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    -[MKMapView userLocationView](self, "userLocationView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v5, "_mkUserLocationView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
LABEL_8:

    objc_msgSend(v8, "headingAccuracy");
    objc_msgSend(v7, "setHeadingAccuracy:");
    objc_msgSend(v7, "setHeading:", self->_heading);

    v4 = v8;
  }

}

- (void)_createAnnotationViewSetIfNeeded
{
  NSMutableSet *v3;
  NSMutableSet *annotationViewEventSet;

  if (!self->_annotationViewEventSet)
  {
    v3 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1E21588C0, &unk_1E21588D8, &unk_1E21588F0, &unk_1E2158908, &unk_1E2158920, &unk_1E2158938, &unk_1E2158950, &unk_1E2158968, &unk_1E2158980, &unk_1E2158998, &unk_1E21589B0, 0);
    annotationViewEventSet = self->_annotationViewEventSet;
    self->_annotationViewEventSet = v3;

  }
}

- (void)_unregisterConfigurationObservers
{
  -[MKMapConfiguration _removeObserver:context:](self->_preferredConfiguration, "_removeObserver:context:", self, MKMapConfigurationKVOContext);
}

- (BOOL)_shouldDeselectMapFeatureForNewPreferredConfiguration:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = __67__MKMapView__shouldDeselectMapFeatureForNewPreferredConfiguration___block_invoke(self->_preferredConfiguration);
  LOBYTE(v6) = 0;
  if (__67__MKMapView__shouldDeselectMapFeatureForNewPreferredConfiguration___block_invoke(v4)
    && (v5 & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    -[MKMapView selectedAnnotations](self, "selectedAnnotations", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

uint64_t __67__MKMapView__shouldDeselectMapFeatureForNewPreferredConfiguration___block_invoke(void *a1)
{
  id v1;
  char isKindOfClass;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
    v5 = 0u;
    v6 = 0u;
    v4 = 0u;
    if (v1)
      objc_msgSend(v1, "cartographicConfiguration", v4, v5, v6, v7);
    isKindOfClass = (_MKMapTypeForCartographicConfiguration((uint64_t *)&v4) & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)mapLayerLabelsDidLayout:(id)a3
{
  id labelsDidLayoutCallback;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  labelsDidLayoutCallback = self->_labelsDidLayoutCallback;
  if (labelsDidLayoutCallback)
    dispatch_async(MEMORY[0x1E0C80D38], labelsDidLayoutCallback);
  -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_showDeferredSelectionAccessoryForReasonIfNeeded:", 2);

  }
}

uint64_t __40__MKMapView_deviceOrientationDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHeadingOrientation");
}

- (void)setPreferredConfiguration:(MKMapConfiguration *)preferredConfiguration
{
  -[MKMapView _setPreferredConfiguration:onInit:](self, "_setPreferredConfiguration:onInit:", preferredConfiguration, 0);
}

- (void)setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8
{
  -[MKMapView setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:](self, "setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:", a3, 0, a4);
}

- (void)setCamera:(MKMapCamera *)camera animated:(BOOL)animated
{
  -[MKMapView setCamera:animated:completionHandler:](self, "setCamera:animated:completionHandler:", camera, animated, 0);
}

- (MKMapView)initWithFrame:(CGRect)a3
{
  return (MKMapView *)-[MKMapView _initWithFrame:allowsAntialiasing:](self, "_initWithFrame:allowsAntialiasing:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateHeadingOrientation
{
  if (self->_internal)
  {
    if (-[MKMapView _showHeadingIndicator](self, "_showHeadingIndicator"))
      -[MKLocationManager setHeadingOrientation:](self->_locationManager, "setHeadingOrientation:", -[MKMapView _interfaceOrientation](self, "_interfaceOrientation"));
  }
}

- (int64_t)_interfaceOrientation
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "interfaceOrientation");
  }
  else
  {
    -[MKMapView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "interfaceOrientation");

  }
  return v5;
}

- (void)_updateShowHeadingIndicator
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  v3 = -[MKMapView _showHeadingIndicator](self, "_showHeadingIndicator");
  -[MKMapView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activationState");

  -[MKMapView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && v6 <= 1
    && (-[MKMapView _alwaysShowHeadingIndicator](self, "_alwaysShowHeadingIndicator")
     || -[MKMapView _showHeadingIndicatorForStepping](self, "_showHeadingIndicatorForStepping")
     || self->_userTrackingMode == 2)
    && -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"))
  {
    v8 = -[MKLocationManager isHeadingServicesAvailable](self->_locationManager, "isHeadingServicesAvailable");
    -[MKMapView _setShowHeadingIndicator:](self, "_setShowHeadingIndicator:", v8);
    if (!v3 && v8)
    {
      -[MKMapView _updateHeadingOrientation](self, "_updateHeadingOrientation");
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginGeneratingDeviceOrientationNotifications");
LABEL_13:

      return;
    }
  }
  else
  {
    -[MKMapView _setShowHeadingIndicator:](self, "_setShowHeadingIndicator:", 0);
    LOBYTE(v8) = 0;
  }
  if (!v8 && v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endGeneratingDeviceOrientationNotifications");
    goto LABEL_13;
  }
}

- (BOOL)_showHeadingIndicator
{
  return (*(_QWORD *)&self->_flags >> 15) & 1;
}

- (void)_setShowHeadingIndicator:(BOOL)a3
{
  uint64_t flags;
  _BOOL8 v4;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x8000) == 0) ^ a3) & 1) != 0)
    return;
  v4 = a3;
  v6 = 0x8000;
  if (!a3)
    v6 = 0;
  *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
  *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFFF7FFFLL | v6;
  -[MKMapView userLocationView](self, "userLocationView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v7, "_mkUserLocationView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
LABEL_10:

  objc_msgSend(v9, "setShouldDisplayHeading:", v4);
  if (v4)
  {
    -[MKMapView _startTrackingHeading](self, "_startTrackingHeading");
    -[MKLocationManager heading](self->_locationManager, "heading");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKMapView _stopTrackingHeading](self, "_stopTrackingHeading");
    v10 = 0;
  }
  -[MKMapView _updateHeading:animated:](self, "_updateHeading:animated:", v10, objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions") ^ 1);

}

- (BOOL)_updateRotationSupported
{
  int v3;
  _BOOL4 v4;
  uint64_t flags;
  char v6;
  uint64_t v7;

  v3 = -[MKLocationManager isHeadingServicesAvailable](self->_locationManager, "isHeadingServicesAvailable");
  if (v3)
  {
    v4 = -[MKMapView _rotationPossible](self, "_rotationPossible");
    flags = (uint64_t)self->_flags;
    v6 = v4 ^ ((flags & 0x1000) == 0);
    if ((v6 & 1) == 0)
    {
      v7 = 4096;
      if (!v4)
        v7 = 0;
      *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
      *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFFFEFFFLL | v7;
      if (!v4 && -[MKMapView userTrackingMode](self, "userTrackingMode") == MKUserTrackingModeFollowWithHeading)
        -[MKMapView setUserTrackingMode:](self, "setUserTrackingMode:", 1);
    }
    LOBYTE(v3) = v6 ^ 1;
  }
  return v3;
}

- (BOOL)_rotationPossible
{
  int v3;

  v3 = -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation");
  if (v3)
    LOBYTE(v3) = -[VKMapView canRotate](self->_mapView, "canRotate");
  return v3;
}

- (BOOL)_alwaysShowHeadingIndicator
{
  return (*(_QWORD *)&self->_flags >> 16) & 1;
}

- (void)_startTrackingHeading
{
  if (!-[MKMapView _useVehicleHeading](self, "_useVehicleHeading"))
    -[MKLocationManager startHeadingUpdateWithObserver:](self->_locationManager, "startHeadingUpdateWithObserver:", self);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKMapView frame](self, "frame");
  if (v9 == width && v8 == height)
  {
    v15.receiver = self;
    v15.super_class = (Class)MKMapView;
    -[MKMapView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  }
  else
  {
    -[MKMapView _sizeWillChange](self, "_sizeWillChange");
    -[MKMapView centerCoordinate](self, "centerCoordinate");
    v12 = v11;
    v14 = v13;
    v16.receiver = self;
    v16.super_class = (Class)MKMapView;
    -[MKMapView setFrame:](&v16, sel_setFrame_, x, y, width, height);
    -[MKMapView _sizeDidChangeWithCenterCoordinate:](self, "_sizeDidChangeWithCenterCoordinate:", v12, v14);
  }
  -[MKMapView _updateHeadingOrientation](self, "_updateHeadingOrientation");
  -[MKMapView _updateInsetsWithForce:](self, "_updateInsetsWithForce:", 0);
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  -[MKMapView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[MKMapView _updateInsetsWithForce:](self, "_updateInsetsWithForce:", 1);
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  -[MKMapView center](self, "center");
  v7 = v6;
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)MKMapView;
  -[MKMapView setCenter:](&v11, sel_setCenter_, x, y);
  if (x != v7 || y != v9)
    -[MKMapView _updateInsetsWithForce:](self, "_updateInsetsWithForce:", 0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  -[MKMapView layoutSubviews](&v3, sel_layoutSubviews);
  -[MKMapView _updateInsetsWithForce:](self, "_updateInsetsWithForce:", 1);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  -[MKMapView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[MKMapView _updateInsetsWithForce:](self, "_updateInsetsWithForce:", 0);
}

- (void)_updateInsetsWithForce:(BOOL)a3
{
  if (!a3 && (*(_QWORD *)&self->_flags & 0x1000000) != 0)
    self->_hasPendingEdgeInsetsChange = 1;
  else
    -[MKMapView _updateInsets](self, "_updateInsets");
}

- (void)_updateInsets
{
  unint64_t flags;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double MaxY;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  flags = (unint64_t)self->_flags;
  if ((flags & 0x10000000000) != 0)
  {
    -[MKMapView _edgeInsets](self, "_edgeInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    goto LABEL_21;
  }
  v5 = *MEMORY[0x1E0CEB4B0];
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if ((flags & 0x400000000000000) == 0)
  {
    if ((flags & 0x800000000000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  -[UIView _findNearestViewController](self, "_findNearestViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[MKMapView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusBarManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statusBarFrame");
    -[MKMapView convertRect:fromView:](self, "convertRect:fromView:", 0);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    MaxY = 0.0;
    if (fabs(v23) >= 0.000001)
    {
      v44.origin.x = v17;
      v44.origin.y = v19;
      v44.size.width = v21;
      v44.size.height = v23;
      MaxY = CGRectGetMaxY(v44);
    }
    objc_msgSend(v12, "topLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "length");
    v27 = v26;

    objc_msgSend(v12, "bottomLayoutGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "length");
    v30 = v29;

    objc_msgSend(v12, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bounds");
    v32 = CGRectGetMaxY(v45) - v30;
    -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v31, 0.0, v27);
    v5 = v33;
    -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v31, 0.0, v32);
    v35 = v34;
    -[MKMapView bounds](self, "bounds");
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    if (v5 <= CGRectGetMinY(v46)
      || (v47.origin.x = x, v47.origin.y = y, v47.size.width = width, v47.size.height = height, v5 >= CGRectGetMaxY(v47)))
    {
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      if (MaxY <= CGRectGetMinY(v48))
      {
        v5 = 0.0;
      }
      else
      {
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        v5 = 0.0;
        if (MaxY < CGRectGetMaxY(v49))
          v5 = MaxY;
      }
    }
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v11 = 0.0;
    v9 = 0.0;
    if (v35 > CGRectGetMinY(v50))
    {
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      if (v35 < CGRectGetMaxY(v51))
      {
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        v9 = CGRectGetMaxY(v52) - v35;
      }
    }

    v7 = 0.0;
  }

  if ((*(_QWORD *)&self->_flags & 0x800000000000000) != 0)
  {
LABEL_20:
    -[MKMapView layoutMargins](self, "layoutMargins");
    v5 = v5 + v40;
    v7 = v7 + v41;
    v11 = v11 + v42;
    v9 = v9 + v43;
  }
LABEL_21:
  -[MKMapView _setEdgeInsets:explicit:](self, "_setEdgeInsets:explicit:", (flags >> 40) & 1, v5, v7, v9, v11);
}

- (void)_unregisterSceneLifecycleNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBB70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBB40], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBB50], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEC150], 0);

}

- (void)_setCamera:(id)a3 duration:(double)a4 timing:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  MKMapCamera *camera;
  MKMapCamera *v13;
  MKMapCamera *v14;
  void *v15;
  MKMapCamera *v16;

  v16 = (MKMapCamera *)a3;
  v10 = a5;
  v11 = a6;
  if (v16)
  {
    if (-[MKMapCamera _validate](v16, "_validate"))
    {
      camera = self->_camera;
      if (camera != v16)
      {
        -[MKMapCamera _setMapView:](camera, "_setMapView:", 0);
        v13 = (MKMapCamera *)-[MKMapCamera copy](v16, "copy");
        v14 = self->_camera;
        self->_camera = v13;

        -[MKMapCamera _setMapView:](self->_camera, "_setMapView:", self);
        -[MKMapView _updateFromCamera:duration:timing:completionHandler:](self, "_updateFromCamera:duration:timing:completionHandler:", self->_camera, v10, v11, a4);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("camera parameter should not be nil"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise");

  }
}

- (void)_updateFromCamera:(id)a3 duration:(double)a4 timing:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  double v12;
  void *v13;
  char v14;
  VKMapView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  MKMapCamera *v26;

  v26 = (MKMapCamera *)a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  if (self->_camera == v26)
  {
    -[MKMapCamera pitch](v26, "pitch");
    if (v12 != 0.0)
    {
      +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "supportsPitchAPI");

      if ((v14 & 1) == 0)
      {
        if (_updateFromCamera_duration_timing_completionHandler__onceToken != -1)
          dispatch_once(&_updateFromCamera_duration_timing_completionHandler__onceToken, &__block_literal_global_17);
        -[MKMapCamera setPitch:](v26, "setPitch:", 0.0);
      }
    }
    v15 = self->_mapView;
    -[MKMapCamera pitch](v26, "pitch");
    if (v16 != 0.0 && (-[VKMapView isPitchable](v15, "isPitchable") & 1) == 0)
      -[MKMapCamera setPitch:](v26, "setPitch:", 0.0);
    *(_QWORD *)&self->_flags |= 0x800000000uLL;
    -[MKMapCamera centerCoordinate](v26, "centerCoordinate");
    -[MKMapCamera centerCoordinate](v26, "centerCoordinate");
    VKLocationCoordinate2DMake();
    v18 = v17;
    v20 = v19;
    -[MKMapCamera altitude](v26, "altitude");
    v22 = v21;
    -[MKMapCamera heading](v26, "heading");
    v24 = v23;
    -[MKMapCamera pitch](v26, "pitch");
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](v15, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", v10, v11, v18, v20, v22, v24, v25, a4);

  }
  else if (v11)
  {
    v11[2](v11, 0);
  }

}

- (void)locationManagerUpdatedHeading:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = -[MKMapView _useVehicleHeading](self, "_useVehicleHeading");
  v5 = v17;
  if (!v4)
  {
    v6 = v17;
    if ((*(_QWORD *)&self->_flags & 2) != 0)
    {
      -[MKMapView _updateLocationConsole](self, "_updateLocationConsole");
      v6 = v17;
    }
    objc_msgSend(v6, "heading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headingAccuracy");
    v9 = v8;

    if (v9 >= 0.0)
    {
      v12 = *(_QWORD *)&self->_flags & 0x8040;
      objc_msgSend(v17, "heading");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == 0x8000)
      {
        -[MKMapView _updateHeading:animated:](self, "_updateHeading:animated:", v13, 1);
LABEL_16:

        v5 = v17;
        goto LABEL_17;
      }
      v14 = v17;
      v15 = v13;
LABEL_15:
      objc_msgSend(v14, "setThrottledHeading:", v15);
      goto LABEL_16;
    }
    -[MKMapView userLocationView](self, "userLocationView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v10, "_mkUserLocationView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
LABEL_14:

    objc_msgSend(v17, "heading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "headingAccuracy");
    objc_msgSend(v13, "setHeadingAccuracy:");

    v14 = v17;
    v15 = 0;
    goto LABEL_15;
  }
LABEL_17:

}

- (BOOL)_useVehicleHeading
{
  return (*(_QWORD *)&self->_flags >> 18) & 1;
}

- (void)goToDefaultLocation
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  MKGetMKMapViewLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GoToDefaultLocation", (const char *)&unk_18B2CC343, buf, 2u);
  }

  if (-[MKMapView userTrackingMode](self, "userTrackingMode") == MKUserTrackingModeNone
    || !-[MKMapView hasUserLocation](self, "hasUserLocation"))
  {
    v4 = MKDefaultCoordinateRegion();
    if (v5 < -180.0 || v5 > 180.0 || v4 < -90.0 || v4 > 90.0 || v6 < 0.0 || v6 > 180.0 || v7 < 0.0 || v7 > 360.0)
    {
      *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
      -[MKMapView _displayWorld](self, "_displayWorld", v4);
      *(_QWORD *)&self->_flags &= ~0x8000000000000uLL;
    }
    else
    {
      *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
      -[MKMapView setRegion:animated:](self, "setRegion:animated:", 0);
      *(_QWORD *)&self->_flags &= ~0x8000000000000uLL;
      MKGetMKMapViewLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v9 = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GoToDefaultLocation", (const char *)&unk_18B2CC343, v9, 2u);
      }

    }
  }
}

- (id)_commonInitFromIB:(BOOL)a3 gestureRecognizerHostView:(id)a4 locationManager:(id)a5 showsAttribution:(BOOL)a6 showsAppleLogo:(BOOL)a7 allowsAntialiasing:(BOOL)a8 carDisplayType:(int64_t)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v12;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  $5D7CD00554919180459D56D22149BB92 *p_flags;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  MKStandardMapConfiguration *v22;
  MKMapConfiguration *preferredConfiguration;
  __int128 v24;
  void *v25;
  OS_dispatch_group *v26;
  OS_dispatch_group *calloutShowAnimationGroup;
  MKMapViewInternal *v28;
  MKMapViewInternal *internal;
  double *v30;
  __int128 v31;
  MKMapType v32;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  $5D7CD00554919180459D56D22149BB92 *v46;
  void *v47;
  int v48;
  uint64_t v49;
  UITraitCollection *v50;
  UITraitCollection *lastTraitCollection;
  NSObject *v52;
  OS_dispatch_queue *v53;
  OS_dispatch_queue *lastEffectiveTraitCollectionIsolationQueue;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  _BOOL4 v61;
  uint64_t v62;
  int IsExtension;
  uint64_t v64;
  _MKMapContentView *v65;
  UIView *contentView;
  double v67;
  double v68;
  double v69;
  double v70;
  MKMapCameraZoomRange *v71;
  MKMapCameraZoomRange *cameraZoomRange;
  MKMapCameraBoundary *v73;
  MKMapCameraBoundary *cameraBoundary;
  void *v75;
  uint64_t v76;
  MKBasicMapView *v77;
  MKBasicMapView *basicMapView;
  VKMapView *v79;
  VKMapView *mapView;
  void *v81;
  VKMapView *v82;
  void *v83;
  void *v84;
  MKLabelSelectionFilter *v85;
  MKLabelSelectionFilter *labelSelectionFilter;
  void *v87;
  void *v88;
  unsigned __int8 v89;
  int v90;
  _BOOL8 v91;
  void *v92;
  void *v93;
  MKScrollContainerView *v94;
  UIView *scrollContainerView;
  MKAnnotationContainerView *v96;
  MKAnnotationContainerView *annotationContainer;
  MKAnnotationManager *v98;
  MKAnnotationManager *annotationManager;
  MKMapCamera *v100;
  MKMapCamera *camera;
  int v102;
  _MKOfflineRegionsOverlayManager *v103;
  _MKOfflineRegionsOverlayManager *offlineRegionsOverlayManager;
  void *v105;
  void *v106;
  id shelbyvilleListener;
  void *v108;
  MKRotationFilter *v109;
  MKRotationFilter *rotationFilter;
  MKUsageCounter *v111;
  MKUsageCounter *usageCounter;
  NSObject *v113;
  _BOOL4 v115;
  id v116;
  uint8_t v117[8];
  uint64_t v118;
  uint64_t v119;
  void (*v120)(uint64_t);
  void *v121;
  id v122;
  uint8_t buf[16];
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  uint64_t v127;

  v115 = a8;
  v9 = a7;
  v10 = a6;
  v12 = a3;
  v127 = *MEMORY[0x1E0C80C00];
  v116 = a4;
  v14 = a5;
  MKGetMKMapViewLog();
  v15 = objc_claimAutoreleasedReturnValue();
  self->_mapViewDidFinishRenderingSignpostID = os_signpost_id_generate(v15);

  MKGetMKMapViewLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CommonInitialization", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v17 = _MKLinkedOnOrAfterReleaseSet(1540);
  p_flags = &self->_flags;
  v19 = 0x400000000000000;
  if (v17)
    v19 = 0;
  *(_QWORD *)p_flags = *(_QWORD *)&self->_flags & 0xFBFFFFFFFFFFFFFFLL | v19;
  v20 = _MKLinkedOnOrAfterReleaseSet(769);
  v21 = 0x800000000000000;
  if (!v20)
    v21 = 0;
  *(_QWORD *)p_flags = *(_QWORD *)p_flags & 0xF7FFFFFFFFFFFFFFLL | v21;
  v22 = objc_alloc_init(MKStandardMapConfiguration);
  preferredConfiguration = self->_preferredConfiguration;
  self->_preferredConfiguration = &v22->super;

  +[MKMapConfiguration _cartographicConfigurationForMapConfiguration:](MKMapConfiguration, "_cartographicConfigurationForMapConfiguration:", self->_preferredConfiguration);
  v24 = v124;
  *(_OWORD *)&self->_cartographicConfiguration.style = *(_OWORD *)buf;
  *(_OWORD *)&self->_cartographicConfiguration.projection = v24;
  *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage = v125;
  *(_QWORD *)&self->_cartographicConfiguration.gridOnly = v126;
  v25 = v14;
  if (!v14)
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_locationManager, v25);
  if (!v14)

  if (qword_1EDFB7998 != -1)
    dispatch_once(&qword_1EDFB7998, &__block_literal_global_5);
  -[MKLocationManager setEnabled:](self->_locationManager, "setEnabled:", !v12);
  v26 = (OS_dispatch_group *)dispatch_group_create();
  calloutShowAnimationGroup = self->_calloutShowAnimationGroup;
  self->_calloutShowAnimationGroup = v26;

  v28 = objc_alloc_init(MKMapViewInternal);
  internal = self->_internal;
  self->_internal = v28;

  objc_storeWeak((id *)&self->_internal->view, self);
  v30 = (double *)MEMORY[0x1E0CEB4B0];
  v31 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  *(_OWORD *)&self->_attributionInsets.top = *MEMORY[0x1E0CEB4B0];
  *(_OWORD *)&self->_attributionInsets.bottom = v31;
  self->_compassViewSize = _MKLinkedOnOrAfterReleaseSet(3081);
  v32 = -[MKMapView mapType](self, "mapType");
  if (v32 - 1 < 4 || v32 == 107)
  {
    self->_compassViewStyle = 0;
  }
  else
  {
    -[MKMapView traitCollection](self, "traitCollection");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    self->_compassViewStyle = objc_msgSend(v92, "userInterfaceStyle") != 2;

  }
  __asm { FMOV            V0.2D, #5.0 }
  *(_OWORD *)&self->_compassInsets.top = _Q0;
  *(_OWORD *)&self->_compassInsets.bottom = _Q0;
  -[MKMapView bounds](self, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = &self->_flags;
  *(_QWORD *)&self->_flags |= 0x102000uLL;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "supportsPitchAPI");
  v49 = 0x100000000;
  if (!v48)
    v49 = 0;
  *(_QWORD *)v46 = *(_QWORD *)v46 & 0xFFFFFFFEFFFFFFFFLL | v49;

  *(_QWORD *)v46 |= 0x80000000uLL;
  self->_showsCompass = 1;
  self->_scaleVisibility = 1;
  self->_pitchButtonVisibility = 1;
  self->_pitchButtonControlSize = 1;
  self->_userTrackingVisible = 0;
  self->_userTrackingControlSize = 1;
  -[MKMapView _registerTraitCollectionObservation](self, "_registerTraitCollectionObservation");
  -[MKMapView traitCollection](self, "traitCollection");
  v50 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  lastTraitCollection = self->_lastTraitCollection;
  self->_lastTraitCollection = v50;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MapKit.MKMapView.effectiveTraitCollectionIsolation", v52);
  lastEffectiveTraitCollectionIsolationQueue = self->_lastEffectiveTraitCollectionIsolationQueue;
  self->_lastEffectiveTraitCollectionIsolationQueue = v53;

  v55 = 0x2000000;
  if (!v10)
    v55 = 0;
  v56 = 0x4000000;
  if (!v9)
    v56 = 0;
  *(_QWORD *)v46 = v56 | v55 | *(_QWORD *)v46 & 0xFFFFFFFFF9FFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bundleIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.Maps"));
  v60 = 0x10000000;
  if (!v59)
    v60 = 0;
  *(_QWORD *)v46 = *(_QWORD *)v46 & 0xFFFFFFFFEFFFFFFFLL | v60;

  *(_QWORD *)v46 |= 0x20008000000uLL;
  v61 = _MKLinkedOnOrAfterReleaseSet(2310);
  v62 = 0x6C0000000000;
  if (v61)
    v62 = 0x680000000000;
  *(_QWORD *)v46 = *(_QWORD *)v46 & 0xFFFFF3FFFFFFFFFFLL | v62;
  IsExtension = _UIApplicationIsExtension();
  v64 = 0x40000000000000;
  if (IsExtension)
    v64 = 0;
  *(_QWORD *)v46 = *(_QWORD *)v46 & 0xFFBFFFFFFFFFFFFFLL | v64;
  v65 = -[_MKMapContentView initWithFrame:]([_MKMapContentView alloc], "initWithFrame:", v39, v41, v43, v45);
  contentView = self->_contentView;
  self->_contentView = &v65->super;

  -[UIView setAutoresizesSubviews:](self->_contentView, "setAutoresizesSubviews:", 0);
  -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
  v67 = *v30;
  v68 = v30[1];
  v69 = v30[2];
  v70 = v30[3];
  -[UIView setLayoutMargins:](self->_contentView, "setLayoutMargins:", *v30, v68, v69, v70);
  v71 = objc_alloc_init(MKMapCameraZoomRange);
  cameraZoomRange = self->_cameraZoomRange;
  self->_cameraZoomRange = v71;

  v73 = -[MKMapCameraBoundary initWithMapRect:]([MKMapCameraBoundary alloc], "initWithMapRect:", 0.0, 0.0, 268435456.0, 268435456.0);
  cameraBoundary = self->_cameraBoundary;
  self->_cameraBoundary = v73;

  if (!v12)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "requiresRTT");

    v77 = -[MKBasicMapView initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:]([MKBasicMapView alloc], "initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:", 0, v76, v115, a9, v39, v41, v43, v45);
    basicMapView = self->_basicMapView;
    self->_basicMapView = v77;

    -[MKBasicMapView mapView](self->_basicMapView, "mapView");
    v79 = (VKMapView *)objc_claimAutoreleasedReturnValue();
    mapView = self->_mapView;
    self->_mapView = v79;

    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView setIsPitchable:](self->_mapView, "setIsPitchable:", objc_msgSend(v81, "supportsPitchAPI"));

    -[MKBasicMapView setRendersInBackground:](self->_basicMapView, "setRendersInBackground:", _MergedGlobals_53);
    -[VKMapView _mapkit_configureFromDefaults](self->_mapView, "_mapkit_configureFromDefaults");
    v82 = self->_mapView;
    -[MKMapView traitCollection](self, "traitCollection");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "preferredContentSizeCategory");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView _mapkit_configureLabelSizesForContentSizeCategory:](v82, "_mapkit_configureLabelSizesForContentSizeCategory:", v84);

    v85 = -[MKLabelSelectionFilter initWithMapFeatureOptions:]([MKLabelSelectionFilter alloc], "initWithMapFeatureOptions:", 0);
    labelSelectionFilter = self->_labelSelectionFilter;
    self->_labelSelectionFilter = v85;

    -[VKMapView setLabelSelectionFilter:](self->_mapView, "setLabelSelectionFilter:", self->_labelSelectionFilter);
    -[VKMapView setShowsVenues:](self->_mapView, "setShowsVenues:", (*(_QWORD *)&self->_flags >> 28) & 1);
    objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v87;
    if (v87)
    {
      v89 = objc_msgSend(v87, "state");
      v90 = v89;
      if (v89 >= 3u)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v90;
          _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
        }
        v91 = 0;
      }
      else
      {
        v91 = (v89 & 7) == 2;
      }
      -[VKMapView setOfflineMode:](self->_mapView, "setOfflineMode:", v91);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "addObserver:selector:name:object:", self, sel__offlineStateDidChange_, *MEMORY[0x1E0D26770], 0);

    -[VKMapView setMapDelegate:](self->_mapView, "setMapDelegate:", self);
    -[VKMapView setCameraDelegate:](self->_mapView, "setCameraDelegate:", self);
    -[VKMapView setMapType:animated:](self->_mapView, "setMapType:animated:", 0, 0);

  }
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[VKMapView setShowsPointsOfInterest:](self->_mapView, "setShowsPointsOfInterest:", 1);
  -[VKMapView setShowsBuildings:](self->_mapView, "setShowsBuildings:", (*(_QWORD *)&self->_flags >> 33) & 1);
  v94 = -[MKScrollContainerView initWithFrame:]([MKScrollContainerView alloc], "initWithFrame:", 0.0, 0.0, 268435456.0, 268435456.0);
  scrollContainerView = self->_scrollContainerView;
  self->_scrollContainerView = &v94->super;

  -[UIView setAutoresizesSubviews:](self->_scrollContainerView, "setAutoresizesSubviews:", 0);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_scrollContainerView);
  v96 = -[MKAnnotationContainerView initWithFrame:]([MKAnnotationContainerView alloc], "initWithFrame:", v39, v41, v43, v45);
  annotationContainer = self->_annotationContainer;
  self->_annotationContainer = v96;

  -[VKMapView addCustomFeatureDataSource:](self->_mapView, "addCustomFeatureDataSource:", self->_annotationContainer);
  -[MKAnnotationContainerView setAutoresizesSubviews:](self->_annotationContainer, "setAutoresizesSubviews:", 0);
  -[MKAnnotationContainerView setAutoresizingMask:](self->_annotationContainer, "setAutoresizingMask:", 18);
  -[MKAnnotationContainerView setDelegate:](self->_annotationContainer, "setDelegate:", self);
  -[UIView insertSubview:aboveSubview:](self->_contentView, "insertSubview:aboveSubview:", self->_annotationContainer, self->_scrollContainerView);
  v98 = objc_alloc_init(MKAnnotationManager);
  annotationManager = self->_annotationManager;
  self->_annotationManager = v98;

  -[MKAnnotationManager setDelegate:](self->_annotationManager, "setDelegate:", self);
  -[MKAnnotationManager setContainer:](self->_annotationManager, "setContainer:", self);
  v100 = objc_alloc_init(MKMapCamera);
  camera = self->_camera;
  self->_camera = v100;

  -[MKMapCamera _setMapView:](self->_camera, "_setMapView:", self);
  if (!v12)
    -[UIView insertSubview:belowSubview:](self->_contentView, "insertSubview:belowSubview:", self->_basicMapView, self->_scrollContainerView);
  -[MKMapView addSubview:](self, "addSubview:", self->_contentView);
  -[MKMapView setClipsToBounds:](self, "setClipsToBounds:", 1);
  if (-[MKMapView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    v102 = 4;
  else
    v102 = 8;
  self->_attributionCorner = v102;
  -[MKMapView _setPreferredConfiguration:onInit:](self, "_setPreferredConfiguration:onInit:", self->_preferredConfiguration, 1);
  -[MKMapView _registerConfigurationObservers](self, "_registerConfigurationObservers");
  v103 = -[_MKOfflineRegionsOverlayManager initWithMapView:]([_MKOfflineRegionsOverlayManager alloc], "initWithMapView:", self);
  offlineRegionsOverlayManager = self->_offlineRegionsOverlayManager;
  self->_offlineRegionsOverlayManager = v103;

  if (!*((_BYTE *)&self->_flags + 9))
    -[MKMapView setLayoutMargins:](self, "setLayoutMargins:", v67, v68, v69, v70);
  -[MKMapView _updateAppearanceIfNeeded](self, "_updateAppearanceIfNeeded");
  _GEOConfigAddDelegateListenerForKey();
  _GEOConfigAddDelegateListenerForKey();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);
  objc_msgSend(v105, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x1E0CEB358], 0);
  objc_msgSend(v105, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0CEB270], 0);
  objc_msgSend(v105, "addObserver:selector:name:object:", self, sel_applicationWillTerminate_, *MEMORY[0x1E0CEB360], 0);
  objc_msgSend(v105, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground_, *MEMORY[0x1E0CEB350], 0);
  objc_msgSend(v105, "addObserver:selector:name:object:", self, sel_deviceOrientationDidChange_, *MEMORY[0x1E0CEB450], 0);
  if (!_MKLinkedOnOrAfterReleaseSet(2310))
    objc_msgSend(v105, "addObserver:selector:name:object:", self, sel__willChangeStatusBarFrame_, *MEMORY[0x1E0CEB348], 0);
  objc_initWeak((id *)buf, self);
  v118 = MEMORY[0x1E0C809B0];
  v119 = 3221225472;
  v120 = __139__MKMapView__commonInitFromIB_gestureRecognizerHostView_locationManager_showsAttribution_showsAppleLogo_allowsAntialiasing_carDisplayType___block_invoke_155;
  v121 = &unk_1E20D84F0;
  objc_copyWeak(&v122, (id *)buf);
  MapsFeature_AddBlockListener();
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  shelbyvilleListener = self->_shelbyvilleListener;
  self->_shelbyvilleListener = v106;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "addTileGroupObserver:queue:", self, MEMORY[0x1E0C80D38]);

  -[MKMapView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[MKMapView setMultipleTouchEnabled:](self, "setMultipleTouchEnabled:", 1);
  self->_automaticallySnapsToNorth = 1;
  -[MKMapView goToDefaultLocation](self, "goToDefaultLocation");
  if (!v12)
    -[MKMapView _configureGestureRecognizers:](self, "_configureGestureRecognizers:", v116);
  v109 = -[MKRotationFilter initWithMapLayer:]([MKRotationFilter alloc], "initWithMapLayer:", self->_mapView);
  rotationFilter = self->_rotationFilter;
  self->_rotationFilter = v109;

  -[MKRotationFilter setDelegate:](self->_rotationFilter, "setDelegate:", self);
  -[MKMapGestureController setRotationFilter:](self->_gestureController, "setRotationFilter:", self->_rotationFilter);
  -[MKMapView _updateAttribution](self, "_updateAttribution");
  -[MKMapView _updateAppleLogoVisibility](self, "_updateAppleLogoVisibility");
  -[MKMapView _stopEffects](self, "_stopEffects");
  self->_cachedLookAroundAvailability = 0;
  v111 = objc_alloc_init(MKUsageCounter);
  usageCounter = self->_usageCounter;
  self->_usageCounter = v111;

  -[MKUsageCounter count:](self->_usageCounter, "count:", 0);
  objc_msgSend(MEMORY[0x1E0D263E8], "reportDailyUsageCountType:", 153);
  -[MKMapView _setVectorKitConsoleEnabled:](self, "_setVectorKitConsoleEnabled:", GEOConfigGetBOOL());
  _GEOConfigAddDelegateListenerForKey();

  self->_controlBackgroundStyle = 1;
  -[MKMapView _setPitchButtonBackgroundStyle:](self, "_setPitchButtonBackgroundStyle:", 1);
  self->_userTrackingButtonBackgroundStyle = 1;
  MKGetMKMapViewLog();
  v113 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v113))
  {
    *(_WORD *)v117 = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v113, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CommonInitialization", (const char *)&unk_18B2CC343, v117, 2u);
  }

  objc_destroyWeak(&v122);
  objc_destroyWeak((id *)buf);

  return self;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKMapView;
  -[MKMapView setLayoutMargins:](&v4, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  *((_BYTE *)&self->_flags + 9) = 1;
}

- (void)_setCartographicConfiguration:(id *)a3 onInit:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  _BOOL4 v13;
  BOOL v14;
  int v15;
  _BOOL4 v16;
  unsigned int v17;
  _BOOL4 v18;
  _BOOL8 v19;
  NSObject *v20;
  uint8_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  BOOL v28;
  _BOOL4 v29;
  uint64_t v30;
  MKMapViewDelegate *v31;
  MKMapViewDelegate *v32;
  char v33;
  MKMapViewDelegate *v34;
  MKMapViewDelegate *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  _BOOL4 v39;
  unsigned int v40;
  unsigned int v41;
  uint8_t v42[2];
  __int16 v43;
  uint8_t buf[16];

  v5 = a5;
  MKGetMKMapViewLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMapType", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v10 = _VKMapTypeForMKCartographicConfiguration(&a3->var0);
  v40 = _VKEmphasisForMKCartographicConfiguration(a3);
  v11 = _VKTerrainModeForMKCartographicConfiguration((uint64_t)a3);
  v41 = _VKMapKitUsageForMKCartographicConfiguration((uint64_t)a3);
  v12 = _VKMapKitClientModeForMKCartographicConfiguration((uint64_t)a3);
  v13 = a3->var2 == 1;
  v14 = -[MKMapView _supportsVKMapType:](self, "_supportsVKMapType:", v10);
  if ((_DWORD)v10 == 3)
    v15 = 1;
  else
    v15 = v10;
  v16 = (_DWORD)v10 != 3 && v13;
  if ((_DWORD)v10 == 4)
    v17 = 2;
  else
    v17 = v15;
  v18 = (_DWORD)v10 != 4 && v16;
  if (v14)
    v10 = v10;
  else
    v10 = v17;
  if (v14)
    v19 = v13;
  else
    v19 = v18;
  if (!_MKCartographicConfigurationEquals((uint64_t)&self->_cartographicConfiguration, (uint64_t)a3) || a4)
  {
    v38 = v12;
    v39 = v5;
    v22 = _MKMapTypeForCartographicConfiguration(&a3->var0);
    *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
    NSStringFromSelector(sel_mapType);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView willChangeValueForKey:](self, "willChangeValueForKey:", v23);

    v24 = v22;
    v25 = *(_OWORD *)&a3->var0;
    v26 = *(_OWORD *)&a3->var2;
    v27 = *(_OWORD *)&a3->var4;
    *(_QWORD *)&self->_cartographicConfiguration.gridOnly = *(_QWORD *)&a3->var6;
    *(_OWORD *)&self->_cartographicConfiguration.projection = v26;
    *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage = v27;
    *(_OWORD *)&self->_cartographicConfiguration.style = v25;
    -[MKAnnotationContainerView setMapType:](self->_annotationContainer, "setMapType:", v22);
    -[MKBasicMapView updateStatsForSwitchingToMapType:](self->_basicMapView, "updateStatsForSwitchingToMapType:", v10);
    if (!a4)
      -[MKBasicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:](self->_basicMapView, "updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:", -[MKMapView _canShowFlyover](self, "_canShowFlyover"));
    -[VKMapView setEnableGlobe:](self->_mapView, "setEnableGlobe:", v19);
    -[VKMapView setTerrainMode:](self->_mapView, "setTerrainMode:", v11);
    -[VKMapView setMapType:animated:](self->_mapView, "setMapType:animated:", v10, v39);
    -[VKMapView setEmphasis:animated:](self->_mapView, "setEmphasis:animated:", v40, v39);
    -[VKMapView setMapKitUsage:](self->_mapView, "setMapKitUsage:", v41);
    -[VKMapView setMapKitClientMode:](self->_mapView, "setMapKitClientMode:", v38);
    -[MKAttributionLabel setMapType:](self->_attributionLabel, "setMapType:", v22);
    -[MKMapView _layoutAttribution](self, "_layoutAttribution");
    -[MKScaleView setMapType:](self->_scaleView, "setMapType:", v22);
    v28 = -[MKMapView _showsNightMode](self, "_showsNightMode");
    v29 = (unint64_t)(v22 - 1) < 4 || v22 == 107;
    v30 = v28 || v29;
    -[MKScaleView setUseLightText:](self->_scaleView, "setUseLightText:", v30);
    -[MKMapView _updateAppearanceIfNeeded](self, "_updateAppearanceIfNeeded");
    -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
    -[MKAnnotationManager updateVisibleAnnotations](self->_annotationManager, "updateVisibleAnnotations");
    *(_QWORD *)&self->_flags &= ~0x2000000000000uLL;
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v31 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v31 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v34 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v34 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v35 = v34;
      -[MKMapViewDelegate mapView:didChangeMapType:](v34, "mapView:didChangeMapType:", self, v24);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "postNotificationName:object:", CFSTR("MKMapViewDidChangeMapTypeNotification"), self);

    NSStringFromSelector(sel_mapType);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView didChangeValueForKey:](self, "didChangeValueForKey:", v37);

    MKGetMKMapViewLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v42 = 0;
      v21 = v42;
      goto LABEL_47;
    }
  }
  else
  {
    -[VKMapView setEnableGlobe:](self->_mapView, "setEnableGlobe:", v19);
    -[VKMapView setTerrainMode:](self->_mapView, "setTerrainMode:", v11);
    -[VKMapView setMapType:animated:](self->_mapView, "setMapType:animated:", v10, v5);
    -[VKMapView setEmphasis:animated:](self->_mapView, "setEmphasis:animated:", v40, v5);
    -[VKMapView setMapKitUsage:](self->_mapView, "setMapKitUsage:", v41);
    -[VKMapView setMapKitClientMode:](self->_mapView, "setMapKitClientMode:", v12);
    MKGetMKMapViewLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      v43 = 0;
      v21 = (uint8_t *)&v43;
LABEL_47:
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMapType", (const char *)&unk_18B2CC343, v21, 2u);
    }
  }

}

- (void)_updateAppearanceIfNeeded
{
  void *v3;
  MKMapType v4;
  _BOOL8 v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  _BOOL4 v11;
  char v12;
  void *v13;
  void *v14;
  MKMapType v15;
  BOOL v16;
  _BOOL4 v17;
  uint64_t v18;
  MKAppleLogoView *appleLogoImageView;
  int v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MKMapView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
  {
    v4 = -[MKMapView mapType](self, "mapType");
    v5 = 0;
    if (v4 - 1 >= 4)
      v5 = v4 != 107;
  }
  else
  {
    v5 = 0;
  }

  MKGetMKMapViewLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (v5)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v7;
    if (-[MKMapView _showsNightMode](self, "_showsNightMode"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = v9;
    v20 = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_INFO, "MKMapView: _updateAppearanceIfNeeded shouldShowNightMode : %@ self.showsNightMode : %@", (uint8_t *)&v20, 0x16u);

  }
  if (v5 != -[MKMapView _showsNightMode](self, "_showsNightMode"))
  {
    -[MKMapView _setShowsNightMode:](self, "_setShowsNightMode:", v5);
    if ((*(_QWORD *)&self->_flags & 0x10) != 0
      && (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters") & 1) == 0)
    {
      v11 = -[MKBasicMapView isInBackground](self->_basicMapView, "isInBackground");
      v12 = -[VKMapView rendersInBackground](self->_mapView, "rendersInBackground");
      if (!v11 || (v12 & 1) != 0)
      {
        -[MKMapView _mapLayer](self, "_mapLayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "forceFrame");

      }
      else
      {
        -[VKMapView setRendersInBackground:](self->_mapView, "setRendersInBackground:", 1);
        -[MKMapView _mapLayer](self, "_mapLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "forceFrame");

        -[VKMapView setRendersInBackground:](self->_mapView, "setRendersInBackground:", 0);
      }
    }
  }
  v15 = -[MKMapView mapType](self, "mapType");
  v16 = -[MKMapView _showsNightMode](self, "_showsNightMode");
  v17 = v15 - 1 < 4 || v15 == 107;
  v18 = v16 || v17;
  -[MKScaleView setUseLightText:](self->_scaleView, "setUseLightText:", v18);
  -[MKCompassView setOverrideUserInterfaceStyle:](self->_compassView, "setOverrideUserInterfaceStyle:", -[MKMapView _controlsUserInterfaceStyleOverride](self, "_controlsUserInterfaceStyleOverride"));
  appleLogoImageView = self->_appleLogoImageView;
  if (appleLogoImageView)
    -[MKAppleLogoView updateForMapType:darkMode:](appleLogoImageView, "updateForMapType:darkMode:", v15, -[MKMapView _showsNightMode](self, "_showsNightMode"));
}

- (BOOL)_showsNightMode
{
  return -[MKMapView _mapDisplayStyle](self, "_mapDisplayStyle") == 1;
}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)_mapDisplayStyle
{
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)-[VKMapView mapDisplayStyle](self->_mapView, "mapDisplayStyle");
}

- (MKMapType)mapType
{
  return _MKMapTypeForCartographicConfiguration(&self->_cartographicConfiguration.style);
}

- (int64_t)_controlsUserInterfaceStyleOverride
{
  MKMapType v3;
  int64_t v4;
  void *v5;

  v3 = -[MKMapView mapType](self, "mapType");
  v4 = 2;
  if (v3 - 1 >= 4 && v3 != 107)
  {
    -[MKMapView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle") == 2)
      v4 = 2;
    else
      v4 = 1;

  }
  return v4;
}

- (BOOL)_supportsVKMapType:(int)a3
{
  VKMapView *mapView;
  int v5;
  int v6;
  void *v7;
  char v8;

  mapView = self->_mapView;
  if (!mapView)
  {
    if ((a3 - 3) > 1)
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    goto LABEL_6;
  }
  v5 = -[VKMapView supportsMapType:](mapView, "supportsMapType:", *(_QWORD *)&a3);
  v6 = v5;
  if ((a3 - 5) >= 0xFFFFFFFE)
  {
    LOBYTE(v5) = 0;
    if (v6)
    {
LABEL_6:
      +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "supports3DImagery");

      LOBYTE(v5) = v8;
    }
  }
  return v5;
}

- (void)_updateFallbackTileLoading
{
  _BOOL4 v3;
  int v4;
  uint64_t v5;

  v3 = (*(_QWORD *)&self->_flags & 0x102000) != 0
    || -[MKMapView isRotateEnabled](self, "isRotateEnabled")
    || -[MKMapView isPitchEnabled](self, "isPitchEnabled");
  v4 = -[MKMapView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v5 = 0;
  if (v3 && v4)
    v5 = (*(_QWORD *)&self->_flags >> 54) & 1;
  -[VKMapView setShouldLoadFallbackTiles:](self->_mapView, "setShouldLoadFallbackTiles:", v5);
}

- (void)_registerConfigurationObservers
{
  -[MKMapConfiguration _addObserver:options:context:](self->_preferredConfiguration, "_addObserver:options:context:", self, 1, MKMapConfigurationKVOContext);
}

- (void)_stopEffects
{
  ++self->_suspendedEffectsCount;
  -[MKMapView _updateEffects](self, "_updateEffects");
}

- (void)_setVectorKitConsoleEnabled:(BOOL)a3
{
  uint64_t flags;
  uint64_t v5;
  UITextView *v6;
  UITextView *vectorKitDebugView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITextView *v12;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x8000000000) == 0) ^ a3) & 1) == 0)
  {
    v5 = 0x8000000000;
    if (!a3)
      v5 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFF7FFFFFFFFFLL | v5;
    if (a3)
    {
      v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E0CEAB18]);
      vectorKitDebugView = self->_vectorKitDebugView;
      self->_vectorKitDebugView = v6;

      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorWithAlphaComponent:", 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setBackgroundColor:](self->_vectorKitDebugView, "setBackgroundColor:", v9);

      objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setTextColor:](self->_vectorKitDebugView, "setTextColor:", v10);

      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 16.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setFont:](self->_vectorKitDebugView, "setFont:", v11);

      -[UITextView setEditable:](self->_vectorKitDebugView, "setEditable:", 0);
      -[UITextView setAutoresizingMask:](self->_vectorKitDebugView, "setAutoresizingMask:", 34);
      -[MKMapView addSubview:](self, "addSubview:", self->_vectorKitDebugView);
    }
    else
    {
      -[UITextView removeFromSuperview](self->_vectorKitDebugView, "removeFromSuperview");
      v12 = self->_vectorKitDebugView;
      self->_vectorKitDebugView = 0;

    }
    -[MKMapView _currentEnvironmentNameFrame](self, "_currentEnvironmentNameFrame");
    -[_MKEnvironmentLabel setFrame:](self->_debugCurrentEnvironmentLabel, "setFrame:");
  }
}

- (BOOL)_canShowFlyover
{
  return -[VKMapView canShowFlyover](self->_mapView, "canShowFlyover");
}

- (void)_setZoomScale:(double)a3 centerMapPoint:(id)a4 duration:(double)a5 animated:(BOOL)a6
{
  -[MKMapView _setZoomScale:centerMapPoint:duration:timingFunction:animated:](self, "_setZoomScale:centerMapPoint:duration:timingFunction:animated:", 0, a6, a3, a4.var0, a4.var1, a5);
}

- (void)_setPitchButtonBackgroundStyle:(unint64_t)a3
{
  id v4;

  if (self->_pitchButtonBackgroundStyle != a3)
  {
    self->_pitchButtonBackgroundStyle = a3;
    -[MKMapView _pitchButton](self, "_pitchButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setBackgroundStyle:", a3);

  }
}

- (id)_pitchButton
{
  MKPitchButton *pitchButton;
  MKPitchButton *v4;
  MKPitchButton *v5;

  pitchButton = self->_pitchButton;
  if (!pitchButton)
  {
    +[MKPitchButton pitchButtonWithMapView:](MKPitchButton, "pitchButtonWithMapView:", self);
    v4 = (MKPitchButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pitchButton;
    self->_pitchButton = v4;

    -[MKPitchButton _setBackgroundStyle:](self->_pitchButton, "_setBackgroundStyle:", self->_pitchButtonBackgroundStyle);
    -[MKPitchButton setVisibility:](self->_pitchButton, "setVisibility:", -[MKMapView pitchButtonVisibility](self, "pitchButtonVisibility"));
    -[MKPitchButton setTranslatesAutoresizingMaskIntoConstraints:](self->_pitchButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    pitchButton = self->_pitchButton;
  }
  return pitchButton;
}

- (MKFeatureVisibility)pitchButtonVisibility
{
  return self->_pitchButtonVisibility;
}

- (void)annotationManager:(id)a3 didAddAnnotationRepresentations:(id)a4
{
  id v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  char v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  MKUsageCounter *usageCounter;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = a4;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    -[MKMapViewDelegate mapView:didAddAnnotationViews:](v11, "mapView:didAddAnnotationViews:", self, v6);

  }
  -[MKAnnotationContainerView dropPinsIfNeeded](self->_annotationContainer, "dropPinsIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          usageCounter = self->_usageCounter;
          v20 = v18;
          objc_msgSend(v20, "_setUsageCounter:", usageCounter);
          objc_msgSend(v12, "addObject:", v20);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v12, "count"))
    -[MKMapView _countUsageForAnnotationViewsIfNeeded:](self, "_countUsageForAnnotationViewsIfNeeded:", v12);

}

- (void)_postDidUpdateYawNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (self->_compassUpdateNotificationObserversCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = CFSTR("MKMapViewDidUpdateYawDegreesKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastYaw);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = CFSTR("MKMapViewDidUpdateYawVisibleKey");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastPossiblyVisible);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("MKMapViewDidUpdateYawNotification"), self, v6);

  }
}

- (id)_initWithFrame:(CGRect)a3 allowsAntialiasing:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  MKMapView *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  MKMapView *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)MKMapView;
    v11 = -[MKMapView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
    if (v11)
      v12 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v11, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, 0, 1, objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkit_shouldShowAppleLogo"), v4, 0);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99858];
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = self;
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "raise:format:", v14, CFSTR("%@: MKMapView must be initialized on the main thread."), v18);
    return 0;
  }
  return v11;
}

- (void)_configureGestureRecognizers:(id)a3
{
  UIView *v4;
  MKMapGestureController *v5;
  UIView *contentView;
  MKMapGestureController *v7;
  MKMapGestureController *gestureController;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *selectingTapGestureRecognizer;
  UITapGestureRecognizer *v11;
  UITapGestureRecognizer *nonselectingTapGestureRecognizer;
  UILongPressGestureRecognizer *v13;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  UITapGestureRecognizer *v15;
  void *v16;
  UITapGestureRecognizer *v17;
  void *v18;
  UITapGestureRecognizer *v19;
  void *v20;
  void *v21;
  UITapGestureRecognizer *v22;
  void *v23;
  UITapGestureRecognizer *v24;
  void *v25;
  UITapGestureRecognizer *v26;
  void *v27;
  UITapGestureRecognizer *v28;
  void *v29;
  UITapGestureRecognizer *v30;
  void *v31;

  v4 = (UIView *)a3;
  v5 = [MKMapGestureController alloc];
  if (v4)
    contentView = v4;
  else
    contentView = self->_contentView;
  v7 = -[MKMapGestureController initWithMapView:gestureTargetView:doubleTapTargetView:](v5, "initWithMapView:gestureTargetView:doubleTapTargetView:", self->_basicMapView, contentView);

  gestureController = self->_gestureController;
  self->_gestureController = v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MKMapGestureController setCompassView:](self->_gestureController, "setCompassView:", self->_compassView);
  -[MKMapGestureController setScaleView:](self->_gestureController, "setScaleView:", self->_scaleView);
  -[MKMapGestureController setDelegate:](self->_gestureController, "setDelegate:", self);
  v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleSelectGestureToSelect_);
  selectingTapGestureRecognizer = self->_selectingTapGestureRecognizer;
  self->_selectingTapGestureRecognizer = v9;

  -[UITapGestureRecognizer setDelegate:](self->_selectingTapGestureRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_selectingTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
  v11 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleSelectGestureToDeselect_);
  nonselectingTapGestureRecognizer = self->_nonselectingTapGestureRecognizer;
  self->_nonselectingTapGestureRecognizer = v11;

  -[UITapGestureRecognizer setDelegate:](self->_nonselectingTapGestureRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_nonselectingTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_nonselectingTapGestureRecognizer, "requireGestureRecognizerToFail:", self->_selectingTapGestureRecognizer);
  v13 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handleLongPressGesture_);
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v13;

  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressGestureRecognizer, "setMinimumPressDuration:", 0.2);
  -[UILongPressGestureRecognizer setCancelsTouchesInView:](self->_longPressGestureRecognizer, "setCancelsTouchesInView:", 0);
  -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", self);
  v15 = self->_selectingTapGestureRecognizer;
  -[MKMapGestureController twoFingerTapGestureRecognizer](self->_gestureController, "twoFingerTapGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v15, "requireGestureRecognizerToFail:", v16);

  v17 = self->_selectingTapGestureRecognizer;
  -[MKMapGestureController panGestureRecognizer](self->_gestureController, "panGestureRecognizer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v17, "requireGestureRecognizerToFail:", v18);

  v19 = self->_selectingTapGestureRecognizer;
  -[MKMapGestureController doubleTapGestureRecognizer](self->_gestureController, "doubleTapGestureRecognizer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v19, "requireGestureRecognizerToFail:", v20);

  -[MKMapGestureController oneHandedZoomGestureRecognizer](self->_gestureController, "oneHandedZoomGestureRecognizer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = self->_selectingTapGestureRecognizer;
    -[MKMapGestureController oneHandedZoomGestureRecognizer](self->_gestureController, "oneHandedZoomGestureRecognizer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v22, "requireGestureRecognizerToFail:", v23);

    v24 = self->_nonselectingTapGestureRecognizer;
    -[MKMapGestureController oneHandedZoomGestureRecognizer](self->_gestureController, "oneHandedZoomGestureRecognizer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v24, "requireGestureRecognizerToFail:", v25);

  }
  v26 = self->_nonselectingTapGestureRecognizer;
  -[MKMapGestureController twoFingerTapGestureRecognizer](self->_gestureController, "twoFingerTapGestureRecognizer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v26, "requireGestureRecognizerToFail:", v27);

  v28 = self->_nonselectingTapGestureRecognizer;
  -[MKMapGestureController panGestureRecognizer](self->_gestureController, "panGestureRecognizer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v28, "requireGestureRecognizerToFail:", v29);

  v30 = self->_nonselectingTapGestureRecognizer;
  -[MKMapGestureController doubleTapGestureRecognizer](self->_gestureController, "doubleTapGestureRecognizer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v30, "requireGestureRecognizerToFail:", v31);

  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", self->_longPressGestureRecognizer);
  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", self->_selectingTapGestureRecognizer);
  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", self->_nonselectingTapGestureRecognizer);
  -[MKMapView _addDebugGesture](self, "_addDebugGesture");
  -[MKMapView _updateScrollingAndGestures](self, "_updateScrollingAndGestures");
}

- (void)_addDebugGesture
{
  UIGestureRecognizer *v3;
  UIGestureRecognizer *locationConsoleGesture;
  UIGestureRecognizer *v5;

  if (GEOConfigGetBOOL())
  {
    v3 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_toggleLocationConsole_);
    -[UIGestureRecognizer setNumberOfTapsRequired:](v3, "setNumberOfTapsRequired:", 2);
    -[UIGestureRecognizer setNumberOfTouchesRequired:](v3, "setNumberOfTouchesRequired:", 3);
    -[UIGestureRecognizer setCancelsTouchesInView:](v3, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v3, "setDelaysTouchesBegan:", 0);
    locationConsoleGesture = self->_locationConsoleGesture;
    self->_locationConsoleGesture = v3;
    v5 = v3;

    -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", self->_locationConsoleGesture);
  }
}

- (id)annotationManager:(id)a3 representationForAnnotation:(id)a4
{
  id v6;
  id v7;
  __objc2_class **v8;
  objc_class *v9;
  _MKMapFeatureAnnotationView *v10;
  BOOL v12;
  uint64_t v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  char v16;
  MKMapViewDelegate *v17;
  MKMapViewDelegate *v18;
  char v19;
  MKMapViewDelegate *v20;
  MKMapViewDelegate *v21;
  void *v22;
  MKMapViewDelegate *v23;
  MKMapViewDelegate *v24;
  char v25;
  MKMapViewDelegate *v26;
  MKMapViewDelegate *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  id v33;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((*(_QWORD *)&self->_flags & 0x4000000000) != 0)
      v8 = off_1E20D57B8;
    else
      v8 = off_1E20D5780;
    v9 = (objc_class *)*v8;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = _MKLinkedOnOrAfterReleaseSet(3852);
    v13 = objc_msgSend(v7, "featureType");
    if (v13 || v12)
    {
      if (!v13)
      {
LABEL_22:
        if (self)
        {
          if (qword_1EDFB79F8 != -1)
            dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
          if (byte_1EDFB7994)
          {
            v17 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v17 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v18 = v17;
        }
        else
        {
          v18 = 0;
        }
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) == 0)
          goto LABEL_47;
        if (self)
        {
          if (qword_1EDFB79F8 != -1)
            dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
          if (byte_1EDFB7994)
          {
            v20 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v20 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v21 = v20;
        }
        else
        {
          v21 = 0;
        }
        -[MKMapViewDelegate mapView:viewForAnnotation:](v21, "mapView:viewForAnnotation:", self, v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
LABEL_47:
          v9 = (objc_class *)_MKPointOfInterestAnnotationView;
LABEL_6:
          v10 = (_MKMapFeatureAnnotationView *)objc_msgSend([v9 alloc], "initWithAnnotation:reuseIdentifier:", v7, 0);
          -[_MKMapFeatureAnnotationView setMapView:](v10, "setMapView:", self);
          goto LABEL_7;
        }

        goto LABEL_41;
      }
    }
    else
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v14 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;
      }
      else
      {
        v15 = 0;
      }
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
        goto LABEL_22;
    }
    v10 = -[_MKMapFeatureAnnotationView initWithAnnotation:reuseIdentifier:]([_MKMapFeatureAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v7, 0);
    goto LABEL_7;
  }
LABEL_41:
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v23 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v23 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v26 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v26 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v27 = v26;
    }
    else
    {
      v27 = 0;
    }
    -[MKMapViewDelegate mapView:viewForAnnotation:](v27, "mapView:viewForAnnotation:", self, v7);
    v10 = (_MKMapFeatureAnnotationView *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "clusteringIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAnnotationView clusteringIdentifier](v10, "clusteringIdentifier");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = (void *)v29;
        -[MKAnnotationView clusteringIdentifier](v10, "clusteringIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v28);

        if ((v32 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("MKAnnotationView instances for cluster annotations cannot use a different clusteringIdentifier than its annotation."), 0);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v33);
        }
      }
      -[MKAnnotationView setClusteringIdentifier:](v10, "setClusteringIdentifier:", v28);

    }
  }
  else
  {
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (NSArray)annotations
{
  void *v2;
  void *v3;
  void *v4;

  -[MKAnnotationManager annotations](self->_annotationManager, "annotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _filterLabelMarkersPredicate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setShowsCompass:(BOOL)showsCompass
{
  self->_showsCompass = showsCompass;
  -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility");
}

void __44__MKMapView__forceManifestUpdateIfNecessary__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateManifest:completionHandler:", 0, &__block_literal_global_189);

}

- (void)_updateAttribution
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIImageView *attributionBadgeView;
  id v9;
  double v10;
  double v11;
  double v12;
  UIImageView *v13;
  UIImageView *v14;
  UIImageView *v15;
  UIImageView *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MKAttributionLabel *v24;
  MKAttributionLabel *attributionLabel;
  MKAttributionLabel *v26;
  id v27;

  if ((*(_QWORD *)&self->_flags & 0x8000000) == 0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "attributionsCount");

  if (!v5)
    goto LABEL_7;
  +[MKMapAttributionImage badgeImageForView:](MKMapAttributionImage, "badgeImageForView:", self);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    attributionBadgeView = self->_attributionBadgeView;
    if (!attributionBadgeView)
    {
      v9 = objc_alloc(MEMORY[0x1E0CEA658]);
      objc_msgSend(v7, "size");
      v11 = v10;
      objc_msgSend(v7, "size");
      v13 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", 0.0, 0.0, v11, v12);
      v14 = self->_attributionBadgeView;
      self->_attributionBadgeView = v13;

      -[UIImageView setAutoresizingMask:](self->_attributionBadgeView, "setAutoresizingMask:", 9);
      -[MKMapView addSubview:](self, "addSubview:", self->_attributionBadgeView);
      attributionBadgeView = self->_attributionBadgeView;
    }
    -[UIImageView setImage:](attributionBadgeView, "setImage:", v7);
    -[MKMapView _updateAppleLogoVisibility](self, "_updateAppleLogoVisibility");

  }
  else
  {
LABEL_7:
    v15 = self->_attributionBadgeView;
    -[UIImageView removeFromSuperview](v15, "removeFromSuperview");
    v16 = self->_attributionBadgeView;
    self->_attributionBadgeView = 0;

    if (v15)
      -[MKMapView _updateAppleLogoVisibility](self, "_updateAppleLogoVisibility");
  }
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activeTileGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "attributionsCount");

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activeTileGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributionAtIndex:", 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  if ((*(_QWORD *)&self->_flags & 0x2000000) != 0
    && (objc_msgSend(v27, "url"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "length"),
        v22,
        v23))
  {
    if (!self->_attributionLabel)
    {
      v24 = objc_alloc_init(MKAttributionLabel);
      attributionLabel = self->_attributionLabel;
      self->_attributionLabel = v24;

      -[MKAttributionLabel setMapType:](self->_attributionLabel, "setMapType:", -[MKMapView mapType](self, "mapType"));
      -[MKAttributionLabel setDisplayStyle:](self->_attributionLabel, "setDisplayStyle:", self->_attributionLinkDisplayStyle);
      -[MKAttributionLabel setUserInteractionEnabled:](self->_attributionLabel, "setUserInteractionEnabled:", 0);
      -[MKAttributionLabel sizeToFit](self->_attributionLabel, "sizeToFit");
      -[MKMapView addSubview:](self, "addSubview:", self->_attributionLabel);
    }
  }
  else
  {
    -[MKAttributionLabel removeFromSuperview](self->_attributionLabel, "removeFromSuperview");
    v26 = self->_attributionLabel;
    self->_attributionLabel = 0;

  }
  -[MKMapView _layoutAttribution](self, "_layoutAttribution");

}

- (void)_registerTraitCollectionObservation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", objc_opt_class());
  objc_msgSend(v6, "addObject:", objc_opt_class());
  objc_msgSend(v6, "addObject:", objc_opt_class());
  objc_msgSend(v6, "addObject:", objc_opt_class());
  v5 = (id)-[MKMapView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v6, sel__traitEnvironment_didChangeTraitCollection_);

}

uint64_t __54__MKMapView__goToCenterCoordinate_zoomLevel_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setZoomScale:centerCoordinate:duration:animated:", *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setShowsUserLocation:(BOOL)showsUserLocation
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = showsUserLocation;
  if (-[MKMapView showsUserLocation](self, "showsUserLocation") != showsUserLocation)
  {
    v5 = 0x80000;
    if (!v3)
      v5 = 0;
    *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v5;
    MKGetMKMapViewLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager startUpdatingUserLocation", buf, 2u);
      }

      -[MKMapView startUpdatingUserLocation](self, "startUpdatingUserLocation");
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager stopUpdatingUserLocation", v8, 2u);
      }

      -[MKMapView stopUpdatingUserLocation](self, "stopUpdatingUserLocation");
    }
  }
}

- (void)startUpdatingUserLocation
{
  MKUserLocation *userLocation;
  MKMapView *v4;
  MKUserLocation *v5;
  MKUserLocation *v6;
  MKUserLocation *v7;
  BOOL v8;
  MKUserLocation *v9;
  MKMapView *v10;
  MKUserLocation *v11;
  MKUserLocation *v12;
  MKUserLocation *v13;
  void *v14;
  MKMapViewDelegate *v15;
  MKMapViewDelegate *v16;
  char v17;
  MKMapViewDelegate *v18;
  MKMapViewDelegate *v19;

  userLocation = self->_userLocation;
  if (!userLocation)
  {
    v4 = self;
    v5 = objc_alloc_init(MKUserLocation);
    v6 = v4->_userLocation;
    v4->_userLocation = v5;

    userLocation = v4->_userLocation;
  }
  v7 = userLocation;
  v8 = -[MKUserLocation isUpdating](v7, "isUpdating");

  if (!v8)
  {
    v9 = self->_userLocation;
    if (!v9)
    {
      v10 = self;
      v11 = objc_alloc_init(MKUserLocation);
      v12 = v10->_userLocation;
      v10->_userLocation = v11;

      v9 = v10->_userLocation;
    }
    v13 = v9;
    -[MKUserLocation setUpdating:](v13, "setUpdating:", 1);

    -[MKLocationManager startLocationUpdateWithObserver:](self->_locationManager, "startLocationUpdateWithObserver:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_locationManagerApprovalDidChange_, MKLocationManagerApprovalDidChangeNotification, 0);

    if (qword_1ECE2D8A0 != -1)
      dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
    if (_MergedGlobals_129)
    {
      v15 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v15 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      if (qword_1ECE2D8A0 != -1)
        dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
      if (_MergedGlobals_129)
      {
        v18 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v18 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;
      -[MKMapViewDelegate mapViewWillStartLocatingUser:](v18, "mapViewWillStartLocatingUser:", self);

    }
  }
}

- (BOOL)showsUserLocation
{
  return (*(_QWORD *)&self->_flags >> 19) & 1;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t flags;
  void *v10;
  double Current;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  int v28;
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  v5 = -[MKMapView hasUserLocation](self, "hasUserLocation");
  objc_msgSend(v4, "lastLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      MKGetPuckTrackingLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v28 = 138412546;
        v29 = v7;
        v30 = 2080;
        v31 = "-[MKMapView(UserPositioningInternal) locationManagerUpdatedLocation:]";
        _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_INFO, "[MK] %@ Received - in %s", (uint8_t *)&v28, 0x16u);
      }

    }
  }
  flags = (uint64_t)self->_flags;
  v10 = v6;
  if ((flags & 0x20000000000) != 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v6, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;

    v15 = *(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration;
    if (*(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration < 0.0)
    {
      +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", *(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "expectedGpsUpdateInterval");
      *(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration = v17 + 0.1;

      v15 = *(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration;
    }
    v18 = Current + v15 - v14;
    v19 = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v6, "timestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;

    v10 = v6;
    if (v18 > 0.0)
    {
      objc_msgSend(v4, "expectedGpsUpdateInterval");
      v10 = v6;
      if (v19 - v22 < v23)
      {
        objc_msgSend(v6, "propagateLocationToTime:", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    -[MKMapView setPredictedUserLocation:](self, "setPredictedUserLocation:", v10);
    flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x80) != 0)
  {
    -[MKMapView _updateLocationConsole](self, "_updateLocationConsole");
    *(_QWORD *)&self->_flags &= ~0x1000000000000uLL;
  }
  else
  {
    -[MKMapView _updateUserLocationViewWithLocation:hadUserLocation:](self, "_updateUserLocationViewWithLocation:hadUserLocation:", v10, v5);
    *(_QWORD *)&self->_flags &= ~0x1000000000000uLL;
    if (self->_userTrackingMode)
    {
      -[MKMapView cameraBoundary](self, "cameraBoundary");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        -[MKMapView cameraBoundary](self, "cameraBoundary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "coordinate");
        v27 = objc_msgSend(v26, "_containsCoordinate:");

        if ((v27 & 1) == 0)
          -[MKMapView setUserTrackingMode:](self, "setUserTrackingMode:", 0);
      }
    }
    if (-[MKMapView _useVehicleHeading](self, "_useVehicleHeading"))
      -[MKMapView _updateCourseForMapViewHeading:](self, "_updateCourseForMapViewHeading:", v6);
  }

}

- (void)setPredictedUserLocation:(id)a3
{
  MKUserLocation *userLocation;
  MKMapView *v5;
  MKUserLocation *v6;
  MKUserLocation *v7;
  MKUserLocation *v8;
  id v9;

  v9 = a3;
  userLocation = self->_userLocation;
  if (!userLocation)
  {
    v5 = self;
    v6 = objc_alloc_init(MKUserLocation);
    v7 = v5->_userLocation;
    v5->_userLocation = v6;

    userLocation = v5->_userLocation;
  }
  v8 = userLocation;
  -[MKUserLocation setPredictedLocation:](v8, "setPredictedLocation:", v9);

}

- (void)_updateUserLocationViewWithLocation:(id)a3 hadUserLocation:(BOOL)a4
{
  _BOOL4 v4;
  MKUserLocation *v6;
  MKUserLocation *v7;
  void *v8;
  int v9;
  MKUserLocation *v10;
  MKUserLocation *userLocation;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  MKMapViewDelegate *v26;
  MKMapViewDelegate *v27;
  char v28;
  MKMapViewDelegate *v29;
  MKMapViewDelegate *v30;
  void *v31;
  id v32;

  v4 = a4;
  v32 = a3;
  v6 = self->_userLocation;
  if (v6)
  {
    v7 = v6;
    if (v4)
    {
      if (-[MKUserLocation isEqualToLocation:](v6, "isEqualToLocation:", v32))
      {
        if (-[MKAnnotationManager containsAnnotation:](self->_annotationManager, "containsAnnotation:", v7))
        {
          -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "hasElevation");

          if (v9)
          {
            -[MKUserLocation setLocation:](v7, "setLocation:", v32);
            objc_msgSend(v32, "course");
            -[MKUserLocation setCourse:](v7, "setCourse:");
            *(_QWORD *)&self->_flags &= ~0x1000000000000uLL;
            goto LABEL_42;
          }
        }
      }
    }
  }
  else
  {
    v10 = objc_alloc_init(MKUserLocation);
    userLocation = self->_userLocation;
    self->_userLocation = v10;

    v7 = self->_userLocation;
  }
  if (!self->_userTrackingMode)
    -[MKUserLocation setLocation:](v7, "setLocation:", v32);
  -[MKAnnotationContainerView userLocationView](self->_annotationContainer, "userLocationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (-[MKAnnotationManager annotationRepresentations](self->_annotationManager, "annotationRepresentations"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsObject:", v12),
        v13,
        v14))
  {
    objc_msgSend(v12, "_userLocationProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTarget:", v15);

    if (self->_userTrackingMode)
    {
      -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBehavior:", 2);

    }
    -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "start");

    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  -[MKLocationManager expectedGpsUpdateInterval](self->_locationManager, "expectedGpsUpdateInterval");
  -[MKUserLocation setExpectedCoordinateUpdateInterval:](self->_userLocation, "setExpectedCoordinateUpdateInterval:");
  if (self->_userTrackingMode)
    -[MKUserLocation setLocation:](self->_userLocation, "setLocation:", v32);
  v20 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v20, "_mkUserLocationView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
LABEL_24:

  -[MKUserLocation expectedCoordinateUpdateInterval](self->_userLocation, "expectedCoordinateUpdateInterval");
  objc_msgSend(v22, "updateStateFromLocation:duration:", v32, v23 + 0.1);

  objc_msgSend(v32, "_navigation_routeMatch");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView _updateUserLocation:routeMatch:](self, "_updateUserLocation:routeMatch:", v32, v24);

  if (v19)
  {
    -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLocationManager currentVehicleHeading](self->_locationManager, "currentVehicleHeading");
    objc_msgSend(v25, "updateVehicleHeading:");

  }
  -[MKAnnotationManager addAnnotation:](self->_annotationManager, "addAnnotation:", v7);
  if (qword_1ECE2D8A0 != -1)
    dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
  if (_MergedGlobals_129)
  {
    v26 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v26 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    if (qword_1ECE2D8A0 != -1)
      dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
    if (_MergedGlobals_129)
    {
      v29 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v29 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v30 = v29;
    -[MKMapViewDelegate mapView:didUpdateUserLocation:](v29, "mapView:didUpdateUserLocation:", self, v7);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "postNotificationName:object:", CFSTR("MKUserTrackingViewDidUpdateUserLocationNotification"), self);

  if (!v4 && self->_userTrackingMode)
  {
    -[VKMapView setStaysCenteredDuringPinch:](self->_mapView, "setStaysCenteredDuringPinch:", 1);
    -[MKAnnotationManager updateVisibleAnnotations](self->_annotationManager, "updateVisibleAnnotations");
    -[VKMapView startTrackingAnnotation:trackHeading:animated:duration:timingFunction:](self->_mapView, "startTrackingAnnotation:trackHeading:animated:duration:timingFunction:", self->_userLocation, self->_userTrackingMode == 2, self->_userTrackingModeShouldAnimate, 0, -1.0);
  }

LABEL_42:
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

- (void)_updateUserLocation:(id)a3 routeMatch:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unint64_t)a4;
  -[MKAnnotationContainerView userLocationView](self->_annotationContainer, "userLocationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setRouteMatch:", v7);
  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "_userLocationProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  if (v7 != 0 && (*(_QWORD *)&self->_flags & 0x100000000000) != 0)
    v11 = v10;
  else
    v11 = 0;
  -[VKMapView setRouteLineSplitAnnotation:](self->_mapView, "setRouteLineSplitAnnotation:", v11);
  objc_opt_class();
  v12 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateLocation:routeMatch:locationUpdateUUID:", v6, v7 & ((uint64_t)(*(_QWORD *)&self->_flags << 18) >> 63), v12);

  if (v12)
  {
    MKGetPuckTrackingLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v12;
      v18 = 2080;
      v19 = "-[MKMapView(UserPositioningInternal) _updateUserLocation:routeMatch:]";
      _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_INFO, "[MK] %@ Processed - in %s", (uint8_t *)&v16, 0x16u);
    }

  }
  objc_msgSend(v6, "coordinate");
  -[VKRouteContext setPuckLocation:](self->_routeContext, "setPuckLocation:");
  if (v7)
  {
    objc_msgSend((id)v7, "route");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKRouteContext setRouteOffset:](self->_routeContext, "setRouteOffset:", objc_msgSend((id)v7, "routeCoordinate"));
    -[VKRouteContext setCurrentSegmentIndex:](self->_routeContext, "setCurrentSegmentIndex:", objc_msgSend(v15, "segmentIndexForStepIndex:", objc_msgSend((id)v7, "stepIndex")));
    -[VKRouteContext setCurrentStepIndex:](self->_routeContext, "setCurrentStepIndex:", objc_msgSend((id)v7, "stepIndex"));
    -[VKRouteContext setPuckSnappedStopID:](self->_routeContext, "setPuckSnappedStopID:", objc_msgSend((id)v7, "transitID"));

  }
  else
  {
    -[VKRouteContext setRouteOffset:](self->_routeContext, "setRouteOffset:", *MEMORY[0x1E0D26A38]);
    -[VKRouteContext setCurrentSegmentIndex:](self->_routeContext, "setCurrentSegmentIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[VKRouteContext setCurrentStepIndex:](self->_routeContext, "setCurrentStepIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[VKRouteContext setPuckSnappedStopID:](self->_routeContext, "setPuckSnappedStopID:", 0);
  }

}

- (void)addAnnotationRepresentation:(id)a3 allowAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  MKUserLocation *v9;
  MKUserLocation *userLocation;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _MKCustomFeatureStore *annotationsCustomFeatureStore;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v4 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "viewRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "annotation");
    v9 = (MKUserLocation *)objc_claimAutoreleasedReturnValue();
    userLocation = self->_userLocation;

    if (v9 != userLocation)
    {
LABEL_16:
      -[MKMapView vk_mapLayer](self, "vk_mapLayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addExternalAnchor:", v26);

      -[MKAnnotationContainerView addAnnotationView:allowAnimation:](self->_annotationContainer, "addAnnotationView:allowAnimation:", v8, v4);
      goto LABEL_17;
    }
    objc_msgSend(v8, "_vkNavigationPuckMarker");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v8, "_vkNavigationPuckMarker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapView navigationPuck](self->_mapView, "navigationPuck");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        objc_msgSend(v8, "_setVKNavigationPuckMarker:", 0);
    }
    v15 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v15, "_mkUserLocationView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v16;
LABEL_13:

    -[MKUserLocation location](self->_userLocation, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateStateFromLocation:duration:", v20, 0.0);

    objc_msgSend(v19, "_setShowingPreciseAuthorizedLocation:", -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"));
    v21 = self->_userTrackingMode == 2;
    objc_msgSend(v19, "setShouldDisplayHeading:", -[MKMapView _showHeadingIndicator](self, "_showHeadingIndicator"));
    objc_msgSend(v19, "setShouldDisplayInaccurateHeading:", v21);
    objc_msgSend(v19, "setForcesConeIndicator:", v21);
    objc_msgSend(v19, "_setForceHeadingUp:", v21);
    -[MKUserLocation heading](self->_userLocation, "heading");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "headingAccuracy");
      objc_msgSend(v19, "setHeadingAccuracy:");
      objc_msgSend(v23, "heading");
      objc_msgSend(v19, "setHeading:");
    }
    -[MKAnnotationContainerView setUserLocationView:](self->_annotationContainer, "setUserLocationView:", v15);
    -[VKMapView navigationPuck](self->_mapView, "navigationPuck");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setVKNavigationPuckMarker:", v24);

    goto LABEL_16;
  }
  -[MKMapView _addAnnotationsCustomFeatureStoreIfNeeded](self, "_addAnnotationsCustomFeatureStoreIfNeeded");
  annotationsCustomFeatureStore = self->_annotationsCustomFeatureStore;
  v27[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKCustomFeatureStore addAnnotations:](annotationsCustomFeatureStore, "addAnnotations:", v18);

LABEL_17:
}

- (id)vk_mapLayer
{
  return self->_mapView;
}

- (void)setSelectableMapFeatures:(MKMapFeatureOptions)selectableMapFeatures
{
  void *v5;
  MKLabelSelectionFilter *v6;
  MKLabelSelectionFilter *labelSelectionFilter;

  -[MKLabelSelectionFilter selectionHandler](self->_labelSelectionFilter, "selectionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if (-[MKLabelSelectionFilter mapFeatureOptions](self->_labelSelectionFilter, "mapFeatureOptions") == selectableMapFeatures)
  {
    return;
  }
  -[VKMapView setIsMKRenderingSelectionBalloon:](self->_mapView, "setIsMKRenderingSelectionBalloon:", selectableMapFeatures != 0);
  v6 = -[MKLabelSelectionFilter initWithMapFeatureOptions:]([MKLabelSelectionFilter alloc], "initWithMapFeatureOptions:", selectableMapFeatures);
  labelSelectionFilter = self->_labelSelectionFilter;
  self->_labelSelectionFilter = v6;

  -[VKMapView setLabelSelectionFilter:](self->_mapView, "setLabelSelectionFilter:", self->_labelSelectionFilter);
}

- (void)applicationDidBecomeActive:(id)a3
{
  -[MKMapView setSuspended:](self, "setSuspended:", 0);
  -[MKBasicMapView setMapModeStartTime:](self->_basicMapView, "setMapModeStartTime:", CFAbsoluteTimeGetCurrent());
  -[MKBasicMapView setTrafficStartTime:](self->_basicMapView, "setTrafficStartTime:", CFAbsoluteTimeGetCurrent());
  objc_msgSend(MEMORY[0x1E0D263E8], "reportDailyUsageCountType:", 154);
}

- (void)setSuspended:(BOOL)a3
{
  uint64_t v4;
  char v5;

  if (((((*(_QWORD *)&self->_flags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      -[MKMapView _stopEffects](self, "_stopEffects");
      v4 = 256;
    }
    else
    {
      -[MKMapView _startEffects](self, "_startEffects");
      v4 = 0;
    }
    v5 = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
    *((_BYTE *)&self->_flags + 8) = v5;
  }
}

void __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_resumeUserInteraction");
    v5 = v7;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      v5 = v7;
    }
  }

}

- (void)_resumeUserInteraction
{
  unint64_t userInteractionDisabledCount;
  unint64_t v4;

  userInteractionDisabledCount = self->_userInteractionDisabledCount;
  if (userInteractionDisabledCount)
  {
    v4 = userInteractionDisabledCount - 1;
    self->_userInteractionDisabledCount = v4;
    -[UIView setUserInteractionEnabled:](self->_contentView, "setUserInteractionEnabled:", v4 == 0);
    -[MKMapView _updateScrollingAndGestures](self, "_updateScrollingAndGestures");
  }
}

void __32__MKMapView_setRegion_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRegion:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (double)_goToCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double longitude;
  double latitude;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t v23;
  signed int v24;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  MKMapCameraBoundary *cameraBoundary;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  double v40;
  void *v41;
  _QWORD v43[9];
  char v44;

  v5 = a5;
  longitude = a3.longitude;
  latitude = a3.latitude;
  -[MKMapView centerCoordinate](self, "centerCoordinate");
  v11 = v10;
  v13 = v12;
  -[MKMapView _zoomLevel](self, "_zoomLevel");
  v15 = v14;
  v16 = vabdd_f64(latitude, v11);
  if (v16 >= 0.00000000999999994
    || vabdd_f64(longitude, v13) >= 0.00000000999999994
    || (v17 = 0.0, vabdd_f64(a4, v14) >= 0.00001))
  {
    -[MKMapView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      v5 = 0;
    v17 = 0.0;
    if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldMakeUIForDefaultPNG") & 1) == 0)
    {
      if (self->_userTrackingMode && (v16 >= 0.00000000999999994 || vabdd_f64(longitude, v13) >= 0.00000000999999994))
      {
        -[MKUserLocation coordinate](self->_userLocation, "coordinate");
        if ((vabdd_f64(latitude, v20) >= 0.00000000999999994 || vabdd_f64(longitude, v19) >= 0.00000000999999994)
          && (*(_QWORD *)&self->_flags & 0x8000000000000) == 0)
        {
          -[MKMapView setUserTrackingMode:](self, "setUserTrackingMode:", 0);
        }
      }
      v21 = -1.0;
      if (a4 != -1.0)
      {
        -[MKMapView _boundedZoomLevel:](self, "_boundedZoomLevel:", a4);
        v21 = v22;
      }
      v23 = -[MKMapView _roundedZoomLevel](self, "_roundedZoomLevel");
      v24 = llround(v21);
      if (v23 != v24 && v5)
      {
        if (v23 >= v24)
          v26 = v24;
        else
          v26 = v23;
        -[MKMapView centerCoordinate](self, "centerCoordinate");
        v29 = MKTilePointForCoordinate(v27, v28, (double)v26);
        v31 = v30;
        cameraBoundary = self->_cameraBoundary;
        v33 = latitude;
        v34 = longitude;
        if (cameraBoundary)
          -[MKMapCameraBoundary _clampedCoordinateForCoordinate:](cameraBoundary, "_clampedCoordinateForCoordinate:", latitude, longitude);
        v35 = MKTilePointForCoordinate(v33, v34, (double)v26);
        if (sqrt((v35 - v29) * (v35 - v29) + (v36 - v31) * (v36 - v31)) > 1000.0)
        {
          v37 = -1.0;
          if (v21 == -1.0 || vabdd_f64(v15, v21) < 0.00001)
            goto LABEL_36;
          v38 = 1.0 / exp2(21.0 - v21);
          goto LABEL_32;
        }
      }
      v39 = exp2(21.0 - v21);
      v37 = -1.0;
      v38 = 1.0 / v39;
      if (v21 == -1.0)
      {
        if (!v5)
          goto LABEL_36;
      }
      else if (!v5)
      {
        if (vabdd_f64(v15, v21) < 0.00001)
        {
LABEL_36:
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __54__MKMapView__goToCenterCoordinate_zoomLevel_animated___block_invoke;
          v43[3] = &unk_1E20D87B8;
          v43[4] = self;
          *(double *)&v43[5] = v37;
          *(double *)&v43[6] = latitude;
          *(double *)&v43[7] = longitude;
          v43[8] = 0;
          v44 = 0;
          objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v43);
          return v17;
        }
LABEL_32:
        v37 = v38;
        goto LABEL_36;
      }
      if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
        v17 = v40;
        objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationTimingFunction");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = 0;
        v17 = -1.0;
      }
      -[MKMapView _setZoomScale:centerCoordinate:duration:timingFunction:animated:](self, "_setZoomScale:centerCoordinate:duration:timingFunction:animated:", v41, 1, v38, latitude, longitude, v17);
      if ((*(_QWORD *)&self->_flags & 1) == 0)
        v17 = 0.0;

    }
  }
  return v17;
}

- (int64_t)_roundedZoomLevel
{
  double v3;
  double v4;

  -[MKMapView _zoomLevel](self, "_zoomLevel");
  -[MKMapView _boundedZoomLevel:](self, "_boundedZoomLevel:", round(v3));
  return (uint64_t)v4;
}

- (void)_setZoomScale:(double)a3 centerMapPoint:(id)a4 duration:(double)a5 timingFunction:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  double var1;
  double var0;
  id v13;
  CLLocationCoordinate2D v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  _QWORD v24[4];
  id v25[5];
  id location;
  MKMapPoint v27;

  v7 = a7;
  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a6;
  v27.x = var0;
  v27.y = var1;
  v14 = MKCoordinateForMapPoint(v27);
  if (a3 == -1.0)
  {
    v18 = 0;
  }
  else
  {
    v15 = log2(a3) + 21.0;
    if (v15 >= 0.0)
      v16 = v15;
    else
      v16 = 0.0;
    -[MKMapView _zoomLevel](self, "_zoomLevel");
    v18 = vabdd_f64(v16, v17) >= 1.0e-12;
  }
  if (v14.longitude == -180.0 && v14.latitude == -180.0)
  {
    v19 = 0;
  }
  else
  {
    -[MKMapView centerCoordinate](self, "centerCoordinate");
    v19 = vabdd_f64(v14.latitude, v20) >= 0.00000000999999994;
    if (vabdd_f64(v14.longitude, v21) >= 0.00000000999999994)
      v19 = 1;
  }
  if (v18 || v19)
  {
    if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
    {
      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __75__MKMapView__setZoomScale_centerMapPoint_duration_timingFunction_animated___block_invoke;
      v24[3] = &unk_1E20D8718;
      objc_copyWeak(v25, &location);
      v25[1] = *(id *)&a3;
      v25[2] = *(id *)&var0;
      v25[3] = *(id *)&var1;
      v25[4] = *(id *)&a5;
      -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v24);
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
    else
    {
      -[MKMapView _mapRegionWithCenterCoordinate:zoomScale:](self, "_mapRegionWithCenterCoordinate:zoomScale:", v14.latitude, v14.longitude, a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5 < 0.0 && v7)
      {
        -[VKMapView durationToAnimateToMapRegion:](self->_mapView, "durationToAnimateToMapRegion:", v22);
        a5 = v23;
      }
      -[MKMapView _goToMapRegion:duration:timingFunction:animated:completionHandler:](self, "_goToMapRegion:duration:timingFunction:animated:completionHandler:", v22, v13, v7, 0, a5);

    }
  }

}

- (id)_mapRegionWithCenterCoordinate:(CLLocationCoordinate2D)a3 zoomScale:(double)a4
{
  double v4;
  double longitude;
  double latitude;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CLLocationCoordinate2D v26;
  CLLocationCoordinate2D v27;
  id v28;
  MKMapPoint v30;
  MKMapPoint v31;

  v4 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  if (a4 == -1.0)
  {
    -[MKMapView _zoomScale](self, "_zoomScale");
    v4 = v8;
  }
  v9 = MKTilePointForCoordinate(latitude, longitude, 21.0);
  v11 = v10;
  -[MKMapView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v20 = (v15 - (v18 + v19)) / v4 * 0.5;
  v21 = v11 - v20;
  v22 = v11 + v20;
  if (v11 - v20 >= 0.0)
  {
    if (v22 > 268435456.0)
      v21 = v21 - (v22 + -268435456.0);
  }
  else
  {
    v22 = v22 - v21;
  }
  v23 = (v13 - (v16 + v17)) / v4 * 0.5;
  v24 = v9 + v23;
  v30.x = v9 - v23;
  v30.y = fmax(v21, 0.0);
  v25 = fmin(v22, 268435456.0);
  v26 = MKCoordinateForMapPoint(v30);
  v31.x = v24;
  v31.y = v25;
  v27 = MKCoordinateForMapPoint(v31);
  v28 = objc_alloc_init(MEMORY[0x1E0D27208]);
  objc_msgSend(v28, "setNorthLat:", v26.latitude);
  objc_msgSend(v28, "setWestLng:", v26.longitude);
  objc_msgSend(v28, "setSouthLat:", v27.latitude);
  objc_msgSend(v28, "setEastLng:", v27.longitude);
  return v28;
}

- (void)_goToMapRegion:(id)a3 duration:(double)a4 timingFunction:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  id *v7;
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  VKMapView *mapView;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  MKMapView *v30;

  v9 = a6;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  if (!v9)
    a4 = 0.0;
  -[MKMapView _clearGestureRecognizers](self, "_clearGestureRecognizers");
  v16 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v17 = (void *)MEMORY[0x1E0CEABB0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke;
    v28[3] = &unk_1E20D7E58;
    v29 = v13;
    v30 = self;
    objc_msgSend(v17, "performWithoutAnimation:", v28);

  }
  -[MKMapView _suspendUserInteraction](self, "_suspendUserInteraction");
  if (v14)
  {
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_2;
    v26[3] = &unk_1E20D8740;
    v18 = v26;
    v7 = &v27;
    v27 = v14;
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)MEMORY[0x18D778DB8](v18);
  objc_initWeak(&location, self);
  mapView = self->_mapView;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_3;
  v22[3] = &unk_1E20D8768;
  objc_copyWeak(&v24, &location);
  v21 = v15;
  v23 = v21;
  -[VKMapView setMapRegion:pitch:yaw:duration:timingCurve:completion:](mapView, "setMapRegion:pitch:yaw:duration:timingCurve:completion:", v13, v19, v22, 0.0, 0.0, a4);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  if (v14)
}

- (void)_suspendUserInteraction
{
  ++self->_userInteractionDisabledCount;
  -[UIView setUserInteractionEnabled:](self->_contentView, "setUserInteractionEnabled:", 0);
  -[MKMapView _updateScrollingAndGestures](self, "_updateScrollingAndGestures");
}

- (void)setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8 completionHandler:(id)a9
{
  id v16;
  void (**v17)(id, uint64_t);
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v16 = a3;
  v17 = (void (**)(id, uint64_t))a9;
  -[MKMapView _clearGestureRecognizers](self, "_clearGestureRecognizers");
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __106__MKMapView_setCamera_duration_springMass_springStiffness_springDamping_springVelocity_completionHandler___block_invoke;
    v22[3] = &unk_1E20D8970;
    objc_copyWeak(&v24, &location);
    v23 = v16;
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v22);
    if (v17)
      v17[2](v17, 1);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&v18 = a5;
    *(float *)&v19 = a6;
    *(float *)&v20 = a7;
    *(float *)&v21 = a8;
    -[MKMapView _setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:](self, "_setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:", v16, v17, a4, v18, v19, v20, v21);
  }

}

- (void)_setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8 completionHandler:(id)a9
{
  id v11;
  id v12;

  v11 = a3;
  VKAnimationCurveSpring();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapView _setCamera:duration:timing:completionHandler:](self, "_setCamera:duration:timing:completionHandler:", v11, v12, 0, a4);

}

- (void)setCamera:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[MKMapView _clearGestureRecognizers](self, "_clearGestureRecognizers");
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__MKMapView_setCamera_animated_completionHandler___block_invoke;
    v10[3] = &unk_1E20D8808;
    objc_copyWeak(&v13, &location);
    v11 = v8;
    v12 = v9;
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView _setCamera:animated:completionHandler:](self, "_setCamera:animated:completionHandler:", v8, v6, v9);
  }

}

- (void)_clearGestureRecognizers
{
  -[MKMapGestureController clearGestureRecognizersInFlight](self->_gestureController, "clearGestureRecognizersInFlight");
}

- (void)setRegion:(MKCoordinateRegion)region animated:(BOOL)animated
{
  _BOOL8 v4;
  double longitudeDelta;
  double latitudeDelta;
  double longitude;
  double latitude;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22[5];
  id location[2];

  v4 = animated;
  longitudeDelta = region.span.longitudeDelta;
  latitudeDelta = region.span.latitudeDelta;
  longitude = region.center.longitude;
  latitude = region.center.latitude;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __32__MKMapView_setRegion_animated___block_invoke;
    v21[3] = &unk_1E20D8718;
    objc_copyWeak(v22, location);
    v22[1] = *(id *)&latitude;
    v22[2] = *(id *)&longitude;
    v22[3] = *(id *)&latitudeDelta;
    v22[4] = *(id *)&longitudeDelta;
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v21);
    objc_destroyWeak(v22);
    objc_destroyWeak(location);
  }
  else
  {
    -[MKMapView region](self, "region");
    if (vabdd_f64(latitude, v13) >= 0.00000000999999994
      || vabdd_f64(longitude, v10) >= 0.00000000999999994
      || vabdd_f64(latitudeDelta, v11) >= 0.00000000999999994
      || vabdd_f64(longitudeDelta, v12) >= 0.00000000999999994)
    {
      if (longitude < -180.0
        || longitude > 180.0
        || latitude < -90.0
        || latitude > 90.0
        || latitudeDelta < 0.0
        || latitudeDelta > 180.0
        || longitudeDelta < 0.0
        || longitudeDelta > 360.0)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
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
        -[MKMapView _zoomLevelForRegion:includeAccessoryPadding:](self, "_zoomLevelForRegion:includeAccessoryPadding:", 0, latitude, longitude, latitudeDelta, longitudeDelta);
        -[MKMapView _goToCenterCoordinate:zoomLevel:animated:](self, "_goToCenterCoordinate:zoomLevel:animated:", v4, latitude, longitude, v15);
      }
    }
    else
    {
      MKGetMKMapViewLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_DEBUG, "MKMapView: setRegion:animated: requested region is equal to existing region", (uint8_t *)location, 2u);
      }

    }
  }
}

- (BOOL)_mustWaitUntilSized
{
  double v3;
  double v4;

  -[MKMapView bounds](self, "bounds");
  if (v3 <= 0.0)
    return 1;
  -[MKMapView bounds](self, "bounds");
  return v4 <= 0.0;
}

- (void)_addSetRegionBlock:(id)a3
{
  -[MKMapView _addSetRegionBlock:completion:](self, "_addSetRegionBlock:completion:", a3, 0);
}

- (void)_setCamera:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  if (v13)
  {
    v9 = 0.0;
    if (v6)
    {
      -[MKMapView _durationForCamera:](self, "_durationForCamera:", v13);
      v9 = v10;
    }
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
    {
      v11 = objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationCurve");
      objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
      -[MKMapView _setCamera:duration:timingCurve:completionHandler:](self, "_setCamera:duration:timingCurve:completionHandler:", v13, v11, v8);
    }
    else
    {
      -[MKMapView _setCamera:duration:timing:completionHandler:](self, "_setCamera:duration:timing:completionHandler:", v13, *MEMORY[0x1E0DC65B8], v8, v9);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("camera parameter should not be nil"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
}

- (MKCoordinateRegion)region
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  MKMapRect v9;
  MKCoordinateRegion result;

  -[MKMapView centerCoordinate](self, "centerCoordinate");
  v4 = v3;
  v6 = v5;
  -[MKMapView visibleMapRect](self, "visibleMapRect");
  result = MKCoordinateRegionForMapRect(v9);
  v7 = v4;
  v8 = v6;
  result.center.longitude = v8;
  result.center.latitude = v7;
  return result;
}

- ($FD8927DAD66E183363B3D9E862D46D99)_zoomRegionForMapRect:(SEL)a3 edgePadding:(id)a4 maxZoomLevel:(UIEdgeInsets)a5 minZoomLevel:(int64_t)a6
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  void *v29;
  $FD8927DAD66E183363B3D9E862D46D99 *result;
  double v31;
  double v32;
  double v33;
  double top;
  double left;
  double v36;
  double bottom;
  double right;
  double var0;
  double var1;
  double v41[2];
  uint64_t v42;
  double v43;
  double v44;
  MKMapPoint v45;

  bottom = a5.bottom;
  right = a5.right;
  top = a5.top;
  left = a5.left;
  var0 = a4.var1.var0;
  var1 = a4.var1.var1;
  v36 = a4.var0.var1;
  v33 = a4.var0.var0;
  if (a7 == -1)
    -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
  else
    v9 = (double)a7;
  v32 = v9;
  if (a6 == -1)
    -[MKMapView _maximumZoomLevel](self, "_maximumZoomLevel");
  else
    v10 = (double)a6;
  v31 = v10;
  -[MKMapView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "supports3DMaps") & 1) != 0)
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC6538], "sharedPlatform");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v29, "supportsHiResRTT") ^ 1;

  }
  v43 = 0.0;
  v44 = 0.0;
  v42 = 0;
  v41[0] = 0.0;
  v41[1] = 0.0;

  _scaleForMapRect(&v43, (double *)&v42, v41, v28, v12 + v22, v14 + v20, v16 - (v22 + v26), v18 - (v20 + v24), v33, v36, var0, var1, top, left, bottom, right, v32, v31);
  v45.x = v43;
  v45.y = fmin(fmax(v44, 0.0), 268435456.0);
  MKCoordinateForMapPoint(v45);
  return result;
}

- (double)_zoomLevelForRegion:(id *)a3 includeAccessoryPadding:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v10;
  void *v11;
  int v12;
  double result;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  v41 = v6;
  v42 = v7;
  v39 = v4;
  v40 = v5;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "supports3DMaps"))
  {

LABEL_4:
    GEOMapRectForCoordinateRegion();
    -[MKMapView _zoomLevelForMapRect:includeAccessoryPadding:](self, "_zoomLevelForMapRect:includeAccessoryPadding:", a3);
    return result;
  }
  objc_msgSend(MEMORY[0x1E0DC6538], "sharedPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsHiResRTT");

  if (v12)
    goto LABEL_4;
  -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
  v15 = (uint64_t)v14;
  -[MKMapView _maximumZoomLevel](self, "_maximumZoomLevel");
  v17 = (uint64_t)v16;
  -[MKMapView bounds](self, "bounds");
  v19 = v18;
  v21 = v20;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  if (v17 > v15)
  {
    v37 = (v21 - (v22 + v24)) * 0.5;
    v38 = (v19 - (v23 + v25)) * 0.5;
    while (1)
    {
      v26 = MKTilePointForCoordinate(v39, v40, (double)v17);
      v28 = v27;
      v29 = v27 - v37;
      v30 = v37 + v27;
      MKCoordinateForTilePoint(v26 - v38, v27, (double)v17);
      v32 = v31;
      MKCoordinateForTilePoint(v38 + v26, v28, (double)v17);
      v34 = v33;
      v35 = MKCoordinateForTilePoint(v26, v29, (double)v17);
      if (v35 - MKCoordinateForTilePoint(v26, v30, (double)v17) + 0.0001 >= v41 && v34 - v32 + 0.0001 >= v42)
        break;
      if (--v17 <= v15)
        return (double)v15;
    }
  }
  return (double)v17;
}

- (double)_zoomLevelForMapRect:(id)a3 includeAccessoryPadding:(BOOL)a4
{
  double var0;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double result;
  double var1;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  if (a4)
  {
    -[MKAnnotationContainerView accessoryPadding](self->_annotationContainer, "accessoryPadding");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = *MEMORY[0x1E0CEB4B0];
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
  v17 = v16;
  -[MKMapView _maximumZoomLevel](self, "_maximumZoomLevel");
  -[MKMapView _zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:](self, "_zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:", (int)vcvtpd_s64_f64(v18), (int)v17, v6, v5, var0, var1, v9, v11, v13, v15);
  return result;
}

- (double)_boundedZoomLevel:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
  if (v5 >= a3)
  {
    -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
    a3 = v6;
  }
  -[MKMapView _maximumZoomLevel](self, "_maximumZoomLevel");
  if (a3 < v7)
    return a3;
  -[MKMapView _maximumZoomLevel](self, "_maximumZoomLevel");
  return result;
}

- (MKMapRect)mapRectThatFits:(MKMapRect)mapRect edgePadding:(UIEdgeInsets)insets
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  MKMapRect result;

  right = insets.right;
  bottom = insets.bottom;
  left = insets.left;
  top = insets.top;
  -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
  v31 = v5;
  -[MKMapView _maximumZoomLevel](self, "_maximumZoomLevel");
  v30 = v6;
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 34);
  -[MKMapView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "supports3DMaps") & 1) != 0)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC6538], "sharedPlatform");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "supportsHiResRTT") ^ 1;

  }
  +[MKMapView _mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:", v24, v8, v10, v12, v14, mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height, v16, v18, v20, v22, *(_QWORD *)&top, *(_QWORD *)&left, *(_QWORD *)&bottom, *(_QWORD *)&right,
    v31,
    v30);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (double)_minimumZoomLevel
{
  double result;

  -[VKMapView topDownMinimumZoomLevelForTileSize:](self->_mapView, "topDownMinimumZoomLevelForTileSize:", 128);
  return result;
}

- (double)_maximumZoomLevel
{
  double result;

  -[VKMapView maximumZoomLevelForTileSize:](self->_mapView, "maximumZoomLevelForTileSize:", 128);
  return result;
}

+ (long)_mapRectThatFitsViewBounds:(double)a3 mapRect:(double)a4 viewInsets:(double)a5 edgePadding:(double)a6 minZoomLevel:(double)a7 maxZoomLevel:(double)a8 snapToZoomLevel:(uint64_t)a9
{
  double v26;
  double v27;
  double v28;
  double v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  long double v37;
  double v39[2];
  double v40;
  double v41[6];

  if (a5 == INFINITY && a6 == INFINITY)
    return INFINITY;
  v41[2] = v29;
  v41[3] = v28;
  v41[4] = v26;
  v41[5] = v27;
  v31 = a3 - (a13 + a15);
  if (v31 - (a17 + a19) > 0.0)
  {
    v32 = a4 - (a12 + a14);
    if (v32 - (a16 + a18) > 0.0)
    {
      v33 = ceil(a20);
      v34 = floor(a21);
      if (!a11)
      {
        v33 = a20;
        v34 = a21;
      }
      v35 = *MEMORY[0x1E0C9D538];
      v36 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v41[0] = 0.0;
      v41[1] = 0.0;
      v40 = 0.0;
      v39[0] = 0.0;
      v39[1] = 0.0;
      _scaleForMapRect(v41, &v40, v39, a11, v35, v36, v31, v32, a5, a6, a7, a8, a16, a17, a18, a19, v33, v34);
      v37 = v31 * 0.5 / (1.0 / exp2(21.0 - v40));
      return v41[0] - v37;
    }
  }
  return a5;
}

- (MKMapRect)visibleMapRect
{
  void *v2;
  double v3;
  double v4;
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
  MKMapRect result;

  -[VKMapView mapRegion](self->_mapView, "mapRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOMapRectForMapRegion();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

BOOL __54__MKMapView_canPossiblyShowCompassForInternalControl___block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(257);
  byte_1EDFB7991 = !result;
  return result;
}

- (void)setShowsAttribution:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3;
  -[MKMapView _updateAttribution](self, "_updateAttribution");
}

void __139__MKMapView__commonInitFromIB_gestureRecognizerHostView_locationManager_showsAttribution_showsAppleLogo_allowsAntialiasing_carDisplayType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateProvidersForCurrentCountry");

  +[MKTrafficSupport sharedTrafficSupport](MKTrafficSupport, "sharedTrafficSupport");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setupTrafficIncidents");

  MKRegisterGEOMultitaskingNotifications();
  v4 = CFSTR("ZoomingDefault");
  v5[0] = &unk_1E21584C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v2);

}

- (void)_setAlwaysShowHeadingIndicatorIfSupported:(BOOL)a3
{
  _BOOL4 v4;
  $5D7CD00554919180459D56D22149BB92 *p_flags;
  uint64_t flags;
  char v7;
  uint64_t v8;

  if (a3)
  {
    v4 = -[MKMapView _shouldSupportAlwaysShowHeadingIndicator](self, "_shouldSupportAlwaysShowHeadingIndicator");
    p_flags = &self->_flags;
    flags = (uint64_t)self->_flags;
    if (((v4 ^ ((flags & 0x10000) == 0)) & 1) == 0)
    {
      v7 = *((_BYTE *)&self->_flags + 8);
      v8 = 0x10000;
      if (!v4)
        v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    p_flags = &self->_flags;
    flags = (uint64_t)self->_flags;
    if ((flags & 0x10000) != 0)
    {
      v8 = 0;
      v7 = *((_BYTE *)&self->_flags + 8);
LABEL_9:
      *(_QWORD *)p_flags = flags & 0xFFFFFFFFFFFEFFFFLL | v8;
      *((_BYTE *)p_flags + 8) = v7;
      -[MKMapView _updateShowHeadingIndicator](self, "_updateShowHeadingIndicator");
    }
  }
}

- (BOOL)_shouldSupportAlwaysShowHeadingIndicator
{
  void *v2;
  char v3;

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAlwaysOnCompass");

  return v3;
}

- (void)mapLayerDidFinishLoadingTiles:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  id v9;

  v9 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v7 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    -[MKMapViewDelegate mapViewDidFinishLoadingMap:](v8, "mapViewDidFinishLoadingMap:", self);

  }
}

double __29__MKMapView__canShowControls__block_invoke()
{
  double result;

  *(double *)&qword_1EDFB79C0 = (double)GEOConfigGetInteger();
  result = (double)GEOConfigGetInteger();
  *(double *)&qword_1EDFB79C8 = result;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  NSObject *v5;
  VKMapView *mapView;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  MKMapView *v19;
  __int16 v20;
  VKMapView *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MKGetMKMapViewLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    mapView = self->_mapView;
    -[MKMapView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v4, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v18 = 134219008;
    v19 = self;
    v20 = 2048;
    v21 = mapView;
    v22 = 2048;
    v23 = v7;
    v24 = 2048;
    v25 = v4;
    v26 = 2048;
    v27 = v8;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "willMoveToWindow called; MKMapView: %p | VKMapView: %p | self.window: %p | newWindow: %p | newWindow.windowScene: %p",
      (uint8_t *)&v18,
      0x34u);
    if (v4)

  }
  v9 = _onscreenMapViews;
  -[MKMapView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || v10)
  {
    -[MKMapView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4 && v11)
    {
      --_onscreenMapViews;
      -[MKMapView _stopEffects](self, "_stopEffects");
    }
  }
  else
  {
    ++_onscreenMapViews;
    -[MKMapView _startEffects](self, "_startEffects");
  }
  if ((*(_QWORD *)&self->_flags & 0x1000000000) == 0)
  {
    if (v9 > 0 || _onscreenMapViews < 1)
    {
      if (v9 >= 1 && _onscreenMapViews <= 0)
      {
        +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "overrideBlurStyle");

        if (v15)
        {
          v16 = (void *)MEMORY[0x1E0CEAC68];
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAllBackdropViewsToGraphicsQuality:", objc_msgSend(v17, "_graphicsQuality"));

        }
      }
    }
    else
    {
      +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "overrideBlurStyle");

      if (v13)
        objc_msgSend(MEMORY[0x1E0CEAC68], "setAllBackdropViewsToGraphicsQuality:", 10);
    }
  }
  -[MKMapView _unregisterSceneLifecycleNotifications](self, "_unregisterSceneLifecycleNotifications");
  -[MKMapView _forceManifestUpdateIfNecessary](self, "_forceManifestUpdateIfNecessary");

}

- (void)_startEffects
{
  unint64_t suspendedEffectsCount;

  suspendedEffectsCount = self->_suspendedEffectsCount;
  if (suspendedEffectsCount)
  {
    self->_suspendedEffectsCount = suspendedEffectsCount - 1;
    -[MKMapView _updateEffects](self, "_updateEffects");
  }
}

- (void)_forceManifestUpdateIfNecessary
{
  if (_forceManifestUpdateIfNecessary_once != -1)
    dispatch_once(&_forceManifestUpdateIfNecessary_once, &__block_literal_global_186);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  -[MKMapView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[MKMapView updateLayoutGuides](self, "updateLayoutGuides");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKMapView;
  -[MKMapView didMoveToWindow](&v8, sel_didMoveToWindow);
  -[MKMapView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKMapView _registerSceneLifecycleNotifications](self, "_registerSceneLifecycleNotifications");
    -[MKMapView _updateShowHeadingIndicator](self, "_updateShowHeadingIndicator");
    -[MKMapView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "activationState");

    if (v6 <= 1)
      -[MKMapView _issueDatasetCheckinCall](self, "_issueDatasetCheckinCall");
  }
  -[UIImageView superview](self->_attributionBadgeView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[MKMapView _updateAttribution](self, "_updateAttribution");
  -[MKMapView updateLayoutGuides](self, "updateLayoutGuides");
}

- (void)updateLayoutGuides
{
  void *v3;
  void *v4;
  id topLayoutGuide;
  void *v6;
  id bottomLayoutGuide;
  id v8;

  -[MKMapView _clearLayoutGuides](self, "_clearLayoutGuides");
  if ((*(_QWORD *)&self->_flags & 0x400000000000000) != 0)
  {
    -[UIView _findNearestViewController](self, "_findNearestViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3;
      objc_msgSend(v3, "topLayoutGuide");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      topLayoutGuide = self->_topLayoutGuide;
      self->_topLayoutGuide = v4;

      objc_msgSend(v8, "bottomLayoutGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      bottomLayoutGuide = self->_bottomLayoutGuide;
      self->_bottomLayoutGuide = v6;

      objc_msgSend(self->_topLayoutGuide, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 0, 0);
      objc_msgSend(self->_bottomLayoutGuide, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 0, 0);
      v3 = v8;
    }

  }
}

- (void)_clearLayoutGuides
{
  id topLayoutGuide;
  id bottomLayoutGuide;

  if ((*(_QWORD *)&self->_flags & 0x400000000000000) != 0)
  {
    objc_msgSend(self->_topLayoutGuide, "removeObserver:forKeyPath:", self, CFSTR("bounds"));
    objc_msgSend(self->_bottomLayoutGuide, "removeObserver:forKeyPath:", self, CFSTR("bounds"));
    topLayoutGuide = self->_topLayoutGuide;
    self->_topLayoutGuide = 0;

    bottomLayoutGuide = self->_bottomLayoutGuide;
    self->_bottomLayoutGuide = 0;

  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;

  -[MKMapView _updateShowHeadingIndicator](self, "_updateShowHeadingIndicator", a3);
  -[MKMapView _updateRotationSupported](self, "_updateRotationSupported");
  -[MKAnnotationContainerView userLocationView](self->_annotationContainer, "userLocationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_mkUserLocationView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  if (v6)
    objc_msgSend(v6, "_setShowingPreciseAuthorizedLocation:", -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"));

}

- (void)_registerSceneLifecycleNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MKMapView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__sceneWillEnterForeground_, *MEMORY[0x1E0CEBB70], v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__sceneDidActivate_, *MEMORY[0x1E0CEBB40], v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, *MEMORY[0x1E0CEBB50], v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__sceneDidFinishSuspensionSnapshot_, *MEMORY[0x1E0CEC150], v8);

  }
}

- (void)_issueDatasetCheckinCall
{
  double v2;
  void *v3;
  id v4;

  GEOMachAbsoluteTimeGetCurrent();
  if (v2 - *(double *)&_issueDatasetCheckinCall_lastCheckinTime >= 30.0)
  {
    _issueDatasetCheckinCall_lastCheckinTime = *(_QWORD *)&v2;
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ticketForDatasetCheckWithTraits:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "submitWithHandler:networkActivity:", &__block_literal_global_337, &__block_literal_global_338);
  }
}

- (void)deviceOrientationDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MKMapView_deviceOrientationDidChange___block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_setZoomScale:(double)a3 centerCoordinate:(CLLocationCoordinate2D)a4 duration:(double)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double v10;
  double v11;

  v6 = a6;
  v10 = MKTilePointForCoordinate(a4.latitude, a4.longitude, 21.0);
  -[MKMapView _setZoomScale:centerMapPoint:duration:animated:](self, "_setZoomScale:centerMapPoint:duration:animated:", v6, a3, v10, v11, a5);
}

- (void)_addCustomFeatureDataSource:(id)a3
{
  -[VKMapView addCustomFeatureDataSource:](self->_mapView, "addCustomFeatureDataSource:", a3);
}

- (void)setDelegate:(id)delegate
{
  MKMapView **v4;
  char v5;
  MKMapView **v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  char v14;

  v4 = (MKMapView **)self;
  if (self)
  {
    if (qword_1ECE2DE10 != -1)
      dispatch_once(&qword_1ECE2DE10, &__block_literal_global_17_0);
    if (_MergedGlobals_171)
      self = v4[67];
    else
      self = (MKMapView *)objc_msgSend(v4, "_safeDelegate");
  }
  if (self != delegate)
  {
    if (qword_1ECE2DE10 != -1)
      dispatch_once(&qword_1ECE2DE10, &__block_literal_global_17_0);
    if (_MergedGlobals_171)
      v4[67] = (MKMapView *)delegate;
    else
      objc_msgSend(v4, "_setSafeDelegate:", delegate);
    v5 = objc_opt_respondsToSelector();
    v6 = v4 + 125;
    v7 = 0x1000000000000000;
    if ((v5 & 1) == 0)
      v7 = 0;
    *v6 = (MKMapView *)((unint64_t)*v6 & 0xEFFFFFFFFFFFFFFFLL | v7);
    v8 = objc_opt_respondsToSelector();
    v9 = 0x2000000000000000;
    if ((v8 & 1) == 0)
      v9 = 0;
    *v6 = (MKMapView *)((unint64_t)*v6 & 0xDFFFFFFFFFFFFFFFLL | v9);
    v10 = objc_opt_respondsToSelector();
    v11 = 0x4000000000000000;
    if ((v10 & 1) == 0)
      v11 = 0;
    *v6 = (MKMapView *)((unint64_t)*v6 & 0xBFFFFFFFFFFFFFFFLL | v11);
    v12 = objc_opt_respondsToSelector();
    v13 = 0x8000000000000000;
    if ((v12 & 1) == 0)
      v13 = 0;
    *v6 = (MKMapView *)(v13 & 0x8000000000000000 | (unint64_t)*v6 & 0x7FFFFFFFFFFFFFFFLL);
    *((_BYTE *)v6 + 8) = (_BYTE)v6[1] & 0xFE | ((objc_opt_respondsToSelector() & 1) != 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 2;
    else
      v14 = 0;
    *((_BYTE *)v6 + 8) = (_BYTE)v6[1] & 0xFD | v14;
  }
}

- (void)_setSafeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_safeDelegate, a3);
}

- (void)mapLayer:(id)a3 locationInHikingToolTipRegion:(unint64_t)a4
{
  MKMapViewDelegate **p_safeDelegate;
  id WeakRetained;
  char v8;
  id v9;

  p_safeDelegate = &self->_safeDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_safeDelegate);
    objc_msgSend(v9, "mapView:didGetHikingToolTipRegionId:", self, a4);

  }
}

void __44__MKMapView__forceManifestUpdateIfNecessary__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  NSObject *v3;

  if ((GEOConfigGetBOOL() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "bundleIdentifier"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Maps")),
        v1,
        v0,
        v2)
    && GEOConfigGetBOOL())
  {
    dispatch_get_global_queue(17, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, &__block_literal_global_187);

  }
}

- (void)_addSetRegionBlock:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableArray *whenSizedBlocks;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  MKWhenSizedBlock *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  whenSizedBlocks = self->_whenSizedBlocks;
  if (whenSizedBlocks)
  {
    v8 = -[NSMutableArray count](whenSizedBlocks, "count");
    if (v8 >= 1)
    {
      v9 = v8 + 1;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_whenSizedBlocks, "objectAtIndexedSubscript:", v9 - 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "type") == 1 || !objc_msgSend(v10, "type"))
        {
          if (!objc_msgSend(v10, "shouldRun"))
            goto LABEL_13;
          objc_msgSend(v10, "setShouldRun:", 0);
        }
        else if (objc_msgSend(v10, "type") == 2)
        {
          goto LABEL_13;
        }

        --v9;
      }
      while (v9 > 1);
    }
  }
  else
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_whenSizedBlocks;
    self->_whenSizedBlocks = v11;
LABEL_13:

  }
  v12 = self->_whenSizedBlocks;
  v13 = -[MKWhenSizedBlock initWithType:block:completion:]([MKWhenSizedBlock alloc], "initWithType:block:completion:", 0, v14, v6);
  -[NSMutableArray addObject:](v12, "addObject:", v13);

}

- (void)mapLayerDidChangeSceneState:(id)a3 withState:(unint64_t)a4
{
  id v6;
  char v7;
  uint64_t flags;
  void *v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  char v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  char v16;
  MKMapViewDelegate *v17;
  MKMapViewDelegate *v18;
  MKMapViewDelegate *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t mapViewDidFinishRenderingSignpostID;
  void *v23;
  uint8_t v24[16];

  v6 = a3;
  v7 = *((_BYTE *)&self->_flags + 8);
  flags = (uint64_t)self->_flags;
  if (a4 == 1 || !(a4 | *(_QWORD *)&self->_flags & 0x20))
  {
    *(_QWORD *)&self->_flags = flags | 0x20;
    *((_BYTE *)&self->_flags + 8) = v7;
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v11 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v14 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v18 = v14;
      -[MKMapViewDelegate mapViewWillStartRenderingMap:](v14, "mapViewWillStartRenderingMap:", self);

    }
  }
  else if (a4 - 2 <= 2)
  {
    if ((flags & 0x10) == 0)
    {
      *(_QWORD *)&self->_flags = flags | 0x10;
      *((_BYTE *)&self->_flags + 8) = v7;
      -[MKBasicMapView setHasRenderedSomething:](self->_basicMapView, "setHasRenderedSomething:", 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("MKMapViewDidFinishInitialRenderNotification"), self);

      -[MKMapView _updateShouldDisplayEffects](self, "_updateShouldDisplayEffects");
    }
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v10 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v10;
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v17 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v17 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v17;
      -[MKMapViewDelegate mapViewDidFinishRenderingMap:fullyRendered:](v17, "mapViewDidFinishRenderingMap:fullyRendered:", self, a4 < 3);

      MKGetMKMapViewLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      mapViewDidFinishRenderingSignpostID = self->_mapViewDidFinishRenderingSignpostID;
      if (mapViewDidFinishRenderingSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)v24 = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v21, OS_SIGNPOST_EVENT, mapViewDidFinishRenderingSignpostID, "mapViewDidFinishRenderingMapFullyRendered", (const char *)&unk_18B2CC343, v24, 2u);
      }

    }
    *(_QWORD *)&self->_flags &= ~0x20uLL;
    objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v23, "mapView:viewPortUpdated:showingGrid:", self, a4 == 3, -[MKMapView _geoCoordinateRegionForOffline](self));

  }
}

- (void)_setUseBalloonCalloutsForLabels:(BOOL)a3
{
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Do not use this SPI"));
}

- (BOOL)_useBalloonCalloutsForLabels
{
  return 1;
}

- (double)_geoCoordinateRegionForOffline
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  MKMapRect v7;

  if (!a1)
    return 0.0;
  if (GEOConfigGetBOOL()
    && (objc_msgSend(a1, "_mapLayer"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "mapRegionIgnoringEdgeInsets"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v3))
  {
    GEOMapRectForMapRegion();
    GEOCoordinateRegionForMapRect();
    v5 = v4;

  }
  else
  {
    objc_msgSend(a1, "visibleMapRect");
    *(_QWORD *)&v5 = (unint64_t)MKCoordinateRegionForMapRect(v7);
  }
  return v5;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("__mapkit_regionSentinel")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("__mapkit_edgeInsetsSentinel")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MKMapView;
    v5 = -[MKMapView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

+ ($DC1C8D958DDC8D67D0023B74A9319680)regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 edgeInsets:(CGSize)a5 region:(UIEdgeInsets)a6
{
  CGFloat right;
  double height;
  double width;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a5.height;
  width = a5.width;
  v11 = +[MKMapView minZoomLevelForMapType:viewSize:](MKMapView, "minZoomLevelForMapType:viewSize:", a4, a7);
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "supports3DMaps") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC6538], "sharedPlatform");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "supportsHiResRTT") ^ 1;

  }
  return +[MKMapView _regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:", a4, v13, width, height, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24), *(_QWORD *)&top, *(_QWORD *)&left, *(_QWORD *)&bottom, *(_QWORD *)&right, v19, v20, v21, v22, (double)v11,
           0x4035000000000000);
}

+ ($DC1C8D958DDC8D67D0023B74A9319680)regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 region:(CGSize)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  return ($DC1C8D958DDC8D67D0023B74A9319680 *)objc_msgSend(a2, "regionThatFitsMapType:viewSize:edgeInsets:region:", a4, a6, a5.width, a5.height, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24), v6, v7, v8, v9);
}

+ (void)setRendersInBackgroundByDefault:(BOOL)a3
{
  _MergedGlobals_53 = a3;
}

void __139__MKMapView__commonInitFromIB_gestureRecognizerHostView_locationManager_showsAttribution_showsAppleLogo_allowsAntialiasing_carDisplayType___block_invoke_155(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateAppearanceIfNeeded");
    WeakRetained = v2;
  }

}

- (id)_initWithFrame:(CGRect)a3 gestureRecognizerHostView:(id)a4 showsAttribution:(BOOL)a5 showsAppleLogo:(BOOL)a6 allowsAntialiasing:(BOOL)a7 carDisplayType:(int64_t)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  id v18;
  MKMapView *v19;
  MKMapView *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  MKMapView *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v29.receiver = self;
    v29.super_class = (Class)MKMapView;
    v19 = -[MKMapView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
    v20 = v19;
    if (v19)
      v21 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v19, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, v18, 0, v11, v10, v9, a8);
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = *MEMORY[0x1E0C99858];
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = self;
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ %@"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "raise:format:", v23, CFSTR("%@: MKMapView must be initialized on the main thread."), v27);
    v20 = 0;
  }

  return v20;
}

- (MKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  MKMapView *v11;
  MKMapView *v12;
  MKLocationManager *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  MKMapView *v17;
  void *v18;
  void *v19;
  MKMapView *v20;
  id v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99858];
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = self;
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ %@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "raise:format:", v15, CFSTR("%@: MKMapView must be initialized on the main thread."), v19);
    v20 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v23.receiver = self;
  v23.super_class = (Class)MKMapView;
  v11 = -[MKMapView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = v11;
    if (v10)
      v13 = -[MKLocationManager initWithCLLocationManager:]([MKLocationManager alloc], "initWithCLLocationManager:", v10);
    else
      v13 = 0;
    v21 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v12, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, v13, 1, objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkit_shouldShowAppleLogo"), 1, 0);
    v17 = v12;

    v20 = v17;
    goto LABEL_9;
  }
  v20 = 0;
LABEL_10:

  return v20;
}

- (id)initFromIBWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MKMapView *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  MKMapView *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (initFromIBWithFrame__onceToken != -1)
      dispatch_once(&initFromIBWithFrame__onceToken, &__block_literal_global_166);
    v18.receiver = self;
    v18.super_class = (Class)MKMapView;
    v9 = -[MKMapView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
    if (v9)
      v10 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v9, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 1, 0, 0, 1, objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkit_shouldShowAppleLogo"), 1, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99858];
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = self;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "raise:format:", v12, CFSTR("%@: MKMapView must be initialized on the main thread."), v16);
    return 0;
  }
  return v9;
}

uint64_t __33__MKMapView_initFromIBWithFrame___block_invoke()
{
  GEODefaultsDisableServer();
  GEONetworkDefaultsDisableServerConnection();
  objc_msgSend(MEMORY[0x1E0D27008], "disableServerConnection");
  objc_msgSend(MEMORY[0x1E0D27420], "disableServerConnection");
  return objc_msgSend(MEMORY[0x1E0D275D0], "useLocalLoader");
}

- (MKMapView)initWithCoder:(id)a3
{
  id v5;
  MKMapView *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MKMapView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99858];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = self;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "raise:format:", v11, CFSTR("%@: MKMapView must be initialized on the main thread."), v15);
    v6 = 0;
    goto LABEL_39;
  }
  v20.receiver = self;
  v20.super_class = (Class)MKMapView;
  v6 = -[MKMapView initWithCoder:](&v20, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v6, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, 0, 1, objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkit_shouldShowAppleLogo"), 1, 0);
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKZoomEnabled")))
      -[MKMapView setZoomEnabled:](v6, "setZoomEnabled:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKZoomEnabled")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKScrollEnabled")))
      -[MKMapView setScrollEnabled:](v6, "setScrollEnabled:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKScrollEnabled")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKShowsUserLocation")))
      -[MKMapView setShowsUserLocation:](v6, "setShowsUserLocation:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKShowsUserLocation")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKDelegate")))
    {
      objc_msgSend(v5, "decodeObjectForKey:", CFSTR("MKDelegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapView setDelegate:](v6, "setDelegate:", v8);

    }
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKPitchButtonVisibility")))
      -[MKMapView setPitchButtonVisibility:](v6, "setPitchButtonVisibility:", objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("MKPitchButtonVisibility")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKPitchEnabled")))
      -[MKMapView setPitchEnabled:](v6, "setPitchEnabled:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKPitchEnabled")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKRotateEnabled")))
      -[MKMapView setRotateEnabled:](v6, "setRotateEnabled:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKRotateEnabled")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKPreferredConfiguration")))
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPreferredConfiguration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapView setPreferredConfiguration:](v6, "setPreferredConfiguration:", v9);
      goto LABEL_32;
    }
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKMapType")))
      -[MKMapView setMapType:](v6, "setMapType:", objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("MKMapType")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKPointOfInterestFilter")))
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPointOfInterestFilter"));
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "containsValueForKey:", CFSTR("MKShowsPointsOfInterest"))
        || (objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKShowsPointsOfInterest")) & 1) != 0)
      {
        goto LABEL_28;
      }
      +[MKPointOfInterestFilter filterExcludingAllCategories](MKPointOfInterestFilter, "filterExcludingAllCategories");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v16;
    -[MKMapConfiguration set_pointOfInterestFilter:](v6->_preferredConfiguration, "set_pointOfInterestFilter:", v16);

LABEL_28:
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKShowsBuildings")))
      -[MKMapView setShowsBuildings:](v6, "setShowsBuildings:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKShowsBuildings")));
    if (!objc_msgSend(v5, "containsValueForKey:", CFSTR("MKShowsTraffic")))
      goto LABEL_33;
    v18 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKShowsTraffic"));
    -[MKMapView preferredConfiguration](v6, "preferredConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set_showsTraffic:", v18);
LABEL_32:

LABEL_33:
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKShowsCompass")))
      -[MKMapView setShowsCompass:](v6, "setShowsCompass:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKShowsCompass")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKShowsScaleKey")))
      -[MKMapView setShowsScale:](v6, "setShowsScale:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKShowsScaleKey")));
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("MKShowsUserTrackingButton")))
      -[MKMapView setShowsUserTrackingButton:](v6, "setShowsUserTrackingButton:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MKShowsUserTrackingButton")));
  }
LABEL_39:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKMapView;
  v4 = a3;
  -[MKMapView encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v5 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate", v9.receiver, v9.super_class);
      v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v6, CFSTR("MKDelegate"), v9.receiver, v9.super_class);

  objc_msgSend(v4, "encodeInteger:forKey:", (int)-[MKMapView mapType](self, "mapType"), CFSTR("MKMapType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isZoomEnabled](self, "isZoomEnabled"), CFSTR("MKZoomEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isScrollEnabled](self, "isScrollEnabled"), CFSTR("MKScrollEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsUserLocation](self, "showsUserLocation"), CFSTR("MKShowsUserLocation"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MKMapView pitchButtonVisibility](self, "pitchButtonVisibility"), CFSTR("MKPitchButtonVisibility"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isPitchEnabled](self, "isPitchEnabled"), CFSTR("MKPitchEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isRotateEnabled](self, "isRotateEnabled"), CFSTR("MKRotateEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsBuildings](self, "showsBuildings"), CFSTR("MKShowsBuildings"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsTraffic](self, "showsTraffic"), CFSTR("MKShowsTraffic"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsCompass](self, "showsCompass"), CFSTR("MKShowsCompass"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsScale](self, "showsScale"), CFSTR("MKShowsScaleKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsUserTrackingButton](self, "showsUserTrackingButton"), CFSTR("MKShowsUserTrackingButton"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView _showsPointsOfInterest](self, "_showsPointsOfInterest"), CFSTR("MKShowsPointsOfInterest"));
  -[MKMapConfiguration _pointOfInterestFilter](self->_preferredConfiguration, "_pointOfInterestFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKPointOfInterestFilter"));

  -[MKMapView preferredConfiguration](self, "preferredConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MKPreferredConfiguration"));

}

- (void)dealloc
{
  MKMapViewInternal *internal;
  void *v4;
  void *v5;
  MKAnnotationContainerView *annotationContainer;
  objc_super v7;

  GEOConfigRemoveDelegateListenerForAllKeys();
  internal = self->_internal;
  if (internal)
    objc_storeWeak((id *)&internal->view, 0);
  MapsFeature_RemoveBlockListener();
  -[VKMapView setCameraDelegate:](self->_mapView, "setCameraDelegate:", 0);
  -[VKMapView setMapDelegate:](self->_mapView, "setMapDelegate:", 0);
  -[MKLocationManager stopHeadingUpdateWithObserver:](self->_locationManager, "stopHeadingUpdateWithObserver:", self);
  -[MKLocationManager stopLocationUpdateWithObserver:](self->_locationManager, "stopLocationUpdateWithObserver:", self);
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTileGroupObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[UITapGestureRecognizer setDelegate:](self->_selectingTapGestureRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer setDelegate:](self->_nonselectingTapGestureRecognizer, "setDelegate:", 0);
  -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", 0);
  -[MKAnnotationManager setDelegate:](self->_annotationManager, "setDelegate:", 0);
  -[MKAnnotationManager setContainer:](self->_annotationManager, "setContainer:", 0);
  annotationContainer = self->_annotationContainer;
  if (annotationContainer->_selectedAnnotationView)
  {
    -[MKAnnotationView _setSelected:animated:](annotationContainer->_selectedAnnotationView, "_setSelected:animated:", 0, 0);
    annotationContainer = self->_annotationContainer;
  }
  -[MKAnnotationContainerView setDelegate:](annotationContainer, "setDelegate:", 0);
  -[MKOverlayContainerView setDelegate:](self->_overlayContainer, "setDelegate:", 0);
  -[MKMapGestureController setDelegate:](self->_gestureController, "setDelegate:", 0);
  -[MKMapView set_startEffectsTimer:](self, "set_startEffectsTimer:", 0);
  -[MKMapCamera _setMapView:](self->_camera, "_setMapView:", 0);
  -[MKMapView _clearLayoutGuides](self, "_clearLayoutGuides");
  -[MKMapView _unregisterConfigurationObservers](self, "_unregisterConfigurationObservers");
  v7.receiver = self;
  v7.super_class = (Class)MKMapView;
  -[MKMapView dealloc](&v7, sel_dealloc);
}

- (void)setBackdropViewQualityChangingDisabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (void)_traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  VKMapView *mapView;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  NSObject *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *lastEffectiveTraitCollectionIsolationQueue;
  void *v26;
  int v27;
  _QWORD block[5];
  id v29;
  uint8_t buf[4];
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MKGetMKMapViewLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_INFO, "MKMapView: _traitEnvironment:didChangeTraitCollection:", buf, 2u);
  }

  -[MKMapView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapGestureController _setTraitCollection:](self->_gestureController, "_setTraitCollection:", v7);
  -[MKMapView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    mapView = self->_mapView;
    -[MKMapView traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredContentSizeCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView _mapkit_configureLabelSizesForContentSizeCategory:](mapView, "_mapkit_configureLabelSizesForContentSizeCategory:", v14);

  }
  MKGetMKMapViewLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[MKMapView traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceStyle");
    if (v17 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown %ld>"), v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E20D8A78[v17];
    }
    *(_DWORD *)buf = 138412290;
    v31 = v18;
    _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_INFO, "MKMapView: _traitEnvironment:didChangeTraitCollection: self.traitCollection.userInterfaceStyle : %@", buf, 0xCu);

  }
  MKGetMKMapViewLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v5, "userInterfaceStyle");
    if (v20 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown %ld>"), v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E20D8A78[v20];
    }
    *(_DWORD *)buf = 138412290;
    v31 = v21;
    _os_log_impl(&dword_18B0B0000, v19, OS_LOG_TYPE_INFO, "MKMapView: _traitEnvironment:didChangeTraitCollection: previousTraitCollection.userInterfaceStyle : %@", buf, 0xCu);

  }
  -[MKMapView traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceStyle");
  v24 = objc_msgSend(v5, "userInterfaceStyle");

  if (v23 != v24)
    -[MKMapView _updateAppearanceIfNeeded](self, "_updateAppearanceIfNeeded");
  lastEffectiveTraitCollectionIsolationQueue = self->_lastEffectiveTraitCollectionIsolationQueue;
  if (lastEffectiveTraitCollectionIsolationQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MKMapView__traitEnvironment_didChangeTraitCollection___block_invoke;
    block[3] = &unk_1E20D7E58;
    block[4] = self;
    v29 = v7;
    dispatch_sync(lastEffectiveTraitCollectionIsolationQueue, block);
    -[MKMapView traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

    if (v27)
      -[MKMapView _invalidateAllOverlayRendererColors](self, "_invalidateAllOverlayRendererColors");

  }
}

void __56__MKMapView__traitEnvironment_didChangeTraitCollection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 976), *(id *)(a1 + 40));
}

- (void)_withEffectiveTraitCollection:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *lastEffectiveTraitCollectionIsolationQueue;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(_QWORD))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  lastEffectiveTraitCollectionIsolationQueue = self->_lastEffectiveTraitCollectionIsolationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__MKMapView__withEffectiveTraitCollection___block_invoke;
  v7[3] = &unk_1E20D7E10;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(lastEffectiveTraitCollectionIsolationQueue, v7);
  objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v9[5]);
  v4[2](v4);
  objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v6);

  _Block_object_dispose(&v8, 8);
}

void __43__MKMapView__withEffectiveTraitCollection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 976));
}

- (BOOL)showsAttribution
{
  return (*(_QWORD *)&self->_flags >> 25) & 1;
}

- (BOOL)_showsAppleLogo
{
  return (*(_QWORD *)&self->_flags >> 26) & 1;
}

- (void)_setShowsAppleLogo:(BOOL)a3
{
  -[MKMapView _setShowsAppleLogo:force:](self, "_setShowsAppleLogo:force:", a3, 0);
}

- (void)_setShowsAppleLogo:(BOOL)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  int v7;
  uint64_t v8;

  v4 = a4;
  v5 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkit_shouldShowAppleLogo");
  v8 = 0x4000000;
  if (((v7 | v4) & v5) == 0)
    v8 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v8;
  -[MKMapView _updateAppleLogoVisibility](self, "_updateAppleLogoVisibility");
}

- (BOOL)canShowAttributionBadge
{
  return (*(_QWORD *)&self->_flags >> 27) & 1;
}

- (void)setCanShowAttributionBadge:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3;
  -[MKMapView _updateAttribution](self, "_updateAttribution");
}

- (BOOL)_isShowingAttributionBadge
{
  UIImageView *attributionBadgeView;
  void *v3;
  BOOL v4;

  attributionBadgeView = self->_attributionBadgeView;
  if (!attributionBadgeView)
    return 0;
  -[UIImageView superview](attributionBadgeView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (CGRect)attributionBadgeBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[MKMapView _isShowingAttributionBadge](self, "_isShowingAttributionBadge"))
  {
    -[UIImageView bounds](self->_attributionBadgeView, "bounds");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_setAttributionLinkDisplayStyle:(int64_t)a3
{
  MKAttributionLabel *attributionLabel;

  if (self->_attributionLinkDisplayStyle != a3)
  {
    self->_attributionLinkDisplayStyle = a3;
    attributionLabel = self->_attributionLabel;
    if (attributionLabel)
    {
      -[MKAttributionLabel setDisplayStyle:](attributionLabel, "setDisplayStyle:");
      -[MKAttributionLabel sizeToFit](self->_attributionLabel, "sizeToFit");
      -[MKMapView _layoutAttribution](self, "_layoutAttribution");
    }
  }
}

- (void)setCompassViewSize:(int64_t)a3
{
  MKCompassView *compassView;

  if (self->_compassViewSize != a3)
  {
    self->_compassViewSize = a3;
    compassView = self->_compassView;
    if (compassView)
      -[MKCompassView setCompassViewSize:](compassView, "setCompassViewSize:");
    -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility");
  }
}

- (void)_setCompassViewSize:(int64_t)a3 style:(int64_t)a4
{
  MKCompassView *compassView;

  if (self->_compassViewSize != a3 || self->_compassViewStyle != a4)
  {
    self->_compassViewSize = a3;
    self->_compassViewStyle = a4;
    compassView = self->_compassView;
    if (compassView)
      -[MKCompassView setCompassViewSize:style:](compassView, "setCompassViewSize:style:");
    -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility");
  }
}

- (void)_setCompassInsetEdges:(unint64_t)a3
{
  self->_compassInsetEdges = a3;
  self->_explicitCompassInsetEdges = 1;
  -[MKMapView _updateControlsPosition:](self, "_updateControlsPosition:", 1);
  if (self->_scaleVisibility != 1)
    -[MKMapView _updateScalePosition](self, "_updateScalePosition");
}

- (void)setAttributionCorner:(int)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3 == 4 || a3 == 8)
  {
    self->_attributionCorner = a3;
    -[MKMapView _layoutAttribution](self, "_layoutAttribution");
  }
  else
  {
    MKGetMKMapViewLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "On iOS, only BottomLeft and BottomRight are supported locations for attribution.", v4, 2u);
    }

  }
}

void __39__MKMapView__updateAppleLogoVisibility__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setOpacity:", v1);

}

uint64_t __39__MKMapView__updateAppleLogoVisibility__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "_layoutAttribution");
}

- (CGRect)attributionFrame
{
  MKAttributionLabel *attributionLabel;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  attributionLabel = self->_attributionLabel;
  if (attributionLabel)
  {
    -[MKAttributionLabel frame](attributionLabel, "frame");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)urlForMapAttribution
{
  void *v2;
  void *v3;

  -[VKMapView attributionsForCurrentRegion](self->_mapView, "attributionsForCurrentRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKMapAttribution attributionUrlFromRegionalAttributions:](MKMapAttribution, "attributionUrlFromRegionalAttributions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mapAttributionWithStringAttributes:(id)a3
{
  return -[MKMapView mapAttributionWithStringAttributes:underlineText:](self, "mapAttributionWithStringAttributes:underlineText:", a3, 1);
}

- (id)mapAttributionWithStringAttributes:(id)a3 allowMultiLine:(BOOL)a4
{
  return -[MKMapView mapAttributionWithStringAttributes:underlineText:](self, "mapAttributionWithStringAttributes:underlineText:", a3, 1);
}

- (id)mapAttributionWithStringAttributes:(id)a3 underlineText:(BOOL)a4 linkAttribution:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MKMapAttribution *v9;
  void *v10;
  MKMapAttribution *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = [MKMapAttribution alloc];
  -[VKMapView attributionsForCurrentRegion](self->_mapView, "attributionsForCurrentRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView _currentScreenScale](self, "_currentScreenScale");
  v11 = -[MKMapAttribution initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:](v9, "initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:", v8, v10, v6, v5);

  return v11;
}

- (id)mapAttributionWithStringAttributes:(id)a3 underlineText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MKMapAttribution *v7;
  void *v8;
  MKMapAttribution *v9;

  v4 = a4;
  v6 = a3;
  v7 = [MKMapAttribution alloc];
  -[VKMapView attributionsForCurrentRegion](self->_mapView, "attributionsForCurrentRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView _currentScreenScale](self, "_currentScreenScale");
  v9 = -[MKMapAttribution initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:](v7, "initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:", v6, v8, v4, 0);

  return v9;
}

- (BOOL)_isVectorKitConsoleEnabled
{
  return (*(_QWORD *)&self->_flags >> 39) & 1;
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  __int128 v4;
  _OWORD v5[3];
  uint64_t v6;

  -[MKMapView _updateAppearanceIfNeeded](self, "_updateAppearanceIfNeeded", a3);
  -[MKMapView _updateAttribution](self, "_updateAttribution");
  -[MKMapView _updateEnvironmentLabelText](self, "_updateEnvironmentLabelText");
  v4 = *(_OWORD *)&self->_cartographicConfiguration.projection;
  v5[0] = *(_OWORD *)&self->_cartographicConfiguration.style;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage;
  v6 = *(_QWORD *)&self->_cartographicConfiguration.gridOnly;
  -[MKMapView _setCartographicConfiguration:onInit:animated:](self, "_setCartographicConfiguration:onInit:animated:", v5, 0, 0);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *var1;
  unsigned int var0;
  VKMapView *mapView;
  void *v10;
  id v11;

  var1 = a3.var1;
  var0 = a3.var0;
  if (a3.var0 == (_DWORD)MapKitConfig_VectorKitDebugConsoleEnabled && a3.var1 == off_1EDFB70C8)
    -[MKMapView _setVectorKitConsoleEnabled:](self, "_setVectorKitConsoleEnabled:", GEOConfigGetBOOL());
  if (var0 == *MEMORY[0x1E0D51920] && var1 == *(void **)(MEMORY[0x1E0D51920] + 8))
  {
    -[VKMapView _mapkit_configureFromDefaults](self->_mapView, "_mapkit_configureFromDefaults");
  }
  else if (var0 == (_DWORD)MapKitConfig_MapTextSize && var1 == off_1EDFB6B28)
  {
    mapView = self->_mapView;
    -[MKMapView traitCollection](self, "traitCollection");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView _mapkit_configureLabelSizesForContentSizeCategory:](mapView, "_mapkit_configureLabelSizesForContentSizeCategory:", v10);

  }
}

- (BOOL)showsTraffic
{
  return -[MKMapConfiguration _showsTraffic](self->_preferredConfiguration, "_showsTraffic");
}

- (void)setShowsTraffic:(BOOL)showsTraffic
{
  -[MKMapConfiguration set_showsTraffic:](self->_preferredConfiguration, "set_showsTraffic:", showsTraffic);
}

- (void)_removeCustomFeatureDataSource:(id)a3
{
  -[VKMapView removeCustomFeatureDataSource:](self->_mapView, "removeCustomFeatureDataSource:", a3);
}

- (BOOL)_showsTrafficIncidents
{
  return -[VKMapView trafficIncidentsEnabled](self->_mapView, "trafficIncidentsEnabled");
}

- (void)_setShowsTrafficIncidents:(BOOL)a3
{
  -[VKMapView setTrafficIncidentsEnabled:](self->_mapView, "setTrafficIncidentsEnabled:", a3);
}

- (int64_t)_offlineRegionVisibility
{
  return -[_MKOfflineRegionsOverlayManager visibility](self->_offlineRegionsOverlayManager, "visibility");
}

- (void)_setOfflineRegionVisibility:(int64_t)a3
{
  -[_MKOfflineRegionsOverlayManager setVisibility:](self->_offlineRegionsOverlayManager, "setVisibility:", a3);
}

- (void)_offlineStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  int v7;
  _BOOL8 v8;
  VKMapView *mapView;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "state");
    v7 = v6;
    if (v6 >= 3u)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v10[0] = 67109120;
        v10[1] = v7;
        _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v10, 8u);
      }
      v8 = 0;
    }
    else
    {
      v8 = (v6 & 7) == 2;
    }
    mapView = self->_mapView;
  }
  else
  {
    mapView = self->_mapView;
    v8 = 0;
  }
  -[VKMapView setOfflineMode:](mapView, "setOfflineMode:", v8);

}

- (void)_addInternalOverlay:(id)a3 level:(int64_t)a4 provider:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addInternalOverlay:level:provider:", v9, a4, v8);

}

- (BOOL)_localizeLabels
{
  return -[VKMapView localizeLabels](self->_mapView, "localizeLabels");
}

- (void)_setLocalizeLabels:(BOOL)a3
{
  -[VKMapView setLocalizeLabels:](self->_mapView, "setLocalizeLabels:", a3);
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

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return -[MKMapConfiguration _pointOfInterestFilter](self->_preferredConfiguration, "_pointOfInterestFilter");
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  -[MKMapConfiguration set_pointOfInterestFilter:](self->_preferredConfiguration, "set_pointOfInterestFilter:", pointOfInterestFilter);
}

- (BOOL)showsBuildings
{
  return (*(_QWORD *)&self->_flags >> 33) & 1;
}

- (void)setShowsBuildings:(BOOL)showsBuildings
{
  uint64_t v3;
  uint64_t v5;

  v3 = showsBuildings;
  if (_MKLinkedOnOrAfterReleaseSet(3338) || GEOConfigGetBOOL())
  {
    if (self->_cartographicConfiguration.mapkitUsage == 2)
      v3 = v3;
    else
      v3 = 1;
  }
  v5 = 0x200000000;
  if (!(_DWORD)v3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v5;
  -[VKMapView setShowsBuildings:](self->_mapView, "setShowsBuildings:", v3);
}

- (BOOL)_showsRoadLabels
{
  return -[VKMapView showsRoadLabels](self->_mapView, "showsRoadLabels");
}

- (void)_setShowsRoadLabels:(BOOL)a3
{
  -[VKMapView setShowsRoadLabels:](self->_mapView, "setShowsRoadLabels:", a3);
}

- (BOOL)_showsRoadShields
{
  return -[VKMapView showsRoadShields](self->_mapView, "showsRoadShields");
}

- (void)_setShowsRoadShields:(BOOL)a3
{
  -[VKMapView setShowsRoadShields:](self->_mapView, "setShowsRoadShields:", a3);
}

- (BOOL)_showsPointLabels
{
  return -[VKMapView showsPointLabels](self->_mapView, "showsPointLabels");
}

- (void)_setShowsPointLabels:(BOOL)a3
{
  -[VKMapView setShowsPointLabels:](self->_mapView, "setShowsPointLabels:", a3);
}

- (BOOL)_showsLabels
{
  return -[VKMapView showsLabels](self->_mapView, "showsLabels");
}

- (void)_setShowsLabels:(BOOL)a3
{
  -[VKMapView setShowsLabels:](self->_mapView, "setShowsLabels:", a3);
}

- (BOOL)_showsContourLabels
{
  return -[VKMapView showsContourLabels](self->_mapView, "showsContourLabels");
}

- (void)_setShowsCountourLabels:(BOOL)a3
{
  -[VKMapView setShowsContourLabels:](self->_mapView, "setShowsContourLabels:", a3);
}

- (BOOL)_showsPhysicalFeatureLabels
{
  return -[VKMapView showsPhysicalFeatureLabels](self->_mapView, "showsPhysicalFeatureLabels");
}

- (void)_setShowsPhysicalFeatureLabels:(BOOL)a3
{
  -[VKMapView setShowsPhysicalFeatureLabels:](self->_mapView, "setShowsPhysicalFeatureLabels:", a3);
}

- (BOOL)_showsVenues
{
  return (*(_QWORD *)&self->_flags >> 28) & 1;
}

- (void)_setShowsVenues:(BOOL)a3
{
  uint64_t flags;
  uint64_t v4;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x10000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x10000000;
    if (!a3)
      v4 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFEFFFFFFFLL | v4;
    -[VKMapView setShowsVenues:](self->_mapView, "setShowsVenues:");
  }
}

- (BOOL)isShowingNoDataPlaceholders
{
  return 0;
}

- (BOOL)showsLiveEVData
{
  return -[VKMapView showsLiveEVData](self->_mapView, "showsLiveEVData");
}

- (void)setShowsLiveEVData:(BOOL)a3
{
  -[VKMapView setShowsLiveEVData:](self->_mapView, "setShowsLiveEVData:", a3);
}

- (void)setSupportedEVConnectorTypes:(id)a3
{
  -[VKMapView setSupportedEVConnectorTypes:](self->_mapView, "setSupportedEVConnectorTypes:", a3);
}

- (BOOL)_showsPressedLabelMarkerEffect
{
  return (*(_QWORD *)&self->_flags >> 53) & 1;
}

- (void)_setShowsPressedLabelMarkerEffect:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (UIPanGestureRecognizer)_panningGestureRecognizer
{
  return -[MKMapGestureController panGestureRecognizer](self->_gestureController, "panGestureRecognizer");
}

- (UIPinchGestureRecognizer)_pinchGestureRecognizer
{
  return -[MKMapGestureController pinchGestureRecognizer](self->_gestureController, "pinchGestureRecognizer");
}

- (UIRotationGestureRecognizer)_rotationGestureRecognizer
{
  return -[MKMapGestureController rotationGestureRecognizer](self->_gestureController, "rotationGestureRecognizer");
}

- (UITapGestureRecognizer)_selectingTapGestureRecognizer
{
  return self->_selectingTapGestureRecognizer;
}

- (UITapGestureRecognizer)_nonselectingTapGestureRecognizer
{
  return self->_nonselectingTapGestureRecognizer;
}

- (UILongPressGestureRecognizer)_longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)_doubleTapGestureRecognizer
{
  return -[MKMapGestureController doubleTapGestureRecognizer](self->_gestureController, "doubleTapGestureRecognizer");
}

- (UITapGestureRecognizer)_twoFingerTapGestureRecognizer
{
  return -[MKMapGestureController twoFingerTapGestureRecognizer](self->_gestureController, "twoFingerTapGestureRecognizer");
}

- (UIGestureRecognizer)_oneHandedZoomGestureRecognizer
{
  return -[MKMapGestureController oneHandedZoomGestureRecognizer](self->_gestureController, "oneHandedZoomGestureRecognizer");
}

- (BOOL)_isHandlingNonselectingTap
{
  void *v2;
  BOOL v3;

  -[MKMapView _nonselectingTapGestureRecognizer](self, "_nonselectingTapGestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 3;

  return v3;
}

- (BOOL)rendersInBackground
{
  return -[MKBasicMapView rendersInBackground](self->_basicMapView, "rendersInBackground");
}

- (void)setRendersInBackground:(BOOL)a3
{
  -[MKBasicMapView setRendersInBackground:](self->_basicMapView, "setRendersInBackground:", a3);
}

- (BOOL)_isShowingFlyover
{
  return -[VKMapView isShowingFlyover](self->_mapView, "isShowingFlyover");
}

- (void)setMapType:(MKMapType)mapType
{
  -[MKMapView _setMapType:animated:](self, "_setMapType:animated:", mapType, 1);
  if (mapType)
    -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 7);
}

- (void)_setMapType:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v4;
  void *v6;
  _OWORD v7[3];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v4 = a3;
  if (a3 >= 3 && !_MKLinkedOnOrAfterReleaseSet(1026))
    v4 = 0;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  _MKCartographicConfigurationForMapType(v4, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v8 = v12;
  +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:](MKMapConfiguration, "_mapConfigurationWithCartographicConfiguration:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setInternalStateFromMapConfiguration:", self->_preferredConfiguration);
  -[MKMapView setPreferredConfiguration:](self, "setPreferredConfiguration:", v6);

}

- (void)_setCartographicConfiguration:(id *)a3
{
  __int128 v3;
  _OWORD v4[3];
  uint64_t v5;

  v3 = *(_OWORD *)&a3->var2;
  v4[0] = *(_OWORD *)&a3->var0;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->var4;
  v5 = *(_QWORD *)&a3->var6;
  -[MKMapView _setCartographicConfiguration:animated:](self, "_setCartographicConfiguration:animated:", v4, 0);
}

- (void)_setCartographicConfiguration:(id *)a3 animated:(BOOL)a4
{
  __int128 v5;
  void *v6;
  _OWORD v7[3];
  uint64_t v8;

  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  v8 = *(_QWORD *)&a3->var6;
  +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:](MKMapConfiguration, "_mapConfigurationWithCartographicConfiguration:", v7, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setInternalStateFromMapConfiguration:", self->_preferredConfiguration);
  -[MKMapView setPreferredConfiguration:](self, "setPreferredConfiguration:", v6);

}

- (MKMapFeatureOptions)selectableMapFeatures
{
  return -[MKLabelSelectionFilter mapFeatureOptions](self->_labelSelectionFilter, "mapFeatureOptions");
}

- (void)_setLabelSelectionFilter:(id)a3
{
  -[MKMapView _setLabelSelectionFilter:animated:](self, "_setLabelSelectionFilter:animated:", a3, 0);
}

- (void)_setLabelSelectionFilter:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKLabelSelectionFilter *v6;
  MKLabelSelectionFilter *labelSelectionFilter;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", self->_labelSelectionFilter) & 1) == 0)
  {
    v6 = (MKLabelSelectionFilter *)objc_msgSend(v8, "copy");
    labelSelectionFilter = self->_labelSelectionFilter;
    self->_labelSelectionFilter = v6;

    -[MKLabelSelectionFilter setMapView:](self->_labelSelectionFilter, "setMapView:", self);
    -[VKMapView setLabelSelectionFilter:](self->_mapView, "setLabelSelectionFilter:", self->_labelSelectionFilter);
    -[MKMapView _deselectCurrentFeatureAnnotationIfNeededAnimated:](self, "_deselectCurrentFeatureAnnotationIfNeededAnimated:", v4);
  }

}

- (void)_deselectCurrentFeatureAnnotationIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v3 = a3;
  -[MKMapView selectedAnnotations](self, "selectedAnnotations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[MKLabelSelectionFilter isFeatureAnnotationSelectable:](self->_labelSelectionFilter, "isFeatureAnnotationSelectable:", v7))-[MKMapView deselectAnnotation:animated:](self, "deselectAnnotation:animated:", v7, v3);

    }
  }

}

- (MKMapConfiguration)configuration
{
  return self->_preferredConfiguration;
}

- (void)_updateCartographicConfiguration
{
  -[MKMapView _updateCartographicConfigurationOnInit:](self, "_updateCartographicConfigurationOnInit:", 0);
}

- (void)_setShowsNightMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  MKMapType v10;
  unint64_t v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[MKMapView _showsNightMode](self, "_showsNightMode") != a3)
  {
    MKGetMKMapViewLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (-[MKMapView _showsNightMode](self, "_showsNightMode"))
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      if (v3)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = v8;
      v15 = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "MKMapView: _setShowsNightMode self.showsNightMode : %@ showsNightMode : %@", (uint8_t *)&v15, 0x16u);

    }
    if (!v3 || (v10 = -[MKMapView mapType](self, "mapType"), v10 - 1 >= 4) && v10 != 107)
    {
      v11 = -[MKMapView _mapDisplayStyle](self, "_mapDisplayStyle") & 0xFFFFFFFFFFFFFF00;
      MKGetMKMapViewLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        if (v3)
          v13 = CFSTR("YES");
        v14 = v13;
        v15 = 138412546;
        v16 = v14;
        v17 = 1024;
        LODWORD(v18) = v3;
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_INFO, "MKMapView: _setShowsNightMode showsNightMode %@, setting style.timePeriod %d", (uint8_t *)&v15, 0x12u);

      }
      -[MKMapView _setMapDisplayStyle:](self, "_setMapDisplayStyle:", (v11 | v3) & 0xFFFFFFFFFFFFLL);
    }
  }
}

- (void)_setMapDisplayStyle:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = *(_QWORD *)&a3.var0;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  MKGetMKMapViewLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_INFO, "MKMapView: _setMapDisplayStyle %d", (uint8_t *)v8, 8u);
  }

  v7 = v3 & 0xFFFFFFFFFFFFLL;
  -[VKMapView setMapDisplayStyle:animated:](self->_mapView, "setMapDisplayStyle:animated:", v7, v5);
  -[MKAnnotationContainerView setMapDisplayStyle:](self->_annotationContainer, "setMapDisplayStyle:", v7);
}

- (BOOL)isSuspended
{
  return (*(_QWORD *)&self->_flags >> 8) & 1;
}

- (BOOL)_isInactive
{
  return -[MKBasicMapView inactive](self->_basicMapView, "inactive");
}

- (void)_setInactive:(BOOL)a3
{
  -[MKBasicMapView setInactive:](self->_basicMapView, "setInactive:", a3);
}

- (BOOL)isRegionChanging
{
  _BOOL4 v3;

  if (-[MKMapView _isChangingRegionForGesture](self, "_isChangingRegionForGesture"))
    LOBYTE(v3) = 1;
  else
    return *(_DWORD *)&self->_flags & 1;
  return v3;
}

- (CGPoint)_centerPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat MidX;
  double MidY;
  double v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;

  -[MKMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = v12;
  v24.origin.y = v14;
  v24.size.width = v16;
  v24.size.height = v18;
  MidY = CGRectGetMidY(v24);
  v21 = MidX;
  result.y = MidY;
  result.x = v21;
  return result;
}

- (double)_mapKitZoomLevelForVectorKitTileZoomLevel:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomLevelAdjustmentForTileSize:", 128);
  v6 = v5 + a3;

  return v6;
}

- (double)_vectorKitTileZoomLevelForMapKitZoomLevel:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomLevelAdjustmentForTileSize:", 128);
  v6 = a3 - v5;

  return v6;
}

- (BOOL)_canZoomIn
{
  return -[VKMapView canZoomInForTileSize:](self->_mapView, "canZoomInForTileSize:", 128);
}

- (BOOL)_canZoomOut
{
  return -[VKMapView canZoomOutForTileSize:](self->_mapView, "canZoomOutForTileSize:", 128);
}

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
  uint64_t flags;
  uint64_t v4;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x2000) == 0) ^ scrollEnabled) & 1) == 0)
  {
    v4 = 0x2000;
    if (!scrollEnabled)
      v4 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFFFDFFFLL | v4;
    -[MKMapView _updateScrollingAndGestures](self, "_updateScrollingAndGestures");
  }
}

- (void)setZoomEnabled:(BOOL)zoomEnabled
{
  uint64_t flags;
  uint64_t v4;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x100000) == 0) ^ zoomEnabled) & 1) == 0)
  {
    v4 = 0x100000;
    if (!zoomEnabled)
      v4 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFEFFFFFLL | v4;
    -[MKMapView _updateScrollingAndGestures](self, "_updateScrollingAndGestures");
  }
}

- (void)setRotateEnabled:(BOOL)rotateEnabled
{
  uint64_t flags;
  uint64_t v4;

  flags = (uint64_t)self->_flags;
  if (((((int)flags >= 0) ^ rotateEnabled) & 1) == 0)
  {
    v4 = 0x80000000;
    if (!rotateEnabled)
      v4 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFF7FFFFFFFLL | v4;
    -[MKMapView _updateScrollingAndGestures](self, "_updateScrollingAndGestures");
  }
}

- (void)setPitchEnabled:(BOOL)pitchEnabled
{
  _BOOL4 v3;
  void *v5;
  int v6;
  BOOL v7;
  $5D7CD00554919180459D56D22149BB92 *p_flags;
  _BOOL4 v9;
  uint64_t v10;
  char v11;
  _BOOL8 v12;
  _BOOL8 v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  char v16;
  MKMapViewDelegate *v17;
  MKMapViewDelegate *v18;

  v3 = pitchEnabled;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsPitchAPI");

  if (v6)
    v7 = 1;
  else
    v7 = !v3;
  if (v7)
  {
    p_flags = &self->_flags;
    if (((((*(_QWORD *)&self->_flags & 0x100000000) == 0) ^ v3) & 1) != 0)
      return;
    v9 = -[MKMapView _canEnter3DMode](self, "_canEnter3DMode");
    v10 = 0x100000000;
    if (!v3)
      v10 = 0;
    goto LABEL_14;
  }
  if (qword_1EDFB79A0 != -1)
    dispatch_once(&qword_1EDFB79A0, &__block_literal_global_220);
  p_flags = &self->_flags;
  if ((*(_QWORD *)&self->_flags & 0x100000000) != 0)
  {
    v9 = -[MKMapView _canEnter3DMode](self, "_canEnter3DMode");
    v10 = 0;
LABEL_14:
    v11 = *((_BYTE *)p_flags + 8);
    *(_QWORD *)p_flags = *(_QWORD *)p_flags & 0xFFFFFFFEFFFFFFFFLL | v10;
    *((_BYTE *)p_flags + 8) = v11;
    -[MKMapView _updateScrollingAndGestures](self, "_updateScrollingAndGestures");
    v12 = -[MKMapView _canEnter3DMode](self, "_canEnter3DMode");
    if (v9 != v12)
    {
      v13 = v12;
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v14 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v17 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v17 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;
        -[MKMapViewDelegate mapView:canEnter3DModeDidChange:](v17, "mapView:canEnter3DModeDidChange:", self, v13);

      }
    }
  }
}

void __29__MKMapView_setPitchEnabled___block_invoke()
{
  NSLog(CFSTR("MKMapView pitch cannot be enabled on this device."));
}

- (BOOL)_panWithMomentum
{
  return -[MKMapGestureController panWithMomentum](self->_gestureController, "panWithMomentum");
}

- (void)_setPanWithMomentum:(BOOL)a3
{
  -[MKMapGestureController setPanWithMomentum:](self->_gestureController, "setPanWithMomentum:", a3);
}

- (void)_setTracePlaybackSpeedMultiplier:(double)a3
{
  id v4;

  -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTracePlaybackSpeedMultiplier:", a3);

}

- (BOOL)isUserLocationVisible
{
  return -[MKMapView _isUserLocationInView:](self, "_isUserLocationInView:", 0);
}

- (BOOL)hasRenderedSomething
{
  return (*(_QWORD *)&self->_flags >> 4) & 1;
}

- (BOOL)canRotateForHeading
{
  _BOOL8 v3;

  LODWORD(v3) = -[MKLocationManager isHeadingServicesAvailable](self->_locationManager, "isHeadingServicesAvailable");
  if (v3)
    return (*(_QWORD *)&self->_flags >> 12) & 1;
  return v3;
}

- (BOOL)isCurrentlyRotated
{
  _BOOL4 v3;
  double v4;

  v3 = -[MKMapView canRotateForHeading](self, "canRotateForHeading");
  if (v3)
  {
    -[MKMapCamera heading](self->_camera, "heading");
    LOBYTE(v3) = v4 != 0.0;
  }
  return v3;
}

- (void)setUserTrackingMode:(MKUserTrackingMode)userTrackingMode
{
  -[MKMapView setUserTrackingMode:animated:](self, "setUserTrackingMode:animated:", userTrackingMode, 0);
}

- (void)setUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
  _BOOL8 v4;
  _QWORD v7[4];
  id v8[2];
  id location;

  v4 = animated;
  if (mode == MKUserTrackingModeNone && self->_userTrackingMode == 2)
    -[MKMapView _snapToTrueNorthAndCallBack:](self, "_snapToTrueNorthAndCallBack:", 0);
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__MKMapView_setUserTrackingMode_animated___block_invoke;
    v7[3] = &unk_1E20D85A0;
    objc_copyWeak(v8, &location);
    v8[1] = (id)mode;
    -[MKMapView _addDependentAuxiliaryBlock:](self, "_addDependentAuxiliaryBlock:", v7);
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", mode, v4, 0);
  }
}

void __42__MKMapView_setUserTrackingMode_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setUserTrackingMode:animated:", *(_QWORD *)(a1 + 40), 0);

}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  int64_t v7;
  int64_t userTrackingMode;
  _BOOL8 v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  double *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  VKMapView *mapView;
  void *v25;
  VKMapView *v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v30;
  VKMapView *v31;
  id v32;
  id v33;
  void *v34;
  char v35;
  MKMapViewDelegate *v36;
  MKMapViewDelegate *v37;
  void *v38;
  void *v39;
  void *v40;
  MKLocationManager *locationManager;
  BOOL v42;
  id v43;
  MKMapViewDelegate *v44;
  MKMapViewDelegate *v45;
  char v46;
  MKMapViewDelegate *v47;
  MKMapViewDelegate *v48;
  _BOOL4 v49;
  id v50;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (a3 == 2)
  {
    if (-[MKLocationManager isHeadingServicesAvailable](self->_locationManager, "isHeadingServicesAvailable")
      && -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"))
    {
      v7 = 2;
    }
    else
    {
      v7 = 1;
    }
  }
  userTrackingMode = self->_userTrackingMode;
  if (v7 != userTrackingMode)
  {
    if (v7)
    {
      -[MKMapGestureController stopDynamicAnimations](self->_gestureController, "stopDynamicAnimations");
      v10 = -[MKMapView hasUserLocation](self, "hasUserLocation");
    }
    else
    {
      v10 = 0;
    }
    -[VKMapView setStaysCenteredDuringPinch:](self->_mapView, "setStaysCenteredDuringPinch:", v10);
    self->_userTrackingMode = v7;
    -[MKMapView userLocationView](self, "userLocationView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v5;
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
LABEL_16:

        objc_msgSend(v13, "setForcesConeIndicator:", v7 == 2);
        -[MKMapView userLocationView](self, "userLocationView");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = 0;
LABEL_22:

            objc_msgSend(v16, "_setForceHeadingUp:", v7 == 2);
            -[MKMapView _updateShowHeadingIndicator](self, "_updateShowHeadingIndicator");
            v17 = (double *)MEMORY[0x1E0C9E498];
            if (!v7)
              v17 = (double *)MEMORY[0x1E0C9E490];
            -[MKLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", *v17);
            if (!v7 || userTrackingMode)
            {
              if (!v7 && userTrackingMode)
              {
                -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setBehavior:", 3);

                -[VKMapView setDisplayRate:](self->_mapView, "setDisplayRate:", self->_originalLoopRate);
                self->_preGesturingLoopRate = self->_originalLoopRate;
              }
            }
            else
            {
              -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setBehavior:", 2);

              self->_originalLoopRate = -[VKMapView displayRate](self->_mapView, "displayRate");
              -[VKMapView setDisplayRate:](self->_mapView, "setDisplayRate:", 0);
            }
            v20 = -1.0;
            if (v6 && objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
            {
              objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationDuration");
              v20 = v21;
              objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationTimingFunction");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              VKAnimationCurveForCAMediaTimingFunction();
              v23 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v23 = 0;
            }
            if (v7 != 2 || userTrackingMode == 2)
            {
              if (!v7)
              {
                if (userTrackingMode)
                  -[VKMapView stopTrackingAnnotation](self->_mapView, "stopTrackingAnnotation");
                goto LABEL_54;
              }
            }
            else if (-[MKMapView hasUserLocation](self, "hasUserLocation"))
            {
              mapView = self->_mapView;
              -[MKMapView userLocation](self, "userLocation");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = mapView;
              v27 = v25;
              v28 = 1;
LABEL_49:
              -[VKMapView startTrackingAnnotation:trackHeading:animated:duration:timingFunction:](v26, "startTrackingAnnotation:trackHeading:animated:duration:timingFunction:", v27, v28, v6, v23, v20);

              goto LABEL_54;
            }
            v30 = v7 == 2 || userTrackingMode != 2;
            if ((!userTrackingMode || !v30) && -[MKMapView hasUserLocation](self, "hasUserLocation"))
            {
              v31 = self->_mapView;
              -[MKMapView userLocation](self, "userLocation");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v31;
              v27 = v25;
              v28 = 0;
              goto LABEL_49;
            }
            if (!-[MKMapView hasUserLocation](self, "hasUserLocation"))
              self->_userTrackingModeShouldAnimate = v6;
LABEL_54:
            -[MKMapView userLocationView](self, "userLocationView");
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v33 = v32;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v34 = 0;
                goto LABEL_60;
              }
              objc_msgSend(v32, "_mkUserLocationView");
              v33 = (id)objc_claimAutoreleasedReturnValue();
            }
            v34 = v33;
LABEL_60:

            objc_msgSend(v34, "setShouldDisplayInaccurateHeading:", v7 == 2);
            v35 = *((_BYTE *)&self->_flags + 8);
            if ((v35 & 1) != 0)
            {
              if (qword_1EDFB79F8 != -1)
                dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
              if (byte_1EDFB7994)
              {
                v36 = self->_unsafeDelegate;
              }
              else
              {
                -[MKMapView _safeDelegate](self, "_safeDelegate");
                v36 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
              }
              v37 = v36;
              -[MKMapViewDelegate mapView:didChangeUserTrackingMode:animated:fromTrackingButton:](v36, "mapView:didChangeUserTrackingMode:animated:fromTrackingButton:", self, self->_userTrackingMode, v6, v49);

              v35 = *((_BYTE *)&self->_flags + 8);
            }
            if ((v35 & 2) != 0)
            {
              -[MKMapView delegate](self, "delegate");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "mapView:didChangeUserTrackingMode:animated:", self, self->_userTrackingMode, v6);

            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "postNotificationName:object:", CFSTR("MKMapViewUserTrackingModeDidChangeNotification"), self);

            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "postNotificationName:object:", CFSTR("MKUserTrackingViewModeDidChangeNotification"), self);

            -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
            if (self->_userTrackingMode)
            {
              if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
              {
                locationManager = self->_locationManager;
                v50 = 0;
                v42 = -[MKLocationManager isLocationServicesPossiblyAvailable:](locationManager, "isLocationServicesPossiblyAvailable:", &v50);
                v43 = v50;
                if (!v42)
                {
                  if (qword_1EDFB79F8 != -1)
                    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
                  if (byte_1EDFB7994)
                  {
                    v44 = self->_unsafeDelegate;
                  }
                  else
                  {
                    -[MKMapView _safeDelegate](self, "_safeDelegate");
                    v44 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
                  }
                  v45 = v44;
                  v46 = objc_opt_respondsToSelector();

                  if ((v46 & 1) != 0)
                  {
                    if (qword_1EDFB79F8 != -1)
                      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
                    if (byte_1EDFB7994)
                    {
                      v47 = self->_unsafeDelegate;
                    }
                    else
                    {
                      -[MKMapView _safeDelegate](self, "_safeDelegate");
                      v47 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
                    }
                    v48 = v47;
                    -[MKMapViewDelegate mapView:didFailToLocateUserWithError:](v47, "mapView:didFailToLocateUserWithError:", self, v43);

                  }
                }

              }
              else
              {
                -[MKMapView setShowsUserLocation:](self, "setShowsUserLocation:", 1);
              }
            }

            return;
          }
          objc_msgSend(v14, "_mkUserLocationView");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;
        goto LABEL_22;
      }
      objc_msgSend(v11, "_mkUserLocationView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    goto LABEL_16;
  }
}

- (BOOL)postsMapViewInitialRenderingNotification
{
  return 1;
}

- (BOOL)_showHeadingIndicatorForStepping
{
  return (*(_QWORD *)&self->_flags >> 17) & 1;
}

- (void)_setShowHeadingIndicatorForStepping:(BOOL)a3
{
  uint64_t flags;
  uint64_t v4;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x20000;
    if (!a3)
      v4 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFFDFFFFLL | v4;
    -[MKMapView _updateShowHeadingIndicator](self, "_updateShowHeadingIndicator");
  }
}

- (id)_annotationAtPoint:(CGPoint)a3 avoidCurrent:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", self->_annotationContainer, a3.x, a3.y);
  -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)calloutViewContainsPoint:(CGPoint)a3
{
  -[MKAnnotationContainerView convertPoint:fromView:](self->_annotationContainer, "convertPoint:fromView:", self, a3.x, a3.y);
  return -[MKAnnotationContainerView calloutContainsPoint:](self->_annotationContainer, "calloutContainsPoint:");
}

- (BOOL)accessoryViewContainsPoint:(CGPoint)a3
{
  -[MKAnnotationContainerView convertPoint:fromView:](self->_annotationContainer, "convertPoint:fromView:", self, a3.x, a3.y);
  return -[MKAnnotationContainerView accessoryContainsPoint:](self->_annotationContainer, "accessoryContainsPoint:");
}

- (void)_handleSelectionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  MKAnnotationManager *annotationManager;
  void *v26;
  int v27;
  MKAnnotationManager *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  MKMapViewDelegate *v34;
  MKMapViewDelegate *v35;
  char v36;
  MKMapViewDelegate *v37;
  MKMapViewDelegate *v38;
  int v39;
  id v40;
  CGPoint v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;

  y = a3.y;
  x = a3.x;
  if (-[VKMapView enableDebugLabelHighlighting](self->_mapView, "enableDebugLabelHighlighting"))
  {
    -[VKMapView debugHighlightLabelAtPoint:](self->_mapView, "debugHighlightLabelAtPoint:", x, y);
    return;
  }
  -[MKAttributionLabel frame](self->_attributionLabel, "frame");
  v41.x = x;
  v41.y = y;
  if (!CGRectContainsPoint(v43, v41)
    && ((-[UIImageView frame](self->_attributionBadgeView, "frame"), v42.x = x,
                                                                     v42.y = y,
                                                                     !CGRectContainsPoint(v44, v42))
     || !self->_attributionBadgeClickable)
    || (-[MKMapView urlForMapAttribution](self, "urlForMapAttribution"), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", self->_annotationContainer, x, y);
    v9 = v8;
    v11 = v10;
    -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "_selectionPriority");
      if (v14 >= 250.0)
      {
        v15 = 0;
        goto LABEL_22;
      }
    }
    -[VKMapView labelMarkerForSelectionAtPoint:selectableLabelsOnly:](self->_mapView, "labelMarkerForSelectionAtPoint:selectableLabelsOnly:", (*(_QWORD *)&self->_flags & 0x4000000000) == 0, v9, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "featureAnnotation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      objc_msgSend(v17, "annotationView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEnabled");

      if (v19)
      {
        objc_msgSend(v17, "annotationView");
        v20 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v20;
      }

LABEL_14:
      v15 = 0;
      v21 = 0;
      if (!v13)
        goto LABEL_15;
      goto LABEL_22;
    }
    if (!v15)
      goto LABEL_27;
    if ((*(_QWORD *)&self->_flags & 0x6000000000) != 0)
    {
      v27 = 1;
      goto LABEL_28;
    }
    if (v16)
    {
      -[_MKCustomFeatureStore allAnnotations](self->_annotationsCustomFeatureStore, "allAnnotations");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "featureAnnotation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v30, "containsObject:", v31);

    }
    else
    {
LABEL_27:
      v27 = 0;
    }
LABEL_28:
    v32 = -[MKLabelSelectionFilter selectionEnabled](self->_labelSelectionFilter, "selectionEnabled");
    if (v15 && v32)
    {
      objc_msgSend(v15, "featureAnnotation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {

        if ((v27 & 1) == 0)
          goto LABEL_14;
      }
      else if (((-[MKLabelSelectionFilter isLabelSelectable:](self->_labelSelectionFilter, "isLabelSelectable:", v15) | v27) & 1) == 0)
      {
        goto LABEL_14;
      }
    }
    else if (!v27)
    {
      goto LABEL_14;
    }
    if (v13 && v15)
    {

      goto LABEL_39;
    }

    if (!v13)
    {
      if (!v15)
      {
        v21 = 0;
        goto LABEL_15;
      }
LABEL_39:
      v40 = v15;
      if ((objc_msgSend(v40, "isSelectable") & 1) != 0 || (*(_QWORD *)&self->_flags & 0x4000000000) != 0)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v34 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v34 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v35 = v34;
        v36 = objc_opt_respondsToSelector();

        if ((v36 & 1) == 0)
          goto LABEL_58;
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v37 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v37 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v38 = v37;
        v39 = -[MKMapViewDelegate mapView:shouldSelectLabelMarker:](v37, "mapView:shouldSelectLabelMarker:", self, v40);

        if (v39)
        {
LABEL_58:
          if (objc_msgSend(v40, "selectionType") == 1)
            -[MKMapView _startFlyoverTourAnimation:duration:completion:](self, "_startFlyoverTourAnimation:duration:completion:", objc_msgSend(v40, "animationID"), 0, 0.0);
          else
            -[MKMapView _selectLabelMarker:animated:](self, "_selectLabelMarker:animated:", v40, 1);
          v13 = v40;
          goto LABEL_23;
        }
      }

      v21 = v40;
LABEL_15:
      v40 = v21;
      -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v22;
      if (v22)
      {
        objc_msgSend(v22, "viewRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        annotationManager = self->_annotationManager;
        if (v23)
        {
          objc_msgSend(v23, "annotation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKAnnotationManager deselectAnnotation:animated:](annotationManager, "deselectAnnotation:animated:", v26, 1);

        }
        else
        {
          -[MKAnnotationManager deselectAnnotation:animated:](annotationManager, "deselectAnnotation:animated:", v13, 1);
        }

      }
      goto LABEL_23;
    }
LABEL_22:
    v28 = self->_annotationManager;
    objc_msgSend(v13, "annotation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationManager selectAnnotation:animated:](v28, "selectAnnotation:animated:", v29, 1);

    v40 = v15;
LABEL_23:

    goto LABEL_24;
  }
  v40 = (id)v6;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openURL:completionHandler:", v40, 0);

LABEL_24:
}

- (id)_debugConsoleAdditionalInfoProvider
{
  return (id)MEMORY[0x18D778DB8](self->_debugConsoleAdditionalInfoProvider, a2);
}

- (MKDebugLocationConsole)_debugConsole
{
  return self->_debugLocationConsole;
}

- (void)_setDebugConsoleAdditionalInfoProvider:(id)a3
{
  void *v4;
  id debugConsoleAdditionalInfoProvider;

  if (self->_debugConsoleAdditionalInfoProvider != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    debugConsoleAdditionalInfoProvider = self->_debugConsoleAdditionalInfoProvider;
    self->_debugConsoleAdditionalInfoProvider = v4;

  }
}

- (void)_updateEnvironmentLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if ((*(_QWORD *)&self->_flags & 0x800000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeTileGroup");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %i"), v5, objc_msgSend(v8, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MKMapView _isUsingDevResourceStyleSheet](self, "_isUsingDevResourceStyleSheet"))
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR("- DevResource Style Sheet"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    -[_MKEnvironmentLabel setText:](self->_debugCurrentEnvironmentLabel, "setText:", v6);
    -[_MKEnvironmentLabel sizeToFit](self->_debugCurrentEnvironmentLabel, "sizeToFit");
    -[MKMapView _currentEnvironmentNameFrame](self, "_currentEnvironmentNameFrame");
    -[_MKEnvironmentLabel setFrame:](self->_debugCurrentEnvironmentLabel, "setFrame:");

  }
}

- (BOOL)_isUsingDevResourceStyleSheet
{
  return -[VKMapView stylesheetIsDevResource](self->_mapView, "stylesheetIsDevResource");
}

- (BOOL)_showsCurrentEnvironmentName
{
  return (*(_QWORD *)&self->_flags >> 47) & 1;
}

- (void)_setShowsCurrentEnvironmentName:(BOOL)a3
{
  uint64_t flags;
  uint64_t v5;
  _MKEnvironmentLabel *v6;
  _MKEnvironmentLabel *v7;
  _MKEnvironmentLabel *debugCurrentEnvironmentLabel;
  _MKEnvironmentLabel *v9;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x800000000000) == 0) ^ a3) & 1) == 0)
  {
    v5 = 0x800000000000;
    if (!a3)
      v5 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFF7FFFFFFFFFFFLL | v5;
    if (a3)
    {
      v6 = [_MKEnvironmentLabel alloc];
      v7 = -[_MKEnvironmentLabel initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      debugCurrentEnvironmentLabel = self->_debugCurrentEnvironmentLabel;
      self->_debugCurrentEnvironmentLabel = v7;

      -[UIView addSubview:](self->_contentView, "addSubview:", self->_debugCurrentEnvironmentLabel);
      -[MKMapView _updateEnvironmentLabelText](self, "_updateEnvironmentLabelText");
    }
    else
    {
      -[_MKEnvironmentLabel removeFromSuperview](self->_debugCurrentEnvironmentLabel, "removeFromSuperview");
      v9 = self->_debugCurrentEnvironmentLabel;
      self->_debugCurrentEnvironmentLabel = 0;

    }
  }
}

- (CGRect)_currentEnvironmentLabelFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[_MKEnvironmentLabel frame](self->_debugCurrentEnvironmentLabel, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)toggleLocationConsole:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[MKMapView setLocationConsoleEnabled:](self, "setLocationConsoleEnabled:", -[MKMapView isLocationConsoleEnabled](self, "isLocationConsoleEnabled") ^ 1);
}

- (BOOL)_isAnimating
{
  return (~*(_DWORD *)&self->_flags & 0x801) == 0;
}

- (void)_willStartZoom:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  v5 = 0x400000;
  if (a3)
    v5 = 6291456;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFF9FFFFFLL | v5;
  -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 0);
  if (v3)
    -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
}

- (void)_didEndZoom
{
  uint64_t flags;
  id v4;
  void *v5;
  id v6;

  flags = (uint64_t)self->_flags;
  *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFF9FFFFFLL;
  -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
  -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 1);
  if ((flags & 0x200000) != 0)
  {
    *(_QWORD *)&self->_flags &= ~0x400uLL;
    -[MKMapView userLocationView](self, "userLocationView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v6, "_mkUserLocationView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
LABEL_8:

    objc_msgSend(v5, "setZoomDirection:", 0);
  }
}

- (BOOL)_isZooming
{
  return (*(_QWORD *)&self->_flags >> 22) & 1;
}

- (BOOL)_userInteractionPausesLocationUpdates
{
  return (*(_QWORD *)&self->_flags >> 42) & 1;
}

- (void)_setUserInteractionPausesLocationUpdates:(BOOL)a3
{
  uint64_t flags;
  _BOOL4 v4;
  uint64_t v6;
  int v7;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x40000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    v6 = 0x40000000000;
    if (!a3)
      v6 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFBFFFFFFFFFFLL | v6;
    v7 = -[VKMapView isGesturing](self->_mapView, "isGesturing");
    if (v4)
    {
      if (v7)
        -[MKMapView pauseUserLocationUpdates](self, "pauseUserLocationUpdates");
    }
    else if (v7)
    {
      -[MKMapView resumeUserLocationUpdates](self, "resumeUserLocationUpdates");
    }
  }
}

- (BOOL)_isLocationPulseEnabled
{
  return (*(_QWORD *)&self->_flags >> 43) & 1;
}

- (void)_setLocationPulseEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v3;
  -[MKMapView _updateShouldDisplayEffects](self, "_updateShouldDisplayEffects");
}

- (BOOL)_shouldSplitRouteLine
{
  return (*(_QWORD *)&self->_flags >> 44) & 1;
}

- (void)_setShouldSplitRouteLine:(BOOL)a3
{
  uint64_t v4;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  void *v9;
  VKMapView *mapView;
  void *v11;
  id v12;

  v4 = 0x100000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  if (!a3)
    goto LABEL_20;
  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v5 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_20:
    -[VKMapView setRouteLineSplitAnnotation:](self->_mapView, "setRouteLineSplitAnnotation:", 0);
    return;
  }
  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v7 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[MKMapViewDelegate mapViewCurrentRouteMatch:](v7, "mapViewCurrentRouteMatch:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_20;
  mapView = self->_mapView;
  -[MKMapView userLocationView](self, "userLocationView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v12, "_userLocationProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  -[VKMapView setRouteLineSplitAnnotation:](mapView, "setRouteLineSplitAnnotation:", v11);
}

- (BOOL)_shouldAnimatePositionWithRouteMatch
{
  return (*(_QWORD *)&self->_flags >> 45) & 1;
}

- (void)_setShouldAnimatePositionWithRouteMatch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)_shouldLoadFallbackTiles
{
  return (*(_QWORD *)&self->_flags >> 54) & 1;
}

- (void)_setShouldLoadFallbackTiles:(BOOL)a3
{
  uint64_t flags;
  uint64_t v4;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x40000000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x40000000000000;
    if (!a3)
      v4 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFBFFFFFFFFFFFFFLL | v4;
    -[MKMapView _updateFallbackTileLoading](self, "_updateFallbackTileLoading");
  }
}

- (void)_annotationViewDragStateChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  char v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  void *v14;
  void *v15;
  MKAnnotationManager *annotationManager;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("oldValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("newValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v9 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v12 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v20, "object");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapViewDelegate mapView:annotationView:didChangeDragState:fromOldState:](v13, "mapView:annotationView:didChangeDragState:fromOldState:", self, v14, v8, v6);

  }
  if (!v8)
  {
    if ((*(_QWORD *)&self->_flags & 4) == 0)
    {
      objc_msgSend(v20, "object");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      annotationManager = self->_annotationManager;
      objc_msgSend(v15, "annotation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAnnotationManager selectAnnotation:animated:](annotationManager, "selectAnnotation:animated:", v17, 1);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "object");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObserver:name:object:", self, 0x1E20E6500, v19);

  }
}

- (void)setLabelTextSize:(int64_t)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = a3 != 2;
  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 1)
    v8 = 2;
  else
    v8 = v5;
  if (a3 == 1)
    v9 = 5;
  else
    v9 = 4;
  objc_msgSend(v6, "setLabelScaleFactor:", v8);

  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShieldSize:", v9);

}

- (int64_t)labelTextSize
{
  void *v2;
  unint64_t v3;
  int64_t v4;

  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "labelScaleFactor");
  if (v3 > 5)
    v4 = 0;
  else
    v4 = qword_18B2A93F0[v3];

  return v4;
}

- (BOOL)isWithinHikingBoundary
{
  void *v2;
  char v3;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCameraInHikingBoundary");

  return v3;
}

- (BOOL)isWithinHikingBufferRegion
{
  void *v2;
  char v3;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCameraInHikingBufferRegion");

  return v3;
}

- (void)checkIfCoordinate:(CLLocationCoordinate2D)a3 isInHikingContextualRegionWithCompletionHandler:(id)a4
{
  void *v5;
  id locationIsInHikingContextCallback;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v5 = (void *)MEMORY[0x18D778DB8](a4, a2);
  locationIsInHikingContextCallback = self->_locationIsInHikingContextCallback;
  self->_locationIsInHikingContextCallback = v5;

  VKLocationCoordinate2DMake();
  v8 = v7;
  v10 = v9;
  -[MKMapView _mapLayer](self, "_mapLayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestHikingContextualRegionDoesIntersectForLocation:", v8, v10);

}

- (id)beginStoppingEffects
{
  -[MKMapView _stopEffects](self, "_stopEffects");
  return -[_MKMapViewSuspendedEffectsToken initWithOwner:]([_MKMapViewSuspendedEffectsToken alloc], "initWithOwner:", self);
}

- (NSTimer)_startEffectsTimer
{
  return self->_startEffectsTimer;
}

- (void)set_startEffectsTimer:(id)a3
{
  NSTimer *v5;
  NSTimer **p_startEffectsTimer;
  NSTimer *v7;

  v5 = (NSTimer *)a3;
  p_startEffectsTimer = &self->_startEffectsTimer;
  if (*p_startEffectsTimer != v5)
  {
    v7 = v5;
    -[NSTimer invalidate](*p_startEffectsTimer, "invalidate");
    objc_storeStrong((id *)p_startEffectsTimer, a3);
    v5 = v7;
  }

}

- (void)showAnnotations:(NSArray *)annotations animated:(BOOL)animated
{
  _BOOL8 v4;
  uint64_t v6;
  NSArray *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CLLocationDegrees v25;
  CLLocationDegrees v26;
  CLLocationCoordinate2D v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  NSArray *v61;
  MKMapRect v62;
  MKMapRect v63;

  v4 = animated;
  v61 = annotations;
  v6 = -[NSArray count](v61, "count");
  v7 = v61;
  if (v6)
  {
    -[MKMapView addAnnotations:](self, "addAnnotations:", v61);
    objc_msgSend(MEMORY[0x1E0D27208], "_mapkit_mapRegionEnclosingAnnotations:", v61);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOMapRectForMapRegion();
    v12 = v9;
    v13 = v10;
    v15 = v14;
    v16 = v11;
    if (v14 == 0.0 || v11 == 0.0)
    {
      MKCoordinateForMapPoint(*(MKMapPoint *)&v9);
      GEOMapPointsPerMeterAtLatitude();
      v18 = v12 == INFINITY && v13 == INFINITY;
      v19 = v17 * -100.0;
      v20 = v12 + v19;
      v21 = v13 + v19;
      v22 = v15 - v19 * 2.0;
      v23 = v16 - v19 * 2.0;
      if (v18)
      {
        v13 = INFINITY;
      }
      else
      {
        v16 = v23;
        v15 = v22;
        v13 = v21;
      }
      if (v18)
        v12 = INFINITY;
      else
        v12 = v20;
    }
    objc_msgSend(v8, "centerLat");
    v25 = v24;
    objc_msgSend(v8, "centerLng");
    v27 = CLLocationCoordinate2DMake(v25, v26);
    -[MKMapView cameraBoundary](self, "cameraBoundary");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v13;
    v30 = v15;
    v31 = v16;
    v32 = v12;
    if (v28)
    {
      v33 = (void *)v28;
      -[MKMapView cameraBoundary](self, "cameraBoundary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "_containsCoordinate:", v27.latitude, v27.longitude);

      v29 = v13;
      v30 = v15;
      v31 = v16;
      v32 = v12;
      if ((v35 & 1) == 0)
      {
        -[MKMapView cameraBoundary](self, "cameraBoundary");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "_clampedCoordinateForCoordinate:", v27.latitude, v27.longitude);
        v38 = v37;
        v40 = v39;

        v41 = MKTilePointForCoordinate(v38, v40, 21.0);
        v43 = vabdd_f64(v41, v12);
        v44 = vabdd_f64(v41, v15 + v12);
        if (v43 <= v44)
          v43 = v44;
        v45 = vabdd_f64(v42, v13);
        v46 = vabdd_f64(v42, v16 + v13);
        if (v45 <= v46)
          v45 = v46;
        v47 = v43 + v43;
        if (v47 <= v15)
          v30 = v15;
        else
          v30 = v47;
        if (v45 + v45 <= v16)
          v31 = v16;
        else
          v31 = v45 + v45;
        v32 = v41 - v30 * 0.5;
        v29 = v42 - v31 * 0.5;
      }
    }
    -[MKAnnotationContainerView accessoryPadding](self->_annotationContainer, "accessoryPadding");
    v58 = v49;
    v59 = v48;
    v57 = v50;
    v60 = v51;
    -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", v32, v29, v30, v31, v48, v49, v50, v51);
    v63.origin.x = v12;
    v63.origin.y = v13;
    v63.size.width = v15;
    v63.size.height = v16;
    v52 = MKMapRectContainsRect(v62, v63);
    if (v52)
      v53 = v32;
    else
      v53 = v12;
    if (v52)
      v54 = v29;
    else
      v54 = v13;
    if (v52)
      v55 = v30;
    else
      v55 = v15;
    if (v52)
      v56 = v31;
    else
      v56 = v16;
    -[MKMapView setVisibleMapRect:edgePadding:animated:](self, "setVisibleMapRect:edgePadding:animated:", v4, v53, v54, v55, v56, v59, v58, v57, v60);
    -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 11);

    v7 = v61;
  }

}

- (void)_fixUserLocationFromPresentationValue
{
  void *v3;
  void *v4;
  MKAnnotationContainerView *annotationContainer;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  MKUserLocation *userLocation;
  MKMapView *v18;
  MKUserLocation *v19;
  MKUserLocation *v20;
  MKUserLocation *v21;
  id v22;

  -[MKMapView userLocationView](self, "userLocationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    annotationContainer = self->_annotationContainer;
    -[MKMapView userLocationView](self, "userLocationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationContainerView coordinateForAnnotationView:](annotationContainer, "coordinateForAnnotationView:", v6);
    v8 = v7;
    v10 = v9;

    if (v10 >= -180.0 && v10 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
    {
      -[MKMapView userLocation](self, "userLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "location");
      v22 = (id)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v22, "horizontalAccuracy");
      v14 = v13;
      objc_msgSend(v22, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v15, v8, v10, 0.0, v14, 0.0);

      userLocation = self->_userLocation;
      if (!userLocation)
      {
        v18 = self;
        v19 = objc_alloc_init(MKUserLocation);
        v20 = v18->_userLocation;
        v18->_userLocation = v19;

        userLocation = v18->_userLocation;
      }
      v21 = userLocation;
      -[MKUserLocation setFixedLocation:](v21, "setFixedLocation:", v16);

    }
  }
}

- (int)_viewIndexForSubview:(id)a3
{
  MKAnnotationContainerView *v4;
  int v5;

  v4 = (MKAnnotationContainerView *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 2;
    }
    else if (self->_annotationContainer == v4)
    {
      v5 = 3;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)_insertSubview:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[MKMapView _viewIndexForSubview:](self, "_viewIndexForSubview:", v4);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIView subviews](self->_scrollContainerView, "subviews", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (-[MKMapView _viewIndexForSubview:](self, "_viewIndexForSubview:", v12) > v6)
          {
            -[UIView insertSubview:belowSubview:](self->_scrollContainerView, "insertSubview:belowSubview:", v4, v12);

            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }

    -[UIView addSubview:](self->_scrollContainerView, "addSubview:", v4);
  }
LABEL_12:

}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MKMapView;
  -[MKMapView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_contentView)
    objc_msgSend(v4, "removeObject:");
  if (self->_attributionLabel)
    objc_msgSend(v4, "removeObject:");
  if (self->_compassView)
    objc_msgSend(v4, "removeObject:");
  if (self->_controlStackView)
    objc_msgSend(v4, "removeObject:");

}

- (void)resumeUserLocationUpdates
{
  -[MKMapView _resumeUserLocationUpdates:](self, "_resumeUserLocationUpdates:", 1);
}

- (void)_selectUserLocationTypeWithDeltaZoomLevel:(double)a3
{
  if (a3 >= 3.0)
    -[MKMapView _clearFixedUserLocation](self, "_clearFixedUserLocation");
  else
    -[MKMapView _fixUserLocationFromPresentationValue](self, "_fixUserLocationFromPresentationValue");
}

uint64_t __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "stopSuppressingUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "updateAnnotationViewsForReason:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "suppressUpdates");
}

uint64_t __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "stopSuppressingUpdates");
}

- (id)_labelMarkersInCurrentViewport
{
  void *v2;
  void *v3;

  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelMarkers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_labelMarkersInCurrentViewportForType:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MKMapView vk_mapLayer](self, "vk_mapLayer", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelMarkers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "featureType") == a3)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)_forceFrame
{
  -[VKMapView forceFrame](self->_mapView, "forceFrame");
}

- (BOOL)canShowPitch
{
  _BOOL4 v3;

  v3 = -[MKMapView _canShowControls](self, "_canShowControls");
  if (v3)
    LOBYTE(v3) = -[MKMapView isPitchEnabled](self, "isPitchEnabled");
  return v3;
}

- (BOOL)canShowZoom
{
  _BOOL4 v3;

  v3 = -[MKMapView _canShowControls](self, "_canShowControls");
  if (v3)
    LOBYTE(v3) = -[MKMapView isZoomEnabled](self, "isZoomEnabled");
  return v3;
}

- (BOOL)showsScale
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = _MKLinkedOnOrAfterReleaseSet(1791);
  v4 = 2;
  if (v3)
    v4 = 0;
  return self->_scaleVisibility == v4;
}

- (void)setShowsScale:(BOOL)showsScale
{
  _BOOL4 v3;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;

  v3 = showsScale;
  v5 = _MKLinkedOnOrAfterReleaseSet(1791);
  v6 = 1;
  if (v3)
    v6 = 2;
  if (v5)
    v7 = !v3;
  else
    v7 = v6;
  -[MKMapView _setScaleVisibility:](self, "_setScaleVisibility:", v7);
}

- (void)_stopPostingScaleUpdateNotifications
{
  uint64_t v1;
  uint8_t v2[16];

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 1344);
    if (v1)
    {
      *(_QWORD *)(a1 + 1344) = v1 - 1;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _scaleUpdateNotificationObserversCount > 0", v2, 2u);
    }
  }
}

- (BOOL)_showsScaleDuringZoom
{
  return self->_scaleVisibility == 0;
}

- (void)_setShowsScaleDuringZoom:(BOOL)a3
{
  -[MKMapView _setScaleVisibility:](self, "_setScaleVisibility:", !a3);
}

- (int64_t)_scaleVisibility
{
  return self->_scaleVisibility;
}

- (void)_setScaleVisibility:(int64_t)a3
{
  if (self->_scaleVisibility != a3)
  {
    self->_scaleVisibility = a3;
    -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 0);
  }
}

- (id)scaleView
{
  MKScaleView *v3;
  MKScaleView *scaleView;
  MKMapType v5;
  BOOL v6;
  _BOOL4 v7;
  uint64_t v8;

  if (!self->_scaleView)
  {
    v3 = objc_alloc_init(MKScaleView);
    scaleView = self->_scaleView;
    self->_scaleView = v3;

    -[MKScaleView setUsedInternallyByMapView:](self->_scaleView, "setUsedInternallyByMapView:", 1);
  }
  v5 = -[MKMapView mapType](self, "mapType");
  -[MKScaleView setMapType:](self->_scaleView, "setMapType:", v5);
  v6 = -[MKMapView _showsNightMode](self, "_showsNightMode");
  v7 = v5 - 1 < 4 || v5 == 107;
  v8 = v6 || v7;
  -[MKScaleView setUseLightText:](self->_scaleView, "setUseLightText:", v8);
  return self->_scaleView;
}

- (BOOL)_shouldDisplayScaleForCurrentRegion
{
  uint64_t v3;
  double MidX;
  CGFloat MidY;
  double v6;
  BOOL result;
  CGRect v8;
  CGRect v9;

  if (qword_1EDFB79B8 != -1)
    dispatch_once(&qword_1EDFB79B8, &__block_literal_global_265);
  v3 = qword_1EDFB79B0;
  if (-[MKMapView _isPitched](self, "_isPitched"))
    return 0;
  if (v3 != 100)
    return 0;
  -[MKMapView bounds](self, "bounds");
  MidX = CGRectGetMidX(v8);
  -[MKMapView bounds](self, "bounds");
  MidY = CGRectGetMidY(v9);
  -[MKMapView _distanceFromPoint:toPoint:fromView:withPrecision:](self, "_distanceFromPoint:toPoint:fromView:withPrecision:", self, 0, MidX, MidY, MidX + 1.0, MidY);
  result = v6 <= 7500.0;
  if (v6 <= 0.0)
    return 0;
  return result;
}

void __48__MKMapView__shouldDisplayScaleForCurrentRegion__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  qword_1EDFB79B0 = objc_msgSend(v0, "_graphicsQuality");

}

- (BOOL)_canShowAppleLogo
{
  double v3;
  double v4;
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
  double Integer;
  CGRect v17;

  -[MKMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v8 = v7;
  v11 = v6 - (v9 + v10);
  v13 = v12 + 10.0 + self->_appleLogoImageWidth + self->_attributionInsets.left;
  -[MKAttributionLabel bounds](self->_attributionLabel, "bounds");
  v14 = v4 - (v8 + v13 + CGRectGetWidth(v17) + self->_attributionInsets.right + 10.0);
  Integer = (double)GEOConfigGetInteger();
  return v11 >= (double)GEOConfigGetInteger() && v14 >= Integer;
}

uint64_t __41__MKMapView__showOrHideScaleIfNecessary___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 752))
      return objc_msgSend(*(id *)(result + 40), "removeFromSuperview");
  }
  return result;
}

uint64_t __41__MKMapView__showOrHideScaleIfNecessary___block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;
  double v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  v3 = 1.0;
  if (!v1)
    v3 = 0.0;
  return objc_msgSend(v2, "setAlpha:", v3);
}

- (void)setCompassEnabled:(BOOL)a3
{
  if (self->_showsCompass != a3)
    -[MKMapView setShowsCompass:](self, "setShowsCompass:");
}

- (void)_setCompassSuppressedForFloorPicker:(BOOL)a3
{
  if (self->_compassSuppressedForFloorPicker != a3)
  {
    self->_compassSuppressedForFloorPicker = a3;
    -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility");
  }
}

- (void)_stopPostingCompassUpdateNotifications
{
  uint64_t v1;
  uint8_t v2[16];

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 1336);
    if (v1)
    {
      *(_QWORD *)(a1 + 1336) = v1 - 1;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _compassUpdateNotificationObserversCount > 0", v2, 2u);
    }
  }
}

- (double)presentationYaw
{
  void *v2;
  double v3;
  double v4;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationYaw");
  v4 = v3;

  return v4;
}

- (void)setShowsUserTrackingButton:(BOOL)showsUserTrackingButton
{
  if (self->_showsUserTrackingButton != showsUserTrackingButton)
  {
    self->_showsUserTrackingButton = showsUserTrackingButton;
    -[MKMapView _updateTrackingVisibility](self, "_updateTrackingVisibility");
  }
}

- (void)setPitchButtonVisibility:(MKFeatureVisibility)pitchButtonVisibility
{
  if (self->_pitchButtonVisibility != pitchButtonVisibility)
  {
    self->_pitchButtonVisibility = pitchButtonVisibility;
    -[MKPitchButton setVisibility:](self->_pitchButton, "setVisibility:");
    -[MKMapView _updatePitchButtonVisibility](self, "_updatePitchButtonVisibility");
  }
}

- (BOOL)showsCompass
{
  return self->_showsCompass;
}

- (id)_userTrackingButton
{
  MKUserTrackingButton *trackingButton;
  MKUserTrackingButton *v4;
  MKUserTrackingButton *v5;

  trackingButton = self->_trackingButton;
  if (!trackingButton)
  {
    +[MKUserTrackingButton userTrackingButtonWithMapView:](MKUserTrackingButton, "userTrackingButtonWithMapView:", self);
    v4 = (MKUserTrackingButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trackingButton;
    self->_trackingButton = v4;

    -[MKUserTrackingButton setBackgroundStyle:](self->_trackingButton, "setBackgroundStyle:", self->_userTrackingButtonBackgroundStyle);
    -[MKUserTrackingButton setTranslatesAutoresizingMaskIntoConstraints:](self->_trackingButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    trackingButton = self->_trackingButton;
  }
  return trackingButton;
}

- (void)_setUserTrackingButtonBackgroundStyle:(unint64_t)a3
{
  id v4;

  if (self->_userTrackingButtonBackgroundStyle != a3)
  {
    self->_userTrackingButtonBackgroundStyle = a3;
    -[MKMapView _userTrackingButton](self, "_userTrackingButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundStyle:", a3);

  }
}

- (void)_setUserTrackingControlSize:(unint64_t)a3
{
  id v4;

  if (self->_userTrackingControlSize != a3)
  {
    self->_userTrackingControlSize = a3;
    -[MKMapView _userTrackingButton](self, "_userTrackingButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setControlSize:", a3);

  }
}

- (void)_setPitchButtonControlSize:(unint64_t)a3
{
  id v4;

  if (self->_pitchButtonControlSize != a3)
  {
    self->_pitchButtonControlSize = a3;
    -[MKMapView _pitchButton](self, "_pitchButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setControlSize:", a3);

  }
}

- (void)_setScaleControlSize:(unint64_t)a3
{
  id v4;

  if (self->_scaleControlSize != a3)
  {
    self->_scaleControlSize = a3;
    -[MKMapView scaleView](self, "scaleView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setControlSize:", a3);

  }
}

- (void)_setControlBackgroundStyle:(unint64_t)a3
{
  self->_controlBackgroundStyle = a3;
  -[MKMapView _setUserTrackingButtonBackgroundStyle:](self, "_setUserTrackingButtonBackgroundStyle:");
  -[MKMapView _setPitchButtonBackgroundStyle:](self, "_setPitchButtonBackgroundStyle:", a3);
}

- (void)_setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
  -[MKMapView _setUserTrackingControlSize:](self, "_setUserTrackingControlSize:");
  -[MKMapView _setPitchButtonControlSize:](self, "_setPitchButtonControlSize:", a3);
  -[MKMapView _setScaleControlSize:](self, "_setScaleControlSize:", a3);
}

- (id)compassView
{
  MKCompassView *compassView;
  double v4;
  MKCompassView *v5;
  MKCompassView *v6;
  void *v7;

  compassView = self->_compassView;
  if (!compassView)
  {
    -[MKMapView _compassDiameter](self, "_compassDiameter");
    v5 = -[MKCompassView initWithFrame:]([MKCompassView alloc], "initWithFrame:", 0.0, 0.0, v4, v4);
    v6 = self->_compassView;
    self->_compassView = v5;

    -[MKCompassView setCompassViewSize:style:](self->_compassView, "setCompassViewSize:style:", self->_compassViewSize, self->_compassViewStyle);
    -[MKCompassView setOverrideUserInterfaceStyle:](self->_compassView, "setOverrideUserInterfaceStyle:", -[MKMapView _controlsUserInterfaceStyleOverride](self, "_controlsUserInterfaceStyleOverride"));
    -[MKMapGestureController setCompassView:](self->_gestureController, "setCompassView:", self->_compassView);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleCompassTap_);
    objc_msgSend(v7, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v7, "setDelegate:", self);
    -[MKCompassView addGestureRecognizer:](self->_compassView, "addGestureRecognizer:", v7);

    compassView = self->_compassView;
  }
  return compassView;
}

- (void)_updateCompassPositionClassic
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  _BOOL4 v30;
  CGFloat v31;
  CGFloat v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double MaxX;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double MaxY;
  double v46;
  double v47;
  double x;
  double y;
  double v50;
  double width;
  double height;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  NSObject *v59;
  double left;
  double right;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double bottom;
  CGFloat v67;
  double v68;
  double v69;
  CGFloat v70;
  uint8_t buf[4];
  unint64_t v72;
  uint64_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v73 = *MEMORY[0x1E0C80C00];
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKMapView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] != v11 || v17 != v12)
  {
    v19 = v11;
    v20 = v12;
    rect_8 = v6;
    rect_24 = v10;
    v68 = v4;
    v69 = v8;
    -[MKCompassView bounds](self->_compassView, "bounds", *MEMORY[0x1E0C9D820], v17);
    rect = v21;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    rect_16 = self->_compassInsets.top;
    bottom = self->_compassInsets.bottom;
    left = self->_compassInsets.left;
    right = self->_compassInsets.right;
    -[MKMapView _compassDiameter](self, "_compassDiameter");
    v29 = v25 == v28;
    v30 = v27 == v28;
    if (v29 && v30)
      v31 = v27;
    else
      v31 = v28;
    if (v29 && v30)
      v32 = v25;
    else
      v32 = v28;
    v33 = -[MKMapView _compassInsetEdges](self, "_compassInsetEdges");
    v70 = v32;
    v67 = v23;
    v34 = v14;
    v35 = v16;
    v36 = v19;
    v37 = v20;
    if ((v33 & 2) != 0)
    {
      v39 = rect_8 + left + CGRectGetMinX(*(CGRect *)&v34);
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      v74.origin.x = rect;
      v74.origin.y = v23;
      v74.size.width = v32;
      v74.size.height = v31;
      v39 = MaxX - CGRectGetWidth(v74) - right - rect_24;
    }
    v40 = v31;
    v41 = v14;
    v42 = v16;
    v43 = v19;
    v44 = v20;
    if ((v33 & 1) != 0)
    {
      v47 = v68 + rect_16 + CGRectGetMinY(*(CGRect *)&v41);
      v46 = v70;
    }
    else
    {
      MaxY = CGRectGetMaxY(*(CGRect *)&v41);
      v75.origin.x = v39;
      v75.origin.y = v67;
      v46 = v70;
      v75.size.width = v70;
      v75.size.height = v31;
      v47 = MaxY - CGRectGetHeight(v75) - bottom - v69;
    }
    if ((*(_QWORD *)&self->_flags & 0x10000000000) != 0)
    {
      x = v39;
      y = v47;
      height = v40;
      width = v46;
    }
    else
    {
      -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v33 & 5, v39, v47, v46, v40);
      x = v76.origin.x;
      y = v76.origin.y;
      v50 = v40;
      width = v76.size.width;
      height = v76.size.height;
      if (CGRectIsNull(v76))
      {
        v53 = v46;
        v54 = v50;
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v33 & 0xA, v39, v47, v53, v50);
        x = v55;
        y = v56;
        width = v57;
        height = v58;
      }
      else
      {
        v54 = v50;
      }
      v77.origin.x = x;
      v77.origin.y = y;
      v77.size.width = width;
      v77.size.height = height;
      if (CGRectIsNull(v77))
      {
        MKGetMKMapViewLog();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v72 = v33;
          _os_log_impl(&dword_18B0B0000, v59, OS_LOG_TYPE_DEBUG, "Could not inset compass from edges %lu", buf, 0xCu);
        }

        x = v39;
        y = v47;
        width = v70;
        height = v54;
      }
    }
    -[MKCompassView setFrame:](self->_compassView, "setFrame:", x, y, width, height);
  }
}

- (id)_controlStackView
{
  UIStackView *controlStackView;
  MKPassThroughStackView *v4;
  UIStackView *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *controlStackHorizontalPositionConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *controlStackVerticalPositionConstraint;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *controlStackWidthConstraint;
  void *v17;
  NSLayoutConstraint *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  controlStackView = self->_controlStackView;
  if (!controlStackView)
  {
    v4 = objc_alloc_init(MKPassThroughStackView);
    v5 = self->_controlStackView;
    self->_controlStackView = &v4->super;

    -[UIStackView setAlignment:](self->_controlStackView, "setAlignment:", 3);
    -[UIStackView setAxis:](self->_controlStackView, "setAxis:", 1);
    -[UIStackView setSpacing:](self->_controlStackView, "setSpacing:", 10.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_controlStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](self->_controlStackView, "setDistribution:", 3);
    -[MKMapView addSubview:](self, "addSubview:", self->_controlStackView);
    -[UIStackView trailingAnchor](self->_controlStackView, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView trailingAnchor](self, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -11.0);
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    controlStackHorizontalPositionConstraint = self->_controlStackHorizontalPositionConstraint;
    self->_controlStackHorizontalPositionConstraint = v8;

    -[UIStackView topAnchor](self->_controlStackView, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView topAnchor](self, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 11.0);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    controlStackVerticalPositionConstraint = self->_controlStackVerticalPositionConstraint;
    self->_controlStackVerticalPositionConstraint = v12;

    -[UIStackView widthAnchor](self->_controlStackView, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", MKCompassViewDiameterForSize(self->_compassViewSize));
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    controlStackWidthConstraint = self->_controlStackWidthConstraint;
    self->_controlStackWidthConstraint = v15;

    v17 = (void *)MEMORY[0x1E0CB3718];
    v18 = self->_controlStackVerticalPositionConstraint;
    v24[0] = self->_controlStackHorizontalPositionConstraint;
    v24[1] = v18;
    v24[2] = self->_controlStackWidthConstraint;
    -[UIStackView bottomAnchor](self->_controlStackView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView bottomAnchor](self, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v22);

    controlStackView = self->_controlStackView;
  }
  return controlStackView;
}

- (void)_handleCompassTap:(id)a3
{
  void *v4;

  +[MKMapService sharedService](MKMapService, "sharedService", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 1040, -[MKMapView currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics"), 0);

  -[MKMapView _snapToTrueNorthAndCallBack:](self, "_snapToTrueNorthAndCallBack:", 1);
}

uint64_t __55__MKMapView__setCompassVisible_animationAllowed_force___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = result;
    if (!*(_BYTE *)(result + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 696), "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeAnimationForKey:", CFSTR("controlVisibility"));

      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 696), "removeFromSuperview");
    }
  }
  return result;
}

- (BOOL)compassVisible
{
  return self->_compassVisible;
}

- (id)_commonVisibilityAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  if (v3)
    v7 = 0.0;
  else
    v7 = 1.0;
  if (v3)
    v8 = 1.0;
  else
    v8 = 0.0;
  objc_msgSend(v4, "set_mapkit_ID:", v6);
  *(float *)&v9 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v10);

  *(float *)&v11 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v12);

  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  if (_MKLinkedOnOrAfterReleaseSet(2824))
  {
    if (v3)
      v13 = 1.0;
    else
      v13 = 0.430000007;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationDuration");
    objc_msgSend(v5, "setDuration:", v13 * v14);
  }
  objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationTimingFunction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v15);

  return v5;
}

- (void)snapToNorth:(id)a3
{
  VKMapView *v4;

  v4 = self->_mapView;
  if (-[MKMapView userTrackingMode](self, "userTrackingMode") == MKUserTrackingModeFollowWithHeading)
    -[MKMapView setUserTrackingMode:animated:](self, "setUserTrackingMode:animated:", 1, 1);
  *(_QWORD *)&self->_flags &= ~0x4000000000000uLL;
  -[VKMapView setYaw:animated:](v4, "setYaw:animated:", 1, self->_verticalYawOverride);

}

- (void)_snapToTrueNorthAndCallBack:(BOOL)a3
{
  _BOOL4 v3;
  VKMapView *v5;

  v3 = a3;
  v5 = self->_mapView;
  if (v3 && -[MKMapView userTrackingMode](self, "userTrackingMode") == MKUserTrackingModeFollowWithHeading)
    -[MKMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 1, 1, 0);
  *(_QWORD *)&self->_flags &= ~0x4000000000000uLL;
  -[VKMapView setYaw:animated:](v5, "setYaw:animated:", 1, 0.0);

}

- (void)_setAutomaticallySnapsToNorth:(BOOL)a3
{
  self->_automaticallySnapsToNorth = a3;
}

- (void)mapLayerDidFailLoadingTiles:(id)a3 withError:(id)a4
{
  id v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  char v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    -[MKMapViewDelegate mapViewDidFailLoadingMap:withError:](v11, "mapViewDidFailLoadingMap:withError:", self, v6);

  }
}

- (void)mapLayer:(id)a3 selectedLabelMarkerDidCompleteLayout:(id)a4
{
  void *v5;
  char isKindOfClass;
  id v7;

  -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_showDeferredSelectionAccessoryForReasonIfNeeded:", 1);
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (void)mapLayer:(id)a3 labelMarkerDidChangeState:(id)a4
{
  void *v5;
  char isKindOfClass;
  id v7;

  -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (void)mapLayer:(id)a3 selectedLabelMarkerWillDisappear:(id)a4
{
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4) & 1) != 0)
  {
    -[MKMapView _deselectLabelMarkerAnimated:](self, "_deselectLabelMarkerAnimated:", 1);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__MKMapView_mapLayer_selectedLabelMarkerWillDisappear___block_invoke;
    block[3] = &unk_1E20D7D98;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __55__MKMapView_mapLayer_selectedLabelMarkerWillDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deselectLabelMarkerAnimated:", 1);
}

- (void)mapLayer:(id)a3 selectedLabelMarkerDidChangeState:(id)a4
{
  id v5;
  void *v6;
  MKMapViewLabelMarkerState *v7;
  MKMapViewLabelMarkerState *v8;
  MKMapViewLabelMarkerState *selectedLabelMarkerState;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[MKMapView _selectedLabelMarker](self, "_selectedLabelMarker");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v13;
  if (v5 == v13)
  {
    v7 = self->_selectedLabelMarkerState;
    +[MKMapViewLabelMarkerState stateForLabelMarker:](MKMapViewLabelMarkerState, "stateForLabelMarker:", v13);
    v8 = (MKMapViewLabelMarkerState *)objc_claimAutoreleasedReturnValue();
    selectedLabelMarkerState = self->_selectedLabelMarkerState;
    self->_selectedLabelMarkerState = v8;

    if (-[MKMapViewLabelMarkerState isVisible](v7, "isVisible")
      || !-[MKMapViewLabelMarkerState isVisible](self->_selectedLabelMarkerState, "isVisible"))
    {
      v10 = -[MKMapViewLabelMarkerState balloonBehavior](v7, "balloonBehavior");
      if (v10 != -[MKMapViewLabelMarkerState balloonBehavior](self->_selectedLabelMarkerState, "balloonBehavior"))
      {
        -[MKAnnotationManager representationForAnnotation:](self->_annotationManager, "representationForAnnotation:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "viewRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[MKAnnotationContainerView updateCalloutStateForSelectedAnnotationView:](self->_annotationContainer, "updateCalloutStateForSelectedAnnotationView:", v12);
      }
    }
    else
    {
      -[MKAnnotationManager _annotationDidChangeState:animated:](self->_annotationManager, "_annotationDidChangeState:animated:", v13, 1);
    }

    v6 = v13;
  }

}

- (void)mapLayer:(id)a3 didUpdateVerticalYawTo:(double)a4
{
  if (self->_verticalYawOverride != a4)
  {
    self->_verticalYawOverride = a4;
    -[MKMapView _updateCompassVisibility](self, "_updateCompassVisibility", a3);
  }
}

- (void)mapLayerWillStartFlyoverTour:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  id v9;

  v9 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v7 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    -[MKMapViewDelegate mapViewWillStartFlyoverTour:](v8, "mapViewWillStartFlyoverTour:", self);

  }
}

- (void)mapLayer:(id)a3 didStopFlyoverTourCompleted:(BOOL)a4
{
  _BOOL8 v4;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v6 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v9 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    -[MKMapViewDelegate mapView:didStopFlyoverTourCompleted:](v10, "mapView:didStopFlyoverTourCompleted:", self, v4);

  }
}

- (void)mapLayer:(id)a3 flyoverTourLabelDidChange:(id)a4
{
  id v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  char v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    -[MKMapViewDelegate mapView:flyoverTourLabelDidChange:](v11, "mapView:flyoverTourLabelDidChange:", self, v6);

  }
}

- (void)mapLayer:(id)a3 willTransitionTo:(int64_t)a4
{
  -[MKAnnotationContainerView transitionTo:](self->_annotationContainer, "transitionTo:", a4);
}

- (void)mapLayer:(id)a3 canShowFlyoverDidChange:(BOOL)a4
{
  _BOOL8 v4;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;

  v4 = a4;
  -[MKBasicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:](self->_basicMapView, "updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:", !a4);
  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v6 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v9 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[MKMapViewDelegate mapView:canShowFlyoverDidChange:](v9, "mapView:canShowFlyoverDidChange:", self, v4);

  }
}

- (void)mapLayer:(id)a3 showingFlyoverDidChange:(BOOL)a4
{
  _BOOL8 v4;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v6 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v9 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    -[MKMapViewDelegate mapView:showingFlyoverDidChange:](v10, "mapView:showingFlyoverDidChange:", self, v4);

  }
}

- (void)mapLayer:(id)a3 flyoverModeDidChange:(int)a4
{
  uint64_t v4;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v6 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v9 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    -[MKMapViewDelegate mapView:flyoverModeDidChange:](v10, "mapView:flyoverModeDidChange:", self, v4);

  }
}

- (void)mapLayer:(id)a3 flyoverModeWillChange:(int)a4
{
  uint64_t v4;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v6 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v9 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    -[MKMapViewDelegate mapView:flyoverModeWillChange:](v10, "mapView:flyoverModeWillChange:", self, v4);

  }
}

- (void)mapLayer:(id)a3 venueWithFocusDidChange:(id)a4 building:(id)a5
{
  id v7;
  void *v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  char v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  if (objc_msgSend(v14, "venueID"))
  {
    v8 = v14;
  }
  else
  {
    if (!self->_cachedVenueIDWithFocus)
      goto LABEL_19;

    v8 = 0;
    v7 = 0;
  }
  v14 = v8;
  if (objc_msgSend(v8, "venueID") != self->_cachedVenueIDWithFocus)
  {
    self->_cachedVenueIDWithFocus = objc_msgSend(v14, "venueID");
    self->_cachedDisplayedFloorOrdinalForVenueWithFocus = -[VKMapView displayedFloorOrdinalForVenueBuilding:](self->_mapView, "displayedFloorOrdinalForVenueBuilding:", v7);
  }
  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v9 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v12 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    -[MKMapViewDelegate mapView:didChangeFocusedVenue:focusedBuilding:](v12, "mapView:didChangeFocusedVenue:focusedBuilding:", self, v14, v7);

  }
LABEL_19:

}

- (void)mapLayer:(id)a3 location:(id)a4 isInHikingContextualRegion:(BOOL)a5
{
  id locationIsInHikingContextCallback;
  _BOOL8 v7;
  double var1;
  double var0;
  id v10;
  CLLocationCoordinate2D v11;
  void (**v12)(id, _BOOL8, double, double);

  locationIsInHikingContextCallback = self->_locationIsInHikingContextCallback;
  if (locationIsInHikingContextCallback)
  {
    v7 = a5;
    var1 = a4.var1;
    var0 = a4.var0;
    v12 = (void (**)(id, _BOOL8, double, double))MEMORY[0x18D778DB8](locationIsInHikingContextCallback, a2, a3);
    v10 = self->_locationIsInHikingContextCallback;
    self->_locationIsInHikingContextCallback = 0;

    v11 = CLLocationCoordinate2DMake(var0, var1);
    v12[2](v12, v7, v11.latitude, v11.longitude);

  }
}

- (void)mapLayerWillPerformZoomBounceAnimation
{
  UINotificationFeedbackGenerator *zoomBounceFeedbackGenerator;
  UINotificationFeedbackGenerator *v4;
  UINotificationFeedbackGenerator *v5;

  zoomBounceFeedbackGenerator = self->_zoomBounceFeedbackGenerator;
  if (!zoomBounceFeedbackGenerator)
  {
    v4 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEA7D0]);
    v5 = self->_zoomBounceFeedbackGenerator;
    self->_zoomBounceFeedbackGenerator = v4;

    zoomBounceFeedbackGenerator = self->_zoomBounceFeedbackGenerator;
  }
  -[UINotificationFeedbackGenerator notificationOccurred:](zoomBounceFeedbackGenerator, "notificationOccurred:", 2);
}

- (void)mapLayerDidFinishInitialTrackingAnimation
{
  void *v3;
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MKMapViewDidFinishInitialUserTrackingModeAnimationNotification"), self);

  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v7 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;
    -[MKMapViewDelegate mapViewDidFinishInitialUserTrackingModeAnimation:](v7, "mapViewDidFinishInitialUserTrackingModeAnimation:", self);

  }
}

- (id)mapLayerPresentationForAnnotation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MKMapView userLocation](self, "userLocation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[MKMapView userLocationView](self, "userLocationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_userLocationProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)mapLayerDidBecomePitched:(BOOL)a3
{
  _BOOL8 v3;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  id v10;

  v3 = a3;
  -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v5 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v8 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    -[MKMapViewDelegate mapView:didBecomePitched:](v9, "mapView:didBecomePitched:", self, v3);

  }
  if (-[VKMapView canShowFlyover](self->_mapView, "canShowFlyover"))
    -[MKMapView mapLayer:showingFlyoverDidChange:](self, "mapLayer:showingFlyoverDidChange:", self->_mapView, v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("MKMapViewPitchStateDidChangeNotification"), self);

}

- (void)mapLayerMuninAvailabilityDidChange:(int64_t)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  id v10;

  if ((unint64_t)a3 >= 3)
  {
    if (!self)
    {
      v5 = 0;
      v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    self->_cachedLookAroundAvailability = a3;
  }
  if (qword_1EDFB79F8 != -1)
    dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
  if (byte_1EDFB7994)
  {
    v4 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = 0;
LABEL_10:
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if ((v6 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v9 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v9;
    }
    -[MKMapViewDelegate mapView:didChangeLookAroundAvailability:](v8, "mapView:didChangeLookAroundAvailability:", self, self->_cachedLookAroundAvailability);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("MKMapViewDidChangeLookAroundAvailabilityNotification"), self);

}

- (void)mapLayerCanZoomInDidChange:(BOOL)a3
{
  _BOOL8 v3;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;

  v3 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v5 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v8 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
    -[MKMapViewDelegate mapView:canZoomInDidChange:](v8, "mapView:canZoomInDidChange:", self, v3);

  }
}

- (void)mapLayerCanZoomOutDidChange:(BOOL)a3
{
  _BOOL8 v3;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;

  v3 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v5 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v8 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
    -[MKMapViewDelegate mapView:canZoomOutDidChange:](v8, "mapView:canZoomOutDidChange:", self, v3);

  }
}

- (void)mapLayerNavigationCameraHasStartedPanning
{
  MKMapViewDelegate *v3;
  MKMapViewDelegate *v4;
  char v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;

  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v3 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v3 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v6 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;
    -[MKMapViewDelegate mapViewNavigationCameraHasStartedPanning:](v6, "mapViewNavigationCameraHasStartedPanning:", self);

  }
}

- (void)mapLayerNavigationCameraHasStoppedPanning
{
  MKMapViewDelegate *v3;
  MKMapViewDelegate *v4;
  char v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;

  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v3 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v3 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v6 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;
    -[MKMapViewDelegate mapViewNavigationCameraHasStoppedPanning:](v6, "mapViewNavigationCameraHasStoppedPanning:", self);

  }
}

- (void)mapLayerNavigationCameraDidLeaveDefaultZoom
{
  MKMapViewDelegate *v3;
  MKMapViewDelegate *v4;
  char v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;

  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v3 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v3 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v6 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;
    -[MKMapViewDelegate mapViewNavigationCameraDidLeaveDefaultZoom:](v6, "mapViewNavigationCameraDidLeaveDefaultZoom:", self);

  }
}

- (void)mapLayerNavigationCameraDidReturnToDefaultZoom
{
  MKMapViewDelegate *v3;
  MKMapViewDelegate *v4;
  char v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;

  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v3 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v3 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v6 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;
    -[MKMapViewDelegate mapViewNavigationCameraDidReturnToDefaultZoom:](v6, "mapViewNavigationCameraDidReturnToDefaultZoom:", self);

  }
}

- (void)applicationWillResignActive:(id)a3
{
  -[MKMapView setSuspended:](self, "setSuspended:", 1);
  -[MKMapView _dropDraggingAnnotationView:](self, "_dropDraggingAnnotationView:", 1);
  -[MKBasicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:](self->_basicMapView, "updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:", -[MKMapView _canShowFlyover](self, "_canShowFlyover"));
  -[MKBasicMapView updateStatsForTrafficEnabledTime](self->_basicMapView, "updateStatsForTrafficEnabledTime");
}

- (void)applicationDidEnterBackground:(id)a3
{
  self->_forceLayoutOnBoundsChange = 1;
}

- (void)applicationWillEnterForeground:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D263E8], "reportDailyUsageCountType:", 60);
}

- (void)applicationWillTerminate:(id)a3
{
  -[MKBasicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:](self->_basicMapView, "updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:", -[MKMapView _canShowFlyover](self, "_canShowFlyover", a3));
  -[MKBasicMapView updateStatsForTrafficEnabledTime](self->_basicMapView, "updateStatsForTrafficEnabledTime");
}

- (void)_sceneDidFinishSuspensionSnapshot:(id)a3
{
  self->_forceLayoutOnBoundsChange = 0;
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
  -[MKMapView bounds](self, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", self);
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

- (CGRect)visibleCenteringRectInView:(id)a3
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  v4 = a3;
  -[MKMapView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  objc_msgSend(v4, "convertRect:fromView:", self, v6 + v16, v8 + v13, v10 - (v16 + v14), v12 - (v13 + v15));
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)annotationContainerIsRotated:(id)a3
{
  double v4;

  if (self->_userTrackingMode == 2)
    return 1;
  -[VKMapView presentationYaw](self->_mapView, "presentationYaw", a3);
  return v4 != 0.0;
}

- (void)annotationContainer:(id)a3 scrollToRevealCalloutWithOffset:(CGPoint)a4 annotationCoordinate:(CLLocationCoordinate2D)a5 completionHandler:(id)a6
{
  double longitude;
  double latitude;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  VKMapView *mapView;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  MKMapViewDelegate *v30;
  void *v31;
  id showCalloutAfterRegionChangeBlock;
  MKMapViewDelegate *v33;
  char v34;
  MKMapViewDelegate *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  MKMapCameraBoundary *cameraBoundary;
  double v42;
  double v43;
  double v44;
  double v45;
  MKMapViewDelegate *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  CGRect v68;
  CGRect v69;

  longitude = a5.longitude;
  latitude = a5.latitude;
  y = a4.y;
  x = a4.x;
  v12 = a3;
  v13 = a6;
  v14 = v13;
  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
    v31 = (void *)objc_msgSend(v13, "copy");
    showCalloutAfterRegionChangeBlock = self->_showCalloutAfterRegionChangeBlock;
    self->_showCalloutAfterRegionChangeBlock = v31;

  }
  else
  {
    if (self->_userTrackingMode >= 1)
      -[MKMapView setUserTrackingMode:animated:](self, "setUserTrackingMode:animated:", 0, 0);
    -[MKMapView bounds](self, "bounds");
    v15 = v68.origin.x;
    v16 = v68.origin.y;
    width = v68.size.width;
    height = v68.size.height;
    if (fabs(x) <= CGRectGetWidth(v68)
      && (v69.origin.x = v15,
          v69.origin.y = v16,
          v69.size.width = width,
          v69.size.height = height,
          fabs(y) <= CGRectGetHeight(v69)))
    {
      -[MKMapView _centerPoint](self, "_centerPoint");
      v37 = x + v36;
      -[MKMapView _centerPoint](self, "_centerPoint");
      -[MKMapView convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self, v37, y + v38);
      cameraBoundary = self->_cameraBoundary;
      if (cameraBoundary
        && (v42 = v39, v43 = v40, !-[MKMapCameraBoundary _containsCoordinate:](cameraBoundary, "_containsCoordinate:")))
      {
        -[MKMapCameraBoundary _clampedCoordinateForCoordinate:](self->_cameraBoundary, "_clampedCoordinateForCoordinate:", v42, v43);
        v49 = v48;
        v50 = v47;
        v51 = v42 - v48;
        if (v51 >= 0.0)
          v52 = v51;
        else
          v52 = -v51;
        if (v43 - v47 >= 0.0)
          v53 = v43 - v47;
        else
          v53 = -(v43 - v47);
        -[MKMapView region](self, "region");
        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithCoordinateRegion:", v49, v50, v54 + v52 * 2.0, v55 + v53 * 2.0);
        -[MKMapView vk_mapLayer](self, "vk_mapLayer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapView vk_mapLayer](self, "vk_mapLayer");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "pitch");
        v60 = v59;
        -[MKMapView vk_mapLayer](self, "vk_mapLayer");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "yaw");
        v63 = v62;
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke_2;
        v64[3] = &unk_1E20D8688;
        v65 = v14;
        objc_msgSend(v57, "setMapRegion:pitch:yaw:duration:completion:", v56, v64, v60, v63, 0.150000006);

      }
      else
      {
        -[MKMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, latitude, longitude);
        -[VKMapView panWithOffset:relativeToScreenPoint:animated:duration:completionHandler:](self->_mapView, "panWithOffset:relativeToScreenPoint:animated:duration:completionHandler:", 1, v14, -x, -y, v44, v45, 0.150000006);
      }
    }
    else
    {
      VKLocationCoordinate2DMake();
      v20 = v19;
      v22 = v21;
      mapView = self->_mapView;
      -[VKMapView altitude](mapView, "altitude");
      v25 = v24;
      -[VKMapView yaw](self->_mapView, "yaw");
      v27 = v26;
      -[VKMapView pitch](self->_mapView, "pitch");
      v29 = v28;
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke;
      v66[3] = &unk_1E20D8688;
      v67 = v14;
      -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](mapView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, v66, v20, v22, v25, v27, v29, 0.150000006);

    }
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v30 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v30 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v33 = v30;
    v34 = objc_opt_respondsToSelector();

    if ((v34 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v35 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v35 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v46 = v35;
      -[MKMapViewDelegate mapViewDidScrollToRevealAnnotationCallout:](v35, "mapViewDidScrollToRevealAnnotationCallout:", self);

    }
  }

}

uint64_t __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)annotationContainer:(id)a3 requestAddingClusterForAnnotationViews:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  MKClusterAnnotation *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  int v22;

  v22 = -1082130432;
  -[MKMapView _flattenedAnnotationsForAnnotationViews:maxDisplayPriority:](self, "_flattenedAnnotationsForAnnotationViews:maxDisplayPriority:", a4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clusterAnnotationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "annotation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "memberAnnotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToArray:", v6);

  if (v11)
  {
    v12 = v8;
  }
  else
  {
    -[MKMapView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0
      || (-[MKMapView delegate](self, "delegate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "mapView:clusterAnnotationForMemberAnnotations:", self, v6),
          v16 = (MKClusterAnnotation *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v16))
    {
      v16 = -[MKClusterAnnotation initWithMemberAnnotations:]([MKClusterAnnotation alloc], "initWithMemberAnnotations:", v6);
    }
    -[MKMapView viewForAnnotation:](self, "viewForAnnotation:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(a4, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clusteringIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKClusterAnnotation setClusteringIdentifier:](v16, "setClusteringIdentifier:", v19);

      -[MKAnnotationManager addRepresentationForAnnotation:](self->_annotationManager, "addRepresentationForAnnotation:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = v22;
      objc_msgSend(v17, "setDisplayPriority:", v20);
      objc_msgSend(v17, "_setHidden:forReason:animated:", 1, 4, 0);
    }
    v12 = v17;

  }
  return v12;
}

- (void)annotationContainer:(id)a3 requestRemovingClusterAnnotationView:(id)a4 updateVisible:(BOOL)a5
{
  _BOOL8 v5;
  MKAnnotationManager *annotationManager;
  id v7;

  v5 = a5;
  annotationManager = self->_annotationManager;
  objc_msgSend(a4, "annotation", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationManager removeAnnotation:updateVisible:](annotationManager, "removeAnnotation:updateVisible:", v7, v5);

}

- (void)annotationContainerDidFinishMapsTransitionExpanding:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  id v9;

  v9 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v7 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    -[MKMapViewDelegate mapViewDidFinishCalloutExpansion:](v8, "mapViewDidFinishCalloutExpansion:", self);

  }
}

- (double)annotationContainer:(id)a3 pinDropDistanceForCoordinate:(CLLocationCoordinate2D)a4 maxDistance:(double *)a5
{
  double v7;
  double v8;
  uint64_t v9;

  -[MKMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, a4.latitude, a4.longitude);
  v8 = v7;
  if (a5)
  {
    -[MKMapView bounds](self, "bounds");
    *(_QWORD *)a5 = v9;
  }
  return v8;
}

- (void)annotationContainerWillDropPins:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  id v9;

  v9 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v7 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    -[MKMapViewDelegate mapViewWillAnimateInAnnotationViews:](v8, "mapViewWillAnimateInAnnotationViews:", self);

  }
}

- (void)annotationContainerDidDropPins:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  id v9;

  v9 = a3;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v7 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    -[MKMapViewDelegate mapViewDidAnimateInAnnotationViews:](v8, "mapViewDidAnimateInAnnotationViews:", self);

  }
}

- (void)annotationContainer:(id)a3 annotationView:(id)a4 calloutAccessoryControlTapped:(id)a5
{
  id v7;
  void *v8;
  char isKindOfClass;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  char v14;
  MKMapViewDelegate *v15;
  char v16;
  MKMapViewDelegate *v17;
  MKMapViewDelegate *v18;
  void *v19;
  id v20;

  v20 = a4;
  v7 = a5;
  objc_msgSend(v20, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v10;
    }
    else
    {
      v12 = 0;
    }
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v15 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v15 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v18 = v15;
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v20, "annotation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapViewDelegate mapView:labelMarker:calloutAccessoryControlTapped:](v18, "mapView:labelMarker:calloutAccessoryControlTapped:", self, v19, v7);

LABEL_38:
    }
  }
  else
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v11 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v13 = v11;
    }
    else
    {
      v13 = 0;
    }
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v17 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v17 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;
      }
      else
      {
        v18 = 0;
      }
      -[MKMapViewDelegate mapView:annotationView:calloutAccessoryControlTapped:](v18, "mapView:annotationView:calloutAccessoryControlTapped:", self, v20, v7);
      goto LABEL_38;
    }
  }

}

- (void)annotationContainer:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4
{
  void *v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  char v10;
  MKMapViewDelegate *v11;
  char v12;
  id v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  id v16;

  v16 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "annotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v6 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v6;
    }
    else
    {
      v8 = 0;
    }
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v11 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v11;
      }
      else
      {
        v15 = 0;
      }
      -[MKMapViewDelegate mapView:calloutPrimaryActionTriggeredForLabelMarker:](v15, "mapView:calloutPrimaryActionTriggeredForLabelMarker:", self, v5);

    }
LABEL_38:

    goto LABEL_39;
  }
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = v16;
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v14 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v5 = v14;
      v13 = v16;
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v5, "mapView:calloutPrimaryActionTriggeredForAnnotationView:", self, v13);
    goto LABEL_38;
  }
LABEL_39:

}

- (void)calloutDidAppearForAnnotationView:(id)a3 inContainer:(id)a4
{
  id v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  char v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    -[MKMapViewDelegate _mapView:calloutDidAppearForAnnotationView:](v11, "_mapView:calloutDidAppearForAnnotationView:", self, v12);

  }
}

- (void)_displayWorld
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double Height;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[MKMapView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v12 = CGRectGetWidth(v18) * 0.0000000037252903;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (v12 <= CGRectGetHeight(v19) * 0.0000000037252903)
  {
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    Height = CGRectGetHeight(v21);
  }
  else
  {
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    Height = CGRectGetWidth(v20);
  }
  v14 = vcvtmd_s64_f64(log2(Height * 0.0000000037252903) + 0.5);
  if (v14 >= -21)
    v15 = v14 + 21;
  else
    v15 = 0;
  -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
  if (v15 <= (uint64_t)v16)
  {
    -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
    v15 = (uint64_t)v17;
  }
  -[MKMapView _goToCenterCoordinate:zoomLevel:animated:](self, "_goToCenterCoordinate:zoomLevel:animated:", 0, 30.0, -40.0, (double)v15);
}

- (void)_performActionAsIfGoingToDefaultLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_QWORD *)&self->_flags &= ~0x8000000000000uLL;
}

- (void)_updateFramingUsingSetRegionBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v4);
  else
    v4[2]();

}

- (CGRect)annotationVisibleRect
{
  MKAnnotationContainerView *annotationContainer;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  annotationContainer = self->_annotationContainer;
  -[MKMapView bounds](self, "bounds");
  -[MKAnnotationContainerView convertRect:fromView:](annotationContainer, "convertRect:fromView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (NSSet)annotationsInMapRect:(MKMapRect)mapRect
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[MKAnnotationManager annotationsInMapRect:](self->_annotationManager, "annotationsInMapRect:", mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _filterLabelMarkersPredicate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredSetUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (annotationsInMapRect__once != -1)
    dispatch_once(&annotationsInMapRect__once, &__block_literal_global_370);
  if (!annotationsInMapRect__shouldIncludeUserLocation
    && objc_msgSend(v6, "containsObject:", self->_userLocation))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", self->_userLocation);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 16);
  return (NSSet *)v6;
}

BOOL __34__MKMapView_annotationsInMapRect___block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(257);
  annotationsInMapRect__shouldIncludeUserLocation = result;
  return result;
}

- (NSArray)selectedAnnotations
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5, v4, (isKindOfClass & 1) == 0))
  {
    v8 = (void *)MEMORY[0x1E0C99D20];
    -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "annotation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObject:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (qword_1EDFB79D8 != -1)
      dispatch_once(&qword_1EDFB79D8, &__block_literal_global_373);
    if (byte_1EDFB7992)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "_mapkit_fakeNil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  return (NSArray *)v7;
}

BOOL __32__MKMapView_selectedAnnotations__block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(1026);
  byte_1EDFB7992 = !result;
  return result;
}

- (void)setSelectedAnnotations:(NSArray *)selectedAnnotations
{
  uint64_t v4;
  MKAnnotationManager *annotationManager;
  void *v6;
  NSArray *v7;

  v7 = selectedAnnotations;
  v4 = -[NSArray count](v7, "count");
  annotationManager = self->_annotationManager;
  if (v4)
  {
    -[NSArray objectAtIndex:](v7, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationManager selectAnnotation:animated:](annotationManager, "selectAnnotation:animated:", v6, 0);

  }
  else
  {
    -[MKAnnotationManager deselectAnnotation:animated:](annotationManager, "deselectAnnotation:animated:", 0, 0);
  }

}

- (BOOL)_canSelectPOIs
{
  return (*(_QWORD *)&self->_flags >> 37) & 1;
}

- (void)_setCanSelectPOIs:(BOOL)a3
{
  _BOOL4 v3;
  MKLabelSelectionFilter *labelSelectionFilter;
  unint64_t flags;
  uint64_t v7;

  v3 = a3;
  labelSelectionFilter = self->_labelSelectionFilter;
  self->_labelSelectionFilter = 0;

  -[VKMapView setLabelSelectionFilter:](self->_mapView, "setLabelSelectionFilter:", 0);
  flags = (unint64_t)self->_flags;
  v7 = 0x2000000000;
  if (!v3)
    v7 = 0;
  *(_QWORD *)&self->_flags = flags & 0xFFFFFFDFFFFFFFFFLL | v7;
  -[VKMapView setLabelMarkerSelectionEnabled:](self->_mapView, "setLabelMarkerSelectionEnabled:", v3 | (flags >> 38) & 1);
}

- (BOOL)_canSelectAllLabels
{
  return (*(_QWORD *)&self->_flags >> 38) & 1;
}

- (void)_setCanSelectAllLabels:(BOOL)a3
{
  _BOOL4 v3;
  MKLabelSelectionFilter *labelSelectionFilter;
  unint64_t flags;
  uint64_t v7;

  v3 = a3;
  labelSelectionFilter = self->_labelSelectionFilter;
  self->_labelSelectionFilter = 0;

  -[VKMapView setLabelSelectionFilter:](self->_mapView, "setLabelSelectionFilter:", 0);
  flags = (unint64_t)self->_flags;
  v7 = 0x4000000000;
  if (!v3)
    v7 = 0;
  *(_QWORD *)&self->_flags = flags & 0xFFFFFFBFFFFFFFFFLL | v7;
  -[VKMapView setLabelMarkerSelectionEnabled:](self->_mapView, "setLabelMarkerSelectionEnabled:", (flags >> 37) & 1 | v3);
}

- (VKLabelMarker)_selectedLabelMarker
{
  return (VKLabelMarker *)-[VKMapView selectedLabelMarker](self->_mapView, "selectedLabelMarker");
}

- (void)_deselectLabelMarkerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  MKAnnotationManager *annotationManager;
  id v7;

  v3 = a3;
  -[MKMapView _selectedLabelMarker](self, "_selectedLabelMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    annotationManager = self->_annotationManager;
    -[MKMapView _selectedLabelMarker](self, "_selectedLabelMarker");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationManager deselectAnnotation:animated:](annotationManager, "deselectAnnotation:animated:", v7, v3);

  }
}

- (void)_selectLabelMarker:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  MKMapFeatureAnnotation *v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  char v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v14 = v6;
    -[MKMapView _selectedLabelMarker](self, "_selectedLabelMarker");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v14;
    if (v7 != v14)
    {
      if (-[MKLabelSelectionFilter selectionEnabled](self->_labelSelectionFilter, "selectionEnabled"))
      {
        v8 = -[MKMapFeatureAnnotation initWithVKLabelMarker:isHybridMap:]([MKMapFeatureAnnotation alloc], "initWithVKLabelMarker:isHybridMap:", v14, -[MKMapView _isHybridMap](self, "_isHybridMap"));
        -[MKMapView addAnnotation:](self, "addAnnotation:", v8);
        -[MKMapView _selectAnnotation:animated:](self, "_selectAnnotation:animated:", v8, v4);

      }
      else
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v9 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v10 = v9;
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          if (qword_1EDFB79F8 != -1)
            dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
          if (byte_1EDFB7994)
          {
            v12 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v13 = v12;
          -[MKMapViewDelegate mapView:willSelectLabelMarker:](v12, "mapView:willSelectLabelMarker:", self, v14);

        }
        -[MKMapView addAnnotation:](self, "addAnnotation:", v14);
        -[MKMapView _selectAnnotation:animated:](self, "_selectAnnotation:animated:", v14, v4);
      }
      v6 = v14;
    }
  }

}

- (BOOL)_isHybridMap
{
  void *v3;
  void *v4;
  BOOL v5;

  -[MKMapView preferredConfiguration](self, "preferredConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKMapView preferredConfiguration](self, "preferredConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "elevationStyle") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_labelMarkerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelMarkerForSelectionAtPoint:selectableLabelsOnly:", -[MKMapView _canSelectAllLabels](self, "_canSelectAllLabels") ^ 1, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && ((objc_msgSend(v7, "isSelectable") & 1) != 0 || -[MKMapView _canSelectAllLabels](self, "_canSelectAllLabels")))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_labelMarkerForCustomFeatureAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MKMapView vk_mapLayer](self, "vk_mapLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelMarkerForCustomFeatureAnnotation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)navigationCameraReturnToPuck
{
  -[VKMapView navigationCameraReturnToPuck](self->_mapView, "navigationCameraReturnToPuck");
}

- (void)selectAnnotation:(id)annotation animated:(BOOL)animated
{
  -[MKAnnotationManager selectAnnotation:animated:](self->_annotationManager, "selectAnnotation:animated:", annotation, animated);
}

- (void)deselectAnnotation:(id)annotation animated:(BOOL)animated
{
  -[MKAnnotationManager deselectAnnotation:animated:](self->_annotationManager, "deselectAnnotation:animated:", annotation, animated);
}

- (void)_addAnnotation:(id)a3 allowAnimation:(BOOL)a4
{
  _BOOL8 v4;
  MKUserLocation *v6;
  MKUserLocation *v7;
  MKUserLocation *v8;

  v4 = a4;
  v6 = (MKUserLocation *)a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    if (self->_userLocation == v6)
    {
      NSLog(CFSTR("WARNING: Passed MKUserLocation to -[MKMapView addAnnotation:]. Use -[MKMapView setShowsUserLocation:YES] instead"), v6);
      -[MKMapView setShowsUserLocation:](self, "setShowsUserLocation:", 1);
    }
    else
    {
      -[MKAnnotationManager addAnnotation:allowAnimation:](self->_annotationManager, "addAnnotation:allowAnimation:", v6, v4);
    }
    v7 = v8;
  }

}

- (void)addAnnotation:(id)annotation
{
  -[MKMapView _addAnnotation:allowAnimation:](self, "_addAnnotation:allowAnimation:", annotation, 1);
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 12);
}

- (void)_addAnnotations:(id)a3 allowAnimation:(BOOL)a4
{
  _BOOL8 v4;
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

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
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
        -[MKMapView _addAnnotation:allowAnimation:](self, "_addAnnotation:allowAnimation:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)removeAnnotation:(id)annotation
{
  id v4;
  id v5;
  id v6;

  v4 = annotation;
  if (v4)
  {
    v6 = v4;
    -[MKMapView userLocation](self, "userLocation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v5 != v6)
    {
      -[MKAnnotationManager removeAnnotation:](self->_annotationManager, "removeAnnotation:", v6);
      -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 14);
      v4 = v6;
    }
  }

}

- (void)_replaceAnnotation:(id)a3 withAnnotation:(id)a4
{
  if (a3)
  {
    if (a4)
      -[MKAnnotationManager replaceAnnotation:withAnnotation:](self->_annotationManager, "replaceAnnotation:withAnnotation:");
  }
}

- (void)_addViewsForAnnotations:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    -[MKAnnotationManager addRepresentationsForAnnotations:](self->_annotationManager, "addRepresentationsForAnnotations:", v4);

}

- (MKAnnotationView)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier
{
  return (MKAnnotationView *)-[MKAnnotationManager dequeueReusableAnnotationRepresentationWithIdentifier:](self->_annotationManager, "dequeueReusableAnnotationRepresentationWithIdentifier:", identifier);
}

- (MKAnnotationView)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier forAnnotation:(id)annotation
{
  NSString *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = identifier;
  v7 = annotation;
  -[MKAnnotationManager dequeueReusableAnnotationRepresentationWithIdentifier:](self->_annotationManager, "dequeueReusableAnnotationRepresentationWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "setAnnotation:", v7);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to dequeue an annotation view with identifier %@ - must register a class for the identifier"), v6);

  return (MKAnnotationView *)v9;
}

- (MKAnnotationView)viewForAnnotation:(id)annotation
{
  return (MKAnnotationView *)-[MKAnnotationManager representationForAnnotation:](self->_annotationManager, "representationForAnnotation:", annotation);
}

- (BOOL)_annotationViewsAreAddedImmediately
{
  return -[MKAnnotationManager annotationRepresentationsAreAddedImmediately](self->_annotationManager, "annotationRepresentationsAreAddedImmediately");
}

- (void)set_annotationViewsAreAddedImmediately:(BOOL)a3
{
  -[MKAnnotationManager setAnnotationRepresentationsAreAddedImmediately:](self->_annotationManager, "setAnnotationRepresentationsAreAddedImmediately:", a3);
}

- (BOOL)_allowsPopoverWhenNotInWindow
{
  return 1;
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)coordinate toPointToView:(UIView *)view
{
  double longitude;
  double latitude;
  MKUsageCounter *usageCounter;
  UIView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  usageCounter = self->_usageCounter;
  v8 = view;
  -[MKUsageCounter countUsageOfTypeIfNeeded:](usageCounter, "countUsageOfTypeIfNeeded:", 30);
  -[MKMapView _convertCoordinate:toPointToView:](self, "_convertCoordinate:toPointToView:", v8, latitude, longitude);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CLLocationCoordinate2D)convertPoint:(CGPoint)point toCoordinateFromView:(UIView *)view
{
  double y;
  double x;
  MKUsageCounter *usageCounter;
  UIView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CLLocationCoordinate2D result;

  y = point.y;
  x = point.x;
  usageCounter = self->_usageCounter;
  v8 = view;
  -[MKUsageCounter countUsageOfTypeIfNeeded:](usageCounter, "countUsageOfTypeIfNeeded:", 29);
  -[MKMapView _convertPoint:toCoordinateFromView:](self, "_convertPoint:toCoordinateFromView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.longitude = v14;
  result.latitude = v13;
  return result;
}

- (CGRect)convertRegion:(MKCoordinateRegion)region toRectToView:(UIView *)view
{
  double longitudeDelta;
  double latitudeDelta;
  double longitude;
  double latitude;
  MKUsageCounter *usageCounter;
  UIView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  longitudeDelta = region.span.longitudeDelta;
  latitudeDelta = region.span.latitudeDelta;
  longitude = region.center.longitude;
  latitude = region.center.latitude;
  usageCounter = self->_usageCounter;
  v10 = view;
  -[MKUsageCounter countUsageOfTypeIfNeeded:](usageCounter, "countUsageOfTypeIfNeeded:", 32);
  -[MKMapView _convertRegion:toRectToView:](self, "_convertRegion:toRectToView:", v10, latitude, longitude, latitudeDelta, longitudeDelta);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (MKCoordinateRegion)convertRect:(CGRect)rect toRegionFromView:(UIView *)view
{
  double height;
  double width;
  double y;
  double x;
  MKUsageCounter *usageCounter;
  UIView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  MKCoordinateRegion result;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  usageCounter = self->_usageCounter;
  v10 = view;
  -[MKUsageCounter countUsageOfTypeIfNeeded:](usageCounter, "countUsageOfTypeIfNeeded:", 31);
  -[MKMapView _convertRect:toRegionFromView:](self, "_convertRect:toRegionFromView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.span.longitudeDelta = v22;
  result.span.latitudeDelta = v21;
  result.center.longitude = v20;
  result.center.latitude = v19;
  return result;
}

- (void)_enter3DMode
{
  id WeakRetained;
  char v4;
  id v5;

  -[MKBasicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:](self->_basicMapView, "updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:", -[MKMapView _canShowFlyover](self, "_canShowFlyover"));
  -[MKMapGestureController stopDynamicAnimations](self->_gestureController, "stopDynamicAnimations");
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    objc_msgSend(v5, "mapView:didPerformPitchAction:", self, 1);

  }
  -[VKMapView enter3DMode](self->_mapView, "enter3DMode");
}

- (void)_exit3DMode
{
  id WeakRetained;
  char v4;
  id v5;

  -[MKBasicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:](self->_basicMapView, "updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:", -[MKMapView _canShowFlyover](self, "_canShowFlyover"));
  -[MKMapGestureController stopDynamicAnimations](self->_gestureController, "stopDynamicAnimations");
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    objc_msgSend(v5, "mapView:didPerformPitchAction:", self, 0);

  }
  -[VKMapView exit3DMode](self->_mapView, "exit3DMode");
}

- (void)_enterARMode
{
  -[MKMapGestureController stopDynamicAnimations](self->_gestureController, "stopDynamicAnimations");
  -[VKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  VKLocationCoordinate2DMake();
  -[VKMapView enterARModeAtCoordinate:](self->_mapView, "enterARModeAtCoordinate:");
}

- (void)_enterARModeWithLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  -[MKMapGestureController stopDynamicAnimations](self->_gestureController, "stopDynamicAnimations");
  if (v13 && (objc_msgSend(v13, "placemark"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(v13, "placemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v13, "placemark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    VKLocationCoordinate2DMake();
    v8 = v7;
    v10 = v9;

  }
  else
  {
    -[VKMapView centerCoordinate](self->_mapView, "centerCoordinate");
    VKLocationCoordinate2DMake();
    v8 = v11;
    v10 = v12;
  }
  -[VKMapView enterARModeAtCoordinate:](self->_mapView, "enterARModeAtCoordinate:", v8, v10);

}

- (void)_exitARMode
{
  -[MKMapGestureController stopDynamicAnimations](self->_gestureController, "stopDynamicAnimations");
  -[VKMapView exitARMode](self->_mapView, "exitARMode");
}

- (BOOL)_canEnter3DModeFlyover
{
  return -[VKMapView canEnter3DModeFlyoverForTileSize:](self->_mapView, "canEnter3DModeFlyoverForTileSize:", 128);
}

- (BOOL)_canEnterNightMode
{
  return -[VKMapView supportsNightMode](self->_mapView, "supportsNightMode");
}

- (int64_t)_lookAroundAvailability
{
  return self->_cachedLookAroundAvailability;
}

- (BOOL)_loadLookAroundAvailability
{
  return -[VKMapView loadMuninAvailability](self->_mapView, "loadMuninAvailability");
}

- (void)_setLoadLookAroundAvailability:(BOOL)a3
{
  -[VKMapView setLoadMuninAvailability:](self->_mapView, "setLoadMuninAvailability:", a3);
}

- ($FF918C85BF8E73478720C66798E418D4)_userTrackingBehavior
{
  $FF918C85BF8E73478720C66798E418D4 *result;

  result = ($FF918C85BF8E73478720C66798E418D4 *)self->_mapView;
  if (result)
    return ($FF918C85BF8E73478720C66798E418D4 *)-[$FF918C85BF8E73478720C66798E418D4 annotationTrackingBehavior](result, "annotationTrackingBehavior");
  *(_QWORD *)&retstr->var0 = 0;
  retstr->var1 = 0.0;
  *(_QWORD *)&retstr->var2 = 0;
  return result;
}

- (void)_setUserTrackingBehavior:(id *)a3
{
  $FF918C85BF8E73478720C66798E418D4 v3;

  v3 = *a3;
  -[VKMapView setAnnotationTrackingBehavior:](self->_mapView, "setAnnotationTrackingBehavior:", &v3);
}

- (int)_applicationState
{
  return -[VKMapView applicationState](self->_mapView, "applicationState");
}

- (void)_setApplicationState:(int)a3
{
  -[VKMapView setApplicationState:](self->_mapView, "setApplicationState:", a3);
}

- (int64_t)_displayedSearchResultsType
{
  return -[VKMapView displayedSearchResultsType](self->_mapView, "displayedSearchResultsType");
}

- (void)_setDisplayedSearchResultsType:(int64_t)a3
{
  -[VKMapView setDisplayedSearchResultsType:](self->_mapView, "setDisplayedSearchResultsType:", a3);
}

+ (int64_t)_defaultOverlayLevel
{
  return +[MKOverlayContainerView _defaultOverlayLevel](MKOverlayContainerView, "_defaultOverlayLevel");
}

- (void)_addVectorOverlay:(id)a3
{
  -[VKMapView addRouteOverlay:](self->_mapView, "addRouteOverlay:", a3);
}

- (void)_removeVectorOverlay:(id)a3
{
  -[VKMapView removeRouteOverlay:](self->_mapView, "removeRouteOverlay:", a3);
}

- (void)_addPersistentVectorOverlay:(id)a3
{
  -[VKMapView addPersistentRouteOverlay:](self->_mapView, "addPersistentRouteOverlay:", a3);
}

- (void)_removePersistentVectorOverlay:(id)a3
{
  -[VKMapView removePersistentRouteOverlay:](self->_mapView, "removePersistentRouteOverlay:", a3);
}

- (void)_willChangeStatusBarFrame:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (!_MKLinkedOnOrAfterReleaseSet(2310))
  {
    v4 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusBarOrientationAnimationDuration");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__MKMapView__willChangeStatusBarFrame___block_invoke;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    objc_msgSend(v4, "animateWithDuration:animations:", v6);

  }
}

uint64_t __39__MKMapView__willChangeStatusBarFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInsetsWithForce:", 0);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MKMapView;
  -[MKMapView setHidden:](&v5, sel_setHidden_);
  if (self->_internal)
    -[MKBasicMapView setHidden:](self->_basicMapView, "setHidden:", v3);
}

- (void)drawRect:(CGRect)a3 forViewPrintFormatter:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  CGContext *CurrentContext;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGImage *v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat rect;
  double rect_8;
  id rect_8a;
  CGSize v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKMapView bounds](self, "bounds", a4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v36.height = v15;
  rect_8 = v15;
  v36.width = v13;
  UIGraphicsBeginImageContextWithOptions(v36, 1, 0.0);
  -[MKMapView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  CurrentContext = UIGraphicsGetCurrentContext();
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v19 = CGRectGetHeight(v37);
  CGContextTranslateCTM(CurrentContext, 0.0, v19);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v38.origin.x = x;
  v32 = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v30 = CGRectGetWidth(v38);
  rect = v10;
  v39.origin.x = v10;
  v39.origin.y = v12;
  v39.size.width = v14;
  v39.size.height = rect_8;
  v31 = v30 / CGRectGetWidth(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v20 = CGRectGetHeight(v40);
  v41.origin.x = v10;
  v41.origin.y = v12;
  v41.size.width = v14;
  v41.size.height = rect_8;
  v21 = v20 / CGRectGetHeight(v41);
  v22 = x;
  if (v31 < v21)
    v21 = v31;
  v23 = v14 * v21;
  v24 = rect_8 * v21;
  v42.origin.x = v32;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v25 = CGRectGetWidth(v42);
  v43.origin.x = rect;
  v43.origin.y = v12;
  v43.size.width = v23;
  v43.size.height = v24;
  v26 = (v25 - CGRectGetWidth(v43)) * 0.5;
  v44.origin.x = v22;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v27 = CGRectGetHeight(v44);
  v45.origin.x = v26;
  v45.origin.y = v12;
  v45.size.width = v23;
  v45.size.height = v24;
  v28 = (v27 - CGRectGetHeight(v45)) * 0.5;
  rect_8a = objc_retainAutorelease(v17);
  v29 = (CGImage *)objc_msgSend(rect_8a, "CGImage");
  v46.origin.x = v26;
  v46.origin.y = v28;
  v46.size.width = v23;
  v46.size.height = v24;
  CGContextDrawImage(CurrentContext, v46, v29);

}

- (void)_startZoomForExternalGesture
{
  -[MKMapGestureController startUserInteractionFromExternalGesture](self->_gestureController, "startUserInteractionFromExternalGesture");
  if ((*(_QWORD *)&self->_flags & 0x400000) == 0)
    -[MKMapView _willStartZoom:](self, "_willStartZoom:", 0);
}

- (void)_endZoomForExternalGesture
{
  -[MKMapView _didEndZoom](self, "_didEndZoom");
  -[MKMapGestureController stopUserInteractionFromExternalGesture](self->_gestureController, "stopUserInteractionFromExternalGesture");
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated
{
  _BOOL4 v4;
  double longitude;
  double latitude;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15[3];
  id location;

  v4 = animated;
  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__MKMapView_setCenterCoordinate_animated___block_invoke;
    v14[3] = &unk_1E20D86F0;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&latitude;
    v15[2] = *(id *)&longitude;
    -[MKMapView _addDependentSetRegionBlock:](self, "_addDependentSetRegionBlock:", v14);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    if (longitude < -180.0 || longitude > 180.0 || latitude < -90.0 || latitude > 90.0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid Coordinate %@"), v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise");

    }
    else
    {
      -[MKMapView camera](self, "camera");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v8, "copy");

      objc_msgSend(v13, "setCenterCoordinate:", latitude, longitude);
      v9 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
      if (!v4 || (v9 & 1) != 0)
        -[MKMapView setCamera:](self, "setCamera:", v13);
      else
        -[MKMapView setCamera:animated:](self, "setCamera:animated:", v13, 1);
    }

  }
}

void __42__MKMapView_setCenterCoordinate_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCenterCoordinate:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
{
  -[MKMapView setCenterCoordinate:animated:](self, "setCenterCoordinate:animated:", objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"), centerCoordinate.latitude, centerCoordinate.longitude);
}

- (GEOMapRegion)mapRegion
{
  return (GEOMapRegion *)-[VKMapView mapRegion](self->_mapView, "mapRegion");
}

- (void)setRegion:(MKCoordinateRegion)region
{
  -[MKMapView setRegion:animated:](self, "setRegion:animated:", objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"), region.center.latitude, region.center.longitude, region.span.latitudeDelta, region.span.longitudeDelta);
}

- (MKCoordinateRegion)regionThatFits:(MKCoordinateRegion)region
{
  MKMapType v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CLLocationDegrees longitudeDelta;
  CLLocationDegrees latitudeDelta;
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  MKCoordinateRegion result;

  longitudeDelta = region.span.longitudeDelta;
  latitudeDelta = region.span.latitudeDelta;
  longitude = region.center.longitude;
  latitude = region.center.latitude;
  v4 = -[MKMapView mapType](self, "mapType");
  -[MKMapView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 33);
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[MKMapView _minimumZoomLevel](self, "_minimumZoomLevel");
  v18 = v17;
  -[MKMapView _maximumZoomLevel](self, "_maximumZoomLevel");
  v20 = v19;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "supports3DMaps") & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC6538], "sharedPlatform");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "supportsHiResRTT") ^ 1;

  }
  +[MKMapView _regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:", v4, v22, v6, v8, v10, v12, v14, v16, *MEMORY[0x1E0CEB4B0], *(_QWORD *)(MEMORY[0x1E0CEB4B0] + 8), *(_QWORD *)(MEMORY[0x1E0CEB4B0] + 16), *(_QWORD *)(MEMORY[0x1E0CEB4B0] + 24), *(_QWORD *)&latitude, *(_QWORD *)&longitude, *(_QWORD *)&latitudeDelta, *(_QWORD *)&longitudeDelta, v18,
    v20);
  result.span.longitudeDelta = v27;
  result.span.latitudeDelta = v26;
  result.center.longitude = v25;
  result.center.latitude = v24;
  return result;
}

- (MKMapRect)mapRectThatFits:(MKMapRect)mapRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKMapRect result;

  -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void __75__MKMapView__setZoomScale_centerMapPoint_duration_timingFunction_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setZoomScale:centerMapPoint:duration:timingFunction:animated:", 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)_setZoomScale:(double)a3 centerCoordinate:(CLLocationCoordinate2D)a4 duration:(double)a5 timingFunction:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  double longitude;
  double latitude;
  double v13;
  double v14;
  id v15;

  v7 = a7;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v15 = a6;
  v13 = MKTilePointForCoordinate(latitude, longitude, 21.0);
  -[MKMapView _setZoomScale:centerMapPoint:duration:timingFunction:animated:](self, "_setZoomScale:centerMapPoint:duration:timingFunction:animated:", v15, v7, a3, v13, v14, a5);

}

- (void)_goToMapRegion:(id)a3 duration:(double)a4 animated:(BOOL)a5
{
  -[MKMapView _goToMapRegion:duration:animated:completionHandler:](self, "_goToMapRegion:duration:animated:completionHandler:", a3, a5, 0, a4);
}

- (void)_goToMapRegion:(id)a3 duration:(double)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  -[MKMapView _goToMapRegion:duration:timingFunction:animated:completionHandler:](self, "_goToMapRegion:duration:timingFunction:animated:completionHandler:", a3, 0, a5, a6, a4);
}

uint64_t __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke(uint64_t a1)
{
  GEOMapRectForMapRegion();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "showAnnotationsInMapRect:");
}

uint64_t __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_solveForInput:");
}

- (void)setVisibleMapRect:(MKMapRect)mapRect edgePadding:(UIEdgeInsets)insets animated:(BOOL)animate
{
  _BOOL8 v5;
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30[9];
  id location[2];

  v5 = animate;
  right = insets.right;
  bottom = insets.bottom;
  left = insets.left;
  top = insets.top;
  height = mapRect.size.height;
  width = mapRect.size.width;
  y = mapRect.origin.y;
  x = mapRect.origin.x;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(location, self);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__MKMapView_setVisibleMapRect_edgePadding_animated___block_invoke;
    v29[3] = &unk_1E20D8790;
    objc_copyWeak(v30, location);
    v30[1] = *(id *)&x;
    v30[2] = *(id *)&y;
    v30[3] = *(id *)&width;
    v30[4] = *(id *)&height;
    v30[5] = *(id *)&top;
    v30[6] = *(id *)&left;
    v30[7] = *(id *)&bottom;
    v30[8] = *(id *)&right;
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v29);
    objc_destroyWeak(v30);
    objc_destroyWeak(location);
  }
  else
  {
    -[MKMapView visibleMapRect](self, "visibleMapRect");
    v21 = x == v18 && y == v15 && width == v16 && height == v17;
    if (v21
      && (left == *(double *)(MEMORY[0x1E0CEB4B0] + 8) ? (v25 = top == *MEMORY[0x1E0CEB4B0]) : (v25 = 0),
          v25 ? (v26 = right == *(double *)(MEMORY[0x1E0CEB4B0] + 24)) : (v26 = 0),
          v26 ? (v27 = bottom == *(double *)(MEMORY[0x1E0CEB4B0] + 16)) : (v27 = 0),
          v27))
    {
      MKGetMKMapViewLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18B0B0000, v28, OS_LOG_TYPE_DEBUG, "MKMapView: setVisibleMapRect:edgePadding:animated: requested rect is equal to existing rect", (uint8_t *)location, 2u);
      }

    }
    else
    {
      -[MKMapView _zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:](self, "_zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:", -1, -1, x, y, width, height, top, left, bottom, right);
      -[MKMapView _goToCenterCoordinate:zoomLevel:animated:](self, "_goToCenterCoordinate:zoomLevel:animated:", v5, v23, v24, v22);
    }
  }
}

void __52__MKMapView_setVisibleMapRect_edgePadding_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

}

- (void)_setVisibleMapRect:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  double var1;
  double var0;
  double v8;
  double v9;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  _QWORD v18[4];
  id v19[5];
  id location;

  v5 = a4;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__MKMapView__setVisibleMapRect_animated_completionHandler___block_invoke;
    v18[3] = &unk_1E20D8718;
    objc_copyWeak(v19, &location);
    v19[1] = *(id *)&v9;
    v19[2] = *(id *)&v8;
    v19[3] = *(id *)&var0;
    v19[4] = *(id *)&var1;
    -[MKMapView _addSetRegionBlock:completion:](self, "_addSetRegionBlock:completion:", v18, v11);
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView mapRectThatFits:](self, "mapRectThatFits:", v9, v8, var0, var1);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithMapRect:", v12, v13, v14, v15);
    v17 = 0.0;
    if (v5)
      -[VKMapView durationToAnimateToMapRegion:](self->_mapView, "durationToAnimateToMapRegion:", v16, 0.0);
    -[MKMapView _goToMapRegion:duration:animated:completionHandler:](self, "_goToMapRegion:duration:animated:completionHandler:", v16, v5, v11, v17);

  }
}

void __59__MKMapView__setVisibleMapRect_animated_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));

}

- (void)_setVisibleMapRect:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18[5];
  id location;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__MKMapView__setVisibleMapRect_duration_completionHandler___block_invoke;
    v17[3] = &unk_1E20D8718;
    objc_copyWeak(v18, &location);
    v18[1] = *(id *)&v9;
    v18[2] = *(id *)&v8;
    v18[3] = *(id *)&var0;
    v18[4] = *(id *)&var1;
    -[MKMapView _addSetRegionBlock:completion:](self, "_addSetRegionBlock:completion:", v17, v11);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView mapRectThatFits:](self, "mapRectThatFits:", v9, v8, var0, var1);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithMapRect:", v12, v13, v14, v15);
    -[MKMapView _goToMapRegion:duration:animated:completionHandler:](self, "_goToMapRegion:duration:animated:completionHandler:", v16, a4 > 0.0, v11, a4);

  }
}

void __59__MKMapView__setVisibleMapRect_duration_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));

}

- (void)setVisibleMapRect:(MKMapRect)visibleMapRect
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;

  height = visibleMapRect.size.height;
  width = visibleMapRect.size.width;
  y = visibleMapRect.origin.y;
  x = visibleMapRect.origin.x;
  v8 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  -[MKMapView setVisibleMapRect:edgePadding:animated:](self, "setVisibleMapRect:edgePadding:animated:", v8, x, y, width, height, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
}

- (void)setVisibleMapRect:(MKMapRect)mapRect animated:(BOOL)animate
{
  -[MKMapView setVisibleMapRect:edgePadding:animated:](self, "setVisibleMapRect:edgePadding:animated:", animate, mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
}

- (double)_defaultAnimationDurationForMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  -[MKMapView _zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:](self, "_zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:", -1, -1, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, a4.top, a4.left, a4.bottom, a4.right);
  v6 = v5;
  v8 = v7;
  v9 = -1.0;
  if (v10 != -1.0)
  {
    -[MKMapView _boundedZoomLevel:](self, "_boundedZoomLevel:");
    v9 = v11;
  }
  -[MKMapView _mapRegionWithCenterCoordinate:zoomScale:](self, "_mapRegionWithCenterCoordinate:zoomScale:", v6, v8, (double)(1.0 / exp2(21.0 - v9)));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView durationToAnimateToMapRegion:](self->_mapView, "durationToAnimateToMapRegion:", v12);
  v14 = v13;

  return v14;
}

- (double)_panDurationFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  return fmin(fmax(sqrt((a4.x - a3.x) * (a4.x - a3.x) + (a4.y - a3.y) * (a4.y - a3.y)) * 0.00156250002, 0.200000003), 1.0);
}

- (double)_zoomScaleForMapRegion:(id)a3
{
  double v4;
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
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double result;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;

  GEOMapRectForMapRegion();
  v5 = v4;
  v7 = v6;
  -[VKMapView mapRegionBounds](self->_mapView, "mapRegionBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v17 = v9 + v16;
  v19 = v11 + v18;
  v21 = v13 - (v16 + v20);
  v23 = v15 - (v18 + v22);
  memset(&v27, 0, sizeof(v27));
  -[VKMapView presentationYaw](self->_mapView, "presentationYaw");
  CGAffineTransformMakeRotation(&v27, v24 * -0.0174532925);
  v26 = v27;
  v28.origin.x = v17;
  v28.origin.y = v19;
  v28.size.width = v21;
  v28.size.height = v23;
  v29 = CGRectApplyAffineTransform(v28, &v26);
  result = v29.size.width / v5;
  if (v29.size.width / v5 >= v29.size.height / v7)
    result = v29.size.height / v7;
  if (fabs(result) == INFINITY)
    return 0.001953125;
  return result;
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double longitude;
  double latitude;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  id v19;
  _QWORD v20[4];
  id v21[4];
  BOOL v22;
  id location;

  v5 = a5;
  longitude = a3.longitude;
  latitude = a3.latitude;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__MKMapView_setCenterCoordinate_zoomLevel_animated___block_invoke;
    v20[3] = &unk_1E20D87E0;
    objc_copyWeak(v21, &location);
    v21[1] = *(id *)&latitude;
    v21[2] = *(id *)&longitude;
    v21[3] = *(id *)&a4;
    v22 = v5;
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v20);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView _mapRegionWithCenterCoordinate:zoomScale:](self, "_mapRegionWithCenterCoordinate:zoomScale:", latitude, longitude, (double)(1.0 / exp2(21.0 - a4)));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
    if (v5)
    {
      -[MKMapView vk_mapLayer](self, "vk_mapLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "durationToAnimateToMapRegion:", v19);
      v10 = v12;

    }
    -[MKMapView vk_mapLayer](self, "vk_mapLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView vk_mapLayer](self, "vk_mapLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pitch");
    v16 = v15;
    -[MKMapView vk_mapLayer](self, "vk_mapLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "yaw");
    objc_msgSend(v13, "setMapRegion:pitch:yaw:duration:completion:", v19, 0, v16, v18, v10);

  }
}

void __52__MKMapView_setCenterCoordinate_zoomLevel_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCenterCoordinate:zoomLevel:animated:", *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

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
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("bounds")))
  {
    -[MKMapView _updateInsetsWithForce:](self, "_updateInsetsWithForce:", 1);
  }
  else if ((void *)MKMapConfigurationKVOContext == a6)
  {
    -[MKMapView _setPreferredConfiguration:onInit:](self, "_setPreferredConfiguration:onInit:", self->_preferredConfiguration, 0);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MKMapView;
    -[MKMapView observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (UIEdgeInsets)_labelEdgeInsets
{
  float v2;
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  UIEdgeInsets result;

  -[VKMapView labelEdgeInsets](self->_mapView, "labelEdgeInsets");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  result.right = v9;
  result.bottom = v7;
  result.left = v5;
  result.top = v3;
  return result;
}

- (void)_setLabelEdgeInsets:(UIEdgeInsets)a3
{
  *(float *)&a3.top = a3.top;
  *(float *)&a3.left = a3.left;
  *(float *)&a3.bottom = a3.bottom;
  *(float *)&a3.right = a3.right;
  -[VKMapView setLabelEdgeInsets:](self->_mapView, "setLabelEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (UIEdgeInsets)_labelEdgeWidths
{
  float v2;
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  UIEdgeInsets result;

  -[VKMapView labelEdgeWidths](self->_mapView, "labelEdgeWidths");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  result.right = v9;
  result.bottom = v7;
  result.left = v5;
  result.top = v3;
  return result;
}

- (void)_setLabelEdgeWidths:(UIEdgeInsets)a3
{
  *(float *)&a3.top = a3.top;
  *(float *)&a3.left = a3.left;
  *(float *)&a3.bottom = a3.bottom;
  *(float *)&a3.right = a3.right;
  -[VKMapView setLabelEdgeWidths:](self->_mapView, "setLabelEdgeWidths:", a3.top, a3.left, a3.bottom, a3.right);
}

- (UILayoutGuide)_edgeInsetsLayoutGuide
{
  UILayoutGuide *edgeInsetsGuide;
  UILayoutGuide *v4;
  UILayoutGuide *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *edgeInsetsTopConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *edgeInsetsLeftConstraint;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *edgeInsetsRightConstraint;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *edgeInsetsBottomConstraint;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *v24;
  void *v25;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  edgeInsetsGuide = self->_edgeInsetsGuide;
  if (!edgeInsetsGuide)
  {
    v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    v5 = self->_edgeInsetsGuide;
    self->_edgeInsetsGuide = v4;

    -[UILayoutGuide setIdentifier:](self->_edgeInsetsGuide, "setIdentifier:", CFSTR("Edge Insets"));
    -[UILayoutGuide topAnchor](self->_edgeInsetsGuide, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView topAnchor](self, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, self->_edgeInsets.top);
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    edgeInsetsTopConstraint = self->_edgeInsetsTopConstraint;
    self->_edgeInsetsTopConstraint = v8;

    -[UILayoutGuide leftAnchor](self->_edgeInsetsGuide, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView leftAnchor](self, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, self->_edgeInsets.left);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    edgeInsetsLeftConstraint = self->_edgeInsetsLeftConstraint;
    self->_edgeInsetsLeftConstraint = v12;

    -[UILayoutGuide rightAnchor](self->_edgeInsetsGuide, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView rightAnchor](self, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -self->_edgeInsets.right);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    edgeInsetsRightConstraint = self->_edgeInsetsRightConstraint;
    self->_edgeInsetsRightConstraint = v16;

    -[UILayoutGuide bottomAnchor](self->_edgeInsetsGuide, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView bottomAnchor](self, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -self->_edgeInsets.bottom);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    edgeInsetsBottomConstraint = self->_edgeInsetsBottomConstraint;
    self->_edgeInsetsBottomConstraint = v20;

    -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_edgeInsetsGuide);
    v22 = (void *)MEMORY[0x1E0CB3718];
    v23 = self->_edgeInsetsLeftConstraint;
    v27[0] = self->_edgeInsetsTopConstraint;
    v27[1] = v23;
    v24 = self->_edgeInsetsBottomConstraint;
    v27[2] = self->_edgeInsetsRightConstraint;
    v27[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v25);

    edgeInsetsGuide = self->_edgeInsetsGuide;
  }
  return edgeInsetsGuide;
}

- (void)_suspendPropagatingEdgeInsets
{
  ++self->_suspendPropagatingEdgeInsetsCount;
}

- (void)_resumePropagatingEdgeInsets
{
  unint64_t suspendPropagatingEdgeInsetsCount;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;

  suspendPropagatingEdgeInsetsCount = self->_suspendPropagatingEdgeInsetsCount;
  if (suspendPropagatingEdgeInsetsCount)
  {
    v4 = suspendPropagatingEdgeInsetsCount - 1;
    self->_suspendPropagatingEdgeInsetsCount = v4;
    if (!v4)
    {
      -[MKMapView _edgeInsets](self, "_edgeInsets");
      *(float *)&v5 = v5;
      *(float *)&v6 = v6;
      *(float *)&v7 = v7;
      *(float *)&v8 = v8;
      -[VKMapView setEdgeInsets:](self->_mapView, "setEdgeInsets:", v5, v6, v7, v8);
    }
  }
}

void __37__MKMapView__setEdgeInsets_explicit___block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      WeakRetained[125] &= ~0x1000000uLL;
      if (*((_BYTE *)WeakRetained + 1137))
      {
        *((_BYTE *)WeakRetained + 1137) = 0;
        v4 = WeakRetained;
        objc_msgSend(WeakRetained, "_updateInsetsWithForce:", 0);
        WeakRetained = v4;
      }
    }
  }

}

- (VKVenueFeatureMarker)venueWithFocus
{
  return (VKVenueFeatureMarker *)-[VKMapView venueWithFocus](self->_mapView, "venueWithFocus");
}

- (id)venueWithID:(unint64_t)a3
{
  return (id)-[VKMapView venueWithID:](self->_mapView, "venueWithID:", a3);
}

- (VKVenueBuildingFeatureMarker)venueBuildingWithFocus
{
  return (VKVenueBuildingFeatureMarker *)-[VKMapView venueBuildingWithFocus](self->_mapView, "venueBuildingWithFocus");
}

- (void)setDimmingOutsideVenueWithFocus:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[VKMapView isDimmingBaseMap](self->_mapView, "isDimmingBaseMap") != a3)
    -[VKMapView setDimmingBaseMap:](self->_mapView, "setDimmingBaseMap:", v3);
}

- (BOOL)_isDimmingOutsideVenueWithFocus
{
  return -[VKMapView isDimmingBaseMap](self->_mapView, "isDimmingBaseMap");
}

- (double)zoomToFocusVenue:(id)a3
{
  float v4;
  double result;

  -[VKMapView zoomToRevealVenueFloorplan:](self->_mapView, "zoomToRevealVenueFloorplan:", a3);
  -[MKMapView _mapKitZoomLevelForVectorKitTileZoomLevel:](self, "_mapKitZoomLevelForVectorKitTileZoomLevel:", v4);
  return result;
}

- (double)zoomToFocusVenueBuilding:(id)a3
{
  float v4;
  double result;

  -[VKMapView zoomToRevealVenueBuildingFloorplan:](self->_mapView, "zoomToRevealVenueBuildingFloorplan:", a3);
  -[MKMapView _mapKitZoomLevelForVectorKitTileZoomLevel:](self, "_mapKitZoomLevelForVectorKitTileZoomLevel:", v4);
  return result;
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forBuildingsInVenue:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  MKMapViewDelegate *v13;
  MKMapViewDelegate *v14;
  char v15;
  MKMapViewDelegate *v16;
  MKMapViewDelegate *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "venueID") == self->_cachedVenueIDWithFocus)
    self->_cachedDisplayedFloorOrdinalForVenueWithFocus = v4;
  v7 = -[MKMapView displayedFloorOrdinalForBuildingsInVenue:](self, "displayedFloorOrdinalForBuildingsInVenue:", v6);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "buildings", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        -[VKMapView setDisplayedFloorOrdinal:forVenueBuilding:](self->_mapView, "setDisplayedFloorOrdinal:forVenueBuilding:", v4, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if (v7 != (_DWORD)v4)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v13 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v13 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v16 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v16 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;
      -[MKMapViewDelegate mapView:didChangeDisplayedFloorOrdinal:forVenue:](v16, "mapView:didChangeDisplayedFloorOrdinal:forVenue:", self, v4, v6);

    }
  }

}

- (void)resetDisplayedFloorOrdinalForAllVenues
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  MKMapViewDelegate *v19;
  MKMapViewDelegate *v20;
  char v21;
  MKMapViewDelegate *v22;
  MKMapViewDelegate *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[VKMapView clearVenueBuildingFloorSelections](self->_mapView, "clearVenueBuildingFloorSelections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "venueID", v24));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(obj);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "unsignedLongLongValue", v24);
          -[VKMapView venueWithID:](self->_mapView, "venueWithID:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = -[MKMapView displayedFloorOrdinalForBuildingsInVenue:](self, "displayedFloorOrdinalForBuildingsInVenue:", v16);
            v18 = v17;
            if (v15 == self->_cachedVenueIDWithFocus)
              self->_cachedDisplayedFloorOrdinalForVenueWithFocus = v17;
            if (qword_1EDFB79F8 != -1)
              dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
            if (byte_1EDFB7994)
            {
              v19 = self->_unsafeDelegate;
            }
            else
            {
              -[MKMapView _safeDelegate](self, "_safeDelegate");
              v19 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
            }
            v20 = v19;
            v21 = objc_opt_respondsToSelector();

            if ((v21 & 1) != 0)
            {
              if (qword_1EDFB79F8 != -1)
                dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
              if (byte_1EDFB7994)
              {
                v22 = self->_unsafeDelegate;
              }
              else
              {
                -[MKMapView _safeDelegate](self, "_safeDelegate");
                v22 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
              }
              v23 = v22;
              -[MKMapViewDelegate mapView:didChangeDisplayedFloorOrdinal:forVenue:](v22, "mapView:didChangeDisplayedFloorOrdinal:forVenue:", self, v18, v16);

            }
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v12);
    }

    v3 = v24;
  }

}

- (signed)displayedFloorOrdinalForBuildingsInVenue:(id)a3
{
  void *v4;
  void *v5;
  signed __int16 v6;

  objc_msgSend(a3, "buildings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[VKMapView displayedFloorOrdinalForVenueBuilding:](self->_mapView, "displayedFloorOrdinalForVenueBuilding:", v5);
  else
    v6 = 0;

  return v6;
}

- (BOOL)displayedFloorIsDefaultForBuildingsInVenue:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "buildings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[VKMapView displayedFloorIsDefaultForVenueBuilding:](self->_mapView, "displayedFloorIsDefaultForVenueBuilding:", v5);
  else
    v6 = 1;

  return v6;
}

- (signed)defaultFloorForBuildingsInVenue:(id)a3
{
  void *v4;
  void *v5;
  signed __int16 v6;

  objc_msgSend(a3, "buildings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[VKMapView defaultFloorOrdinalForVenueBuilding:](self->_mapView, "defaultFloorOrdinalForVenueBuilding:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)setSelectedVenuePoiFeatureId:(unint64_t)a3
{
  -[VKMapView setSelectedVenuePoiFeatureId:](self->_mapView, "setSelectedVenuePoiFeatureId:", a3);
}

- (void)deselectVenuePoiFeatureId
{
  -[VKMapView deselectVenuePoiFeatureId](self->_mapView, "deselectVenuePoiFeatureId");
}

- (void)setSelectedTrailId:(unint64_t)a3
{
  -[VKMapView setSelectedTrailId:](self->_mapView, "setSelectedTrailId:", a3);
}

- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5
{
  -[VKMapView setSelectedTrailWithId:name:locale:](self->_mapView, "setSelectedTrailWithId:name:locale:", a3, a4, a5);
}

- (void)deselectTrails
{
  -[VKMapView deselectTrails](self->_mapView, "deselectTrails");
}

- (void)requestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a3
{
  VKMapView *mapView;

  mapView = self->_mapView;
  VKLocationCoordinate2DMake();
  -[VKMapView requestHikingToolTipRegionIDForLocation:](mapView, "requestHikingToolTipRegionIDForLocation:");
}

- (void)_prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__MKMapView__prepareFlyoverAnimation_completion___block_invoke;
    v8[3] = &unk_1E20D8808;
    objc_copyWeak(&v11, &location);
    v9 = v6;
    v10 = v7;
    -[MKMapView _addDependentAuxiliaryBlock:](self, "_addDependentAuxiliaryBlock:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[VKMapView prepareFlyoverAnimation:completion:](self->_mapView, "prepareFlyoverAnimation:completion:", v6, v7);
  }

}

void __49__MKMapView__prepareFlyoverAnimation_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_prepareFlyoverAnimation:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_performFlyoverAnimation:(id)a3
{
  -[MKMapView _performFlyoverAnimation:animateToStart:](self, "_performFlyoverAnimation:animateToStart:", a3, 0);
}

- (void)_performFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  VKMapView *mapView;
  _QWORD v11[5];
  BOOL v12;
  BOOL v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  id location;

  v4 = a4;
  v6 = a3;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke;
    v15[3] = &unk_1E20D8830;
    objc_copyWeak(&v17, &location);
    v16 = v6;
    v18 = v4;
    -[MKMapView _addDependentAuxiliaryBlock:](self, "_addDependentAuxiliaryBlock:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = -[MKMapView showsUserLocation](self, "showsUserLocation");
    v8 = -[MKMapView isCompassEnabled](self, "isCompassEnabled");
    -[MKMapView setCompassEnabled:](self, "setCompassEnabled:", 0);
    v9 = -[MKMapView showsScale](self, "showsScale");
    -[MKMapView setShowsScale:](self, "setShowsScale:", 0);
    -[MKMapView setShowsCompass:](self, "setShowsCompass:", 0);
    -[MKMapView setShowsUserLocation:](self, "setShowsUserLocation:", 0);
    mapView = self->_mapView;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke_2;
    v11[3] = &unk_1E20D8858;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    v14 = v7;
    -[VKMapView startFlyoverAnimation:animateToStart:completion:](mapView, "startFlyoverAnimation:animateToStart:completion:", v6, v4, v11);
  }

}

void __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performFlyoverAnimation:animateToStart:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

uint64_t __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompassEnabled:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setShowsScale:", *(unsigned __int8 *)(a1 + 41));
  objc_msgSend(*(id *)(a1 + 32), "setShowsCompass:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setShowsUserLocation:", *(unsigned __int8 *)(a1 + 42));
}

- (void)_startFlyoverTourAnimation:(unint64_t)a3 duration:(double)a4 completion:(id)a5
{
  id v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  MKMapItemIdentifier *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  double v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  id v25[3];
  id location;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke;
    v23[3] = &unk_1E20D8880;
    objc_copyWeak(v25, &location);
    v25[1] = (id)a3;
    v25[2] = *(id *)&a4;
    v24 = v8;
    -[MKMapView _addDependentAuxiliaryBlock:](self, "_addDependentAuxiliaryBlock:", v23);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = -[MKMapView showsUserLocation](self, "showsUserLocation");
    v10 = -[MKMapView showsCompass](self, "showsCompass");
    -[MKMapView setCompassEnabled:](self, "setCompassEnabled:", 0);
    v11 = -[MKMapView showsScale](self, "showsScale");
    -[MKMapView setShowsScale:](self, "setShowsScale:", 0);
    -[MKMapView setShowsCompass:](self, "setShowsCompass:", 0);
    -[MKMapView setShowsUserLocation:](self, "setShowsUserLocation:", 0);
    v12 = -[MKMapItemIdentifier initWithMUID:]([MKMapItemIdentifier alloc], "initWithMUID:", a3);
    +[MKMapService sharedService](MKMapService, "sharedService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ticketForIdentifiers:traits:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_2;
    v16[3] = &unk_1E20D88F8;
    v18 = a4;
    v16[4] = self;
    v20 = v10;
    v21 = v11;
    v22 = v9;
    v17 = v8;
    v19 = a3;
    objc_msgSend(v15, "submitWithHandler:networkActivity:", v16, 0);

  }
}

void __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startFlyoverTourAnimation:duration:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));

}

void __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  id *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  char v17;
  __int16 v18;
  _QWORD v19[5];
  id v20;
  char v21;
  __int16 v22;
  _QWORD v23[5];
  id v24;
  id v25;
  char v26;
  __int16 v27;

  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(v4 + 672);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_6;
    v15[3] = &unk_1E20D88A8;
    v7 = *(_QWORD *)(a1 + 56);
    v15[1] = 3221225472;
    v15[4] = v4;
    v17 = *(_BYTE *)(a1 + 64);
    v18 = *(_WORD *)(a1 + 65);
    v16 = v5;
    objc_msgSend(v6, "startFlyoverTourAnimation:animateToStart:completion:", v7, 1, v15);

  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "_hasFlyover"))
    {
      v9 = *(double *)(a1 + 48);
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 672);
      objc_msgSend(v8, "_flyover");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 <= 0.0)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_5;
        v19[3] = &unk_1E20D88A8;
        v14 = *(void **)(a1 + 40);
        v19[4] = *(_QWORD *)(a1 + 32);
        v21 = *(_BYTE *)(a1 + 64);
        v13 = &v20;
        v22 = *(_WORD *)(a1 + 65);
        v20 = v14;
        objc_msgSend(v10, "startFlyoverAnimation:animateToStart:completion:", v11, 1, v19);
      }
      else
      {
        v12 = *(double *)(a1 + 48);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_3;
        v23[3] = &unk_1E20D88D0;
        v23[4] = *(_QWORD *)(a1 + 32);
        v13 = &v24;
        v24 = v8;
        v26 = *(_BYTE *)(a1 + 64);
        v27 = *(_WORD *)(a1 + 65);
        v25 = *(id *)(a1 + 40);
        objc_msgSend(v10, "moveToFlyoverTourStartPosition:duration:completion:", v11, v23, v12);

        v11 = v25;
      }

    }
  }
}

void __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  char v6;
  __int16 v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 672);
  objc_msgSend(*(id *)(a1 + 40), "_flyover");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_4;
  v4[3] = &unk_1E20D88A8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 56);
  v7 = *(_WORD *)(a1 + 57);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "startFlyoverAnimation:animateToStart:completion:", v3, 0, v4);

}

uint64_t __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCompassEnabled:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setShowsScale:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(*(id *)(a1 + 32), "setShowsCompass:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setShowsUserLocation:", *(unsigned __int8 *)(a1 + 50));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCompassEnabled:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setShowsScale:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(*(id *)(a1 + 32), "setShowsCompass:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setShowsUserLocation:", *(unsigned __int8 *)(a1 + 50));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCompassEnabled:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setShowsScale:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(*(id *)(a1 + 32), "setShowsCompass:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setShowsUserLocation:", *(unsigned __int8 *)(a1 + 50));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_stopFlyoverAnimation
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __34__MKMapView__stopFlyoverAnimation__block_invoke;
    v3[3] = &unk_1E20D8A58;
    objc_copyWeak(&v4, &location);
    -[MKMapView _addDependentAuxiliaryBlock:](self, "_addDependentAuxiliaryBlock:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    -[VKMapView stopFlyoverAnimation](self->_mapView, "stopFlyoverAnimation");
  }
}

void __34__MKMapView__stopFlyoverAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopFlyoverAnimation");

}

- (void)_pauseFlyoverAnimation
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __35__MKMapView__pauseFlyoverAnimation__block_invoke;
    v4[3] = &unk_1E20D8A58;
    objc_copyWeak(&v5, &location);
    -[MKMapView _addDependentAuxiliaryBlock:](self, "_addDependentAuxiliaryBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView vk_mapLayer](self, "vk_mapLayer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseFlyoverTourAnimation");

  }
}

void __35__MKMapView__pauseFlyoverAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pauseFlyoverAnimation");

}

- (void)_resumeFlyoverAnimation
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36__MKMapView__resumeFlyoverAnimation__block_invoke;
    v4[3] = &unk_1E20D8A58;
    objc_copyWeak(&v5, &location);
    -[MKMapView _addDependentAuxiliaryBlock:](self, "_addDependentAuxiliaryBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView vk_mapLayer](self, "vk_mapLayer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumeFlyoverTourAnimation");

  }
}

void __36__MKMapView__resumeFlyoverAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resumeFlyoverAnimation");

}

- (void)setFlyoverMode:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[MKMapView _mapLayer](self, "_mapLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlyoverMode:", v3);

}

- (void)mapLayerWillEnterAR:(id)a3
{
  MKMapViewDelegate **p_safeDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_safeDelegate = &self->_safeDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    objc_msgSend(v7, "mapViewWillEnterAR:", self);

  }
}

- (void)mapLayerDidEnterAR:(id)a3
{
  MKMapViewDelegate **p_safeDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_safeDelegate = &self->_safeDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    objc_msgSend(v7, "mapViewDidEnterAR:", self);

  }
}

- (void)mapLayerDidExitAR:(id)a3
{
  MKMapViewDelegate **p_safeDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_safeDelegate = &self->_safeDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    objc_msgSend(v7, "mapViewDidExitAR:", self);

  }
}

- (void)mapLayer:(id)a3 didEncounterARError:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    objc_msgSend(v7, "mapView:didEncounterARError:", self, v8);

  }
}

- (void)mapLayer:(id)a3 arTrackingStateDidChange:(unint64_t)a4 reason:(unint64_t)a5
{
  MKMapViewDelegate **p_safeDelegate;
  id WeakRetained;
  char v10;
  id v11;

  p_safeDelegate = &self->_safeDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_safeDelegate);
    objc_msgSend(v11, "mapView:arTrackingStateDidChange:reason:", self, a4, a5);

  }
}

- (void)mapLayer:(id)a3 arSessionWasInterrupted:(unint64_t)a4
{
  MKMapViewDelegate **p_safeDelegate;
  id WeakRetained;
  char v8;
  id v9;

  p_safeDelegate = &self->_safeDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_safeDelegate);
    objc_msgSend(v9, "mapView:arSessionWasInterrupted:", self, a4);

  }
}

- (void)mapLayer:(id)a3 puckLocationTracingEvent:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    objc_msgSend(v7, "mapView:puckLocationTracingEvent:", self, v8);

  }
}

- (void)mapLayerARSessionInterruptionEnded:(id)a3
{
  MKMapViewDelegate **p_safeDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_safeDelegate = &self->_safeDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    objc_msgSend(v7, "mapViewARSessionInterruptionEnded:", self);

  }
}

- (void)_addAnnotationsCustomFeatureStoreIfNeeded
{
  _MKCustomFeatureStore *v3;
  _MKCustomFeatureStore *annotationsCustomFeatureStore;

  if (!self->_annotationsCustomFeatureStore)
  {
    v3 = -[_MKCustomFeatureStore initWithClustering:]([_MKCustomFeatureStore alloc], "initWithClustering:", 0);
    annotationsCustomFeatureStore = self->_annotationsCustomFeatureStore;
    self->_annotationsCustomFeatureStore = v3;

    -[MKMapView _setDisplayedSearchResultsType:](self, "_setDisplayedSearchResultsType:", 1);
    -[MKMapView _addCustomFeatureDataSource:](self, "_addCustomFeatureDataSource:", self->_annotationsCustomFeatureStore);
  }
}

- (void)removeAnnotationRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKCustomFeatureStore *annotationsCustomFeatureStore;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "viewRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, 0x1E20E6500, v5);

    -[MKMapView userLocationView](self, "userLocationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      -[MKAnnotationContainerView setUserLocationView:](self->_annotationContainer, "setUserLocationView:", 0);
      -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stop");

      objc_msgSend(v5, "_setVKNavigationPuckMarker:", 0);
    }
    -[MKMapView vk_mapLayer](self, "vk_mapLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeExternalAnchor:", v10);

    -[MKAnnotationContainerView removeAnnotationView:](self->_annotationContainer, "removeAnnotationView:", v5);
  }
  else
  {
    -[MKMapView _addAnnotationsCustomFeatureStoreIfNeeded](self, "_addAnnotationsCustomFeatureStoreIfNeeded");
    annotationsCustomFeatureStore = self->_annotationsCustomFeatureStore;
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKCustomFeatureStore removeAnnotations:](annotationsCustomFeatureStore, "removeAnnotations:", v12);

  }
}

- (void)selectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id selectAnnotationViewAfterRedrawBlock;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  id location;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "viewRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((*(_QWORD *)&self->_flags & 0x400000000) != 0)
    {
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __53__MKMapView_selectAnnotationRepresentation_animated___block_invoke;
      v11[3] = &unk_1E20D8830;
      objc_copyWeak(&v13, &location);
      v12 = v6;
      v14 = v4;
      v9 = (void *)objc_msgSend(v11, "copy");
      selectAnnotationViewAfterRedrawBlock = self->_selectAnnotationViewAfterRedrawBlock;
      self->_selectAnnotationViewAfterRedrawBlock = v9;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      -[MKAnnotationContainerView selectAnnotationView:animated:](self->_annotationContainer, "selectAnnotationView:animated:", v7, v4);
    }
  }
  else
  {
    -[MKMapView _addAnnotationsCustomFeatureStoreIfNeeded](self, "_addAnnotationsCustomFeatureStoreIfNeeded");
    -[MKMapView _labelMarkerForCustomFeatureAnnotation:](self, "_labelMarkerForCustomFeatureAnnotation:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView selectLabelMarker:](self->_mapView, "selectLabelMarker:", v8);

  }
}

void __53__MKMapView_selectAnnotationRepresentation_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "selectAnnotationRepresentation:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)deselectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id selectAnnotationViewAfterRedrawBlock;
  id v7;

  v4 = a4;
  objc_msgSend(a3, "viewRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    selectAnnotationViewAfterRedrawBlock = self->_selectAnnotationViewAfterRedrawBlock;
    self->_selectAnnotationViewAfterRedrawBlock = 0;

    -[MKAnnotationContainerView deselectAnnotationView:animated:](self->_annotationContainer, "deselectAnnotationView:animated:", v7, v4);
  }
  else
  {
    -[MKMapView _addAnnotationsCustomFeatureStoreIfNeeded](self, "_addAnnotationsCustomFeatureStoreIfNeeded");
    -[MKMapView _deselectLabelMarkerAnimated:](self, "_deselectLabelMarkerAnimated:", v4);
  }

}

- (void)moveAnnotationRepresentation:(id)a3 fromCoordinate:(CLLocationCoordinate2D)a4 animated:(BOOL)a5 duration:(double)a6
{
  void *v7;
  void *v8;

  objc_msgSend(a3, "viewRepresentation", a4.latitude, a4.longitude, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    -[MKAnnotationContainerView updateAnnotationView:](self->_annotationContainer, "updateAnnotationView:", v7);
    v7 = v8;
  }

}

- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFraction:(double)a3 ofVisible:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MKMapRect v15;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v6 = INFINITY;
  if (a4.var0.var0 == INFINITY && a4.var0.var1 == INFINITY)
  {
    v10 = INFINITY;
  }
  else
  {
    v8 = -(a4.var1.var1 * a3);
    v9 = -(var0 * a3);
    v10 = a4.var0.var0 + v9;
    v6 = a4.var0.var1 + v8;
    var0 = var0 - v9 * 2.0;
    var1 = a4.var1.var1 - v8 * 2.0;
  }
  v15.size.width = 268435456.0;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.height = 268435456.0;
  v11 = v10;
  v12 = var0;
  result = ($FD2884BA735A6398BD92EEF91FE53E55)MKMapRectIntersection(v15, *(MKMapRect *)(&v6 - 1));
  v13 = v10;
  v14 = var0;
  result.var1.var0 = v14;
  result.var0.var0 = v13;
  return result;
}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  return -[VKMapView shouldHideOffscreenSelectedAnnotation](self->_mapView, "shouldHideOffscreenSelectedAnnotation");
}

- (BOOL)_shouldCallAnnotationViewCallback:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v3, "shouldShowCallout");

  return v4;
}

- (void)annotationManager:(id)a3 didSelectAnnotationRepresentation:(id)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  MKMapViewLabelMarkerState *v8;
  MKMapViewLabelMarkerState *selectedLabelMarkerState;
  MKMapViewDelegate *v10;
  char v11;
  void *v12;
  void *v13;
  MKMapViewLabelMarkerState *v14;
  MKMapViewLabelMarkerState *v15;
  MKMapViewDelegate *v16;
  MKMapViewDelegate *v17;
  char v18;
  MKMapViewDelegate *v19;
  MKMapViewDelegate *v20;
  void *v21;
  char v22;
  MKMapViewDelegate *v23;
  MKMapViewDelegate *v24;
  MKMapViewDelegate *v25;
  MKMapViewDelegate *v26;
  char v27;
  MKMapViewDelegate *v28;
  id v29;

  v29 = a4;
  objc_msgSend(v29, "viewRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MKMapView _addAnnotationsCustomFeatureStoreIfNeeded](self, "_addAnnotationsCustomFeatureStoreIfNeeded");
    -[MKMapView _labelMarkerForCustomFeatureAnnotation:](self, "_labelMarkerForCustomFeatureAnnotation:", v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView _selectLabelMarker:animated:](self, "_selectLabelMarker:animated:", v7, 1);
LABEL_56:

    goto LABEL_57;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v5, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    +[MKMapViewLabelMarkerState stateForLabelMarker:](MKMapViewLabelMarkerState, "stateForLabelMarker:", v7);
    v8 = (MKMapViewLabelMarkerState *)objc_claimAutoreleasedReturnValue();
    selectedLabelMarkerState = self->_selectedLabelMarkerState;
    self->_selectedLabelMarkerState = v8;

    -[VKMapView selectLabelMarker:](self->_mapView, "selectLabelMarker:", v7);
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v10 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v10;
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_56;
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v19 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v19 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;
    -[MKMapViewDelegate mapView:didSelectLabelMarker:](v19, "mapView:didSelectLabelMarker:", self, v7);
    goto LABEL_55;
  }
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v5, "annotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "marker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[MKMapViewLabelMarkerState stateForLabelMarker:](MKMapViewLabelMarkerState, "stateForLabelMarker:", v13);
    v14 = (MKMapViewLabelMarkerState *)objc_claimAutoreleasedReturnValue();
    v15 = self->_selectedLabelMarkerState;
    self->_selectedLabelMarkerState = v14;

    -[VKMapView selectLabelMarker:](self->_mapView, "selectLabelMarker:", v13);
  }
  if (-[MKMapView _shouldCallAnnotationViewCallback:](self, "_shouldCallAnnotationViewCallback:", v5))
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v16 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v16 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v20 = v16;
    }
    else
    {
      v20 = 0;
    }
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v23 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v23 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;
      }
      else
      {
        v24 = 0;
      }
      -[MKMapViewDelegate mapView:didSelectAnnotationView:](v24, "mapView:didSelectAnnotationView:", self, v5);

    }
  }
  if (self)
  {
    if (qword_1EDFB79F8 != -1)
      dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
    if (byte_1EDFB7994)
    {
      v25 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v25 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;
  }
  else
  {
    v26 = 0;
  }
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v28 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v28 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v28;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "annotation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapView:didSelectAnnotation:", self, v21);
LABEL_55:

    goto LABEL_56;
  }
LABEL_57:

}

- (BOOL)annotationManager:(id)a3 shouldAnimateDeselectionOfAnnotation:(id)a4 forSelectionOfAnnotation:(id)a5
{
  id v5;
  char isKindOfClass;

  v5 = a4;
  if (_MKLinkedOnOrAfterReleaseSet(2053))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)annotationManager:(id)a3 canSelectAnnotationRepresentation:(id)a4
{
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  char v9;

  objc_msgSend(a4, "viewRepresentation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v4, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v4, "annotation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "marker");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
LABEL_6:
    v9 = 1;
    goto LABEL_7;
  }
LABEL_5:
  v9 = objc_msgSend(v6, "isVisible");

LABEL_7:
  return v9;
}

- (void)annotationManager:(id)a3 willDeselectAnnotationRepresentation:(id)a4
{
  void *v5;
  void *v6;
  char isKindOfClass;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  char v13;
  MKMapViewDelegate *v14;
  char v15;
  void *v16;
  MKMapViewDelegate *v17;
  MKMapViewDelegate *v18;
  MKMapViewDelegate *v19;
  char v20;
  MKMapViewDelegate *v21;
  id v22;

  v22 = a4;
  objc_msgSend(v22, "viewRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v5, "annotation"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0))
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v8 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v19 = v8;
      }
      else
      {
        v19 = 0;
      }
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        if (self)
        {
          if (qword_1EDFB79F8 != -1)
            dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
          if (byte_1EDFB7994)
          {
            v21 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v21 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v16 = v21;
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(v16, "_mapView:willDeselectLabelMarker:", self, v22);
LABEL_58:

      }
    }
    else
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v9 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v11 = v9;
      }
      else
      {
        v11 = 0;
      }
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        if (self)
        {
          if (qword_1EDFB79F8 != -1)
            dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
          if (byte_1EDFB7994)
          {
            v14 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v16 = v14;
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(v16, "_mapView:willDeselectAnnotationView:", self, v5);
        goto LABEL_58;
      }
    }
  }
  else
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v10;
    }
    else
    {
      v12 = 0;
    }
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[MKMapView _labelMarkerForCustomFeatureAnnotation:](self, "_labelMarkerForCustomFeatureAnnotation:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v17 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v17 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;
      }
      else
      {
        v18 = 0;
      }
      -[MKMapViewDelegate _mapView:willDeselectLabelMarker:](v18, "_mapView:willDeselectLabelMarker:", self, v16);

      goto LABEL_58;
    }
  }

}

- (void)annotationManager:(id)a3 didDeselectAnnotationRepresentation:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  id v10;
  MKMapViewLabelMarkerState *selectedLabelMarkerState;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  char v14;
  MKMapViewLabelMarkerState *v15;
  MKMapViewDelegate *v16;
  MKMapViewDelegate *v17;
  MKMapViewDelegate *v18;
  char v19;
  MKMapViewDelegate *v20;
  char v21;
  void *v22;
  MKMapViewDelegate *v23;
  void *v24;
  MKMapViewDelegate *v25;
  MKMapViewDelegate *v26;
  dispatch_time_t v27;
  id v28;
  char v29;
  MKMapViewDelegate *v30;
  MKMapViewDelegate *v31;
  MKMapViewDelegate *v32;
  MKMapViewDelegate *v33;
  char v34;
  MKMapViewDelegate *v35;
  _QWORD block[5];
  id v37;
  id v38;

  v5 = a4;
  objc_msgSend(v5, "viewRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v6, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      v10 = v8;
      -[VKMapView deselectLabelMarker](self->_mapView, "deselectLabelMarker");
      selectedLabelMarkerState = self->_selectedLabelMarkerState;
      self->_selectedLabelMarkerState = 0;

      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v12 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v18 = v12;
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v20 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v20 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v26 = v20;
        -[MKMapViewDelegate mapView:didDeselectLabelMarker:](v20, "mapView:didDeselectLabelMarker:", self, v10);

      }
      v27 = dispatch_time(0, 250000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__MKMapView_annotationManager_didDeselectAnnotationRepresentation___block_invoke;
      block[3] = &unk_1E20D7E80;
      block[4] = self;
      v37 = v10;
      v38 = v10;
      v28 = v10;
      dispatch_after(v27, MEMORY[0x1E0C80D38], block);

      goto LABEL_74;
    }
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
    {
      -[VKMapView deselectLabelMarker](self->_mapView, "deselectLabelMarker");
      v15 = self->_selectedLabelMarkerState;
      self->_selectedLabelMarkerState = 0;

    }
    if (-[MKMapView _shouldCallAnnotationViewCallback:](self, "_shouldCallAnnotationViewCallback:", v6))
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v16 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v16 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v25 = v16;
      }
      else
      {
        v25 = 0;
      }
      v29 = objc_opt_respondsToSelector();

      if ((v29 & 1) != 0)
      {
        if (self)
        {
          if (qword_1EDFB79F8 != -1)
            dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
          if (byte_1EDFB7994)
          {
            v30 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v30 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v31 = v30;
        }
        else
        {
          v31 = 0;
        }
        -[MKMapViewDelegate mapView:didDeselectAnnotationView:](v31, "mapView:didDeselectAnnotationView:", self, v6);

      }
    }
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v32 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v32 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v33 = v32;
    }
    else
    {
      v33 = 0;
    }
    v34 = objc_opt_respondsToSelector();

    if ((v34 & 1) != 0)
    {
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v35 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v35 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v22 = v35;
      }
      else
      {
        v22 = 0;
      }
      objc_msgSend(v6, "annotation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mapView:didDeselectAnnotation:", self, v24);
LABEL_73:

    }
  }
  else
  {
    if (self)
    {
      if (qword_1EDFB79F8 != -1)
        dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
      if (byte_1EDFB7994)
      {
        v13 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v13 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v13;
    }
    else
    {
      v17 = 0;
    }
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[MKMapView _labelMarkerForCustomFeatureAnnotation:](self, "_labelMarkerForCustomFeatureAnnotation:", v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        if (qword_1EDFB79F8 != -1)
          dispatch_once(&qword_1EDFB79F8, &__block_literal_global_1790);
        if (byte_1EDFB7994)
        {
          v23 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v23 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v24, "mapView:didDeselectLabelMarker:", self, v22);
      goto LABEL_73;
    }
  }
LABEL_74:

}

void __67__MKMapView_annotationManager_didDeselectAnnotationRepresentation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_selectedLabelMarker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
    objc_msgSend(*(id *)(a1 + 32), "removeAnnotation:", *(_QWORD *)(a1 + 48));
}

- (void)setCamera:(MKMapCamera *)camera
{
  MKMapCamera *v4;
  _QWORD v5[4];
  MKMapCamera *v6;
  id v7;
  id location;

  v4 = camera;
  -[MKMapView _clearGestureRecognizers](self, "_clearGestureRecognizers");
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __23__MKMapView_setCamera___block_invoke;
    v5[3] = &unk_1E20D8970;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView _setCamera:](self, "_setCamera:", v4);
  }

}

void __23__MKMapView_setCamera___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setCamera:animated:", *(_QWORD *)(a1 + 32), 0);

}

void __50__MKMapView_setCamera_animated_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setCamera:animated:completionHandler:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

void __106__MKMapView_setCamera_duration_springMass_springStiffness_springDamping_springVelocity_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setCamera:animated:", *(_QWORD *)(a1 + 32), 0);

}

- (void)setCamera:(id)a3 springMass:(float)a4 springStiffness:(float)a5 springDamping:(float)a6 springVelocity:(float)a7
{
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v12 = a3;
  -[MKMapView _clearGestureRecognizers](self, "_clearGestureRecognizers");
  if (-[MKMapView _mustWaitUntilSized](self, "_mustWaitUntilSized"))
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__MKMapView_setCamera_springMass_springStiffness_springDamping_springVelocity___block_invoke;
    v17[3] = &unk_1E20D8970;
    objc_copyWeak(&v19, &location);
    v18 = v12;
    -[MKMapView _addSetRegionBlock:](self, "_addSetRegionBlock:", v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&v13 = a4;
    *(float *)&v14 = a5;
    *(float *)&v15 = a6;
    *(float *)&v16 = a7;
    -[MKMapView _setCamera:springMass:springStiffness:springDamping:springVelocity:](self, "_setCamera:springMass:springStiffness:springDamping:springVelocity:", v12, v13, v14, v15, v16);
  }

}

void __79__MKMapView_setCamera_springMass_springStiffness_springDamping_springVelocity___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setCamera:animated:", *(_QWORD *)(a1 + 32), 0);

}

- (void)setCameraZoomRange:(MKMapCameraZoomRange *)cameraZoomRange
{
  -[MKMapView setCameraZoomRange:animated:](self, "setCameraZoomRange:animated:", cameraZoomRange, 0);
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 9);
}

- (void)setCameraZoomRange:(MKMapCameraZoomRange *)cameraZoomRange animated:(BOOL)animated
{
  _BOOL8 v4;
  BOOL v6;
  MKMapCameraZoomRange *v7;
  MKMapCameraZoomRange *v8;
  MKMapCameraZoomRange *v9;
  MKMapCameraZoomRange *v10;

  v4 = animated;
  v10 = cameraZoomRange;
  v6 = -[MKMapCameraZoomRange isEqual:](v10, "isEqual:", self->_cameraZoomRange);
  v7 = v10;
  if (!v6)
  {
    if (v10)
      v8 = (MKMapCameraZoomRange *)-[MKMapCameraZoomRange copy](v10, "copy");
    else
      v8 = -[MKMapCameraZoomRange initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:]([MKMapCameraZoomRange alloc], "initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:", -1.0, -1.0);
    v9 = self->_cameraZoomRange;
    self->_cameraZoomRange = v8;

    -[MKMapView _setCameraZoomRange:animated:](self, "_setCameraZoomRange:animated:", self->_cameraZoomRange, v4);
    -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 9);
    v7 = v10;
  }

}

- (void)setCameraBoundary:(MKMapCameraBoundary *)cameraBoundary
{
  -[MKMapView setCameraBoundary:animated:](self, "setCameraBoundary:animated:", cameraBoundary, 0);
}

- (void)setCameraBoundary:(MKMapCameraBoundary *)cameraBoundary animated:(BOOL)animated
{
  _BOOL8 v4;
  MKMapCameraBoundary *v6;
  MKMapCameraBoundary *v7;
  MKMapCameraBoundary *v8;

  v4 = animated;
  v8 = cameraBoundary;
  if (!-[MKMapCameraBoundary isEqual:](v8, "isEqual:", self->_cameraBoundary))
  {
    v6 = (MKMapCameraBoundary *)-[MKMapCameraBoundary copy](v8, "copy");
    v7 = self->_cameraBoundary;
    self->_cameraBoundary = v6;

    -[MKMapView _setCameraBoundary:animated:](self, "_setCameraBoundary:animated:", self->_cameraBoundary, v4);
    -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 10);
  }

}

- (void)startLinearZoomIn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", CFSTR("ZoomingDefault"));
  v7 = v6;

  if (v3)
    v8 = 2;
  else
    v8 = 4;
  -[MKMapGestureController handleZoomArrowMask:speed:](self->_gestureController, "handleZoomArrowMask:speed:", v8, v7);
}

- (void)stopZoomingWithInertia
{
  -[MKMapGestureController handleZoomArrowMask:speed:](self->_gestureController, "handleZoomArrowMask:speed:", 0, -1.0);
}

- (void)_zoomWithAmount:(double)a3
{
  -[MKMapView _zoomWithAmount:completionHandler:](self, "_zoomWithAmount:completionHandler:", 0, a3);
}

- (void)_zoomWithAmount:(double)a3 completionHandler:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MidX;
  double MidY;
  VKMapView *mapView;
  id v26;
  _QWORD v27[5];
  id v28;
  CGRect v29;
  CGRect v30;

  v6 = a4;
  -[MKBasicMapView bounds](self->_basicMapView, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MKBasicMapView edgeInsets](self->_basicMapView, "edgeInsets");
  v16 = v8 + v15;
  v18 = v10 + v17;
  v20 = v12 - (v15 + v19);
  v22 = v14 - (v17 + v21);
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.width = v20;
  v30.size.height = v22;
  MidY = CGRectGetMidY(v30);
  -[MKMapGestureController startUserInteractionFromExternalGesture](self->_gestureController, "startUserInteractionFromExternalGesture");
  mapView = self->_mapView;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __47__MKMapView__zoomWithAmount_completionHandler___block_invoke;
  v27[3] = &unk_1E20D8238;
  v27[4] = self;
  v28 = v6;
  v26 = v6;
  -[VKMapView zoom:withFocusPoint:completionHandler:](mapView, "zoom:withFocusPoint:completionHandler:", v27, a3, MidX, MidY);

}

uint64_t __47__MKMapView__zoomWithAmount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "stopUserInteractionFromExternalGesture");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_zoomIn
{
  -[MKMapView _zoomInWithCompletionHandler:](self, "_zoomInWithCompletionHandler:", 0);
}

- (void)_zoomInWithCompletionHandler:(id)a3
{
  -[MKMapView _zoomWithAmount:completionHandler:](self, "_zoomWithAmount:completionHandler:", a3, 1.0);
}

- (void)_zoomOut
{
  -[MKMapView _zoomOutWithCompletionHandler:](self, "_zoomOutWithCompletionHandler:", 0);
}

- (void)_zoomOutWithCompletionHandler:(id)a3
{
  -[MKMapView _zoomWithAmount:completionHandler:](self, "_zoomWithAmount:completionHandler:", a3, -1.0);
}

- (void)_startPanningAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[MKMapGestureController setScrollEnabled:](self->_gestureController, "setScrollEnabled:", 0);
  -[MKBasicMapView convertPoint:fromView:](self->_basicMapView, "convertPoint:fromView:", self, x, y);
  -[VKMapView startPanningAtPoint:](self->_mapView, "startPanningAtPoint:");
}

- (void)_updatePanWithTranslation:(CGPoint)a3
{
  -[VKMapView updatePanWithTranslation:](self->_mapView, "updatePanWithTranslation:", a3.x, a3.y);
}

- (void)_stopPanningAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[MKMapView setScrollEnabled:](self, "setScrollEnabled:", (*(_QWORD *)&self->_flags >> 13) & 1);
  -[MKMapGestureController setScrollEnabled:](self->_gestureController, "setScrollEnabled:", (*(_QWORD *)&self->_flags >> 13) & 1);
  -[MKBasicMapView convertPoint:fromView:](self->_basicMapView, "convertPoint:fromView:", self, x, y);
  -[VKMapView stopPanningAtPoint:](self->_mapView, "stopPanningAtPoint:");
}

- (void)setVehicleState:(id)a3
{
  id v4;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVehicleState:", a3.var0);

}

- (void)_clearGesturesAndAnimations
{
  -[MKMapGestureController clearGestureRecognizersInFlight](self->_gestureController, "clearGestureRecognizersInFlight");
  -[MKMapGestureController stopDynamicAnimations](self->_gestureController, "stopDynamicAnimations");
}

- (int)currentUITargetForAnalytics
{
  return 0;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)zoomIn:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  MKMapType v8;
  uint64_t v9;
  unsigned int v10;
  id v11;

  if (-[MKMapView isZoomEnabled](self, "isZoomEnabled", a3))
  {
    -[MKMapGestureController zoomIn](self->_gestureController, "zoomIn");
    v4 = (void *)MEMORY[0x1E0D263E8];
    v5 = -[MKMapView currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics");
    -[MKMapView mapRegion](self, "mapRegion");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MKMapView _zoomLevel](self, "_zoomLevel");
    v7 = v6;
    v8 = -[MKMapView mapType](self, "mapType");
    v9 = 1;
    switch(v8)
    {
      case MKMapTypeStandard:
        break;
      case MKMapTypeSatellite:
      case MKMapTypeSatelliteFlyover:
        v9 = 2;
        break;
      case MKMapTypeHybrid:
      case MKMapTypeHybridFlyover:
        v9 = 3;
        break;
      default:
        if (v8 == 104)
          v10 = 4;
        else
          v10 = 0;
        if (v8 == 102)
          v9 = 1;
        else
          v9 = v10;
        break;
    }
    objc_msgSend(v4, "captureUserAction:target:value:mapRegion:zoomLevel:mapType:", 1002, v5, 0, v11, v9, v7);

  }
}

- (void)zoomOut:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  MKMapType v8;
  uint64_t v9;
  unsigned int v10;
  id v11;

  if (-[MKMapView isZoomEnabled](self, "isZoomEnabled", a3))
  {
    -[MKMapGestureController zoomOut](self->_gestureController, "zoomOut");
    v4 = (void *)MEMORY[0x1E0D263E8];
    v5 = -[MKMapView currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics");
    -[MKMapView mapRegion](self, "mapRegion");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MKMapView _zoomLevel](self, "_zoomLevel");
    v7 = v6;
    v8 = -[MKMapView mapType](self, "mapType");
    v9 = 1;
    switch(v8)
    {
      case MKMapTypeStandard:
        break;
      case MKMapTypeSatellite:
      case MKMapTypeSatelliteFlyover:
        v9 = 2;
        break;
      case MKMapTypeHybrid:
      case MKMapTypeHybridFlyover:
        v9 = 3;
        break;
      default:
        if (v8 == 104)
          v10 = 4;
        else
          v10 = 0;
        if (v8 == 102)
          v9 = 1;
        else
          v9 = v10;
        break;
    }
    objc_msgSend(v4, "captureUserAction:target:value:mapRegion:zoomLevel:mapType:", 1003, v5, 0, v11, v9, v7);

  }
}

- (void)_insertSubviewBelowAnnotationContainerView:(id)a3
{
  MKAnnotationContainerView *annotationContainer;
  id v5;
  id v6;

  annotationContainer = self->_annotationContainer;
  v5 = a3;
  -[MKAnnotationContainerView superview](annotationContainer, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:belowSubview:", v5, self->_annotationContainer);

}

- (MKLocationManager)_locationManager
{
  return self->_locationManager;
}

- (OS_dispatch_group)_calloutShowAnimationGroup
{
  return self->_calloutShowAnimationGroup;
}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfiguration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[19].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[19].var0;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[19].var4;
  *(_QWORD *)&retstr->var6 = *(_QWORD *)&self[19].var6;
  return self;
}

- (BOOL)_isAttributionBadgeClickable
{
  return self->_attributionBadgeClickable;
}

- (void)_setAttributionBadgeClickable:(BOOL)a3
{
  self->_attributionBadgeClickable = a3;
}

- (UIEdgeInsets)_attributionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_attributionInsets.top;
  left = self->_attributionInsets.left;
  bottom = self->_attributionInsets.bottom;
  right = self->_attributionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)_compassInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_compassInsets.top;
  left = self->_compassInsets.left;
  bottom = self->_compassInsets.bottom;
  right = self->_compassInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (MKLabelSelectionFilter)_labelSelectionFilter
{
  return self->_labelSelectionFilter;
}

- (int64_t)_interactionMode
{
  return self->_interactionMode;
}

- (void)_setInteractionMode:(int64_t)a3
{
  self->_interactionMode = a3;
}

- (unint64_t)_currentFlyoverAnimationID
{
  return self->_currentFlyoverAnimationID;
}

- (void)_setCurrentFlyoverAnimationID:(unint64_t)a3
{
  self->_currentFlyoverAnimationID = a3;
}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (MKMapCameraZoomRange)cameraZoomRange
{
  return self->_cameraZoomRange;
}

- (MKMapCameraBoundary)cameraBoundary
{
  return self->_cameraBoundary;
}

- (BOOL)showsPitchControl
{
  return self->_showsPitchControl;
}

- (void)setShowsPitchControl:(BOOL)showsPitchControl
{
  self->_showsPitchControl = showsPitchControl;
}

- (BOOL)showsZoomControls
{
  return self->_showsZoomControls;
}

- (void)setShowsZoomControls:(BOOL)showsZoomControls
{
  self->_showsZoomControls = showsZoomControls;
}

- (unint64_t)_userTrackingButtonBackgroundStyle
{
  return self->_userTrackingButtonBackgroundStyle;
}

- (unint64_t)_pitchButtonBackgroundStyle
{
  return self->_pitchButtonBackgroundStyle;
}

- (unint64_t)_userTrackingControlSize
{
  return self->_userTrackingControlSize;
}

- (unint64_t)_pitchButtonControlSize
{
  return self->_pitchButtonControlSize;
}

- (unint64_t)_scaleControlSize
{
  return self->_scaleControlSize;
}

- (unint64_t)_controlBackgroundStyle
{
  return self->_controlBackgroundStyle;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (int)attributionCorner
{
  return self->_attributionCorner;
}

- (int64_t)_attributionLinkDisplayStyle
{
  return self->_attributionLinkDisplayStyle;
}

- (BOOL)_isCompassSuppressedForFloorPicker
{
  return self->_compassSuppressedForFloorPicker;
}

- (int64_t)compassViewSize
{
  return self->_compassViewSize;
}

- (int64_t)compassViewStyle
{
  return self->_compassViewStyle;
}

- (id)_labelsDidLayoutCallback
{
  return self->_labelsDidLayoutCallback;
}

- (void)_setLabelsDidLayoutCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1536);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_labelsDidLayoutCallback, 0);
  objc_storeStrong((id *)&self->_cameraBoundary, 0);
  objc_storeStrong((id *)&self->_cameraZoomRange, 0);
  objc_storeStrong((id *)&self->_preferredConfiguration, 0);
  objc_storeStrong((id *)&self->_labelSelectionFilter, 0);
  objc_storeStrong(&self->_locationIsInHikingContextCallback, 0);
  objc_storeStrong((id *)&self->_offlineRegionsOverlayManager, 0);
  objc_storeStrong((id *)&self->_zoomBounceFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedLabelMarkerState, 0);
  objc_storeStrong((id *)&self->_annotationsCustomFeatureStore, 0);
  objc_storeStrong(&self->_shelbyvilleListener, 0);
  objc_storeStrong((id *)&self->_calloutShowAnimationGroup, 0);
  objc_storeStrong((id *)&self->_edgeInsetsBottomConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsRightConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsLeftConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsTopConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsGuide, 0);
  objc_storeStrong((id *)&self->_longPressedAnnotationView, 0);
  objc_storeStrong((id *)&self->_rotationFilter, 0);
  objc_storeStrong((id *)&self->_lastTraitCollection, 0);
  objc_storeStrong((id *)&self->_lastEffectiveTraitCollectionIsolationQueue, 0);
  objc_storeStrong(&self->_bottomLayoutGuide, 0);
  objc_storeStrong(&self->_topLayoutGuide, 0);
  objc_storeStrong((id *)&self->_vectorKitStyleDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_vectorKitDebugView, 0);
  objc_storeStrong(&self->_selectAnnotationViewAfterRedrawBlock, 0);
  objc_storeStrong(&self->_showCalloutAfterRegionChangeBlock, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_navContext, 0);
  objc_storeStrong((id *)&self->_routeContext, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_scrollContainerView, 0);
  objc_storeStrong((id *)&self->_controlStackWidthConstraint, 0);
  objc_storeStrong((id *)&self->_controlStackVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_controlStackHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_controlStackView, 0);
  objc_storeStrong((id *)&self->_pitchButton, 0);
  objc_storeStrong((id *)&self->_trackingButton, 0);
  objc_storeStrong((id *)&self->_compassView, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_storeStrong((id *)&self->_pressedLabelMarker, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_basicMapView, 0);
  objc_storeStrong((id *)&self->_overlayContainer, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_locationConsoleGesture, 0);
  objc_storeStrong((id *)&self->_nonselectingTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectingTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_debugCurrentEnvironmentLabel, 0);
  objc_storeStrong(&self->_debugConsoleAdditionalInfoProvider, 0);
  objc_storeStrong((id *)&self->_debugLocationConsole, 0);
  objc_destroyWeak((id *)&self->_safeDelegate);
  objc_storeStrong((id *)&self->_startEffectsTimer, 0);
  objc_storeStrong((id *)&self->_attributionBadgeView, 0);
  objc_storeStrong(&self->_annotationCoordinateTest, 0);
  objc_storeStrong(&self->_annotationRectTest, 0);
  objc_storeStrong((id *)&self->_appleLogoImageView, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_annotationContainer, 0);
  objc_storeStrong((id *)&self->_annotationManager, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_usageCounter, 0);
  objc_storeStrong((id *)&self->_overlayRendererEventDictionary, 0);
  objc_storeStrong((id *)&self->_annotationViewEventSet, 0);
  objc_storeStrong((id *)&self->_whenSizedBlocks, 0);
}

- (unint64_t)_selectedFeatureID
{
  return 0;
}

- (void)_setSelectedFeatureID:(unint64_t)a3
{
  void *v4;
  id v5;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "setSelectedFeatureId:", a3);
  else
    objc_msgSend(v4, "deselectFeatureId");

}

- (void)stopUpdatingUserLocation
{
  NSObject *v3;
  MKUserLocation *userLocation;
  MKMapView *v5;
  MKUserLocation *v6;
  MKUserLocation *v7;
  MKUserLocation *v8;
  _BOOL4 v9;
  MKMapView *v10;
  MKUserLocation *v11;
  MKUserLocation *v12;
  MKUserLocation *v13;
  MKUserLocation *v14;
  MKUserLocation *v15;
  MKMapView *v16;
  MKUserLocation *v17;
  MKUserLocation *v18;
  MKUserLocation *v19;
  void *v20;
  MKMapViewDelegate *v21;
  MKMapViewDelegate *v22;
  char v23;
  MKMapViewDelegate *v24;
  MKMapViewDelegate *v25;
  __int16 v26[8];

  MKGetPuckTrackingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v26[0] = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager stopUpdatingUserLocation", (uint8_t *)v26, 2u);
  }

  userLocation = self->_userLocation;
  if (!userLocation)
  {
    v5 = self;
    v6 = objc_alloc_init(MKUserLocation);
    v7 = v5->_userLocation;
    v5->_userLocation = v6;

    userLocation = v5->_userLocation;
  }
  v8 = userLocation;
  v9 = -[MKUserLocation isUpdating](v8, "isUpdating");

  if (v9)
  {
    -[MKMapView removeUserLocation](self, "removeUserLocation");
    v10 = self;
    v11 = v10->_userLocation;
    if (!v11)
    {
      v12 = objc_alloc_init(MKUserLocation);
      v13 = v10->_userLocation;
      v10->_userLocation = v12;

      v11 = v10->_userLocation;
    }
    v14 = v11;

    -[MKUserLocation setUpdating:](v14, "setUpdating:", 0);
    v15 = v10->_userLocation;
    if (!v15)
    {
      v16 = v10;
      v17 = objc_alloc_init(MKUserLocation);
      v18 = v16->_userLocation;
      v16->_userLocation = v17;

      v15 = v16->_userLocation;
    }
    v19 = v15;
    -[MKUserLocation setLocation:](v19, "setLocation:", 0);

    -[MKLocationManager stopLocationUpdateWithObserver:](v10->_locationManager, "stopLocationUpdateWithObserver:", v10);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObserver:name:object:", v10, MKLocationManagerApprovalDidChangeNotification, 0);

    if (qword_1ECE2D8A0 != -1)
      dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
    if (_MergedGlobals_129)
    {
      v21 = v10->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](v10, "_safeDelegate");
      v21 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      if (qword_1ECE2D8A0 != -1)
        dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
      if (_MergedGlobals_129)
      {
        v24 = v10->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](v10, "_safeDelegate");
        v24 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;
      -[MKMapViewDelegate mapViewDidStopLocatingUser:](v24, "mapViewDidStopLocatingUser:", v10);

    }
  }
}

- (BOOL)isLocationConsoleEnabled
{
  return self->_debugLocationConsole != 0;
}

- (void)setLocationConsoleEnabled:(BOOL)a3
{
  _BOOL4 v3;
  MKDebugLocationConsole *v5;
  MKDebugLocationConsole *debugLocationConsole;
  MKDebugLocationConsole *v7;

  v3 = a3;
  if (-[MKMapView isLocationConsoleEnabled](self, "isLocationConsoleEnabled") != a3)
  {
    if (v3)
    {
      v5 = -[MKDebugLocationConsole initWithMapView:]([MKDebugLocationConsole alloc], "initWithMapView:", self);
      debugLocationConsole = self->_debugLocationConsole;
      self->_debugLocationConsole = v5;

      -[MKMapView addSubview:](self, "addSubview:", self->_debugLocationConsole);
    }
    else
    {
      -[MKDebugLocationConsole removeFromSuperview](self->_debugLocationConsole, "removeFromSuperview");
      v7 = self->_debugLocationConsole;
      self->_debugLocationConsole = 0;

    }
  }
}

- (void)_updateLocationConsole
{
  -[MKDebugLocationConsole update](self->_debugLocationConsole, "update");
}

- (BOOL)_isLocationPropagationEnabled
{
  return (*(_QWORD *)&self->_flags >> 41) & 1;
}

- (void)_setLocationPropagationEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)_clearUserLocationOnLocationReset
{
  return (*(_QWORD *)&self->_flags >> 46) & 1;
}

- (void)_setClearUserLocationOnLocationReset:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)_isUserLocationInView:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  BOOL v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;

  if (!-[MKMapView hasUserLocation](self, "hasUserLocation", a3))
    return 0;
  -[MKAnnotationContainerView userLocationView](self->_annotationContainer, "userLocationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "superview"), (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6, v8 = objc_msgSend(v5, "isHidden"), v7, (v8 & 1) == 0))
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v5, "convertRect:toView:", self);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[MKMapView bounds](self, "bounds");
    v20.origin.x = v11;
    v20.origin.y = v13;
    v20.size.width = v15;
    v20.size.height = v17;
    v9 = CGRectIntersectsRect(v19, v20);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isUserLocationViewCentered:(double)a3
{
  -[MKMapView _centerPoint](self, "_centerPoint");
  return -[MKMapView _isPoint:nearUserLocationView:](self, "_isPoint:nearUserLocationView:");
}

- (BOOL)_isPoint:(CGPoint)a3 nearUserLocationView:(double)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  MKBasicMapView *basicMapView;
  double v12;
  double v13;
  BOOL v14;
  MKBasicMapView *v15;
  double v16;
  double v17;

  y = a3.y;
  x = a3.x;
  -[MKMapView userLocationView](self, "userLocationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "superview"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    basicMapView = self->_basicMapView;
    objc_msgSend(v9, "_presentationCoordinate");
    -[MKBasicMapView convertCoordinate:toCameraModelPointToView:](basicMapView, "convertCoordinate:toCameraModelPointToView:", self);
    if (sqrt((v12 - x) * (v12 - x) + (v13 - y) * (v13 - y)) >= a4)
    {
      v15 = self->_basicMapView;
      objc_msgSend(v9, "coordinate");
      -[MKBasicMapView convertCoordinate:toCameraModelPointToView:](v15, "convertCoordinate:toCameraModelPointToView:", self);
      v14 = sqrt((v16 - x) * (v16 - x) + (v17 - y) * (v17 - y)) < a4;
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_userLocationWithinVisibleMapBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  MKMapPoint v17;
  MKMapRect v18;

  -[MKMapView visibleMapRect](self, "visibleMapRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKMapView userLocationView](self, "userLocationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinate");
  v17.x = MKTilePointForCoordinate(v12, v13, 21.0);
  v17.y = v14;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v15 = MKMapRectContainsPoint(v18, v17);

  return v15;
}

- (CLLocation)predictedUserLocation
{
  MKUserLocation *userLocation;
  MKMapView *v3;
  MKUserLocation *v4;
  MKUserLocation *v5;
  MKUserLocation *v6;
  void *v7;

  userLocation = self->_userLocation;
  if (!userLocation)
  {
    v3 = self;
    v4 = objc_alloc_init(MKUserLocation);
    v5 = v3->_userLocation;
    v3->_userLocation = v4;

    userLocation = v3->_userLocation;
  }
  v6 = userLocation;
  -[MKUserLocation predictedLocation](v6, "predictedLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLLocation *)v7;
}

- (void)removeUserLocation
{
  double v3;
  double v4;

  -[MKUserLocation coordinate](self->_userLocation, "coordinate");
  if (v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0 && v3 <= 90.0)
    -[MKAnnotationManager removeAnnotation:](self->_annotationManager, "removeAnnotation:", self->_userLocation);
}

- (BOOL)ignoreLocationUpdates
{
  return (*(_QWORD *)&self->_flags >> 7) & 1;
}

- (void)setIgnoreLocationUpdates:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (void)_pauseUserLocationUpdates
{
  id v3;

  -[MKMapView setIgnoreLocationUpdates:](self, "setIgnoreLocationUpdates:", 1);
  *(_QWORD *)&self->_flags |= 0x400uLL;
  -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

}

- (void)_resumeUserLocationUpdates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[MKMapView setIgnoreLocationUpdates:](self, "setIgnoreLocationUpdates:", 0);
  *(_QWORD *)&self->_flags &= ~0x400uLL;
  -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

  if (v3)
  {
    -[MKMapView _clearFixedUserLocation](self, "_clearFixedUserLocation");
    if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
    {
      -[MKLocationManager lastLocation](self->_locationManager, "lastLocation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[MKMapView locationManagerUpdatedLocation:](self, "locationManagerUpdatedLocation:", self->_locationManager);
    }
  }
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  char v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  id v13;

  v13 = a4;
  -[MKMapView userLocationView](self, "userLocationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
LABEL_5:
    v7 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "_mkUserLocationView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  objc_msgSend(v7, "locationManagerFailedToUpdateLocation");
  if (self)
  {
    if (qword_1ECE2D8A0 != -1)
      dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
    if (_MergedGlobals_129)
    {
      v8 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    if (self)
    {
      if (qword_1ECE2D8A0 != -1)
        dispatch_once(&qword_1ECE2D8A0, &__block_literal_global_10);
      if (_MergedGlobals_129)
      {
        v11 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    -[MKMapViewDelegate mapView:didFailToLocateUserWithError:](v12, "mapView:didFailToLocateUserWithError:", self, v13);

  }
}

- (void)locationManagerDidReset:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if ((*(_QWORD *)&self->_flags & 0x400000000000) != 0)
  {
    v6 = v4;
    if (self->_userLocation)
    {
      if (self->_userTrackingMode && -[MKMapView hasUserLocation](self, "hasUserLocation"))
        -[VKMapView stopTrackingAnnotation](self->_mapView, "stopTrackingAnnotation");
      -[MKMapView removeUserLocation](self, "removeUserLocation");
      -[MKUserLocation reset](self->_userLocation, "reset");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MKUserTrackingViewDidResetUserLocationNotification"), self, 0);

    }
    -[MKMapView _updateLocationConsole](self, "_updateLocationConsole");
    v4 = v6;
  }

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)_setUseVehicleHeading:(BOOL)a3
{
  uint64_t flags;
  uint64_t v6;
  MKLocationManager *locationManager;

  flags = (uint64_t)self->_flags;
  if (((((flags & 0x40000) == 0) ^ a3) & 1) == 0)
  {
    v6 = 0x40000;
    if (!a3)
      v6 = 0;
    *((_BYTE *)&self->_flags + 8) = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFFBFFFFLL | v6;
    -[VKMapView setHasVehicleHeading:](self->_mapView, "setHasVehicleHeading:");
    if (-[MKMapView _showHeadingIndicator](self, "_showHeadingIndicator"))
    {
      locationManager = self->_locationManager;
      if (a3)
        -[MKLocationManager stopHeadingUpdateWithObserver:](locationManager, "stopHeadingUpdateWithObserver:", self);
      else
        -[MKLocationManager startHeadingUpdateWithObserver:](locationManager, "startHeadingUpdateWithObserver:", self);
    }
  }
}

- (void)pauseUserHeadingUpdates
{
  *(_QWORD *)&self->_flags |= 0x40uLL;
}

- (void)resumeUserHeadingUpdates
{
  *(_QWORD *)&self->_flags &= ~0x40uLL;
}

- (void)_stopTrackingHeading
{
  void *v3;
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  void *v6;
  void *v7;
  id v8;

  -[MKLocationManager stopHeadingUpdateWithObserver:](self->_locationManager, "stopHeadingUpdateWithObserver:", self);
  -[MKMapView userLocation](self, "userLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHeading:", 0);

  if ((*(_QWORD *)&self->_flags & 0x4000000000000000) != 0)
  {
    if (qword_1ECE2D8B0 != -1)
      dispatch_once(&qword_1ECE2D8B0, &__block_literal_global_12);
    if (_MergedGlobals_130)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    -[MKMapView userLocation](self, "userLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapViewDelegate mapView:didUpdateUserLocation:](v5, "mapView:didUpdateUserLocation:", self, v6);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", 0x1E20E0C80, self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MKUserTrackingViewDidUpdateUserLocationNotification"), self);

}

- (void)_updateCourseForMapViewHeading:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  v4 = a3;
  if (-[MKMapView _useVehicleHeading](self, "_useVehicleHeading"))
  {
    if (-[MKMapView _showHeadingIndicator](self, "_showHeadingIndicator"))
    {
      -[MKLocationManager currentVehicleHeading](self->_locationManager, "currentVehicleHeading");
      if (v5 < 0.0)
      {
        objc_msgSend(v4, "course");
        if (v6 >= 0.0)
        {
          if (objc_msgSend(v4, "_navigation_hasValidCourse"))
          {
            v17 = 0u;
            v18 = 0u;
            objc_msgSend(v4, "course", 0, 0, 0, 0);
            v8 = v7;
            objc_msgSend(v4, "timestamp");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "timeIntervalSinceReferenceDate");
            v11 = v10;

            v14 = v8;
            v15 = 0;
            v16 = v11;
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3A0]), "initWithClientHeading:", &v13);
            -[MKMapView _updateHeading:animated:](self, "_updateHeading:animated:", v12, 1);

          }
        }
      }
    }
  }

}

- (void)_locationManager:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  _OWORD v12[2];
  double v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v7 = a5;
  -[VKMapView userLocationAnimator](self->_mapView, "userLocationAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateVehicleHeading:", a4);

  if (-[MKMapView _useVehicleHeading](self, "_useVehicleHeading"))
  {
    v9 = -[MKMapView _showHeadingIndicator](self, "_showHeadingIndicator");
    if (a4 >= 0.0 && v9)
    {
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      memset(v12, 0, sizeof(v12));
      v13 = a4;
      v14 = 0;
      v15 = v10;
      v16 = 0u;
      v17 = 0u;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3A0]), "initWithClientHeading:", v12);
      -[MKMapView _updateHeading:animated:](self, "_updateHeading:animated:", v11, 1);

    }
  }

}

- (void)_setCamera:(id)a3
{
  -[MKMapView _setCamera:completionHandler:](self, "_setCamera:completionHandler:", a3, 0);
}

- (void)_setCamera:(id)a3 completionHandler:(id)a4
{
  id v6;
  double v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    -[MKMapView _setCamera:duration:timingCurve:completionHandler:](self, "_setCamera:duration:timingCurve:completionHandler:", v8, objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationCurve"), v6, v7);
  }
  else
  {
    -[MKMapView _setCamera:duration:timing:completionHandler:](self, "_setCamera:duration:timing:completionHandler:", v8, 0, v6, 0.0);
  }

}

- (double)_durationForCamera:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  -[MKMapView _cameraAltitudeClampedToZoomRange:](self, "_cameraAltitudeClampedToZoomRange:", v4);
  v6 = v5;
  v7 = v5;
  -[MKMapCamera altitude](self->_camera, "altitude");
  v9 = v6 < v8;
  v10 = v7;
  if (!v9)
    -[MKMapCamera altitude](self->_camera, "altitude", v7);
  v11 = 0.0001;
  if (v10 > 0.0001)
  {
    -[MKMapCamera altitude](self->_camera, "altitude");
    v11 = v7;
    if (v6 >= v12)
    {
      -[MKMapCamera altitude](self->_camera, "altitude");
      v11 = v13;
    }
  }
  -[MKMapCamera altitude](self->_camera, "altitude");
  if (v6 <= v14)
  {
    -[MKMapCamera altitude](self->_camera, "altitude");
    v7 = v15;
  }
  v16 = 0.0;
  if (v11 < v7)
  {
    v17 = 0.0;
    do
    {
      v17 = v17 + 1.0;
      v11 = v11 + v11;
    }
    while (v11 < v7);
    v16 = v17 * 0.25;
  }
  -[MKMapView cameraBoundary](self, "cameraBoundary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[MKMapView cameraBoundary](self, "cameraBoundary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerCoordinate");
    objc_msgSend(v19, "_clampedCoordinateForCoordinate:");
    v21 = v20;
    v23 = v22;

  }
  else
  {
    objc_msgSend(v4, "centerCoordinate");
    v21 = v24;
    v23 = v25;
  }
  v44 = v21;
  v45 = v23;
  v26 = fmin(v16, 2.0);

  -[MKMapCamera centerCoordinate](self->_camera, "centerCoordinate");
  v42 = v27;
  v43 = v28;
  CLLocationCoordinate2DGetDistanceFrom();
  v30 = fmin(v29 / fmax(v6, 0.0001) * 0.25, 2.0);
  objc_msgSend(v4, "heading", v42, v43, v44, v45);
  v32 = v31;
  -[MKMapCamera heading](self->_camera, "heading");
  v34 = fmod(v32 - v33, 360.0) / 45.0 * 0.25;
  objc_msgSend(v4, "pitch");
  v36 = v35;
  -[MKMapCamera pitch](self->_camera, "pitch");
  v38 = vabdd_f64(v36, v37) / 20.0 * 0.25;
  if (v26 <= v30)
    v39 = v30;
  else
    v39 = v26;
  if (v39 <= v34)
    v39 = v34;
  if (v39 > v38)
    v38 = v39;
  v40 = fmax(v38, 0.25);

  return v40;
}

- (double)_cameraAltitudeClampedToZoomRange:(id)a3
{
  id v4;
  long double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(v4, "pitch");
  v6 = cos(v5);
  -[MKMapView cameraZoomRange](self, "cameraZoomRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minCenterCoordinateDistance");
  v9 = v6 * v8;

  -[MKMapView cameraZoomRange](self, "cameraZoomRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maxCenterCoordinateDistance");
  v12 = v11;

  objc_msgSend(v4, "altitude");
  if (v9 <= v13)
  {
    objc_msgSend(v4, "altitude");
    v9 = v14;
  }
  if (v9 >= v6 * v12)
    v15 = v6 * v12;
  else
    v15 = v9;
  if (v6 * v12 <= 0.0)
    v16 = v9;
  else
    v16 = v15;

  return v16;
}

- (void)_setCamera:(id)a3 animated:(BOOL)a4
{
  -[MKMapView _setCamera:animated:completionHandler:](self, "_setCamera:animated:completionHandler:", a3, a4, 0);
}

- (id)_vkTimingFunctionForUIViewAnimationCurve:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)a3 > 3)
    v3 = 0;
  else
    v3 = (void *)MEMORY[0x18D778DB8](**((_QWORD **)&unk_1E20D93D0 + a3), a2);
  v4 = (void *)MEMORY[0x18D778DB8](v3);

  return v4;
}

- (void)_setCamera:(id)a3 duration:(double)a4 timingCurve:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a3;
  -[MKMapView _vkTimingFunctionForUIViewAnimationCurve:](self, "_vkTimingFunctionForUIViewAnimationCurve:", a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapView _setCamera:duration:timing:completionHandler:](self, "_setCamera:duration:timing:completionHandler:", v11, v12, v10, a4);

}

- (void)_setCamera:(id)a3 springMass:(float)a4 springStiffness:(float)a5 springDamping:(float)a6 springVelocity:(float)a7
{
  id v8;

  v8 = a3;
  -[MKMapView _durationForCamera:](self, "_durationForCamera:", v8);
  -[MKMapView _setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:](self, "_setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:", v8, 0);

}

- (void)_setCameraZoomRange:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  double v14;
  double v15;
  void *v16;
  VKMapView *mapView;
  double v18;
  void *v19;
  double v20;
  VKMapView *v21;
  uint64_t v22;
  double v23;
  double v24;
  char v25;
  _BYTE v26[7];

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "minCenterCoordinateDistance");
  v7 = -1.0;
  v8 = -1.0;
  if (v9 >= 0.0)
  {
    objc_msgSend(v6, "minCenterCoordinateDistance");
    v8 = v10;
  }
  objc_msgSend(v6, "maxCenterCoordinateDistance");
  if (v11 >= 0.0)
  {
    objc_msgSend(v6, "maxCenterCoordinateDistance");
    v7 = v12;
  }
  v13 = objc_msgSend(v6, "_bouncesZoom");
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    v15 = v14;
    -[MKMapView _vkTimingFunctionForUIViewAnimationCurve:](self, "_vkTimingFunctionForUIViewAnimationCurve:", objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationCurve"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    mapView = self->_mapView;
    v23 = v8;
    v24 = v7;
    v25 = v13;
    memset(v26, 0, sizeof(v26));
    -[VKMapView setCenterCoordinateDistanceRange:duration:timingFunction:](mapView, "setCenterCoordinateDistanceRange:duration:timingFunction:", &v23, v16, v15);

  }
  else
  {
    v18 = 0.0;
    if (v4)
    {
      -[MKMapView camera](self, "camera");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapView _durationForCamera:](self, "_durationForCamera:", v19);
      v18 = v20;

    }
    v21 = self->_mapView;
    v22 = *MEMORY[0x1E0DC65B8];
    v23 = v8;
    v24 = v7;
    v25 = v13;
    memset(v26, 0, sizeof(v26));
    -[VKMapView setCenterCoordinateDistanceRange:duration:timingFunction:](v21, "setCenterCoordinateDistanceRange:duration:timingFunction:", &v23, v22, v18);
  }

}

- (void)_setCameraBoundary:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  double v8;
  double v9;
  void *v10;
  VKMapView *mapView;
  void *v12;
  double v13;
  double v14;
  VKMapView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a4;
  v6 = a3;
  v21 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "_isEmpty") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
        v9 = v8;
        -[MKMapView _vkTimingFunctionForUIViewAnimationCurve:](self, "_vkTimingFunctionForUIViewAnimationCurve:", objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationCurve"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        mapView = self->_mapView;
        objc_msgSend(v21, "_vkRegionRestriction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKMapView setRegionRestriction:duration:timingFunction:](mapView, "setRegionRestriction:duration:timingFunction:", v12, v10, v9);

LABEL_12:
        if (-[MKMapView userTrackingMode](self, "userTrackingMode"))
        {
          -[MKMapView userLocation](self, "userLocation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[MKMapView userLocation](self, "userLocation");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "location");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "coordinate");
            if ((objc_msgSend(v21, "_containsCoordinate:") & 1) == 0)
              -[MKMapView setUserTrackingMode:](self, "setUserTrackingMode:", 0);

          }
        }
        goto LABEL_17;
      }
      v7 = 0;
    }
    v6 = v21;
  }
  else
  {
    v7 = 1;
  }
  v13 = 0.0;
  if (v4)
  {
    -[MKMapView _animationDurationWhenSettingCameraBoundary:](self, "_animationDurationWhenSettingCameraBoundary:", v21);
    v6 = v21;
    v13 = v14;
  }
  v15 = self->_mapView;
  objc_msgSend(v6, "_vkRegionRestriction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView setRegionRestriction:duration:timingFunction:](v15, "setRegionRestriction:duration:timingFunction:", v16, *MEMORY[0x1E0DC65B8], v13);

  if ((v7 & 1) == 0)
    goto LABEL_12;
LABEL_17:

}

- (double)_animationDurationWhenSettingCameraBoundary:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  _BOOL4 v20;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;

  v4 = a3;
  -[MKMapCamera centerCoordinate](self->_camera, "centerCoordinate");
  v24 = v5;
  v25 = v6;
  v7 = 0.0;
  if (v4)
  {
    v8 = v5;
    v9 = v6;
    if ((objc_msgSend(v4, "_containsCoordinate:") & 1) == 0)
    {
      objc_msgSend(v4, "_clampedCoordinateForCoordinate:", v8, v9);
      v22 = v10;
      v23 = v11;
      CLLocationCoordinate2DGetDistanceFrom();
      v13 = v12;
      -[MKMapCamera altitude](self->_camera, "altitude", v22, v23, *(_QWORD *)&v24, *(_QWORD *)&v25);
      v15 = v14;
      v16 = 0.0001;
      if (v15 > 0.0001)
        -[MKMapCamera altitude](self->_camera, "altitude");
      v17 = 0.25;
      v18 = v13 / v16 * 0.25;
      v19 = v18 >= 2.0;
      v20 = v18 > 0.25 || v18 >= 2.0;
      if (v18 <= 0.25)
        v19 = 1;
      if (v20)
        v17 = 2.0;
      if (v19)
        v7 = v17;
      else
        v7 = v18;
    }
  }

  return v7;
}

void __75__MKMapView_MKCamera___updateFromCamera_duration_timing_completionHandler___block_invoke()
{
  NSLog(CFSTR("MKMapView does not support non-zero pitch on this device"));
}

- (void)_updateFromCamera:(id)a3
{
  -[MKMapView _updateFromCamera:duration:timing:completionHandler:](self, "_updateFromCamera:duration:timing:completionHandler:", a3, 0, 0, 0.0);
}

- (void)_snapToNorthIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (self->_userTrackingMode != 2)
  {
    -[VKMapView yaw](self->_mapView, "yaw");
    v4 = v3 * 3.14159265 / 180.0;
    if (fabs(v4) >= 0.0001)
    {
      v5 = self->_verticalYawOverride * 3.14159265 / 180.0;
      v6 = vabdd_f64(v5, v4);
      if (v6 >= 0.0001)
      {
        if (fabs(v5) <= 0.0001 || v6 >= 0.24)
        {
          if (vabdd_f64(0.0, v4) < 0.12)
            -[MKMapView _snapToTrueNorthAndCallBack:](self, "_snapToTrueNorthAndCallBack:", 1);
        }
        else
        {
          -[MKMapView snapToNorth:](self, "snapToNorth:", 0);
        }
      }
    }
  }
}

- (NSArray)_transitLineMarkersInCurrentViewport
{
  void *v2;
  void *v3;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitLineMarkersInCurrentViewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_transitLineMarkerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MKMapView _transitLineMarkersInCurrentViewport](self, "_transitLineMarkersInCurrentViewport", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "mapItemIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v14 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = objc_alloc(MEMORY[0x1E0DC6580]);
  objc_msgSend(v4, "geoMapItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "initWithIdentifier:", v5);
LABEL_11:
  v15 = v14;

  return v15;
}

- (void)_selectTransitLineMarker:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "mapItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView _transitLineMarkerForIdentifier:](self, "_transitLineMarkerForIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKMapView _mapLayer](self, "_mapLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectTransitLineMarker:", v7);

  }
}

- (void)_selectTransitLineMarkerWithIdentifier:(id)a3
{
  id v4;

  -[MKMapView _transitLineMarkerForIdentifier:](self, "_transitLineMarkerForIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapView _selectTransitLineMarker:](self, "_selectTransitLineMarker:", v4);

}

- (void)_deselectTransitLineMarker
{
  id v2;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectTransitLineMarker");

}

- (BOOL)_hasSelectedTransitLines
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTransitLineIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_selectedTransitLineIDs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MKMapItemIdentifier *v11;
  MKMapItemIdentifier *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTransitLineIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [MKMapItemIdentifier alloc];
        v12 = -[MKMapItemIdentifier initWithMUID:](v11, "initWithMUID:", objc_msgSend(v10, "unsignedLongLongValue", (_QWORD)v14));
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)overlayContainer
{
  MKOverlayContainerView *overlayContainer;
  MKOverlayContainerView *v4;
  MKOverlayContainerView *v5;
  MKOverlayContainerView *v6;

  overlayContainer = self->_overlayContainer;
  if (!overlayContainer)
  {
    v4 = -[MKOverlayContainerView initWithFrame:]([MKOverlayContainerView alloc], "initWithFrame:", 0.0, 0.0, 268435456.0, 268435456.0);
    v5 = self->_overlayContainer;
    self->_overlayContainer = v4;

    -[MKOverlayContainerView setDelegate:](self->_overlayContainer, "setDelegate:", self);
    v6 = self->_overlayContainer;
    -[MKMapView _zoomScale](self, "_zoomScale");
    -[MKOverlayContainerView setMapZoomScale:](v6, "setMapZoomScale:");
    -[MKOverlayContainerView setMapView:](self->_overlayContainer, "setMapView:", self);
    -[MKMapView _insertSubview:](self, "_insertSubview:", self->_overlayContainer);
    -[MKMapView _updateScrollContainerView:forReason:](self, "_updateScrollContainerView:forReason:", 0, 0);
    overlayContainer = self->_overlayContainer;
  }
  return overlayContainer;
}

- (id)createDrawableForOverlay:(id)a3
{
  id v4;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  void *v12;
  char v13;
  MKMapViewDelegate *v14;

  v4 = a3;
  if (self)
  {
    if (qword_1ECE2D910 != -1)
      dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
    if (_MergedGlobals_134)
    {
      v5 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (self)
    {
      if (qword_1ECE2D910 != -1)
        dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
      if (_MergedGlobals_134)
      {
        v8 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v8;
    }
    else
    {
      v10 = 0;
    }
    -[MKMapViewDelegate mapView:rendererForOverlay:](v10, "mapView:rendererForOverlay:", self, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v12, "_setUsageCounter:", self->_usageCounter);
    -[MKMapView _countUsageForRendererIfNeeded:](self, "_countUsageForRendererIfNeeded:", v12);
LABEL_40:

    goto LABEL_41;
  }
  if (self)
  {
    if (qword_1ECE2D910 != -1)
      dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
    if (_MergedGlobals_134)
    {
      v9 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;
  }
  else
  {
    v11 = 0;
  }
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    if (self)
    {
      if (qword_1ECE2D910 != -1)
        dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
      if (_MergedGlobals_134)
      {
        v14 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v14;
    }
    else
    {
      v10 = 0;
    }
    -[MKMapViewDelegate mapView:viewForOverlay:](v10, "mapView:viewForOverlay:", self, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  v12 = 0;
LABEL_41:

  return v12;
}

- (void)overlayContainerAddedDrawables:(id)a3
{
  void *v4;
  char isKindOfClass;
  MKMapViewDelegate *v6;
  void *v7;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  char v11;
  id v12;
  MKMapViewDelegate *v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  char v16;
  id v17;
  MKMapViewDelegate *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (self)
    {
      if (qword_1ECE2D910 != -1)
        dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
      if (_MergedGlobals_134)
      {
        v6 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v6;
    }
    else
    {
      v10 = 0;
    }
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = v19;
      if (self)
      {
        if (qword_1ECE2D910 != -1)
          dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
        if (_MergedGlobals_134)
        {
          v13 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v13 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v13;
        v12 = v19;
      }
      else
      {
        v15 = 0;
      }
      -[MKMapViewDelegate mapView:didAddOverlayRenderers:](v15, "mapView:didAddOverlayRenderers:", self, v12);
LABEL_39:

    }
  }
  else
  {
    objc_msgSend(v19, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) != 0)
    {
      if (self)
      {
        if (qword_1ECE2D910 != -1)
          dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
        if (_MergedGlobals_134)
        {
          v9 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v14 = v9;
      }
      else
      {
        v14 = 0;
      }
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v17 = v19;
        if (self)
        {
          if (qword_1ECE2D910 != -1)
            dispatch_once(&qword_1ECE2D910, &__block_literal_global_22);
          if (_MergedGlobals_134)
          {
            v18 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v18 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v15 = v18;
          v17 = v19;
        }
        else
        {
          v15 = 0;
        }
        -[MKMapViewDelegate mapView:didAddOverlayViews:](v15, "mapView:didAddOverlayViews:", self, v17);
        goto LABEL_39;
      }
    }
  }

}

- ($FD2884BA735A6398BD92EEF91FE53E55)overlayContainerVisibleMapRect:(id)a3
{
  void *v3;
  double v4;
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
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  -[VKMapView mapRegionIgnoringEdgeInsets](self->_mapView, "mapRegionIgnoringEdgeInsets", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GEOMapRectForMapRegion();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.var1.var1 = v15;
  result.var1.var0 = v14;
  result.var0.var1 = v13;
  result.var0.var0 = v12;
  return result;
}

- (void)_invalidateAllOverlayRendererColors
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MKOverlayContainerView allDrawables](self->_overlayContainer, "allDrawables", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_updateRenderColors");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addOverlay:(id)overlay
{
  id v4;
  void *v5;

  v4 = overlay;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOverlay:", v4);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 17);
}

- (void)addOverlays:(NSArray *)overlays
{
  NSArray *v4;
  void *v5;

  v4 = overlays;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOverlays:", v4);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 19);
}

- (void)addOverlay:(id)overlay level:(MKOverlayLevel)level
{
  id v6;
  void *v7;

  v6 = overlay;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOverlay:level:", v6, level);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 18);
}

- (void)addOverlays:(NSArray *)overlays level:(MKOverlayLevel)level
{
  NSArray *v6;
  void *v7;

  v6 = overlays;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOverlays:level:", v6, level);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 20);
}

- (void)insertOverlay:(id)overlay atIndex:(NSUInteger)index level:(MKOverlayLevel)level
{
  id v8;
  void *v9;

  v8 = overlay;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertOverlay:atIndex:level:", v8, index, level);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 21);
}

- (void)removeOverlay:(id)overlay
{
  -[MKOverlayContainerView removeOverlay:](self->_overlayContainer, "removeOverlay:", overlay);
  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 25);
}

- (void)insertOverlay:(id)overlay atIndex:(NSUInteger)index
{
  id v6;
  void *v7;

  v6 = overlay;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertOverlay:atIndex:", v6, index);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 22);
}

- (void)exchangeOverlayAtIndex:(NSUInteger)index1 withOverlayAtIndex:(NSUInteger)index2
{
  void *v7;

  -[MKMapView overlayContainer](self, "overlayContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exchangeOverlayAtIndex:withOverlayAtIndex:", index1, index2);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 27);
}

- (void)exchangeOverlay:(id)overlay1 withOverlay:(id)overlay2
{
  id v6;
  id v7;
  void *v8;

  v6 = overlay2;
  v7 = overlay1;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exchangeOverlay:withOverlay:", v7, v6);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 28);
}

- (void)insertOverlay:(id)overlay aboveOverlay:(id)sibling
{
  id v6;
  id v7;
  void *v8;

  v6 = sibling;
  v7 = overlay;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertOverlay:aboveOverlay:", v7, v6);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 23);
}

- (void)insertOverlay:(id)overlay belowOverlay:(id)sibling
{
  id v6;
  id v7;
  void *v8;

  v6 = sibling;
  v7 = overlay;
  -[MKMapView overlayContainer](self, "overlayContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertOverlay:belowOverlay:", v7, v6);

  -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 24);
}

- (MKOverlayView)viewForOverlay:(id)overlay
{
  void *v3;
  id v4;

  -[MKOverlayContainerView drawableForOverlay:](self->_overlayContainer, "drawableForOverlay:", overlay);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (MKOverlayView *)v4;
}

- (MKOverlayRenderer)rendererForOverlay:(id)overlay
{
  void *v3;
  id v4;

  -[MKOverlayContainerView drawableForOverlay:](self->_overlayContainer, "drawableForOverlay:", overlay);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (MKOverlayRenderer *)v4;
}

- (NSArray)overlaysInLevel:(MKOverlayLevel)level
{
  return (NSArray *)-[MKOverlayContainerView overlaysInLevel:](self->_overlayContainer, "overlaysInLevel:", level);
}

- (void)_addDependentSetRegionBlock:(id)a3
{
  -[MKMapView _addDependentSetRegionBlock:completion:](self, "_addDependentSetRegionBlock:completion:", a3, 0);
}

- (void)_addDependentSetRegionBlock:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableArray *whenSizedBlocks;
  NSMutableArray *v8;
  NSMutableArray *v9;
  MKWhenSizedBlock *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  whenSizedBlocks = self->_whenSizedBlocks;
  if (!whenSizedBlocks)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = self->_whenSizedBlocks;
    self->_whenSizedBlocks = v8;

    whenSizedBlocks = self->_whenSizedBlocks;
  }
  v10 = -[MKWhenSizedBlock initWithType:block:completion:]([MKWhenSizedBlock alloc], "initWithType:block:completion:", 1, v11, v6);
  -[NSMutableArray addObject:](whenSizedBlocks, "addObject:", v10);

}

- (void)_addDependentAuxiliaryBlock:(id)a3
{
  NSMutableArray *whenSizedBlocks;
  NSMutableArray *v5;
  NSMutableArray *v6;
  MKWhenSizedBlock *v7;
  id v8;

  v8 = a3;
  whenSizedBlocks = self->_whenSizedBlocks;
  if (!whenSizedBlocks)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_whenSizedBlocks;
    self->_whenSizedBlocks = v5;

    whenSizedBlocks = self->_whenSizedBlocks;
  }
  v7 = -[MKWhenSizedBlock initWithType:block:]([MKWhenSizedBlock alloc], "initWithType:block:", 2, v8);
  -[NSMutableArray addObject:](whenSizedBlocks, "addObject:", v7);

}

- (void)_createOverlayRendererDictionaryIfNeeded
{
  NSMutableDictionary *v3;
  NSMutableDictionary *overlayRendererEventDictionary;

  if (!self->_overlayRendererEventDictionary)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", &unk_1E21589C8, CFSTR("MKCircleRenderer"), &unk_1E21589E0, CFSTR("MKPolylineRenderer"), &unk_1E21589F8, CFSTR("MKMultiPolylineRenderer"), &unk_1E2158A10, CFSTR("MKPolygonRenderer"), &unk_1E2158A28, CFSTR("MKMultiPolygonRenderer"), &unk_1E2158A40, CFSTR("MKTileOverlayRenderer"), &unk_1E2158A58, CFSTR("MKPathOverlayRenderer"), 0);
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    overlayRendererEventDictionary = self->_overlayRendererEventDictionary;
    self->_overlayRendererEventDictionary = v3;

  }
}

- (void)_countUsageForRendererIfNeeded:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MKMapView _createOverlayRendererDictionaryIfNeeded](self, "_createOverlayRendererDictionaryIfNeeded");
  if (-[NSMutableDictionary count](self->_overlayRendererEventDictionary, "count"))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_overlayRendererEventDictionary, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", objc_msgSend(v6, "integerValue"));
      -[NSMutableDictionary removeObjectForKey:](self->_overlayRendererEventDictionary, "removeObjectForKey:", v5);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "shouldRasterize"))
    -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", 53);

}

- (NSArray)_visibleTileSets
{
  void *v2;
  void *v3;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleTileSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)_detailedDescription
{
  void *v2;
  void *v3;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)_detailedDescriptionDictionaryRepresentation
{
  void *v2;
  void *v3;

  -[MKMapView _mapLayer](self, "_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedDescriptionDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)_transitLineMarkersForSelectionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  -[MKMapView _mapLayer](self, "_mapLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView _mapLayer](self, "_mapLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromLayer:", v8, x, y);
  objc_msgSend(v6, "transitLineMarkersForSelectionAtPoint:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  MKAnnotationContainerView *annotationContainer;
  void *v5;

  if (self->_longPressGestureRecognizer != a3)
    return 1;
  annotationContainer = self->_annotationContainer;
  objc_msgSend(a3, "locationInView:", annotationContainer);
  -[MKAnnotationContainerView annotationViewForPoint:](annotationContainer, "annotationViewForPoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  BOOL v8;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = 0;
  if (self->_nonselectingTapGestureRecognizer == v6 || self->_selectingTapGestureRecognizer == v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  void *v18;
  MKMapViewDelegate *v19;
  MKMapViewDelegate *v20;
  char v21;
  MKMapViewDelegate *v22;
  MKMapViewDelegate *v23;
  CGPoint v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if ((*(_QWORD *)&self->_flags & 0x1000000000000000) == 0)
    goto LABEL_8;
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v8 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = -[MKMapViewDelegate mapView:shouldReceiveTouch:](v8, "mapView:shouldReceiveTouch:", self, v7);

  if (v10)
  {
LABEL_8:
    objc_msgSend(v7, "locationInView:", self);
    v12 = v11;
    v14 = v13;
    if (-[MKMapView calloutViewContainsPoint:](self, "calloutViewContainsPoint:")
      || -[MKMapView accessoryViewContainsPoint:](self, "accessoryViewContainsPoint:", v12, v14))
    {
      LOBYTE(v10) = 0;
    }
    else if (self->_selectingTapGestureRecognizer != v6
           || (-[VKMapView enableDebugLabelHighlighting](self->_mapView, "enableDebugLabelHighlighting") & 1) != 0
           || (-[MKAttributionLabel frame](self->_attributionLabel, "frame"),
               v24.x = v12,
               v24.y = v14,
               CGRectContainsPoint(v26, v24))
           || (-[UIImageView frame](self->_attributionBadgeView, "frame"),
               v25.x = v12,
               v25.y = v14,
               CGRectContainsPoint(v27, v25))
           && -[MKMapView _isAttributionBadgeClickable](self, "_isAttributionBadgeClickable"))
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 1;
      -[MKMapView _annotationAtPoint:avoidCurrent:](self, "_annotationAtPoint:avoidCurrent:", 1, v12, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[MKMapView _labelMarkerAtPoint:](self, "_labelMarkerAtPoint:", v12, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && ((objc_msgSend(v17, "isSelectable") & 1) != 0 || (*(_QWORD *)&self->_flags & 0x4000000000) != 0))
        {
          if (qword_1ECE2DC48 != -1)
            dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
          if (_MergedGlobals_157)
          {
            v19 = self->_unsafeDelegate;
          }
          else
          {
            -[MKMapView _safeDelegate](self, "_safeDelegate");
            v19 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
          }
          v20 = v19;
          v21 = objc_opt_respondsToSelector();

          if ((v21 & 1) != 0)
          {
            if (qword_1ECE2DC48 != -1)
              dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
            if (_MergedGlobals_157)
            {
              v22 = self->_unsafeDelegate;
            }
            else
            {
              -[MKMapView _safeDelegate](self, "_safeDelegate");
              v22 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
            }
            v23 = v22;
            LOBYTE(v10) = -[MKMapViewDelegate mapView:shouldSelectLabelMarker:](v22, "mapView:shouldSelectLabelMarker:", self, v18);

          }
          else
          {
            LOBYTE(v10) = 1;
          }
        }
        else
        {
          LOBYTE(v10) = 0;
        }

      }
    }
  }

  return v10;
}

- (void)_handleLongPressGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  MKAnnotationView *v9;
  MKAnnotationView *v10;
  _BOOL4 v11;
  char v12;
  uint64_t flags;
  int v14;
  MKAnnotationView *v15;
  BOOL v16;
  void *v17;
  char v18;
  MKAnnotationView *longPressedAnnotationView;
  double v20;
  double v21;
  double v22;
  double v23;
  MKAnnotationView *v24;
  MKAnnotationView *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  MKAnnotationManager *annotationManager;
  void *v32;
  id v33;

  v4 = a3;
  v33 = v4;
  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
  {
    if (objc_msgSend(v4, "state") == 3 || (v16 = objc_msgSend(v33, "state") == 4, v4 = v33, v16))
    {
      v10 = self->_longPressedAnnotationView;
      longPressedAnnotationView = self->_longPressedAnnotationView;
      self->_longPressedAnnotationView = 0;

      if ((*(_QWORD *)&self->_flags & 0x10000000000000) != 0)
      {
        -[MKMapView _dropDraggingAnnotationView:](self, "_dropDraggingAnnotationView:", 0);
      }
      else if (-[MKAnnotationView isHighlighted](v10, "isHighlighted"))
      {
        -[MKAnnotationView setHighlighted:](v10, "setHighlighted:", 0);
      }
      *(_QWORD *)&self->_flags &= ~0x200uLL;
      -[MKMapGestureController stopUserInteractionFromExternalGesture](self->_gestureController, "stopUserInteractionFromExternalGesture");
      goto LABEL_34;
    }
  }
  objc_msgSend(v4, "locationInView:", self->_annotationContainer);
  v7 = v5;
  v8 = v6;
  if ((*(_QWORD *)&self->_flags & 0x10000000000000) == 0)
  {
    -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 0, v5, v6, 10.0);
    v9 = (MKAnnotationView *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = -[MKAnnotationView isSelected](v9, "isSelected");
      v12 = *((_BYTE *)&self->_flags + 8);
      flags = (uint64_t)self->_flags;
      v14 = !v11;
      if ((flags & 0x10000000000000) != 0)
        v14 = 0;
      if ((flags & 0x200) == 0 || v14)
      {
        *(_QWORD *)&self->_flags = flags | 0x200;
        *((_BYTE *)&self->_flags + 8) = v12;
        v15 = self->_longPressedAnnotationView;
        if (v15)
          v16 = v15 == v10;
        else
          v16 = 1;
        if (!v16)
          -[MKAnnotationView setHighlighted:](v15, "setHighlighted:", 0);
        objc_storeStrong((id *)&self->_longPressedAnnotationView, v10);
        if (objc_msgSend(v33, "state") == 1)
          -[MKMapGestureController startUserInteractionFromExternalGesture](self->_gestureController, "startUserInteractionFromExternalGesture");
        if (-[MKAnnotationView isDraggable](v10, "isDraggable"))
        {
          -[MKAnnotationView annotation](v10, "annotation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_opt_respondsToSelector();

        }
        else
        {
          v18 = 0;
        }
        if (-[MKAnnotationView isSelected](v10, "isSelected"))
        {
          -[MKAnnotationView setHighlighted:](v10, "setHighlighted:", 1);
          if ((v18 & 1) != 0)
          {
            *(_QWORD *)&self->_flags &= ~4uLL;
            -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "_shouldDeselectWhenDragged");

            if (v27)
              -[MKAnnotationManager deselectAnnotation:animated:](self->_annotationManager, "deselectAnnotation:animated:", 0, 1);
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeObserver:name:object:", self, 0x1E20E6500, 0);

            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__annotationViewDragStateChanged_, 0x1E20E6500, v10);

            -[MKAnnotationView annotation](v10, "annotation");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKAnnotationManager setDraggedAnnotation:](self->_annotationManager, "setDraggedAnnotation:", v30);

            -[MKAnnotationContainerView _liftForDragging:mouseDownPoint:](self->_annotationContainer, "_liftForDragging:mouseDownPoint:", v10, v7, v8);
            *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
          }
        }
        else
        {
          annotationManager = self->_annotationManager;
          -[MKAnnotationView annotation](v10, "annotation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKAnnotationManager selectAnnotation:animated:](annotationManager, "selectAnnotation:animated:", v32, 1);

        }
      }
    }
    else
    {
      v24 = self->_longPressedAnnotationView;
      self->_longPressedAnnotationView = 0;
      v25 = v24;

      -[MKAnnotationView setHighlighted:](v25, "setHighlighted:", 0);
    }
LABEL_34:

    goto LABEL_35;
  }
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  -[MKAnnotationContainerView draggingTouchMovedToPoint:edgeInsets:](self->_annotationContainer, "draggingTouchMovedToPoint:edgeInsets:", v7, v8, v20, v21, v22, v23);
LABEL_35:

}

- (void)_handleSelectGestureToSelect:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  -[MKMapView _handleSelectionAtPoint:](self, "_handleSelectionAtPoint:");
}

- (void)_handleSelectGestureToDeselect:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  MKMapViewDelegate *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MKAnnotationManager *annotationManager;
  void *v14;
  id v15;

  v15 = a3;
  if (self)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v4 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_20:
    -[MKAnnotationManager selectedAnnotationRepresentation](self->_annotationManager, "selectedAnnotationRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "viewRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      annotationManager = self->_annotationManager;
      if (v11)
      {
        objc_msgSend(v11, "annotation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKAnnotationManager deselectAnnotation:animated:](annotationManager, "deselectAnnotation:animated:", v14, 1);

      }
      else
      {
        -[MKAnnotationManager deselectAnnotation:animated:](annotationManager, "deselectAnnotation:animated:", v10, 1);
      }

    }
    goto LABEL_26;
  }
  if (self)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v6 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v6 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = -[MKMapViewDelegate mapViewShouldHandleTapToDeselect:](v7, "mapViewShouldHandleTapToDeselect:", self);

  if (v8)
    goto LABEL_20;
LABEL_26:

}

- (BOOL)_isChangingRegionForGesture
{
  return (*(_QWORD *)&self->_flags & 0x60404000) != 0;
}

- (void)gestureControllerWillStartUserInteraction:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;

  -[VKMapView setGesturing:](self->_mapView, "setGesturing:", 1);
  self->_preGesturingLoopRate = -[VKMapView displayRate](self->_mapView, "displayRate");
  -[VKMapView setDisplayRate:](self->_mapView, "setDisplayRate:", -1);
  if ((*(_QWORD *)&self->_flags & 0x40000000000) != 0)
    -[MKMapView pauseUserLocationUpdates](self, "pauseUserLocationUpdates");
  -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v4 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    -[MKMapViewDelegate mapViewDidStartUserInteraction:](v7, "mapViewDidStartUserInteraction:", self);

  }
}

- (void)gestureControllerDidStopUserInteraction:(id)a3
{
  VKLabelMarker *pressedLabelMarker;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  id v10;

  v10 = a3;
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    -[VKLabelMarker setLabelPressed:](self->_pressedLabelMarker, "setLabelPressed:", 0);
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;

  }
  -[VKMapView setGesturing:](self->_mapView, "setGesturing:", 0);
  -[VKMapView setDisplayRate:](self->_mapView, "setDisplayRate:", self->_preGesturingLoopRate);
  if ((*(_QWORD *)&self->_flags & 0x40000000000) != 0)
    -[MKMapView resumeUserLocationUpdates](self, "resumeUserLocationUpdates");
  -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v5 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v8 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    -[MKMapViewDelegate mapViewDidStopUserInteraction:](v8, "mapViewDidStopUserInteraction:", self);

  }
}

- (void)gestureControllerWillStartPanning:(id)a3
{
  VKLabelMarker *pressedLabelMarker;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  id v10;

  v10 = a3;
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    -[VKLabelMarker setLabelPressed:](self->_pressedLabelMarker, "setLabelPressed:", 0);
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;

  }
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v5 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v8 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    -[MKMapViewDelegate mapView:willStartRespondingToGesture:animated:](v8, "mapView:willStartRespondingToGesture:animated:", self, 0, 0);

  }
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");

}

- (void)gestureControllerDidStopPanning:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  uint64_t flags;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  char v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  char v16;
  MKMapViewDelegate *v17;
  id v18;

  v6 = a3;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) != 0)
  {
    v18 = v6;
    v8 = *((_BYTE *)&self->_flags + 8);
    if (a4)
    {
      *(_QWORD *)&self->_flags = flags | 8;
      *((_BYTE *)&self->_flags + 8) = v8;
      -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
LABEL_29:
      v6 = v18;
      goto LABEL_30;
    }
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFFFBFF7;
    *((_BYTE *)&self->_flags + 8) = v8;
    -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v9 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v12 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v14 = v12;
      -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v12, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 0, 0, 0, 0, 0);
LABEL_28:

      goto LABEL_29;
    }
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v13 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v13 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v13;
    v16 = objc_opt_respondsToSelector();

    v6 = v18;
    if ((v16 & 1) != 0)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v17 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v17 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v14 = v17;
      -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v17, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 0, 0, 0, 0);
      goto LABEL_28;
    }
  }
LABEL_30:

}

- (void)gestureControllerDidStopPanningDecelerating:(id)a3
{
  id v4;
  uint64_t flags;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  char v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  char v14;
  MKMapViewDelegate *v15;
  id v16;

  v4 = a3;
  flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    v16 = v4;
    v6 = *((_BYTE *)&self->_flags + 8);
    *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFFFFFBFF7;
    *((_BYTE *)&self->_flags + 8) = v6;
    -[MKMapView _updateIconsShouldAlignToPixels](self, "_updateIconsShouldAlignToPixels");
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v10;
      -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v10, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 0, 0, 0, 1, 0);
LABEL_26:

      v4 = v16;
      goto LABEL_27;
    }
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v11 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
    v14 = objc_opt_respondsToSelector();

    v4 = v16;
    if ((v14 & 1) != 0)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v15 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v15 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v15;
      -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v15, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 0, 0, 1, 0);
      goto LABEL_26;
    }
  }
LABEL_27:

}

- (void)gestureControllerWillStartZooming:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  VKLabelMarker *pressedLabelMarker;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  char v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    -[VKLabelMarker setLabelPressed:](self->_pressedLabelMarker, "setLabelPressed:", 0);
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;

  }
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v7 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v10 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    -[MKMapViewDelegate mapView:willStartRespondingToGesture:animated:](v10, "mapView:willStartRespondingToGesture:animated:", self, 1, v4);

  }
  if ((*(_QWORD *)&self->_flags & 0x400000) == 0)
    -[MKMapView _willStartZoom:](self, "_willStartZoom:", v4);

}

- (void)gestureControllerDidStopZooming:(id)a3 direction:(int64_t)a4 willDecelerate:(BOOL)a5
{
  -[MKMapView gestureControllerDidStopZooming:direction:type:willDecelerate:](self, "gestureControllerDidStopZooming:direction:type:willDecelerate:", a3, a4, 7, a5);
}

- (void)gestureControllerDidStopZooming:(id)a3 direction:(int64_t)a4 type:(int64_t)a5 willDecelerate:(BOOL)a6
{
  id v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  char v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  MKMapViewDelegate *v16;
  MKMapViewDelegate *v17;
  char v18;
  MKMapViewDelegate *v19;
  id v20;

  v10 = a3;
  if ((*(_QWORD *)&self->_flags & 0x400000) != 0 && !a6)
  {
    v20 = v10;
    -[MKMapView _didEndZoom](self, "_didEndZoom");
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v11 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v14 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v16 = v14;
      -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v14, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 1, a4, a5, 0, 0);
LABEL_27:

      v10 = v20;
      goto LABEL_28;
    }
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v15 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v15 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v15;
    v18 = objc_opt_respondsToSelector();

    v10 = v20;
    if ((v18 & 1) != 0)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v19 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v19 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v16 = v19;
      -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v19, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 1, a4, 0, 0);
      goto LABEL_27;
    }
  }
LABEL_28:

}

- (void)gestureControllerDidStopZoomingDecelerating:(id)a3 direction:(int64_t)a4
{
  -[MKMapView gestureControllerDidStopZoomingDecelerating:direction:type:](self, "gestureControllerDidStopZoomingDecelerating:direction:type:", a3, a4, 7);
}

- (void)gestureControllerDidStopZoomingDecelerating:(id)a3 direction:(int64_t)a4 type:(int64_t)a5
{
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  char v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  MKMapViewDelegate *v13;
  char v14;
  MKMapViewDelegate *v15;
  MKMapViewDelegate *v16;

  -[MKMapView _didEndZoom](self, "_didEndZoom", a3);
  if (self)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v8 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    if (self)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v11 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = 0;
    }
    v16 = v11;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v11, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 1, a4, a5, 1, 0);
LABEL_36:

    return;
  }
  if (self)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v12 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    if (self)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v15 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v15 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v15, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 1, a4, 1, 0);
    goto LABEL_36;
  }
}

- (void)gestureControllerWillStartTwoFingerLongPress:(id)a3
{
  $5D7CD00554919180459D56D22149BB92 *p_flags;
  uint64_t flags;
  VKLabelMarker *pressedLabelMarker;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  char v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  id v13;

  v13 = a3;
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000000) != 0)
  {
    -[VKLabelMarker setLabelPressed:](self->_pressedLabelMarker, "setLabelPressed:", 0);
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;

    flags = *(_QWORD *)p_flags;
  }
  v7 = *((_BYTE *)&self->_flags + 8);
  *(_QWORD *)p_flags = flags | 0x200000000000000;
  *((_BYTE *)&self->_flags + 8) = v7;
  -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 0);
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v8 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v11 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    -[MKMapViewDelegate mapView:willStartRespondingToGesture:animated:](v11, "mapView:willStartRespondingToGesture:animated:", self, 4, 0);

  }
}

- (void)gestureControllerDidStopTwoFingerLongPress:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  char v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;

  *(_QWORD *)&self->_flags &= ~0x200000000000000uLL;
  -[MKMapView _showOrHideScaleIfNecessary:](self, "_showOrHideScaleIfNecessary:", 1);
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v4 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v7;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v7, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 4, 0, 0, 0, 0);
LABEL_26:

    return;
  }
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v8 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v11 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v11, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 4, 0, 0, 0);
    goto LABEL_26;
  }
}

- (void)gestureControllerWillStartRotating:(id)a3
{
  VKLabelMarker *pressedLabelMarker;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  id v10;

  v10 = a3;
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    -[VKLabelMarker setLabelPressed:](self->_pressedLabelMarker, "setLabelPressed:", 0);
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;

  }
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v5 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v8 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    -[MKMapViewDelegate mapView:willStartRespondingToGesture:animated:](v8, "mapView:willStartRespondingToGesture:animated:", self, 2, 0);

  }
  *(_QWORD *)&self->_flags |= 0x100000020000000uLL;
  if (self->_userTrackingMode == 2)
    -[MKMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 1, 1, 0);

}

- (void)gestureControllerDidStopRotating:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  uint64_t flags;
  char v8;
  long double v9;
  double v10;
  long double verticalYawOverride;
  double v12;
  double v13;
  double v14;
  MKMapViewDelegate *v15;
  MKMapViewDelegate *v16;
  char v17;
  MKMapViewDelegate *v18;
  MKMapViewDelegate *v19;
  MKMapViewDelegate *v20;
  MKMapViewDelegate *v21;
  char v22;
  MKMapViewDelegate *v23;
  id v24;

  v6 = a3;
  if (!a4)
  {
    flags = (uint64_t)self->_flags;
    if ((flags & 0x20000000) != 0)
    {
      v24 = v6;
      v8 = *((_BYTE *)&self->_flags + 8);
      *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFDFFFFFFFLL;
      *((_BYTE *)&self->_flags + 8) = v8;
      -[VKMapView yaw](self->_mapView, "yaw");
      v10 = v9;
      verticalYawOverride = self->_verticalYawOverride;
      v12 = fmod(v9, 360.0);
      if (v10 >= 0.0)
        v13 = v12;
      else
        v13 = v12 + 360.0;
      v14 = fmod(verticalYawOverride, 360.0);
      if (verticalYawOverride < 0.0)
        v14 = v14 + 360.0;
      if (vabdd_f64(v13, v14) > 180.0)
      {
        if (v13 >= v14)
          v14 = v14 + 360.0;
        else
          v13 = v13 + 360.0;
      }
      *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | ((unint64_t)(vabdd_f64(v14, v13) > 0.1) << 50);
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v15 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v15 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        if (qword_1ECE2DC48 != -1)
          dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
        if (_MergedGlobals_157)
        {
          v18 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v18 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v20 = v18;
        -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v18, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 2, 0, 0, 0, 0);
LABEL_36:

        v6 = v24;
        goto LABEL_37;
      }
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v19 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v19 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v21 = v19;
      v22 = objc_opt_respondsToSelector();

      v6 = v24;
      if ((v22 & 1) != 0)
      {
        if (qword_1ECE2DC48 != -1)
          dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
        if (_MergedGlobals_157)
        {
          v23 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v23 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v20 = v23;
        -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v23, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 2, 0, 0, 0);
        goto LABEL_36;
      }
    }
  }
LABEL_37:

}

- (void)gestureControllerWillStartTilting:(id)a3
{
  VKLabelMarker *pressedLabelMarker;
  MKMapViewDelegate *v5;
  MKMapViewDelegate *v6;
  char v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  id v10;

  v10 = a3;
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    -[VKLabelMarker setLabelPressed:](self->_pressedLabelMarker, "setLabelPressed:", 0);
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;

  }
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v5 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v5 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v8 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    -[MKMapViewDelegate mapView:willStartRespondingToGesture:animated:](v8, "mapView:willStartRespondingToGesture:animated:", self, 3, 0);

  }
  *(_QWORD *)&self->_flags |= 0x40000000uLL;

}

- (void)gestureControllerDidStopTilting:(id)a3 willDecelerate:(BOOL)a4 tiltDirection:(int64_t)a5
{
  id v8;
  uint64_t flags;
  char v10;
  MKMapViewDelegate *v11;
  MKMapViewDelegate *v12;
  char v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  MKMapViewDelegate *v16;
  MKMapViewDelegate *v17;
  char v18;
  MKMapViewDelegate *v19;
  id v20;

  v8 = a3;
  if (!a4)
  {
    flags = (uint64_t)self->_flags;
    if ((flags & 0x40000000) != 0)
    {
      v20 = v8;
      v10 = *((_BYTE *)&self->_flags + 8);
      *(_QWORD *)&self->_flags = flags & 0xFFFFFFFFBFFFFFFFLL;
      *((_BYTE *)&self->_flags + 8) = v10;
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v11 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v11 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        if (qword_1ECE2DC48 != -1)
          dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
        if (_MergedGlobals_157)
        {
          v14 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v16 = v14;
        -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v14, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 3, 0, 0, 0, a5);
LABEL_27:

        v8 = v20;
        goto LABEL_28;
      }
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v15 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v15 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v15;
      v18 = objc_opt_respondsToSelector();

      v8 = v20;
      if ((v18 & 1) != 0)
      {
        if (qword_1ECE2DC48 != -1)
          dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
        if (_MergedGlobals_157)
        {
          v19 = self->_unsafeDelegate;
        }
        else
        {
          -[MKMapView _safeDelegate](self, "_safeDelegate");
          v19 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
        }
        v16 = v19;
        -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v19, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 3, 0, 0, a5);
        goto LABEL_27;
      }
    }
  }
LABEL_28:

}

- (void)gestureControllerDidStopTiltingDecelerating:(id)a3
{
  MKMapViewDelegate *v4;
  MKMapViewDelegate *v5;
  char v6;
  MKMapViewDelegate *v7;
  MKMapViewDelegate *v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;
  char v11;
  MKMapViewDelegate *v12;
  id v13;

  v13 = a3;
  *(_QWORD *)&self->_flags &= ~0x40000000uLL;
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v4 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v4 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v7 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v7 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v7, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 3, 0, 0, 1, 0);
LABEL_25:

    goto LABEL_26;
  }
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v8 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v8 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v12 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v12 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v12, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 3, 0, 1, 0);
    goto LABEL_25;
  }
LABEL_26:

}

- (void)gestureControllerDidStopRotatingDecelerating:(id)a3
{
  long double v4;
  double v5;
  long double verticalYawOverride;
  double v7;
  double v8;
  double v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  char v12;
  MKMapViewDelegate *v13;
  MKMapViewDelegate *v14;
  MKMapViewDelegate *v15;
  char v16;
  MKMapViewDelegate *v17;
  MKMapViewDelegate *v18;

  *(_QWORD *)&self->_flags &= ~0x20000000uLL;
  -[VKMapView yaw](self->_mapView, "yaw", a3);
  v5 = v4;
  verticalYawOverride = self->_verticalYawOverride;
  v7 = fmod(v4, 360.0);
  if (v5 >= 0.0)
    v8 = v7;
  else
    v8 = v7 + 360.0;
  v9 = fmod(verticalYawOverride, 360.0);
  if (verticalYawOverride < 0.0)
    v9 = v9 + 360.0;
  if (vabdd_f64(v8, v9) > 180.0)
  {
    if (v8 >= v9)
      v9 = v9 + 360.0;
    else
      v8 = v8 + 360.0;
  }
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | ((unint64_t)(vabdd_f64(v9, v8) > 0.1) << 50);
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v10 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v13 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v13 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v13;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](v13, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", self, 2, 0, 0, 1, 0);
LABEL_35:

    return;
  }
  if (qword_1ECE2DC48 != -1)
    dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
  if (_MergedGlobals_157)
  {
    v14 = self->_unsafeDelegate;
  }
  else
  {
    -[MKMapView _safeDelegate](self, "_safeDelegate");
    v14 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v17 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v17 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    -[MKMapViewDelegate mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:](v17, "mapView:didStopRespondingToGesture:zoomDirection:didDecelerate:tiltDirection:", self, 2, 0, 1, 0);
    goto LABEL_35;
  }
}

- (BOOL)gestureController:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  char v8;
  MKMapViewDelegate *v9;
  MKMapViewDelegate *v10;

  v6 = a3;
  v7 = a4;
  if ((*(_QWORD *)&self->_flags & 0x1000000000000000) != 0)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v9 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v9 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v8 = -[MKMapViewDelegate mapView:shouldReceiveTouch:](v9, "mapView:shouldReceiveTouch:", self, v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (double)gestureController:(id)a3 shouldWaitForNextTapForDuration:(double)a4 afterTouch:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  double v12;

  v7 = a5;
  v8 = v7;
  if ((*(_QWORD *)&self->_flags & 0x2000000000000000) != 0)
  {
    objc_msgSend(v7, "locationInView:", self->_annotationContainer);
    -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (qword_1ECE2DC48 != -1)
        dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
      if (_MergedGlobals_157)
      {
        v10 = self->_unsafeDelegate;
      }
      else
      {
        -[MKMapView _safeDelegate](self, "_safeDelegate");
        v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      -[MKMapViewDelegate mapView:shouldDelayTapResponse:onAnnotationView:forDuration:](v10, "mapView:shouldDelayTapResponse:onAnnotationView:forDuration:", self, v8, v9, a4);
      a4 = v12;

    }
  }

  return a4;
}

- (CGPoint)gestureController:(id)a3 focusPointForPoint:(CGPoint)a4 gestureKind:(int64_t)a5
{
  double y;
  double x;
  id v9;
  MKMapViewDelegate *v10;
  MKMapViewDelegate *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  if (self)
  {
    if (qword_1ECE2DC48 != -1)
      dispatch_once(&qword_1ECE2DC48, &__block_literal_global_65);
    if (_MergedGlobals_157)
    {
      v10 = self->_unsafeDelegate;
    }
    else
    {
      -[MKMapView _safeDelegate](self, "_safeDelegate");
      v10 = (MKMapViewDelegate *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MKMapViewDelegate mapView:focusPointForPoint:gesture:](v11, "mapView:focusPointForPoint:gesture:", self, a5, x, y);
      x = v12;
      y = v13;
    }
  }
  else
  {
    v11 = 0;
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGRect)gestureControllerSignificantViewFrame:(id)a3
{
  double v4;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[MKMapView bounds](self, "bounds", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v13 = v7 + v12;
  v16 = v9 - (v14 + v15);
  v18 = v11 - (v12 + v17);
  v19 = v5 + v14;
  v20 = v13;
  v21 = v16;
  result.size.height = v18;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_setRouteContextForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "count"))
    v7 = 0;
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  -[MKMapView _setRouteContextForRoutes:selectedRouteIndex:](self, "_setRouteContextForRoutes:selectedRouteIndex:", v6, v7);

}

- (void)_setRouteContextForRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  MKRouteContextBuilder *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[MKMapView _shouldUpdateSelectedRouteFromRoutes:selectedRouteIndex:](self, "_shouldUpdateSelectedRouteFromRoutes:selectedRouteIndex:"))
  {
    v6 = objc_alloc_init(MKRouteContextBuilder);
    -[MKRouteContextBuilder buildRouteContextForRoutes:selectedRouteIndex:](v6, "buildRouteContextForRoutes:selectedRouteIndex:", v8, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView _setRouteContext:](self, "_setRouteContext:", v7);

  }
}

- (BOOL)_shouldUpdateSelectedRouteFromRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  _BOOL8 v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (objc_msgSend(v24, "count") <= a4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v24, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v24, "count");
  v22 = v6 != 0;
  -[VKRouteContext routeInfo](self->_routeContext, "routeInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v6)
  {
    -[VKRouteContext alternateRoutes](self->_routeContext, "alternateRoutes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v7 - v22 == v11)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      obj = v24;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = 0;
        v14 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (v16 != v6)
            {
              -[VKRouteContext alternateRoutes](self->_routeContext, "alternateRoutes");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectAtIndexedSubscript:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "route");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v16 == v19;

              if (!v20)
              {

                goto LABEL_20;
              }
              ++v13;
            }
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v12)
            continue;
          break;
        }
      }

      LOBYTE(v22) = 0;
    }
  }
  else
  {

  }
LABEL_20:

  return v22;
}

- (void)_setRouteContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  VKMapView *v13;
  id v14;

  v5 = a3;
  v14 = v5;
  if (v5 && self->_routeContext)
  {
    objc_msgSend(v5, "routeInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueRouteID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKRouteContext routeInfo](self->_routeContext, "routeInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueRouteID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqual:", v11);

  }
  else
  {
    v12 = 0;
  }
  objc_storeStrong((id *)&self->_routeContext, a3);
  v13 = self->_mapView;
  -[VKMapView setRouteContext:](v13, "setRouteContext:", self->_routeContext);
  if ((v12 & 1) == 0)
    -[VKMapView setRouteLineSplitAnnotation:](v13, "setRouteLineSplitAnnotation:", 0);

}

- (void)_clearRouteContext
{
  VKRouteContext *routeContext;
  VKMapView *v4;

  routeContext = self->_routeContext;
  if (routeContext)
  {
    self->_routeContext = 0;

    v4 = self->_mapView;
    -[VKMapView setRouteContext:](v4, "setRouteContext:", 0);
    -[VKMapView setRouteLineSplitAnnotation:](v4, "setRouteLineSplitAnnotation:", 0);

  }
}

- (id)_routeInfoForRoute:(id)a3
{
  -[VKRouteContext _routeInfoForRoute:](self->_routeContext, "_routeInfoForRoute:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setRouteContextInspectedSegmentIndex:(unint64_t)a3 inspectedStepIndex:(unint64_t)a4
{
  -[VKRouteContext _setRouteContextInspectedSegmentIndex:inspectedStepIndex:](self->_routeContext, "_setRouteContextInspectedSegmentIndex:inspectedStepIndex:", a3, a4);
}

- (void)_setRouteContextAnnotationText:(id)a3 etaType:(int64_t)a4 tollCurrency:(unsigned __int8)a5 advisoryStyleAttributes:(id)a6 forRoute:(id)a7
{
  -[VKRouteContext _setRouteContextAnnotationText:etaType:tollCurrency:advisoryStyleAttributes:forRoute:](self->_routeContext, "_setRouteContextAnnotationText:etaType:tollCurrency:advisoryStyleAttributes:forRoute:", a3, a4, a5, a6, a7);
}

- (void)_setRouteContextAnnotationTexts:(id)a3 forLegsInRoute:(id)a4
{
  -[VKRouteContext _setRouteContextAnnotationTexts:forLegsInRoute:](self->_routeContext, "_setRouteContextAnnotationTexts:forLegsInRoute:", a3, a4);
}

- (void)_setRouteContextAnnotationFocus:(BOOL)a3 forRoute:(id)a4
{
  -[VKRouteContext _setRouteContextAnnotationFocus:forRoute:](self->_routeContext, "_setRouteContextAnnotationFocus:forRoute:", a3, a4);
}

- (void)_setAlternateRouteContextAnnotationETAComparison:(unsigned __int8)a3 forRoute:(id)a4
{
  -[VKRouteContext _setAlternateRouteContextAnnotationETAComparison:forRoute:](self->_routeContext, "_setAlternateRouteContextAnnotationETAComparison:forRoute:", a3, a4);
}

- (void)_updateWaypointCaptions
{
  -[VKRouteContext _updateWaypointCaptions](self->_routeContext, "_updateWaypointCaptions");
  -[VKMapView forceLayout](self->_mapView, "forceLayout");
}

- (BOOL)canBecomeFocused
{
  void *v2;
  BOOL v3;

  -[MKMapView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 3;

  return v3;
}

- (int64_t)_focusItemDeferralMode
{
  return 2;
}

- (id)focusEffect
{
  return 0;
}

- (void)setCustomOverrideInterfaceStyle:(int64_t)a3
{
  -[MKMapView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:");
  if (a3)
    -[MKMapView _updateAppearanceIfNeeded](self, "_updateAppearanceIfNeeded");
}

- (void)zoomControlMinusPressed:(id)a3
{
  -[MKMapView startLinearZoomIn:](self, "startLinearZoomIn:", 0);
}

- (void)zoomControlPlusPressed:(id)a3
{
  -[MKMapView startLinearZoomIn:](self, "startLinearZoomIn:", 1);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "keyCode");
  v11 = (unint64_t)(v10 - 45) > 0x25 || ((1 << (v10 - 45)) & 0x3C00000003) == 0;
  if (v11 || !-[MKMapGestureController keyDown:](self->_gestureController, "keyDown:", v8))
  {
    v12.receiver = self;
    v12.super_class = (Class)MKMapView;
    -[MKMapView pressesBegan:withEvent:](&v12, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (BOOL)_pressEnded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "keyCode");
  v8 = (unint64_t)(v6 - 45) <= 0x25
    && ((1 << (v6 - 45)) & 0x3C00000003) != 0
    && -[MKMapGestureController keyUp:](self->_gestureController, "keyUp:", v4);

  return v8;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MKMapView _pressEnded:](self, "_pressEnded:", v8))
  {
    v9.receiver = self;
    v9.super_class = (Class)MKMapView;
    -[MKMapView pressesEnded:withEvent:](&v9, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MKMapView _pressEnded:](self, "_pressEnded:", v8))
  {
    v9.receiver = self;
    v9.super_class = (Class)MKMapView;
    -[MKMapView pressesCancelled:withEvent:](&v9, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (id)delegate
{
  id *v2;

  if (self)
  {
    v2 = (id *)self;
    if (qword_1ECE2DE10 != -1)
      dispatch_once(&qword_1ECE2DE10, &__block_literal_global_17_0);
    if (_MergedGlobals_171)
      return v2[67];
    else
      return (id)objc_msgSend(v2, "_safeDelegate");
  }
  return self;
}

- (id)_flattenedAnnotationsForAnnotationViews:(id)a3 maxDisplayPriority:(float *)a4
{
  size_t v6;
  id *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MKAnnotationView *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  id *v27;
  uint64_t v28;
  void *v29;
  uint64_t v32;
  id obj;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "count");
  v7 = (id *)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a3;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v9 = &OBJC_IVAR____MKUIViewControllerClickableRootView__gestureRecognizer;
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      v32 = v10;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(char **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        v15 = *(void **)&v14[v9[319]];
        if (!v15)
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v13), "annotation");
        if (objc_msgSend(v15, "_isMKClusterAnnotation"))
        {
          v16 = (void *)objc_msgSend(v15, "memberAnnotations");
          v6 = v6 + objc_msgSend(v16, "count") - 1;
          v7 = (id *)malloc_type_realloc(v7, 8 * v6, 0x80040B8603338uLL);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v17)
          {
            v18 = v17;
            v19 = v12;
            v20 = *(_QWORD *)v36;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v36 != v20)
                  objc_enumerationMutation(v16);
                v22 = -[MKMapView viewForAnnotation:](self, "viewForAnnotation:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v21));
                if (v22)
                {
                  v7[v11++] = v22;
                }
                else
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: memberView != nil", buf, 2u);
                  }
                  --v6;
                }
                ++v21;
              }
              while (v18 != v21);
              v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              v18 = v23;
            }
            while (v23);
            v9 = &OBJC_IVAR____MKUIViewControllerClickableRootView__gestureRecognizer;
            v12 = v19;
            v10 = v32;
          }
        }
        else
        {
          v7[v11++] = v14;
        }
        ++v13;
      }
      while (v13 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v10);
  }
  qsort_b(v7, v6, 8uLL, &__block_literal_global_99);
  objc_msgSend(*v7, "displayPriority");
  *(_DWORD *)a4 = v24;
  v25 = 0;
  if (v6)
  {
    v26 = MEMORY[0x1E0C81028];
    v27 = v7;
    do
    {
      v28 = *((_QWORD *)*v27 + 81);
      if (v28 || (v28 = objc_msgSend(*v27, "annotation")) != 0)
      {
        v7[v25++] = (id)v28;
      }
      else if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18B0B0000, v26, OS_LOG_TYPE_FAULT, "Assertion failed: annotation != nil", buf, 2u);
      }
      ++v27;
      --v6;
    }
    while (v6);
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, v25);
  free(v7);
  return v29;
}

uint64_t __82__MKMapView_MKNonARC___flattenedAnnotationsForAnnotationViews_maxDisplayPriority___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3;
  float v4;

  v3 = *(float *)(*(_QWORD *)a2 + 656);
  v4 = *(float *)(*(_QWORD *)a3 + 656);
  if (v3 > v4)
    return 0xFFFFFFFFLL;
  if (v3 < v4)
    return 1;
  return *(_QWORD *)a2 - *(_QWORD *)a3;
}

- (CGPoint)_convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4
{
  VKMapView *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v6 = self->_mapView;
  v7 = a4;
  VKLocationCoordinate2DMake();
  v9 = v8;
  v11 = v10;
  -[MKMapView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView convertCoordinate:toPointToLayer:](v6, "convertCoordinate:toPointToLayer:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", v7, v14, v16);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CLLocationCoordinate2D)_convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4
{
  double y;
  double x;
  VKMapView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CLLocationDegrees v15;
  double v16;
  CLLocationDegrees v17;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v20;
  CLLocationCoordinate2D result;

  y = a3.y;
  x = a3.x;
  v8 = self->_mapView;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", a4, x, y);
  v10 = v9;
  v12 = v11;
  -[MKMapView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView convertPoint:toCoordinateFromLayer:](v8, "convertPoint:toCoordinateFromLayer:", v13, v10, v12);
  v15 = v14;
  v17 = v16;

  v20 = CLLocationCoordinate2DMake(v15, v17);
  longitude = v20.longitude;
  latitude = v20.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CGPoint)_convertMapPoint:(id)a3 toPointToView:(id)a4
{
  double var1;
  double var0;
  VKMapView *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = self->_mapView;
  v9 = a4;
  -[MKMapView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView convertMapPoint:toPointToLayer:](v8, "convertMapPoint:toPointToLayer:", v10, var0, var1);
  v12 = v11;
  v14 = v13;

  -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", v9, v12, v14);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_convertPoint:(CGPoint)a3 toMapPointFromView:(id)a4
{
  double y;
  double x;
  VKMapView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  v8 = self->_mapView;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", a4, x, y);
  v10 = v9;
  v12 = v11;
  -[MKMapView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView convertPoint:toMapPointFromLayer:](v8, "convertPoint:toMapPointFromLayer:", v13, v10, v12);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (CGRect)_convertRegion:(id *)a3 toRectToView:(id)a4
{
  $DC1C8D958DDC8D67D0023B74A9319680 *v5;
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
  double v17;
  CGRect result;

  v5 = a3;
  GEOMapRectForCoordinateRegion();
  -[MKMapView _convertMapRect:toRectToView:](self, "_convertMapRect:toRectToView:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)_convertRect:(SEL)a3 toRegionFromView:(CGRect)a4
{
  $DC1C8D958DDC8D67D0023B74A9319680 *result;
  MKMapRect v6;

  -[MKMapView _convertRect:toMapRectFromView:](self, "_convertRect:toMapRectFromView:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  MKCoordinateRegionForMapRect(v6);
  return result;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_convertRect:(CGRect)a3 toMapRectFromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v30;
  BOOL v31;
  char v32;
  BOOL v33;
  char v34;
  double v35;
  double v36;
  double v37;
  _QWORD v38[9];
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v38[8] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, x, y);
  v11 = v10;
  v13 = v12;
  v14 = y + height;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, x, y + height);
  v16 = v15;
  v18 = v17;
  v19 = x + width;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, v19, y);
  v21 = v20;
  v23 = v22;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, v19, v14);
  v25 = v24;
  v27 = v26;

  v28 = 0.0;
  v30 = v11 == -1.0 || v13 == -1.0;
  if (v30
    || (v16 != -1.0 ? (v31 = v18 == -1.0) : (v31 = 1),
        !v31 ? (v32 = 0) : (v32 = 1),
        v32 || (v21 != -1.0 ? (v33 = v23 == -1.0) : (v33 = 1), !v33 ? (v34 = 0) : (v34 = 1), v34)))
  {
    v37 = INFINITY;
  }
  else
  {
    v37 = INFINITY;
    if (v25 != -1.0 && v27 != -1.0)
    {
      *(double *)v38 = v11;
      *(double *)&v38[1] = v13;
      *(double *)&v38[2] = v16;
      *(double *)&v38[3] = v18;
      *(double *)&v38[4] = v21;
      *(double *)&v38[5] = v23;
      *(double *)&v38[6] = v25;
      *(double *)&v38[7] = v27;
      v37 = MKMapRectBoundingMapPoints((uint64_t)v38, 4);
      goto LABEL_28;
    }
  }
  v35 = INFINITY;
  v36 = 0.0;
LABEL_28:
  result.var1.var1 = v36;
  result.var1.var0 = v28;
  result.var0.var1 = v35;
  result.var0.var0 = v37;
  return result;
}

- (CGRect)_convertMapRect:(id)a3 toRectToView:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float64_t v46;
  uint64_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  float64x2_t v55;
  float64_t v56;
  _QWORD v57[9];
  CGRect result;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v6 = a3.var0.var1;
  v7 = a3.var0.var0;
  v57[8] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = v6 + var1;
  v11 = v7 + var0;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v7, v6);
  v13 = v12;
  v15 = v14;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v7, v10);
  v17 = v16;
  v19 = v18;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v11, v6);
  v21 = v20;
  v23 = v22;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v11, v10);
  v26 = fabs(v15);
  v27 = fabs(v17);
  v28 = fabs(v19);
  v29 = fabs(v21);
  v30 = fabs(v23);
  v31 = fabs(v24);
  v32 = fabs(v25);
  if (fabs(v13) == INFINITY
    || v26 == INFINITY
    || v27 == INFINITY
    || v28 == INFINITY
    || v29 == INFINITY
    || v30 == INFINITY
    || v31 == INFINITY
    || v32 == INFINITY)
  {
    v46 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v55 = *(float64x2_t *)(MEMORY[0x1E0C9D628] + 16);
    v56 = *MEMORY[0x1E0C9D628];
  }
  else
  {
    v47 = 0;
    *(double *)v57 = v13;
    *(double *)&v57[1] = v15;
    *(double *)&v57[2] = v17;
    *(double *)&v57[3] = v19;
    *(double *)&v57[4] = v21;
    *(double *)&v57[5] = v23;
    *(double *)&v57[6] = v24;
    *(double *)&v57[7] = v25;
    v48 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    v49 = (float64x2_t)vdupq_n_s64(0xFFF0000000000000);
    do
    {
      v50 = *(float64x2_t *)&v57[v47];
      v48 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v48, v50), (int8x16_t)v50, (int8x16_t)v48);
      v49 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v50, v49), (int8x16_t)v50, (int8x16_t)v49);
      v47 += 2;
    }
    while (v47 != 8);
    v55 = vsubq_f64(v49, v48);
    v46 = v48.f64[1];
    v56 = v48.f64[0];
  }

  v52 = v55.f64[0];
  v51 = v56;
  v53 = v55.f64[1];
  v54 = v46;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v54;
  result.origin.x = v51;
  return result;
}

- (double)_distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 fromView:(id)a5 withPrecision:(int64_t)a6
{
  double y;
  double x;
  double v10;
  double v11;
  VKMapView *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v13 = self->_mapView;
  v14 = a5;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v14, v11, v10);
  v16 = v15;
  v18 = v17;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v14, x, y);
  v20 = v19;
  v22 = v21;

  -[MKMapView layer](self, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView distanceFromPoint:toPoint:fromLayer:withPrecision:](v13, "distanceFromPoint:toPoint:fromLayer:withPrecision:", v23, a6 == 1, v16, v18, v20, v22);
  v25 = v24;

  return v25;
}

+ ($DC1C8D958DDC8D67D0023B74A9319680)_regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 viewInsets:(CGSize)a5 edgePadding:(UIEdgeInsets)a6 region:(UIEdgeInsets)a7 minZoomLevel:(id *)a8 maxZoomLevel:(double)a9 snapToZoomLevel:(double)a10
{
  CGFloat top;
  double height;
  double width;
  CGFloat left;
  CGFloat right;
  CGFloat bottom;
  $DC1C8D958DDC8D67D0023B74A9319680 *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  MKMapRect v27;

  top = a6.top;
  height = a5.height;
  width = a5.width;
  if (a10 >= -180.0)
  {
    left = a6.left;
    if (a10 <= 180.0)
    {
      right = a6.right;
      bottom = a6.bottom;
      if (a9 >= -90.0
        && a9 <= 90.0
        && v23 >= 0.0
        && v23 <= 180.0
        && v24 >= 0.0
        && v24 <= 360.0
        && a5.width - (a6.left + a6.right) - (a7.left + a7.right) > 0.0
        && a5.height - (a6.top + a6.bottom) - (a7.top + a7.bottom) > 0.0)
      {
        v18 = result;
        GEOMapRectForCoordinateRegion();
        -[$DC1C8D958DDC8D67D0023B74A9319680 _mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:](v18, "_mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:", a8, 0.0, 0.0, width, height, v19, v20, v21, v22, *(_QWORD *)&top, *(_QWORD *)&left, *(_QWORD *)&bottom, *(_QWORD *)&right, *(_QWORD *)&a7.top, *(_QWORD *)&a7.left, *(_QWORD *)&a7.bottom, *(_QWORD *)&a7.right,
          v25,
          v26);
        MKCoordinateRegionForMapRect(v27);
      }
    }
  }
  return result;
}

+ (unint64_t)minZoomLevelForMapType:(unint64_t)a3 viewSize:(CGSize)a4
{
  CGFloat v4;
  double v5;
  double v6;

  v4 = a4.width * 0.0000000037252903;
  v5 = a4.height * 0.0000000037252903;
  if (v4 <= v5)
    v4 = v5;
  v6 = ceil(log2(v4)) + 21.0;
  if (v6 <= 0.0)
    return (unint64_t)0.0;
  return (unint64_t)v6;
}

@end

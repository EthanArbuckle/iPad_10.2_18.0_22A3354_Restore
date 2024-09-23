@implementation MKAnnotationView

- (MKAnnotationViewDragState)dragState
{
  return self->_dragState;
}

- (double)_pointsForDistance:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[MKAnnotationView anchor](self, "anchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointOffsetForDistanceOffset:", a3);
  v6 = v5;

  return v6;
}

- (VKAnchorWrapper)anchor
{
  _MKAnnotationViewAnchor *anchor;
  _MKAnnotationViewAnchor *v4;
  _MKAnnotationViewAnchor *v5;

  anchor = self->_anchor;
  if (!anchor)
  {
    v4 = objc_alloc_init(_MKAnnotationViewAnchor);
    v5 = self->_anchor;
    self->_anchor = v4;

    -[VKAnchorWrapper setFollowsTerrain:](self->_anchor, "setFollowsTerrain:", objc_msgSend((id)objc_opt_class(), "_followsTerrain"));
    -[_MKAnnotationViewAnchor setAnnotationView:](self->_anchor, "setAnnotationView:", self);
    anchor = self->_anchor;
  }
  return (VKAnchorWrapper *)anchor;
}

- (void)_setHidden:(BOOL)a3 forReason:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  char v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  unint64_t hiddenReasons;
  int v13;
  _BOOL8 v14;
  _BOOL4 v15;
  unint64_t v16;
  NSMutableArray *hiddenCompletionBlocks;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  __int16 flags;
  double realAlpha;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = v10;
  hiddenReasons = self->_hiddenReasons;
  v13 = 1 << v7;
  if (v8)
  {
    self->_hiddenReasons = hiddenReasons | v13;
    if (hiddenReasons)
      goto LABEL_23;
    v14 = 1;
  }
  else
  {
    v15 = hiddenReasons == 0;
    v16 = hiddenReasons & ~v13;
    self->_hiddenReasons = v16;
    v14 = v16 != 0;
    if (v15 != v14)
      goto LABEL_23;
  }
  if (v10)
  {
    hiddenCompletionBlocks = self->_hiddenCompletionBlocks;
    if (hiddenCompletionBlocks)
    {
      v18 = (void *)MEMORY[0x18D778DB8](v10);
      -[NSMutableArray addObject:](hiddenCompletionBlocks, "addObject:", v18);
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C99DE8];
      v18 = (void *)MEMORY[0x18D778DB8](v10);
      objc_msgSend(v19, "arrayWithObject:", v18);
      v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v21 = self->_hiddenCompletionBlocks;
      self->_hiddenCompletionBlocks = v20;

    }
  }
  flags = (__int16)self->_flags;
  *(_WORD *)&self->_flags = flags & 0xDFFF;
  if (v6)
  {
    *(_WORD *)&self->_flags = flags | 0x2000;
  }
  else
  {
    realAlpha = 0.0;
    if (!v14)
      realAlpha = self->_realAlpha;
    v35.receiver = self;
    v35.super_class = (Class)MKAnnotationView;
    -[MKAnnotationView setAlpha:](&v35, sel_setAlpha_, realAlpha);
    v34.receiver = self;
    v34.super_class = (Class)MKAnnotationView;
    -[MKAnnotationView setHidden:](&v34, sel_setHidden_, v14);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = self->_hiddenCompletionBlocks;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v26);
    }

    -[NSMutableArray removeAllObjects](self->_hiddenCompletionBlocks, "removeAllObjects", (_QWORD)v30);
  }
  -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature"));
  -[MKAnnotationView _annotationContainer](self, "_annotationContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "annotationViewDidChangeHidden:", self);

LABEL_23:
}

- (void)_setHidden:(BOOL)a3 forReason:(unint64_t)a4 animated:(BOOL)a5
{
  -[MKAnnotationView _setHidden:forReason:animated:completion:](self, "_setHidden:forReason:animated:completion:", a3, a4, a5, 0);
}

- (_MKStaticMapView)_staticMapView
{
  return (_MKStaticMapView *)objc_loadWeakRetained((id *)&self->_staticMapView);
}

- (void)_updateFromMap
{
  if (_MKLinkedOnOrAfterReleaseSet(3852))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_titleVisibility = 1;
      self->_subtitleVisibility = 1;
    }
  }
}

- (void)_updateAnchorPosition:(CGPoint)a3 alignToPixels:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
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
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  double v32;
  double v33;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  self->_anchorPoint = a3;
  -[MKAnnotationView centerOffset](self, "centerOffset");
  v9 = x + v8;
  v11 = y + v10;
  -[MKAnnotationView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v16 = v9 - v12 * 0.5;
  v17 = v11 - v14 * 0.5;
  -[MKAnnotationView _collisionAlignmentRectInsets](self, "_collisionAlignmentRectInsets");
  self->_collisionFrame.origin.x = v18 + v16 + -5.0;
  self->_collisionFrame.origin.y = v19 + v17 + -5.0;
  self->_collisionFrame.size.width = v13 - (v18 + v20) + 10.0;
  self->_collisionFrame.size.height = v15 - (v19 + v21) + 10.0;
  if (v4 && !-[MKAnnotationView isHidden](self, "isHidden"))
  {
    -[MKAnnotationView _currentScreenScale](self, "_currentScreenScale");
    v9 = MKIntegralCenterForViewWithScale(self, v9, v11, v22);
    v11 = v23;
  }
  v24 = fabs(v11);
  v25 = INFINITY;
  if (fabs(v9) != INFINITY && v24 != INFINITY)
  {
    if (self->_wantsViewBasedPositioning)
      goto LABEL_13;
    if (-[MKAnnotationView isSelected](self, "isSelected", INFINITY, v24))
    {
      -[MKAnnotationView leftCalloutAccessoryView](self, "leftCalloutAccessoryView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27
        || (-[MKAnnotationView rightCalloutAccessoryView](self, "rightCalloutAccessoryView"),
            (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

        goto LABEL_13;
      }
      -[MKAnnotationView detailCalloutAccessoryView](self, "detailCalloutAccessoryView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
LABEL_13:
        -[MKAnnotationView center](self, "center", v25, v24);
        if (v29 == v9 && v28 == v11)
          return;
        -[MKAnnotationView setCenter:](self, "setCenter:", v9, v11);
LABEL_17:
        -[MKCalloutView annotationViewFrameDidChange](self->_calloutView, "annotationViewFrameDidChange");
        return;
      }
    }
    v31 = (id)-[MKAnnotationView layer](self, "layer");
    objc_msgSend(v31, "position");
    if (v33 != v9 || v32 != v11)
    {
      objc_msgSend(v31, "setPosition:", v9, v11);
      goto LABEL_17;
    }
  }
}

- (BOOL)isHidden
{
  return self->_hiddenReasons != 0;
}

- (UIEdgeInsets)_collisionAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (self->_subclassImplementsAlignmentRectInsets)
    -[MKAnnotationView alignmentRectInsets](self, "alignmentRectInsets");
  else
    -[MKAnnotationView _defaultCollisionAlignmentRectInsets](self, "_defaultCollisionAlignmentRectInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)centerOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_centerOffset.x;
  y = self->_centerOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -5.0;
  v3 = -5.0;
  v4 = -5.0;
  v5 = -5.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_mapView
{
  void *v2;
  uint64_t v3;

  -[MKAnnotationView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)_setMapRotationRadians:(double)a3
{
  double direction;
  CGAffineTransform v5;

  self->_mapRotationRadians = a3;
  direction = self->_direction;
  if (direction > 0.0)
  {
    CGAffineTransformMakeRotation(&v5, -(a3 - direction * 0.0174532925));
    -[MKAnnotationView setTransform:](self, "setTransform:", &v5);
  }
}

- (id)_annotationContainer
{
  void *v2;
  void *v3;
  id v4;

  -[MKAnnotationView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (BOOL)_followsTerrain
{
  return 1;
}

- (CLLocationCoordinate2D)_presentationCoordinate
{
  int *v2;
  double *v3;
  double v4;
  double v5;
  CLLocationCoordinate2D result;

  v2 = &OBJC_IVAR___MKAnnotationView__presentationCoordinate;
  if (!self->_animatingToCoordinate)
  {
    v2 = &OBJC_IVAR___MKAnnotationView__coordinate;
    if (self->_tracking)
      v2 = &OBJC_IVAR___MKAnnotationView__presentationCoordinate;
  }
  v3 = (double *)((char *)self + *v2);
  v4 = *v3;
  v5 = v3[1];
  result.longitude = v5;
  result.latitude = v4;
  return result;
}

- (MKAnnotationViewZPriority)selectedZPriority
{
  return self->_selectedZPriority;
}

- (float)_effectiveZPriority
{
  float v3;
  float v4;
  double v5;
  float v6;

  v3 = 1001.0;
  if (-[MKAnnotationView dragState](self, "dragState") != MKAnnotationViewDragStateStarting
    && -[MKAnnotationView dragState](self, "dragState") != MKAnnotationViewDragStateDragging
    && -[MKAnnotationView dragState](self, "dragState") != MKAnnotationViewDragStateEnding)
  {
    if (-[MKAnnotationView isSelected](self, "isSelected"))
    {
      -[MKAnnotationView selectedZPriority](self, "selectedZPriority");
      v4 = *(float *)&v5;
      LODWORD(v5) = 0;
      if (v4 > 0.0)
        -[MKAnnotationView selectedZPriority](self, "selectedZPriority", v5);
    }
    else
    {
      -[MKAnnotationView zPriority](self, "zPriority");
      v6 = *(float *)&v5;
      LODWORD(v5) = 0;
      if (v6 > 0.0)
        -[MKAnnotationView zPriority](self, "zPriority", v5);
    }
    return fminf(*(float *)&v5, 1000.0);
  }
  return v3;
}

- (MKAnnotationViewZPriority)zPriority
{
  return self->_zPriority;
}

- (CGPoint)_anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (MKAnnotationViewCollisionMode)collisionMode
{
  return self->_collisionMode;
}

- (void)setCalloutOffset:(CGPoint)calloutOffset
{
  CGFloat y;
  CGFloat x;
  CGPoint *p_calloutOffset;

  y = calloutOffset.y;
  x = calloutOffset.x;
  p_calloutOffset = &self->_calloutOffset;
  if (vabdd_f64(calloutOffset.x, self->_calloutOffset.x) >= 0.001
    || vabdd_f64(calloutOffset.y, self->_calloutOffset.y) >= 0.001)
  {
    -[MKAnnotationView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("calloutOffset"));
    p_calloutOffset->x = x;
    p_calloutOffset->y = y;
    -[MKAnnotationView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("calloutOffset"));
  }
}

- (double)_mapPitchRadians
{
  return self->_mapPitchRadians;
}

- (unint64_t)_mapType
{
  return self->_mapType;
}

- (void)_setUsageCounter:(id)a3
{
  objc_storeWeak((id *)&self->_usageCounter, a3);
}

- (void)didMoveToSuperview
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[MKAnnotationView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = v5;
    if ((isKindOfClass & 1) == 0)
    {
      -[MKAnnotationView prepareForSnapshotting](self, "prepareForSnapshotting");
      v3 = v5;
    }
  }

}

- (void)_unhideForDisplay
{
  -[MKAnnotationView _setHidden:forReason:animated:](self, "_setHidden:forReason:animated:", 0, 1, 0);
}

- (MKAnnotationView)initWithAnnotation:(id)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
  id v6;
  NSString *v7;
  MKAnnotationView *v8;
  MKAnnotationView *v9;
  uint64_t v10;
  NSString *v11;
  objc_super v13;

  v6 = annotation;
  v7 = reuseIdentifier;
  if (_MKLinkedOnOrAfterReleaseSet(1283))
  {
    v13.receiver = self;
    v13.super_class = (Class)MKAnnotationView;
    v8 = -[MKAnnotationView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else
  {
    v8 = -[MKAnnotationView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v9 = v8;
  if (v8)
  {
    -[MKAnnotationView _commonInit](v8, "_commonInit");
    -[MKAnnotationView setAnnotation:](v9, "setAnnotation:", v6);
    v10 = -[NSString copy](v7, "copy");
    v11 = v9->_reuseIdentifier;
    v9->_reuseIdentifier = (NSString *)v10;

  }
  return v9;
}

- (void)_commonInit
{
  float v3;
  void *v4;
  float v5;
  float v6;

  self->_realAlpha = 1.0;
  objc_msgSend((id)objc_opt_class(), "_defaultDisplayPriority");
  self->_displayPriority = v3;
  self->_selectionPriority = 1000.0;
  self->_titleVisibility = 1;
  self->_subtitleVisibility = 1;
  self->_allowedCalloutEdges = 1;
  v4 = (void *)objc_opt_class();
  self->_subclassImplementsAlignmentRectInsets = objc_msgSend(v4, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_alignmentRectInsets, objc_msgSend((id)objc_opt_class(), "_mapkitLeafClass"));
  -[MKAnnotationView _defaultZPriority](self, "_defaultZPriority");
  self->_zPriority = v5;
  -[MKAnnotationView _defaultSelectedZPriority](self, "_defaultSelectedZPriority");
  self->_selectedZPriority = v6;
  self->_wantsViewBasedPositioning = objc_msgSend((id)objc_opt_class(), "_wantsViewBasedPositioning");
}

+ (float)_defaultDisplayPriority
{
  return 1000.0;
}

- (float)_defaultZPriority
{
  if (objc_msgSend((id)objc_opt_class(), "_zIndex") == 20)
    return 500.0;
  else
    return (float)((float)(unint64_t)objc_msgSend((id)objc_opt_class(), "_zIndex") * 4.6566e-10) * 1000.0;
}

- (float)_defaultSelectedZPriority
{
  if (objc_msgSend((id)objc_opt_class(), "_selectedZIndex") != 2147483646)
    self->_selectedZPriority = (float)((float)(unint64_t)objc_msgSend((id)objc_opt_class(), "_selectedZIndex")
                                     * 4.6566e-10)
                             * 1000.0;
  return 1000.0;
}

+ (unint64_t)_zIndex
{
  return 20;
}

+ (BOOL)_wantsViewBasedPositioning
{
  return 0;
}

+ (unint64_t)_selectedZIndex
{
  return 2147483646;
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)setAnnotation:(id)annotation
{
  void *v5;
  MKAnnotation *v6;

  v6 = (MKAnnotation *)annotation;
  if (self->_annotation != v6)
  {
    objc_storeStrong((id *)&self->_annotation, annotation);
    -[MKAnnotationView _invalidateCachedCoordinate](self, "_invalidateCachedCoordinate");
    -[MKAnnotationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnnotation:", v6);

  }
}

- (void)_performStateUpdatesIfNeeded
{
  unint64_t hiddenReasons;
  void *v4;

  hiddenReasons = self->_hiddenReasons;
  -[MKAnnotationView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (hiddenReasons & 0xFFFFFFFE) == 2)
    -[MKAnnotationView prepareForDisplay](self, "prepareForDisplay");
  -[MKAnnotationView _performOffsetAnimationIfNeeded](self, "_performOffsetAnimationIfNeeded");
  -[MKAnnotationView _performHideAnimationIfNeeded](self, "_performHideAnimationIfNeeded");
}

- (void)_performOffsetAnimationIfNeeded
{
  BOOL v2;
  double v3;
  _QWORD v4[5];

  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    *(_WORD *)&self->_flags &= ~0x1000u;
    v2 = *(double *)(MEMORY[0x1E0C9D538] + 8) == self->_realOffset.y && *MEMORY[0x1E0C9D538] == self->_realOffset.x;
    v3 = 0.3;
    if (v2)
      v3 = 0.5;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__MKAnnotationView__performOffsetAnimationIfNeeded__block_invoke;
    v4[3] = &unk_1E20D7D98;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v4, &__block_literal_global_49, v3);
  }
}

- (void)_performHideAnimationIfNeeded
{
  _BOOL4 v3;
  BOOL v4;
  double v5;
  double v7;
  _QWORD v8[5];
  _QWORD v9[5];
  BOOL v10;
  objc_super v11;
  objc_super v12;

  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    *(_WORD *)&self->_flags &= ~0x2000u;
    v3 = -[MKAnnotationView isHidden](self, "isHidden");
    v4 = v3;
    v5 = 0.3;
    if (!v3)
      v5 = 0.5;
    if (self->_realOffset.y == *(double *)(MEMORY[0x1E0C9D538] + 8) && self->_realOffset.x == *MEMORY[0x1E0C9D538])
      v7 = 0.4;
    else
      v7 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MKAnnotationView;
    if (-[MKAnnotationView isHidden](&v12, sel_isHidden))
    {
      v11.receiver = self;
      v11.super_class = (Class)MKAnnotationView;
      -[MKAnnotationView setHidden:](&v11, sel_setHidden_, 0);
    }
    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke;
    v9[3] = &unk_1E20D8320;
    v10 = v4;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke_2;
    v8[3] = &unk_1E20D82F8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v9, v8, v7);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKAnnotationView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    if (qword_1EDFB7A68 != -1)
      dispatch_once(&qword_1EDFB7A68, &__block_literal_global_775);
    if (_MergedGlobals_9)
      -[MKAnnotationView _metricsDidChange](self, "_metricsDidChange");
  }
}

- (void)_metricsDidChange
{
  void *v3;

  -[MKAnnotationView _annotationContainer](self, "_annotationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotationViewDidChangeMetrics:", self);

  -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature"));
}

- (BOOL)canShowCallout
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (NSString)clusteringIdentifier
{
  return self->_clusteringIdentifier;
}

- (void)_invalidateCachedCoordinate
{
  CLLocationCoordinate2D *p_coordinate;
  double latitude;
  double longitude;
  void *v6;
  CLLocationDegrees v7;
  CLLocationDegrees v8;
  _QWORD v9[2];
  CLLocationCoordinate2D v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_coordinate = &self->_coordinate;
  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  -[MKAnnotationView annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  p_coordinate->latitude = v7;
  p_coordinate->longitude = v8;

  if (vabdd_f64(p_coordinate->latitude, latitude) >= 0.00000000999999994
    || vabdd_f64(p_coordinate->longitude, longitude) >= 0.00000000999999994)
  {
    *(double *)v9 = latitude;
    *(double *)&v9[1] = longitude;
    v10 = *p_coordinate;
    -[MKAnnotationView _invalidateCustomFeatureForced:coordinates:count:](self, "_invalidateCustomFeatureForced:coordinates:count:", -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature"), v9, 2);
  }
}

- (id)annotation
{
  return self->_annotation;
}

- (MKFeatureDisplayPriority)displayPriority
{
  return self->_displayPriority;
}

- (int64_t)titleVisibility
{
  return self->_titleVisibility;
}

- (int64_t)subtitleVisibility
{
  return self->_subtitleVisibility;
}

- (void)_setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (void)_setMapPitchRadians:(double)a3
{
  self->_mapPitchRadians = a3;
}

- (void)_setMapDisplayStyle:(id)a3
{
  self->_mapDisplayStyle = ($4CDE9EFBD0E8DAF50B82D23E2BCF9383)a3;
}

+ (BOOL)_isInitiallyHiddenWhenAdded
{
  _BOOL4 v2;
  float v3;

  v2 = _MKLinkedOnOrAfterReleaseSet(1796);
  if (v2)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2053))
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_defaultDisplayPriority");
      LOBYTE(v2) = v3 < 1000.0;
    }
  }
  return v2;
}

- (double)alpha
{
  return self->_realAlpha;
}

- (void)setAlpha:(double)a3
{
  objc_super v3;

  self->_realAlpha = a3;
  v3.receiver = self;
  v3.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView setAlpha:](&v3, sel_setAlpha_);
}

- (id)_vkNavigationPuckMarker
{
  return 0;
}

- (int64_t)_calloutStyle
{
  return self->_calloutStyle;
}

- (UIView)detailCalloutAccessoryView
{
  return self->_detailCalloutAccessoryView;
}

- (MKCalloutView)_calloutView
{
  return self->_calloutView;
}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)_mapDisplayStyle
{
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)(*(unsigned int *)&self->_mapDisplayStyle.timePeriod | ((unint64_t)*(unsigned __int16 *)&self->_mapDisplayStyle.searchResultsType << 32));
}

- (void)setZPriority:(MKAnnotationViewZPriority)zPriority
{
  -[MKAnnotationView _clampZPriority:](self, "_clampZPriority:");
  -[MKAnnotationView _setZPriority:](self, "_setZPriority:");
}

- (float)_clampZPriority:(float)a3
{
  float v3;
  BOOL v4;
  float result;

  v3 = 1000.0;
  if (a3 <= 1000.0)
    v3 = a3;
  v4 = a3 < 0.0;
  result = 0.0;
  if (!v4)
    return v3;
  return result;
}

- (void)_setZPriority:(float)a3
{
  id v4;

  if (self->_zPriority != a3)
  {
    self->_zPriority = a3;
    if (!-[MKAnnotationView isSelected](self, "isSelected"))
    {
      -[MKAnnotationView _containerView](self, "_containerView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "annotationViewDidChangeZPriority:", self);

    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView layoutSubviews](&v4, sel_layoutSubviews);
  if (self->_imageLayer)
  {
    -[MKAnnotationView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    -[CALayer setFrame:](self->_imageLayer, "setFrame:");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKAnnotationView _layoutOpenInMapsAccessory](self, "_layoutOpenInMapsAccessory");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MKAnnotationView _layoutCalloutSelectionAccessoryView:](self, "_layoutCalloutSelectionAccessoryView:", self->_selectionAccessoryView);
  }
}

- (void)setCanShowCallout:(BOOL)canShowCallout
{
  __int16 v4;
  MKUsageCounter **p_usageCounter;
  id WeakRetained;
  __int16 flags;
  id v8;

  if (canShowCallout)
    v4 = 8;
  else
    v4 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v4;
  p_usageCounter = &self->_usageCounter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
  if (WeakRetained)
  {
    flags = (__int16)self->_flags;

    if ((flags & 8) == 0)
    {
      v8 = objc_loadWeakRetained((id *)p_usageCounter);
      objc_msgSend(v8, "countUsageOfTypeIfNeeded:", 46);

    }
  }
}

- (UIView)rightCalloutAccessoryView
{
  return self->_rightCalloutAccessoryView;
}

- (UIView)leftCalloutAccessoryView
{
  return self->_leftCalloutAccessoryView;
}

- (BOOL)isSelected
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_setCalloutStyle:(int64_t)a3
{
  self->_calloutStyle = a3;
}

- (id)_containerView
{
  void *v2;
  id v3;

  -[MKAnnotationView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setEnabled:(BOOL)enabled
{
  __int16 v3;

  if (enabled)
    v3 = 0;
  else
    v3 = 2;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (void)_setPresentationCoordinateChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

+ (Class)calloutViewClass
{
  return 0;
}

- (BOOL)shouldShowCallout
{
  void *v3;
  void *v4;
  BOOL v5;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }
  if (_MKLinkedOnOrAfterReleaseSet(1540) && self->_detailCalloutAccessoryView)
    v5 = 1;

  return v5;
}

- (BOOL)_isSelectable
{
  void *v3;
  BOOL v4;
  void *v5;

  if ((*(_WORD *)&self->_flags & 2) != 0)
    return 0;
  if (_MKLinkedOnOrAfterReleaseSet(2053) || !-[MKAnnotationView canShowCallout](self, "canShowCallout"))
    return 1;
  -[MKAnnotation title](self->_annotation, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[MKAnnotationView detailCalloutAccessoryView](self, "detailCalloutAccessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_mapVisibleCenteringRectChanged
{
  MKCalloutView *calloutView;

  calloutView = self->_calloutView;
  if (calloutView)
    -[MKCalloutView annotationViewFrameDidChange](calloutView, "annotationViewFrameDidChange");
}

- (void)setClusterAnnotationView:(id)a3
{
  objc_storeWeak((id *)&self->_clusterAnnotationView, a3);
}

- (int64_t)compareForClustering:(id)a3
{
  MKAnnotation *annotation;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v14;

  annotation = self->_annotation;
  v6 = (void *)*((_QWORD *)a3 + 81);
  if (!v6)
  {
    objc_msgSend(a3, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MKAnnotation coordinate](annotation, "coordinate");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "coordinate");
  if (v8 < v11)
    return -1;
  if (v8 > v11)
    return 1;
  if (v10 < v12)
    return -1;
  if (v10 > v12)
    return 1;
  v14 = (char *)self - (_BYTE *)a3;
  if ((char *)self - (_BYTE *)a3 >= 1)
    v14 = 1;
  if (v14 < 0)
    return -1;
  else
    return v14;
}

- (int64_t)compareForCollision:(id)a3
{
  unsigned int v3;
  unsigned int v4;
  float displayPriority;
  float v8;
  double v9;
  double v10;
  double v11;
  int64_t v13;

  v3 = (*(_WORD *)&self->_flags >> 2) & 1;
  v4 = (*((unsigned __int16 *)a3 + 432) >> 2) & 1;
  if (v3 < v4)
    return 1;
  if (v3 > v4)
    return -1;
  displayPriority = self->_displayPriority;
  v8 = *((float *)a3 + 164);
  if (displayPriority < v8)
    return 1;
  if (displayPriority > v8)
    return -1;
  -[MKAnnotationView _collisionFrame](self, "_collisionFrame");
  v10 = v9;
  objc_msgSend(a3, "_collisionFrame");
  if (v10 < v11)
    return 1;
  if (v10 > v11)
    return -1;
  v13 = (char *)self - (_BYTE *)a3;
  if ((char *)self - (_BYTE *)a3 >= 1)
    v13 = 1;
  if (v13 < 0)
    return -1;
  else
    return v13;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("calloutOffset")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MKAnnotationView;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)_disclosureCalloutButton
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)_disclosureCalloutButton__disclosureCalloutButton;
  if (!_disclosureCalloutButton__disclosureCalloutButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("ShowInfo.png"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setImage:forState:", v6, 0);

      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("ShowInfoPressed.png"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setImage:forState:", v7, 1);

    }
    v8 = (void *)_disclosureCalloutButton__disclosureCalloutButton;
    _disclosureCalloutButton__disclosureCalloutButton = (uint64_t)v3;

    v2 = (void *)_disclosureCalloutButton__disclosureCalloutButton;
  }
  return v2;
}

- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3
{
  double MaxY;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  switch(a3)
  {
    case 4:
      -[MKAnnotationView center](self, "center");
      v6 = v5;
      v8 = v7;
      -[MKAnnotationView superview](self, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
      v11 = v10;
      v13 = v12;

      -[MKAnnotationView bounds](self, "bounds");
      v15 = -0.5;
LABEL_8:
      v23 = v11 + v14 * v15;
      MaxY = v13 + self->_accessoryOffset.y;
      break;
    case 3:
      -[MKAnnotationView center](self, "center");
      v17 = v16;
      v19 = v18;
      -[MKAnnotationView superview](self, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v20, v17, v19);
      v11 = v21;
      v13 = v22;

      -[MKAnnotationView bounds](self, "bounds");
      v15 = 0.5;
      goto LABEL_8;
    case 1:
      if (-[MKAnnotationView _isProvidingVKLabelContents](self, "_isProvidingVKLabelContents"))
      {
        -[MKAnnotationView _labelDisplayFrame](self, "_labelDisplayFrame");
        MaxY = CGRectGetMaxY(v27);
      }
      else
      {
        -[MKAnnotationView bounds](self, "bounds");
        MaxY = v24;
      }
      -[MKAnnotationView bounds](self, "bounds");
      v23 = CGRectGetMidX(v29) + self->_accessoryOffset.x;
      break;
    default:
      -[MKAnnotationView bounds](self, "bounds");
      v23 = CGRectGetMidX(v28) + self->_accessoryOffset.x;
      MaxY = 0.0;
      break;
  }
  v25 = MaxY;
  result.y = v25;
  result.x = v23;
  return result;
}

- (CGPoint)_openInMapsAnchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[MKAnnotationView _anchorPointForCalloutAnchorPosition:](self, "_anchorPointForCalloutAnchorPosition:", 1);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_layoutOpenInMapsAccessory
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[MKAnnotationView _openInMapsAnchorPoint](self, "_openInMapsAnchorPoint");
  v4 = v3;
  v6 = v5;
  -[MKSelectionAccessoryView bounds](self->_selectionAccessoryView, "bounds");
  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", 1, v7, v8, v4, v6, 0.0);
  -[MKSelectionAccessoryView setFrame:](self->_selectionAccessoryView, "setFrame:");
}

- (void)_layoutCalloutSelectionAccessoryView:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "pointerEdge");
  -[MKAnnotationView _anchorPointForCalloutAnchorPosition:](self, "_anchorPointForCalloutAnchorPosition:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v14, "bounds");
  v10 = v9;
  v12 = v11;
  +[MKCalloutSelectionAccessoryView pointerHeight](MKCalloutSelectionAccessoryView, "pointerHeight");
  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", v4, v10, v12, v6, v8, v13);
  objc_msgSend(v14, "setFrame:");

}

- (MKAnnotationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MKAnnotationView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (_MKLinkedOnOrAfterReleaseSet(1283))
  {
    v8 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](self, "initWithAnnotation:reuseIdentifier:", 0, 0);
    -[MKAnnotationView setFrame:](v8, "setFrame:", x, y, width, height);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MKAnnotationView;
    v8 = -[MKAnnotationView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MKAnnotationView _commonInit](v8, "_commonInit");
  }
  return v8;
}

- (MKAnnotationView)initWithCoder:(NSCoder *)aDecoder
{
  MKAnnotationView *v3;
  MKAnnotationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKAnnotationView;
  v3 = -[MKAnnotationView initWithCoder:](&v6, sel_initWithCoder_, aDecoder);
  v4 = v3;
  if (v3)
    -[MKAnnotationView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_MKKVOProxy removeObserverForObject:forKeyPath:context:](self->_annotationObserver, "removeObserverForObject:forKeyPath:context:", self, CFSTR("annotation.title"), MKAnnotationKVOContext);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MKUserLocationAnnotationViewProxy setAnnotationView:](self->_userLocationProxy, "setAnnotationView:", 0);
  -[_MKAnnotationViewAnchor setAnnotationView:](self->_anchor, "setAnnotationView:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView dealloc](&v4, sel_dealloc);
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)prepareForReuse
{
  float v3;
  NSString *clusteringIdentifier;
  float v5;
  float v6;
  objc_super v7;
  objc_super v8;

  -[MKAnnotationView _removePopover](self, "_removePopover");
  -[MKAnnotationView setSelected:](self, "setSelected:", 0);
  self->_hiddenReasons = 0;
  v8.receiver = self;
  v8.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView setHidden:](&v8, sel_setHidden_, 0);
  v7.receiver = self;
  v7.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView setAlpha:](&v7, sel_setAlpha_, 1.0);
  self->_pendingSelectionAnimated = 0;
  objc_msgSend((id)objc_opt_class(), "_defaultDisplayPriority");
  self->_displayPriority = v3;
  clusteringIdentifier = self->_clusteringIdentifier;
  self->_clusteringIdentifier = 0;

  objc_storeWeak((id *)&self->_clusterAnnotationView, 0);
  -[MKAnnotationView _defaultZPriority](self, "_defaultZPriority");
  self->_zPriority = v5;
  -[MKAnnotationView _defaultSelectedZPriority](self, "_defaultSelectedZPriority");
  self->_selectedZPriority = v6;
  objc_storeWeak((id *)&self->_staticMapView, 0);
  -[NSMutableArray removeAllObjects](self->_hiddenCompletionBlocks, "removeAllObjects");
  objc_storeWeak((id *)&self->_usageCounter, 0);
}

- (id)_getPopover:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        NSClassFromString(CFSTR("_MKPopoverEmbeddingView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v4;

          goto LABEL_12;
        }
        -[MKAnnotationView _getPopover:](self, "_getPopover:", v12);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (void)_removePopover
{
  void *v2;
  id v3;

  -[MKAnnotationView _getPopover:](self, "_getPopover:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "removeFromSuperview");
    v2 = v3;
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[MKAnnotationView _hitTest:view:withEvent:](self, "_hitTest:view:withEvent:", self->_calloutView, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[MKAnnotationView _hitTest:view:withEvent:](self, "_hitTest:view:withEvent:", self->_selectionAccessoryView, v7, x, y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)_hitTest:(CGPoint)a3 view:(id)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    objc_msgSend(v9, "hitTest:withEvent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
  UIImage *v5;
  double v6;
  double v7;
  double v8;
  CALayer **p_imageLayer;
  uint64_t v10;
  CALayer *v11;
  void *v12;
  void *v13;
  UIImage *v14;

  v5 = image;
  if (self->_image != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_image, image);
    if (v14)
    {
      -[UIImage size](v14, "size");
      v7 = v6;
      -[UIImage size](v14, "size");
      -[MKAnnotationView setBounds:](self, "setBounds:", 0.0, 0.0, v7, v8);
      p_imageLayer = &self->_imageLayer;
      if (!self->_imageLayer)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *p_imageLayer;
        *p_imageLayer = (CALayer *)v10;

        -[MKAnnotationView layer](self, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "insertSublayer:atIndex:", *p_imageLayer, 0);

        -[MKAnnotationView setOpaque:](self, "setOpaque:", 0);
      }
    }
    else
    {
      p_imageLayer = &self->_imageLayer;
    }
    -[MKAnnotationView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    -[CALayer setFrame:](*p_imageLayer, "setFrame:");

    -[CALayer setContents:](*p_imageLayer, "setContents:", -[UIImage CGImage](objc_retainAutorelease(v14), "CGImage"));
    v5 = v14;
  }

}

- (void)setDisplayPriority:(MKFeatureDisplayPriority)displayPriority
{
  void *v4;
  id WeakRetained;
  void *v6;
  float v7;
  float v8;
  float v9;
  id v10;

  if (self->_displayPriority != displayPriority)
  {
    self->_displayPriority = displayPriority;
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature"));
    -[MKAnnotationView _containerView](self, "_containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "annotationViewDidChangeDisplayPriority:", self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = self->_displayPriority;
      objc_msgSend((id)objc_opt_class(), "_defaultDisplayPriority");
      v9 = v8;

      if (v7 != v9)
      {
        v10 = objc_loadWeakRetained((id *)&self->_usageCounter);
        objc_msgSend(v10, "countUsageOfTypeIfNeeded:", 42);

      }
    }
  }
}

- (void)setSelectedZPriority:(MKAnnotationViewZPriority)selectedZPriority
{
  -[MKAnnotationView _clampZPriority:](self, "_clampZPriority:");
  -[MKAnnotationView _setSelectedZPriority:](self, "_setSelectedZPriority:");
}

- (void)_setSelectedZPriority:(float)a3
{
  id v4;

  if (self->_selectedZPriority != a3)
  {
    self->_selectedZPriority = a3;
    if (-[MKAnnotationView isSelected](self, "isSelected"))
    {
      -[MKAnnotationView _containerView](self, "_containerView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "annotationViewDidChangeZPriority:", self);

    }
  }
}

- (void)setClusteringIdentifier:(NSString *)clusteringIdentifier
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  MKUsageCounter **p_usageCounter;
  id WeakRetained;
  NSString *v11;
  id v12;
  NSString *v13;

  v4 = clusteringIdentifier;
  v5 = v4;
  if (self->_clusteringIdentifier != v4)
  {
    v13 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v13;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v13, "copy");
      v8 = self->_clusteringIdentifier;
      self->_clusteringIdentifier = v7;

      -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature"));
      p_usageCounter = &self->_usageCounter;
      WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
      v5 = v13;
      if (WeakRetained)
      {
        v11 = self->_clusteringIdentifier;

        v5 = v13;
        if (v11)
        {
          v12 = objc_loadWeakRetained((id *)p_usageCounter);
          objc_msgSend(v12, "countUsageOfTypeIfNeeded:", 45);

          v5 = v13;
        }
      }
    }
  }

}

- (void)setCollisionMode:(MKAnnotationViewCollisionMode)collisionMode
{
  MKUsageCounter **p_usageCounter;
  id WeakRetained;
  int64_t v6;
  id v7;

  if (self->_collisionMode != collisionMode)
  {
    self->_collisionMode = collisionMode;
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature"));
    p_usageCounter = &self->_usageCounter;
    WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
    if (WeakRetained)
    {
      v6 = self->_collisionMode;

      if (v6)
      {
        v7 = objc_loadWeakRetained((id *)p_usageCounter);
        objc_msgSend(v7, "countUsageOfTypeIfNeeded:", 44);

      }
    }
  }
}

- (void)setSelected:(BOOL)selected
{
  __int16 flags;
  __int16 v5;
  _BOOL8 v6;

  flags = (__int16)self->_flags;
  if ((flags & 0xC000) == 0x4000)
  {
    if (selected)
      v5 = 4;
    else
      v5 = 0;
    *(_WORD *)&self->_flags = flags & 0xFFFB | v5;
    v6 = !selected || -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature");
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", v6);
  }
  else
  {
    *(_WORD *)&self->_flags = flags & 0x3FFF | 0x8000;
    -[MKAnnotationView _setSelected:animated:](self, "_setSelected:animated:", selected, 0);
  }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  __int16 flags;
  __int16 v6;
  _BOOL8 v7;

  flags = (__int16)self->_flags;
  if ((flags & 0xC000) == 0x4000)
  {
    if (selected)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_flags = flags & 0xFFFB | v6;
    v7 = !selected || -[MKAnnotationView isProvidingCustomFeature](self, "isProvidingCustomFeature", selected, animated);
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", v7);
  }
  else
  {
    *(_WORD *)&self->_flags = flags & 0x3FFF | 0x8000;
    -[MKAnnotationView _setSelected:animated:](self, "_setSelected:animated:", selected, animated);
  }
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  __int16 flags;
  _BOOL4 v7;
  __int16 v8;
  void (**v9)(_QWORD);
  _QWORD v10[5];
  BOOL v11;

  flags = (__int16)self->_flags;
  if (((((flags & 4) == 0) ^ a3) & 1) == 0)
  {
    v7 = a3;
    if ((flags & 0xC000) != 0x8000)
    {
      *(_WORD *)&self->_flags = flags & 0x3FFF | 0x4000;
      -[MKAnnotationView setSelected:animated:](self, "setSelected:animated:", a3, a4);
      flags = (__int16)self->_flags;
    }
    if (v7)
      v8 = 4;
    else
      v8 = 0;
    *(_WORD *)&self->_flags = flags & 0xFFFB | v8;
    if (v7)
      -[MKAnnotationView _addAnnotationObservation](self, "_addAnnotationObservation");
    else
      -[MKAnnotationView _removeAnnotationObservation](self, "_removeAnnotationObservation");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__MKAnnotationView__setSelected_animated___block_invoke;
    v10[3] = &unk_1E20D8320;
    v10[4] = self;
    v11 = a4;
    v9 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v10);
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v9);
    else
      v9[2](v9);

    flags = (__int16)self->_flags;
  }
  *(_WORD *)&self->_flags = flags & 0x3FFF;
}

uint64_t __42__MKAnnotationView__setSelected_animated___block_invoke(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "updateCalloutViewIfNeededAnimated:", *(unsigned __int8 *)(a1 + 40))|| objc_msgSend(*(id *)(a1 + 32), "_calloutPermitsSelectionAccessory"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSelectionAccessoryIfNeededAnimated:", *(unsigned __int8 *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateEffectiveZPriority");
}

- (void)setDetailCalloutAccessoryView:(UIView *)detailCalloutAccessoryView
{
  UIView **p_detailCalloutAccessoryView;
  MKUsageCounter **p_usageCounter;
  id WeakRetained;
  UIView *v8;
  id v9;
  UIView *v10;

  p_detailCalloutAccessoryView = &self->_detailCalloutAccessoryView;
  v10 = detailCalloutAccessoryView;
  if (*p_detailCalloutAccessoryView != v10)
  {
    -[MKAnnotationView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("detailCalloutAccessoryView"));
    objc_storeStrong((id *)&self->_detailCalloutAccessoryView, detailCalloutAccessoryView);
    -[MKAnnotationView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("detailCalloutAccessoryView"));
    -[MKAnnotationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 1);
    p_usageCounter = &self->_usageCounter;
    WeakRetained = objc_loadWeakRetained((id *)p_usageCounter);
    if (WeakRetained)
    {
      v8 = *p_detailCalloutAccessoryView;

      if (v8)
      {
        v9 = objc_loadWeakRetained((id *)p_usageCounter);
        objc_msgSend(v9, "countUsageOfTypeIfNeeded:", 47);

      }
    }
  }

}

- (void)setLeftCalloutAccessoryView:(UIView *)leftCalloutAccessoryView
{
  UIView *v5;
  UIView *v6;

  v5 = leftCalloutAccessoryView;
  if (self->_leftCalloutAccessoryView != v5)
  {
    v6 = v5;
    -[MKAnnotationView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("leftCalloutAccessoryView"));
    objc_storeStrong((id *)&self->_leftCalloutAccessoryView, leftCalloutAccessoryView);
    -[MKAnnotationView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("leftCalloutAccessoryView"));
    -[MKAnnotationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 1);
    v5 = v6;
  }

}

- (void)setRightCalloutAccessoryView:(UIView *)rightCalloutAccessoryView
{
  UIView *v5;
  UIView *v6;

  v5 = rightCalloutAccessoryView;
  if (self->_rightCalloutAccessoryView != v5)
  {
    v6 = v5;
    -[MKAnnotationView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rightCalloutAccessoryView"));
    objc_storeStrong((id *)&self->_rightCalloutAccessoryView, rightCalloutAccessoryView);
    -[MKAnnotationView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rightCalloutAccessoryView"));
    -[MKAnnotationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 1);
    v5 = v6;
  }

}

- (int64_t)_effectiveCalloutStyle
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "calloutViewClass");
  if (v3 && v3 == objc_opt_class())
    return 1;
  else
    return self->_calloutStyle;
}

- (BOOL)_shouldShowCalloutIfSelected
{
  void *v3;
  int v4;

  if ((self->_allowedCalloutEdges & 0xF) != 0
    && (-[MKAnnotationView _effectiveCalloutStyle](self, "_effectiveCalloutStyle") != 1
     || -[MKAnnotationView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE016DE8))
    && -[MKAnnotationView _allowedToShowCallout](self, "_allowedToShowCallout")
    && -[MKAnnotationView shouldShowCallout](self, "shouldShowCallout"))
  {
    -[MKAnnotationView _containerView](self, "_containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "suppressCallout") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_calloutPermitsSelectionAccessory
{
  return -[MKAnnotationView _effectiveCalloutStyle](self, "_effectiveCalloutStyle") == 1;
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  if (-[MKAnnotationView isSelected](self, "isSelected")
    && -[MKAnnotationView _shouldShowCalloutIfSelected](self, "_shouldShowCalloutIfSelected"))
  {
    if (!-[MKCalloutView isVisible](self->_calloutView, "isVisible"))
      -[MKAnnotationView _showCallout:](self, "_showCallout:", v3);
    LOBYTE(v5) = 1;
  }
  else if (-[MKCalloutView isVisible](self->_calloutView, "isVisible")
         || (v5 = -[MKCalloutView hasPendingVisibility](self->_calloutView, "hasPendingVisibility")))
  {
    -[MKAnnotationView setHighlighted:](self, "setHighlighted:", 0);
    -[MKAnnotationView _dismissCallout:](self, "_dismissCallout:", v3);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)_updateSelectionAccessoryIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  MKSelectionAccessory *activeSelectionAccessory;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  _QWORD v14[4];
  id v15;
  MKAnnotationView *v16;
  id v17;
  BOOL v18;

  v3 = a3;
  v5 = -[MKAnnotationView isSelected](self, "isSelected");
  activeSelectionAccessory = self->_activeSelectionAccessory;
  if (v5)
  {
    if (!activeSelectionAccessory)
    {
      -[MKAnnotationView _mapView](self, "_mapView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = objc_msgSend(v8, "mapViewShouldDelaySelectionAccessoryPresentation:", v7);
      else
        v9 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __62__MKAnnotationView__updateSelectionAccessoryIfNeededAnimated___block_invoke;
      v14[3] = &unk_1E20DAE20;
      v15 = v8;
      v16 = self;
      v17 = v7;
      v18 = v3;
      v10 = v7;
      v11 = v8;
      v12 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v14);
      v13 = v12;
      if (v9)
        dispatch_async(MEMORY[0x1E0C80D38], v12);
      else
        v12[2](v12);

    }
  }
  else if (activeSelectionAccessory)
  {
    -[MKAnnotationView _dismissSelectionAccessoryAnimated:](self, "_dismissSelectionAccessoryAnimated:", v3);
  }
}

void __62__MKAnnotationView__updateSelectionAccessoryIfNeededAnimated___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "mapView:selectionAccessoryForAnnotation:", *(_QWORD *)(a1 + 48), v2[81]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_showSelectionAccessory:animated:", v3, *(unsigned __int8 *)(a1 + 56));

  }
}

- (id)_resolvedAccessoryFor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "_mapItemDetailPresentationStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_style");

  v7 = v4;
  if (!v6)
  {
    objc_msgSend(v4, "_mapItemDetailPresentationStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_presentationViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView _resolvedAutomaticStyleWithViewController:](self, "_resolvedAutomaticStyleWithViewController:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "_mapItemDetailPresentationStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_style");

  if (v11 == 1)
  {
    objc_msgSend(v7, "_mapItemDetailPresentationStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12 || !objc_msgSend(v12, "_calloutStyle"))
    {
      -[MKAnnotationView _resolvedAutomaticCalloutStyle](self, "_resolvedAutomaticCalloutStyle");
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v14;
    }

  }
  return v7;
}

- (id)_resolvedAutomaticStyleWithViewController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6)
  {
    if (-[MKAnnotationView _viewportCanDisplayFullCalloutAccessory](self, "_viewportCanDisplayFullCalloutAccessory"))
    {
      objc_msgSend((id)objc_opt_class(), "_fullCalloutAccessory");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_sheetAccessoryWithViewController:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v8 = -[MKAnnotationView _viewportCanDisplayCompactCalloutAccessory](self, "_viewportCanDisplayCompactCalloutAccessory");
  v9 = (void *)objc_opt_class();
  if (v8)
    objc_msgSend(v9, "_compactCalloutAccessory");
  else
    objc_msgSend(v9, "_openInMapsAccessory");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = (void *)v7;

  return v10;
}

- (id)_resolvedAutomaticCalloutStyle
{
  void *v3;
  int v4;
  void *v5;

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4
    && -[MKAnnotationView _viewportCanDisplayFullCalloutAccessory](self, "_viewportCanDisplayFullCalloutAccessory"))
  {
    objc_msgSend((id)objc_opt_class(), "_fullCalloutAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_compactCalloutAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (CGSize)_effectiveMapViewportSize
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
  CGSize result;

  -[MKAnnotationView _mapView](self, "_mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "_edgeInsets");
  v9 = v4 - (v7 + v8);
  v12 = v6 - (v10 + v11);

  v13 = v9;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)_viewportCanDisplayFullCalloutAccessory
{
  double v2;
  double v3;

  -[MKAnnotationView _effectiveMapViewportSize](self, "_effectiveMapViewportSize");
  return v3 >= 400.0 && v2 >= 750.0;
}

- (BOOL)_viewportCanDisplayCompactCalloutAccessory
{
  double v2;
  double v3;

  -[MKAnnotationView _effectiveMapViewportSize](self, "_effectiveMapViewportSize");
  return v3 >= 150.0 && v2 >= 300.0;
}

+ (id)_fullCalloutAccessory
{
  void *v2;
  void *v3;

  +[MKMapItemDetailSelectionAccessoryPresentationStyle calloutWithCalloutStyle:](MKMapItemDetailSelectionAccessoryPresentationStyle, "calloutWithCalloutStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSelectionAccessory mapItemDetailWithPresentationStyle:](MKSelectionAccessory, "mapItemDetailWithPresentationStyle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_compactCalloutAccessory
{
  void *v2;
  void *v3;

  +[MKMapItemDetailSelectionAccessoryPresentationStyle calloutWithCalloutStyle:](MKMapItemDetailSelectionAccessoryPresentationStyle, "calloutWithCalloutStyle:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSelectionAccessory mapItemDetailWithPresentationStyle:](MKSelectionAccessory, "mapItemDetailWithPresentationStyle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_openInMapsAccessory
{
  void *v2;
  void *v3;

  +[MKMapItemDetailSelectionAccessoryPresentationStyle openInMaps](MKMapItemDetailSelectionAccessoryPresentationStyle, "openInMaps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSelectionAccessory mapItemDetailWithPresentationStyle:](MKSelectionAccessory, "mapItemDetailWithPresentationStyle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_sheetAccessoryWithViewController:(id)a3
{
  void *v3;
  void *v4;

  +[MKMapItemDetailSelectionAccessoryPresentationStyle sheetPresentedFromViewController:](MKMapItemDetailSelectionAccessoryPresentationStyle, "sheetPresentedFromViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSelectionAccessory mapItemDetailWithPresentationStyle:](MKSelectionAccessory, "mapItemDetailWithPresentationStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_reasonToDeferSelectionAccessoryPresentationStyle:(id)a3
{
  if ((objc_msgSend(a3, "_style") | 2) != 3)
    return 0;
  if (-[MKAnnotationView _isProvidingVKLabelContents](self, "_isProvidingVKLabelContents"))
    return 2;
  return 0;
}

- (void)_showDeferredSelectionAccessoryForReasonIfNeeded:(unint64_t)a3
{
  void *v4;
  _MKDeferredSelectionAccessoryPresentation *deferredSelectionAccessory;

  if (-[_MKDeferredSelectionAccessoryPresentation reason](self->_deferredSelectionAccessory, "reason") == a3)
  {
    -[MKSelectionAccessory _mapItemDetailPresentationStyle](self->_resolvedSelectionAccessory, "_mapItemDetailPresentationStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView _showSelectionAccessoryWithStyle:animated:](self, "_showSelectionAccessoryWithStyle:animated:", v4, -[_MKDeferredSelectionAccessoryPresentation animated](self->_deferredSelectionAccessory, "animated"));

    deferredSelectionAccessory = self->_deferredSelectionAccessory;
    self->_deferredSelectionAccessory = 0;

  }
}

- (BOOL)_canShowSelectionAccessory:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "_style"))
  {
    -[MKAnnotationView _mapItem](self, "_mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_showSelectionAccessory:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;
  void *v8;
  MKSelectionAccessory *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _MKDeferredSelectionAccessoryPresentation *v13;
  _MKDeferredSelectionAccessoryPresentation *deferredSelectionAccessory;
  MKSelectionAccessory *resolvedSelectionAccessory;
  id v16;

  v4 = a4;
  v16 = a3;
  v7 = -[MKAnnotationView _canShowSelectionAccessory:](self, "_canShowSelectionAccessory:", v16);
  v8 = v16;
  if (v7)
  {
    -[MKAnnotationView _resolvedAccessoryFor:](self, "_resolvedAccessoryFor:", v16);
    v9 = (MKSelectionAccessory *)objc_claimAutoreleasedReturnValue();
    -[MKSelectionAccessory _mapItemDetailPresentationStyle](v9, "_mapItemDetailPresentationStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MKAnnotationView _reasonToDeferSelectionAccessoryPresentationStyle:](self, "_reasonToDeferSelectionAccessoryPresentationStyle:", v10);
    if (v11)
    {
      v12 = v11;
      v13 = -[_MKDeferredSelectionAccessoryPresentation initWithReason:animated:]([_MKDeferredSelectionAccessoryPresentation alloc], "initWithReason:animated:", v11, v4);
      deferredSelectionAccessory = self->_deferredSelectionAccessory;
      self->_deferredSelectionAccessory = v13;

      -[_MKDeferredSelectionAccessoryPresentation setReady:](self->_deferredSelectionAccessory, "setReady:", v12 == 1);
    }
    else
    {
      -[MKAnnotationView _showSelectionAccessoryWithStyle:animated:](self, "_showSelectionAccessoryWithStyle:animated:", v10, v4);
    }
    objc_storeStrong((id *)&self->_activeSelectionAccessory, a3);
    resolvedSelectionAccessory = self->_resolvedSelectionAccessory;
    self->_resolvedSelectionAccessory = v9;

    v8 = v16;
  }

}

- (void)_showSelectionAccessoryWithStyle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  BOOL v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = objc_msgSend(v9, "_style");
  if (v6 == 1)
  {
    -[MKAnnotationView _showMapItemDetailCalloutAccessory:animated:](self, "_showMapItemDetailCalloutAccessory:animated:", v9, v4);
  }
  else if (v6 == 3)
  {
    -[MKAnnotationView _showMapItemDetailOpenInMapsAccessory:animated:](self, "_showMapItemDetailOpenInMapsAccessory:animated:", v9, v4);
  }
  else
  {
    v7 = v6 == 2;
    v8 = v9;
    if (!v7)
      goto LABEL_9;
    -[MKAnnotationView _showMapItemDetailSheetAccessory:animated:](self, "_showMapItemDetailSheetAccessory:animated:", v9, v4);
  }
  v8 = v9;
LABEL_9:

}

- (void)_showMapItemDetailSheetAccessory:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(v8, "_presentationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "_presentationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView _presentSelectionAccessorySheetFromViewController:animated:](self, "_presentSelectionAccessorySheetFromViewController:animated:", v7, v4);

  }
}

- (double)_labelDisplayHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[MKAnnotationView _isProvidingVKLabelContents](self, "_isProvidingVKLabelContents");
  result = 0.0;
  if (v2)
    return 25.0;
  return result;
}

- (CGRect)_labelDisplayFrame
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  void *v17;
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
  CGRect result;

  if (-[MKAnnotationView _isProvidingVKLabelContents](self, "_isProvidingVKLabelContents"))
  {
    -[MKAnnotationView _mapView](self, "_mapView");
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3[84];
    -[MKAnnotationView customFeatureAnnotation](self, "customFeatureAnnotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView _annotationContainer](self, "_annotationContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelMarkerForCustomFeatureAnnotation:dataSource:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "screenCollisionBounds");
    v12 = v11;
    if (v9 == -INFINITY || v10 == -INFINITY)
    {
      v19 = *MEMORY[0x1E0C9D648];
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      v14 = v8;
      v15 = v9;
      v16 = v10;
      -[MKAnnotationView _mapView](self, "_mapView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertRect:toView:", self, v12, v14, v15, v16);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

    }
  }
  else
  {
    v19 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (double)_verticalAccessoryDisplayPadding
{
  return 6.0;
}

- (double)_horizontalAccessoryDisplayPadding
{
  return 25.0;
}

- (id)_urlForOpenInMaps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MKAnnotationView _mapItem](self, "_mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[MKMapItem urlForMapItem:options:](MKMapItem, "urlForMapItem:options:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MKAnnotation marker](self->_annotation, "marker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v6, "muid");

      if (v4)
      {
        v7 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maps://?auid=%llu"), v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLWithString:", v8);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)_showMapItemDetailOpenInMapsAccessory:(id)a3 animated:(BOOL)a4
{
  void *v5;
  MKOpenInMapsSelectionAccessoryView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[5];
  MKOpenInMapsSelectionAccessoryView *v19;

  -[MKAnnotationView _urlForOpenInMaps](self, "_urlForOpenInMaps", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MKOpenInMapsSelectionAccessoryView initWithURL:]([MKOpenInMapsSelectionAccessoryView alloc], "initWithURL:", v5);
    objc_storeStrong((id *)&self->_selectionAccessoryView, v6);
    -[MKAnnotationView _calculatePresentationFrameForOpenInMapsView:](self, "_calculatePresentationFrameForOpenInMapsView:", v6);
    -[MKAnnotationView _calculateMapOffsetForPresentationFrame:](self, "_calculateMapOffsetForPresentationFrame:");
    v9 = v8;
    v10 = v7;
    if (v8 == *MEMORY[0x1E0C9D538] && v7 == *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      -[MKAnnotationView addSubview:](self, "addSubview:", v6);
    }
    else
    {
      -[MKAnnotationView _mapView](self, "_mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAnnotationView _annotationContainer](self, "_annotationContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAnnotationView coordinate](self, "coordinate");
      v15 = v14;
      v17 = v16;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __67__MKAnnotationView__showMapItemDetailOpenInMapsAccessory_animated___block_invoke;
      v18[3] = &unk_1E20D7E58;
      v18[4] = self;
      v19 = v6;
      objc_msgSend(v12, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v13, v18, v9, v10, v15, v17);

    }
  }

}

uint64_t __67__MKAnnotationView__showMapItemDetailOpenInMapsAccessory_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
}

- (CGRect)_calculatePresentationFrameForOpenInMapsView:(id)a3
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
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect result;
  CGRect v45;

  v4 = a3;
  -[MKAnnotationView _frameForSelectionAdjustment](self, "_frameForSelectionAdjustment");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MKAnnotationView _openInMapsAnchorPoint](self, "_openInMapsAnchorPoint");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v18 = v17;
  v20 = v19;

  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", 1, v18, v20, v14, v16, 0.0);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[MKAnnotationView superview](self, "superview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView convertRect:toView:](self, "convertRect:toView:", v29, v22, v24, v26, v28);
  v45.origin.x = v30;
  v45.origin.y = v31;
  v45.size.width = v32;
  v45.size.height = v33;
  v42.origin.x = v6;
  v42.origin.y = v8;
  v42.size.width = v10;
  v42.size.height = v12;
  v43 = CGRectUnion(v42, v45);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;

  v38 = y + -10.0;
  v39 = height + 20.0;
  v40 = x;
  v41 = width;
  result.size.height = v39;
  result.size.width = v41;
  result.origin.y = v38;
  result.origin.x = v40;
  return result;
}

- (int64_t)_calloutAnchorPositionForCurrentFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v15;

  -[MKAnnotationView _mapView](self, "_mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[MKAnnotationView _mapView](self, "_mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  -[MKAnnotationView frame](self, "frame");
  if (v5 >= 500.0)
  {
    if (v8 - CGRectGetMaxX(*(CGRect *)&v11) <= v11)
      v15 = 4;
    else
      v15 = 3;
  }
  else if (v10 - CGRectGetMaxY(*(CGRect *)&v11) > v12)
  {
    v15 = 1;
  }
  else
  {
    v15 = 2;
  }

  return v15;
}

- (void)_showMapItemDetailCalloutAccessory:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  MKCompactDeveloperPlaceCardSelectionAccessoryView *v7;
  MKCompactDeveloperPlaceCardSelectionAccessoryView *v8;
  MKCompactDeveloperPlaceCardSelectionAccessoryView *v9;
  MKCalloutSelectionAccessoryView *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = objc_msgSend(v11, "_calloutStyle");
  if (v6 == 2)
  {
    v8 = [MKCompactDeveloperPlaceCardSelectionAccessoryView alloc];
    v7 = -[MKViewSwitchingSelectionAccessoryView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    v7 = -[MKFullDeveloperPlaceCardSelectionAccessoryView initAsAccessory]([MKFullDeveloperPlaceCardSelectionAccessoryView alloc], "initAsAccessory");
LABEL_5:
    v9 = v7;
    v10 = -[MKCalloutSelectionAccessoryView initWithSelectionAccessoryView:style:pointerEdge:pointerUnitLocation:]([MKCalloutSelectionAccessoryView alloc], "initWithSelectionAccessoryView:style:pointerEdge:pointerUnitLocation:", v7, objc_msgSend(v11, "_calloutStyle"), -[MKAnnotationView _calloutAnchorPositionForCurrentFrame](self, "_calloutAnchorPositionForCurrentFrame"), 0.5);
    -[MKAnnotationView _showSelectionAccessoryView:animated:](self, "_showSelectionAccessoryView:animated:", v10, v4);

  }
}

- (void)_dismissSelectionAccessoryAnimated:(BOOL)a3
{
  MKSelectionAccessory *activeSelectionAccessory;
  _BOOL8 v5;
  MKMapItemRequest *selectionAccessoryMapItemRequest;
  void *deferredSelectionAccessory;
  MKSelectionAccessory *v8;
  MKSelectionAccessory *resolvedSelectionAccessory;

  activeSelectionAccessory = self->_activeSelectionAccessory;
  if (activeSelectionAccessory)
  {
    v5 = a3;
    if (!-[MKSelectionAccessory _style](activeSelectionAccessory, "_style"))
    {
      -[MKMapItemRequest cancel](self->_selectionAccessoryMapItemRequest, "cancel");
      selectionAccessoryMapItemRequest = self->_selectionAccessoryMapItemRequest;
      self->_selectionAccessoryMapItemRequest = 0;

      deferredSelectionAccessory = self->_deferredSelectionAccessory;
      if (deferredSelectionAccessory)
      {
        self->_deferredSelectionAccessory = 0;
      }
      else
      {
        -[MKSelectionAccessory _mapItemDetailPresentationStyle](self->_resolvedSelectionAccessory, "_mapItemDetailPresentationStyle");
        deferredSelectionAccessory = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(deferredSelectionAccessory, "_style") == 2)
          -[MKAnnotationView _dismissSelectionAccessoryPresentation:animated:](self, "_dismissSelectionAccessoryPresentation:animated:", deferredSelectionAccessory, v5);
        else
          -[MKAnnotationView _dismissSelectionAccessoryViewAnimated:](self, "_dismissSelectionAccessoryViewAnimated:", v5);
      }

      v8 = self->_activeSelectionAccessory;
      self->_activeSelectionAccessory = 0;

      resolvedSelectionAccessory = self->_resolvedSelectionAccessory;
      self->_resolvedSelectionAccessory = 0;

    }
  }
}

- (void)_presentSelectionAccessorySheetFromViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MKSelectionAccessoryView *v7;
  MKSelectionAccessoryView *selectionAccessoryView;
  MKPresentableSelectionAccessoryViewController *v9;
  void *v10;
  MKPresentableSelectionAccessoryViewController *selectionAccessoryViewController;
  MKSelectionAccessoryView *v12;

  v4 = a4;
  v6 = a3;
  v7 = -[MKFullDeveloperPlaceCardSelectionAccessoryView initAsAccessory]([MKFullDeveloperPlaceCardSelectionAccessoryView alloc], "initAsAccessory");
  selectionAccessoryView = self->_selectionAccessoryView;
  self->_selectionAccessoryView = v7;
  v12 = v7;

  -[MKSelectionAccessoryView setDelegate:](self->_selectionAccessoryView, "setDelegate:", self);
  -[MKAnnotationView _updateSelectionAccessoryViewContent](self, "_updateSelectionAccessoryViewContent");
  v9 = -[MKPresentableSelectionAccessoryViewController initWithSelectionAccessoryView:]([MKPresentableSelectionAccessoryViewController alloc], "initWithSelectionAccessoryView:", v12);
  -[MKPresentableSelectionAccessoryViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
  -[MKPresentableSelectionAccessoryViewController sheetPresentationController](v9, "sheetPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  objc_msgSend(v6, "presentViewController:animated:completion:", v9, v4, 0);
  selectionAccessoryViewController = self->_selectionAccessoryViewController;
  self->_selectionAccessoryViewController = v9;

}

- (void)_dismissPresentedSelectionAccessoryFromViewController:(id)a3 animated:(BOOL)a4
{
  MKSelectionAccessoryView *selectionAccessoryView;
  MKPresentableSelectionAccessoryViewController *selectionAccessoryViewController;

  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", a4, 0);
  selectionAccessoryView = self->_selectionAccessoryView;
  self->_selectionAccessoryView = 0;

  selectionAccessoryViewController = self->_selectionAccessoryViewController;
  self->_selectionAccessoryViewController = 0;

}

- (void)selectionAccessoryViewDidRequestDismissal:(id)a3
{
  id v4;

  -[MKAnnotationView _mapView](self, "_mapView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectAnnotation:animated:", self->_annotation, 1);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  -[MKAnnotationView _mapView](self, "_mapView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectAnnotation:animated:", self->_annotation, 1);

}

- (void)_showSelectionAccessoryView:(id)a3 animated:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  MKAnnotationView *v25;
  id v26;
  id location;

  v5 = a3;
  -[MKAnnotationView _calculatePresentationFrameForAccessoryView:](self, "_calculatePresentationFrameForAccessoryView:", v5);
  -[MKAnnotationView _calculateMapOffsetForPresentationFrame:](self, "_calculateMapOffsetForPresentationFrame:");
  v7 = v6;
  v9 = v8;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__MKAnnotationView__showSelectionAccessoryView_animated___block_invoke;
  v23[3] = &unk_1E20D83C0;
  objc_copyWeak(&v26, &location);
  v11 = v5;
  v24 = v11;
  v25 = self;
  v12 = MEMORY[0x18D778DB8](v23);
  v13 = (void *)v12;
  if (v7 == *MEMORY[0x1E0C9D538] && v9 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
  else
  {
    -[MKAnnotationView _mapView](self, "_mapView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView _annotationContainer](self, "_annotationContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView coordinate](self, "coordinate");
    v18 = v17;
    v20 = v19;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __57__MKAnnotationView__showSelectionAccessoryView_animated___block_invoke_2;
    v21[3] = &unk_1E20D7EF8;
    v22 = v13;
    objc_msgSend(v15, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v16, v21, v7, v9, v18, v20);

  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __57__MKAnnotationView__showSelectionAccessoryView_animated___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "addSubview:", *(_QWORD *)(a1 + 32));

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 928), *(id *)(a1 + 32));
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_updateSelectionAccessoryViewContent");

}

uint64_t __57__MKAnnotationView__showSelectionAccessoryView_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGRect)_calculatePresentationFrameForAccessoryView:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect result;
  CGRect v47;

  v4 = a3;
  -[MKAnnotationView _frameForSelectionAdjustment](self, "_frameForSelectionAdjustment");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  +[MKFullDeveloperPlaceCardLoadingView contentSize](MKFullDeveloperPlaceCardLoadingView, "contentSize");
  v14 = v13;
  v16 = v15;
  -[MKAnnotationView _anchorPointForCalloutAnchorPosition:](self, "_anchorPointForCalloutAnchorPosition:", objc_msgSend(v4, "pointerEdge"));
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v4, "pointerEdge");

  +[MKCalloutSelectionAccessoryView pointerHeight](MKCalloutSelectionAccessoryView, "pointerHeight");
  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", v21, v14, v16, v18, v20, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[MKAnnotationView superview](self, "superview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView convertRect:toView:](self, "convertRect:toView:", v31, v24, v26, v28, v30);
  v47.origin.x = v32;
  v47.origin.y = v33;
  v47.size.width = v34;
  v47.size.height = v35;
  v44.origin.x = v6;
  v44.origin.y = v8;
  v44.size.width = v10;
  v44.size.height = v12;
  v45 = CGRectUnion(v44, v47);
  x = v45.origin.x;
  y = v45.origin.y;
  width = v45.size.width;
  height = v45.size.height;

  v40 = y + -40.0;
  v41 = height + 60.0;
  v42 = x;
  v43 = width;
  result.size.height = v41;
  result.size.width = v43;
  result.origin.y = v40;
  result.origin.x = v42;
  return result;
}

- (CGPoint)_calculateMapOffsetForPresentationFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double MaxX;
  CGFloat v29;
  CGFloat v30;
  double MaxY;
  double v32;
  CGFloat rect;
  double v34;
  CGPoint result;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKAnnotationView _containerView](self, "_containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView _containerView](self, "_containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_visibleCenteringRectInView:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  rect = height;
  v34 = *MEMORY[0x1E0C9D538];
  v30 = v15;
  v32 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v36.origin.x = v11;
  v36.origin.y = v13;
  v36.size.width = v15;
  v29 = v17;
  v36.size.height = v17;
  v45.origin.x = x;
  v18 = y;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  if (CGRectContainsRect(v36, v45))
    goto LABEL_10;
  v19 = x;
  if (x >= v11)
  {
    v37.origin.x = x;
    v37.origin.y = v18;
    v21 = width;
    v37.size.width = width;
    v37.size.height = rect;
    MaxX = CGRectGetMaxX(v37);
    v38.origin.x = v11;
    v38.origin.y = v13;
    v23 = v29;
    v22 = v30;
    v38.size.width = v30;
    v38.size.height = v29;
    v24 = MaxX <= CGRectGetMaxX(v38);
    v20 = v34;
    if (!v24)
    {
      v39.origin.x = x;
      v39.origin.y = v18;
      v39.size.width = v21;
      v39.size.height = rect;
      v25 = CGRectGetMaxX(v39);
      v40.origin.x = v11;
      v40.origin.y = v13;
      v40.size.width = v30;
      v40.size.height = v29;
      v20 = v25 - CGRectGetMaxX(v40);
    }
  }
  else
  {
    v20 = x - v11;
    v21 = width;
    v23 = v29;
    v22 = v30;
  }
  if (v18 >= v13)
  {
    v34 = v20;
    v41.origin.x = v19;
    v41.origin.y = v18;
    v41.size.width = v21;
    v41.size.height = rect;
    MaxY = CGRectGetMaxY(v41);
    v42.origin.x = v11;
    v42.origin.y = v13;
    v42.size.width = v22;
    v42.size.height = v23;
    if (MaxY > CGRectGetMaxY(v42))
    {
      v43.origin.x = v19;
      v43.origin.y = v18;
      v43.size.width = v21;
      v43.size.height = rect;
      v27 = CGRectGetMaxY(v43);
      v44.origin.x = v11;
      v44.origin.y = v13;
      v44.size.width = v22;
      v44.size.height = v23;
      v26 = v27 - CGRectGetMaxY(v44);
      v20 = v34;
      goto LABEL_11;
    }
LABEL_10:
    v20 = v34;
    v26 = v32;
    goto LABEL_11;
  }
  v26 = v18 - v13;
LABEL_11:
  result.y = v26;
  result.x = v20;
  return result;
}

- (CGRect)_calculateAccessoryFrameForSize:(CGSize)a3 anchorPosition:(int64_t)a4 anchorPoint:(CGPoint)a5 pointerHeight:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  height = a3.height;
  width = a3.width;
  y = a5.y;
  x = a5.x;
  switch(a4)
  {
    case 1:
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = width;
      v21.size.height = height;
      v12 = x - CGRectGetMidX(v21);
      -[MKAnnotationView _verticalAccessoryDisplayPadding](self, "_verticalAccessoryDisplayPadding");
      v14 = y + v13 + a6;
      break;
    case 2:
      v22.origin.x = 0.0;
      v22.origin.y = 0.0;
      v22.size.width = width;
      v22.size.height = height;
      v12 = x - CGRectGetMidX(v22);
      -[MKAnnotationView _verticalAccessoryDisplayPadding](self, "_verticalAccessoryDisplayPadding");
      v14 = y - v15 - a6 - height;
      break;
    case 3:
      -[MKAnnotationView _horizontalAccessoryDisplayPadding](self, "_horizontalAccessoryDisplayPadding");
      v12 = x + v16;
      goto LABEL_7;
    case 4:
      -[MKAnnotationView _horizontalAccessoryDisplayPadding](self, "_horizontalAccessoryDisplayPadding");
      v12 = x - v17 - width;
LABEL_7:
      v23.origin.y = 0.0;
      v23.origin.x = v12;
      v23.size.width = width;
      v23.size.height = height;
      v14 = y - CGRectGetMidY(v23);
      break;
    default:
      v14 = 0.0;
      v12 = 0.0;
      break;
  }
  v18 = v12;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v14;
  result.origin.x = v18;
  return result;
}

- (void)_dismissSelectionAccessoryPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(v8, "_presentationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "_presentationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView _dismissPresentedSelectionAccessoryFromViewController:animated:](self, "_dismissPresentedSelectionAccessoryFromViewController:animated:", v7, v4);

  }
}

- (void)_dismissSelectionAccessoryViewAnimated:(BOOL)a3
{
  void *v4;
  MKSelectionAccessoryView *selectionAccessoryView;
  MKPresentableSelectionAccessoryViewController *selectionAccessoryViewController;

  -[MKSelectionAccessoryView superview](self->_selectionAccessoryView, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MKSelectionAccessoryView removeFromSuperview](self->_selectionAccessoryView, "removeFromSuperview");
  selectionAccessoryView = self->_selectionAccessoryView;
  self->_selectionAccessoryView = 0;

  selectionAccessoryViewController = self->_selectionAccessoryViewController;
  self->_selectionAccessoryViewController = 0;

}

- (void)_updateSelectionAccessoryViewContent
{
  uint64_t v3;
  id v4;

  -[MKAnnotationView _mapItem](self, "_mapItem");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v3;
  if (v3)
    -[MKSelectionAccessoryView displayMapItem:](self->_selectionAccessoryView, "displayMapItem:", v3);
  else
    -[MKAnnotationView _fetchMapItemForSelectionAccessoryView](self, "_fetchMapItemForSelectionAccessoryView");

}

- (void)_fetchMapItemForSelectionAccessoryView
{
  MKAnnotation *v3;
  MKMapItemRequest *v4;
  MKMapItemRequest *selectionAccessoryMapItemRequest;
  MKMapItemRequest *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_selectionAccessoryMapItemRequest)
  {
    objc_initWeak(&location, self);
    v3 = self->_annotation;
    v4 = -[MKMapItemRequest initWithMapFeatureAnnotation:]([MKMapItemRequest alloc], "initWithMapFeatureAnnotation:", v3);
    selectionAccessoryMapItemRequest = self->_selectionAccessoryMapItemRequest;
    self->_selectionAccessoryMapItemRequest = v4;

    v6 = self->_selectionAccessoryMapItemRequest;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__MKAnnotationView__fetchMapItemForSelectionAccessoryView__block_invoke;
    v7[3] = &unk_1E20DAE48;
    objc_copyWeak(&v8, &location);
    -[MKMapItemRequest getMapItemWithCompletionHandler:](v6, "getMapItemWithCompletionHandler:", v7);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
}

void __58__MKAnnotationView__fetchMapItemForSelectionAccessoryView__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 116);
    if (v6)
      objc_msgSend(v5, "displayMapItem:", v6);
    else
      objc_msgSend(v5, "displayError");
  }

}

- (void)_showCallout:(BOOL)a3
{
  _BOOL8 v3;
  MKCalloutView *v5;
  MKCalloutView *calloutView;
  void *v7;
  NSObject *v8;
  MKCalloutView *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;

  v3 = a3;
  if (!self->_calloutView)
  {
    -[MKAnnotationView _effectiveCalloutStyle](self, "_effectiveCalloutStyle");
    objc_opt_class();
    v5 = (MKCalloutView *)objc_msgSend(objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()), "initWithAnnotationView:", self);
    calloutView = self->_calloutView;
    self->_calloutView = v5;

  }
  -[MKAnnotationView _mapView](self, "_mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_calloutShowAnimationGroup");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    dispatch_group_enter(v8);
  v9 = self->_calloutView;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__MKAnnotationView__showCallout___block_invoke;
  v11[3] = &unk_1E20D7D98;
  v12 = v8;
  v10 = v8;
  -[MKCalloutView showAnimated:completionBlock:](v9, "showAnimated:completionBlock:", v3, v11);

}

void __33__MKAnnotationView__showCallout___block_invoke(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_group_leave(v1);
}

- (void)_dismissCallout:(BOOL)a3
{
  _BOOL8 v3;
  MKCalloutView *v5;
  MKCalloutView *calloutView;
  _QWORD v7[4];
  MKCalloutView *v8;

  v3 = a3;
  v5 = self->_calloutView;
  if (v5)
  {
    calloutView = self->_calloutView;
    self->_calloutView = 0;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__MKAnnotationView__dismissCallout___block_invoke;
    v7[3] = &unk_1E20D7D98;
    v8 = v5;
    -[MKCalloutView dismissAnimated:completionBlock:](v8, "dismissAnimated:completionBlock:", v3, v7);

  }
}

uint64_t __36__MKAnnotationView__dismissCallout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setCenterOffset:(CGPoint)centerOffset
{
  self->_centerOffset = centerOffset;
  if (qword_1EDFB7A70 != -1)
    dispatch_once(&qword_1EDFB7A70, &__block_literal_global_777);
  if (byte_1EDFB7A61)
    -[MKAnnotationView _metricsDidChange](self, "_metricsDidChange");
}

- (CGPoint)calloutOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_calloutOffset.x;
  y = self->_calloutOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)_setDirection:(double)a3
{
  CGAffineTransform v4;

  self->_direction = a3;
  CGAffineTransformMakeRotation(&v4, -(self->_mapRotationRadians - a3 * 0.0174532925));
  -[MKAnnotationView setTransform:](self, "setTransform:", &v4);
}

- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3
{
  void *v4;
  void (**v5)(void);

  self->_presentationCoordinate = a3;
  -[MKAnnotationView _presentationCoordinateChangedCallback](self, "_presentationCoordinateChangedCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MKAnnotationView _presentationCoordinateChangedCallback](self, "_presentationCoordinateChangedCallback");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (BOOL)_shouldDeselectWhenDragged
{
  return 1;
}

- (void)_setAnimatingToCoordinate:(BOOL)a3
{
  _BOOL4 v3;
  CLLocationDegrees v5;
  CLLocationDegrees v6;

  if (self->_animatingToCoordinate != a3)
  {
    v3 = a3;
    -[MKAnnotationView _presentationCoordinate](self, "_presentationCoordinate");
    self->_animatingToCoordinate = v3;
    if (v3)
    {
      self->_presentationCoordinate.latitude = v5;
      self->_presentationCoordinate.longitude = v6;
    }
  }
}

- (void)_setTracking:(BOOL)a3
{
  _BOOL4 v3;
  CLLocationDegrees v5;
  CLLocationDegrees v6;

  if (self->_tracking != a3)
  {
    v3 = a3;
    -[MKAnnotationView _presentationCoordinate](self, "_presentationCoordinate");
    self->_tracking = v3;
    if (v3)
    {
      self->_presentationCoordinate.latitude = v5;
      self->_presentationCoordinate.longitude = v6;
    }
  }
}

- (MKUserLocationAnnotationViewProxy)_userLocationProxy
{
  MKUserLocationAnnotationViewProxy *userLocationProxy;
  MKUserLocationAnnotationViewProxy *v4;
  MKUserLocationAnnotationViewProxy *v5;

  userLocationProxy = self->_userLocationProxy;
  if (!userLocationProxy)
  {
    v4 = objc_alloc_init(MKUserLocationAnnotationViewProxy);
    v5 = self->_userLocationProxy;
    self->_userLocationProxy = v4;

    -[MKUserLocationAnnotationViewProxy setAnnotationView:](self->_userLocationProxy, "setAnnotationView:", self);
    userLocationProxy = self->_userLocationProxy;
  }
  return userLocationProxy;
}

- (CGRect)_mapkit_visibleRect
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  -[MKAnnotationView _significantBounds](self, "_significantBounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[MKAnnotationView _calloutView](self, "_calloutView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MKAnnotationView _calloutView](self, "_calloutView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v24.origin.x = v13;
    v24.origin.y = v14;
    v24.size.width = v15;
    v24.size.height = v16;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectUnion(v21, v24);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;

  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_significantFrame
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
  CGRect result;

  -[MKAnnotationView _significantBounds](self, "_significantBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKAnnotationView frame](self, "frame");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (BOOL)isEnabled
{
  return (*(_WORD *)&self->_flags & 2) == 0;
}

- (BOOL)isHighlighted
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)setHighlighted:(BOOL)highlighted
{
  __int16 v3;

  if (highlighted)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)isDraggable
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)setDraggable:(BOOL)draggable
{
  __int16 v3;
  id WeakRetained;

  if (draggable)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
  if (draggable)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
    objc_msgSend(WeakRetained, "countUsageOfTypeIfNeeded:", 43);

  }
}

- (void)setDragState:(MKAnnotationViewDragState)dragState
{
  -[MKAnnotationView _setDragState:animated:](self, "_setDragState:animated:", dragState, 0);
}

- (void)_setDragState:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t dragState;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  dragState = self->_dragState;
  self->_dragState = a3;
  -[MKAnnotationView _updateEffectiveZPriority](self, "_updateEffectiveZPriority");
  if (a3 == 1 || !a3 && dragState)
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", a3 != 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", dragState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("oldValue"), v9, CFSTR("newValue"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MKAnnotationViewDragStateChangedNotification"), self, v10);

}

- (BOOL)_canDisplayDisclosureInCallout
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (void)_setCanDisplayDisclosureInCallout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)_canDisplayPlacemarkInCallout
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (void)_setCanDisplayPlacemarkInCallout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)isPersistent
{
  return 0;
}

- (unint64_t)_zIndex
{
  return self->_zIndex;
}

- (void)_setZIndex:(unint64_t)a3
{
  double v3;

  if (self->_zIndex != a3)
  {
    self->_zIndex = a3;
    *(float *)&v3 = (float)((float)a3 * 4.6566e-10) * 1000.0;
    -[MKAnnotationView setZPriority:](self, "setZPriority:", v3);
  }
}

- (void)_updateEffectiveZPriority
{
  id v3;

  -[MKAnnotationView _containerView](self, "_containerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotationViewDidChangeZPriority:", self);

}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MKAnnotationView prepareForSnapshotting](self, "prepareForSnapshotting");
  return -[MKAnnotationView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", v3);
}

- (void)setHidden:(BOOL)a3
{
  -[MKAnnotationView _setHidden:forReason:animated:](self, "_setHidden:forReason:animated:", a3, 0, objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"));
}

- (void)_setHiddenForOffscreen:(BOOL)a3
{
  -[MKAnnotationView _setHidden:forReason:animated:](self, "_setHidden:forReason:animated:", a3, 2, 0);
}

- (BOOL)_isHiddenForReason:(unint64_t)a3
{
  return (self->_hiddenReasons & (1 << a3)) != 0;
}

id __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke(uint64_t a1)
{
  double v1;
  objc_super v3;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = *(double *)(*(_QWORD *)(a1 + 32) + 520);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)MKAnnotationView;
  return objc_msgSendSuper2(&v3, sel_setAlpha_, v1);
}

uint64_t __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v13.receiver = v2;
  v13.super_class = (Class)MKAnnotationView;
  objc_msgSendSuper2(&v13, sel_setHidden_, objc_msgSend(v2, "isHidden"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 512);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "removeAllObjects", (_QWORD)v9);
}

uint64_t __51__MKAnnotationView__performOffsetAnimationIfNeeded__block_invoke(uint64_t a1)
{
  CGFloat *v1;
  CGAffineTransform v3;
  CGAffineTransform v4;

  memset(&v4, 0, sizeof(v4));
  v1 = *(CGFloat **)(a1 + 32);
  CGAffineTransformMakeTranslation(&v4, v1[66], v1[67]);
  v3 = v4;
  return -[CGFloat setTransform:](v1, "setTransform:", &v3);
}

- (void)_setPositionOffset:(CGPoint)a3 animated:(BOOL)a4
{
  __int16 flags;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (self->_realOffset.x != a3.x || self->_realOffset.y != a3.y)
  {
    self->_realOffset = a3;
    flags = (__int16)self->_flags;
    *(_WORD *)&self->_flags = flags & 0xEFFF;
    if (a4)
    {
      *(_WORD *)&self->_flags = flags | 0x1000;
    }
    else
    {
      memset(&v8, 0, sizeof(v8));
      CGAffineTransformMakeTranslation(&v8, a3.x, a3.y);
      v7 = v8;
      -[MKAnnotationView setTransform:](self, "setTransform:", &v7);
    }
  }
}

- (CGPoint)_offsetToAnnotationView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[MKAnnotationView center](self, "center");
  v5 = v4;
  v7 = v6;
  objc_msgSend(a3, "center");
  v9 = v8 - v5;
  v11 = v10 - v7;
  result.y = v11;
  result.x = v9;
  return result;
}

- (void)_enableRotationForHeadingMode:(double)a3
{
  void *v5;
  void *v6;
  __int16 flags;
  CGAffineTransform v8;

  -[MKAnnotationView _contentLayer](self, "_contentLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "affineTransform");
  else
    memset(&v8, 0, sizeof(v8));
  if (CGAffineTransformIsIdentity(&v8))
    goto LABEL_7;
  flags = (__int16)self->_flags;

  if ((flags & 0x200) == 0)
  {
    *(_WORD *)&self->_flags |= 0x100u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__userTrackingModeDidChange_, 0x1E20E0C60, 0);
LABEL_7:

  }
  -[MKAnnotationView _setRotationRadians:withAnimation:](self, "_setRotationRadians:withAnimation:", 0, a3, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

- (void)_userTrackingModeDidChange:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    v7 = v4;
    v5 = objc_msgSend(v4, "userTrackingMode") == 2;
    v4 = v7;
    if (v5)
    {
      NSLog(CFSTR("A custom transform was applied to '%@' and is not supported with MKUserTrackingModeFollowWithHeading."), self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, 0x1E20E0C60, 0);

      v4 = v7;
    }
  }

}

- (void)_setRotationRadians:(double)a3 withAnimation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v6 = a4;
  if (vabdd_f64(a3, self->_rotationRadians) >= 0.000001 && (*(_WORD *)&self->_flags & 0x300) != 0x100)
  {
    CGAffineTransformMakeRotation(&v11, a3);
    -[MKAnnotationView _contentLayer](self, "_contentLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    objc_msgSend(v7, "setAffineTransform:", &v10);

    *(_WORD *)&self->_flags |= 0x200u;
    self->_rotationRadians = a3;
    -[MKAnnotationView _contentLayer](self, "_contentLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
      objc_msgSend(v8, "addAnimation:forKey:", v6, CFSTR("rotation"));
    else
      objc_msgSend(v8, "removeAnimationForKey:", CFSTR("rotation"));

  }
}

- (BOOL)_hasAlternateOrientation
{
  return -[MKAnnotationView _orientationCount](self, "_orientationCount") > 1;
}

- (unint64_t)_orientationCount
{
  return 1;
}

- (id)_customFeatureAnnotation
{
  return 0;
}

- (void)_addAnnotationObservation
{
  _MKKVOProxy *v3;
  _MKKVOProxy *annotationObserver;

  if (!self->_annotationObserver)
  {
    v3 = -[_MKKVOProxy initWithDelegate:]([_MKKVOProxy alloc], "initWithDelegate:", self);
    annotationObserver = self->_annotationObserver;
    self->_annotationObserver = v3;

    -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_annotationObserver, "addObserverForObject:forKeyPath:options:context:", self, CFSTR("annotation.title"), 0, MKAnnotationKVOContext);
  }
}

- (void)_removeAnnotationObservation
{
  _MKKVOProxy *annotationObserver;
  _MKKVOProxy *v4;

  annotationObserver = self->_annotationObserver;
  if (annotationObserver)
  {
    -[_MKKVOProxy removeObserverForObject:forKeyPath:context:](annotationObserver, "removeObserverForObject:forKeyPath:context:", self, CFSTR("annotation.title"), MKAnnotationKVOContext);
    v4 = self->_annotationObserver;
    self->_annotationObserver = 0;

  }
}

- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v7[4];
  id v8;
  id location;

  if ((void *)MKAnnotationKVOContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4, a5))
    {
      -[MKAnnotationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 1);
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __70__MKAnnotationView__mkObserveValueForKeyPath_ofObject_change_context___block_invoke;
      v7[3] = &unk_1E20D8A58;
      objc_copyWeak(&v8, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __70__MKAnnotationView__mkObserveValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateCalloutViewIfNeededAnimated:", 1);

}

- (BOOL)isCollidingWithAnnotationView:(id)a3 previouslyCollided:(BOOL)a4
{
  double y;
  double x;
  double height;
  double width;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  int64_t collisionMode;
  uint64_t v15;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double MinX;
  double v37;
  double MinY;
  double v39;
  double v40;
  double v41;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double MidY;
  double MidX;
  CGFloat v58;
  double v59;
  CGFloat rect;
  CGFloat recta;
  CGPoint v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  x = self->_collisionFrame.origin.x;
  y = self->_collisionFrame.origin.y;
  width = self->_collisionFrame.size.width;
  height = self->_collisionFrame.size.height;
  v11 = *((double *)a3 + 83);
  v10 = *((double *)a3 + 84);
  v12 = *((double *)a3 + 85);
  v13 = *((double *)a3 + 86);
  if (!a4)
  {
    v63 = CGRectInset(self->_collisionFrame, 5.0, 5.0);
    x = v63.origin.x;
    y = v63.origin.y;
    width = v63.size.width;
    height = v63.size.height;
    v63.origin.x = v11;
    v63.origin.y = v10;
    v63.size.width = v12;
    v63.size.height = v13;
    v64 = CGRectInset(v63, 5.0, 5.0);
    v11 = v64.origin.x;
    v10 = v64.origin.y;
    v12 = v64.size.width;
    v13 = v64.size.height;
  }
  collisionMode = self->_collisionMode;
  v15 = *((_QWORD *)a3 + 89);
  if (collisionMode == 2 || v15 == 2)
    return 0;
  if (collisionMode == v15)
  {
    if (!collisionMode)
    {
      v78.origin.x = x;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = height;
      v82.origin.x = v11;
      v82.origin.y = v10;
      v82.size.width = v12;
      v82.size.height = v13;
      return CGRectIntersectsRect(v78, v82);
    }
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    MidX = CGRectGetMidX(v65);
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    MidY = CGRectGetMidY(v66);
    v67.origin.x = v11;
    v67.origin.y = v10;
    v67.size.width = v12;
    v67.size.height = v13;
    v55 = CGRectGetMidX(v67);
    v68.origin.x = v11;
    v68.origin.y = v10;
    v58 = v12;
    rect = v13;
    v68.size.width = v12;
    v68.size.height = v13;
    v54 = CGRectGetMidY(v68);
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    v18 = CGRectGetWidth(v69) * 0.5;
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    if (v18 >= CGRectGetHeight(v70) * 0.5)
    {
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      v19 = CGRectGetHeight(v79);
    }
    else
    {
      v71.origin.x = x;
      v71.origin.y = y;
      v71.size.width = width;
      v71.size.height = height;
      v19 = CGRectGetWidth(v71);
    }
    v43 = v19 * 0.5;
    v80.origin.x = v11;
    v80.origin.y = v10;
    v80.size.width = v58;
    v80.size.height = rect;
    v44 = CGRectGetWidth(v80) * 0.5;
    v81.origin.x = v11;
    v81.origin.y = v10;
    v81.size.width = v58;
    v81.size.height = rect;
    v45 = CGRectGetHeight(v81);
    v46 = rect;
    if (v44 >= v45 * 0.5)
    {
      v51 = v11;
      v52 = v10;
      v53 = v58;
      v50 = CGRectGetHeight(*(CGRect *)(&v46 - 3));
    }
    else
    {
      v47 = v11;
      v48 = v10;
      v49 = v58;
      v50 = CGRectGetWidth(*(CGRect *)(&v46 - 3));
    }
    return (MidX - v55) * (MidX - v55) + (MidY - v54) * (MidY - v54) < (v43 + v50 * 0.5) * (v43 + v50 * 0.5);
  }
  else
  {
    if (v15 == 1)
      v20 = v12;
    else
      v20 = width;
    v21 = v10;
    if (v15 == 1)
      v22 = v13;
    else
      v22 = height;
    v23 = v12;
    if (v15 == 1)
      v24 = v21;
    else
      v24 = y;
    v25 = v13;
    if (v15 == 1)
      v26 = v11;
    else
      v26 = x;
    if (v15 == 1)
      v25 = height;
    recta = v25;
    v27 = v11;
    if (v15 == 1)
      v28 = width;
    else
      v28 = v23;
    if (v15 == 1)
    {
      v29 = x;
    }
    else
    {
      y = v21;
      v29 = v27;
    }
    v30 = v20;
    v31 = v26;
    v32 = v24;
    v33 = v22;
    v34 = CGRectGetMidX(*(CGRect *)(&v20 - 2));
    v72.origin.x = v26;
    v72.origin.y = v24;
    v59 = v22;
    v72.size.width = v30;
    v72.size.height = v22;
    v35 = CGRectGetMidY(v72);
    v73.origin.x = v29;
    v73.origin.y = y;
    v73.size.width = v28;
    v73.size.height = recta;
    v62.x = v34;
    v62.y = v35;
    if (CGRectContainsPoint(v73, v62))
      return 1;
    v74.origin.x = v29;
    v74.origin.y = y;
    v74.size.width = v28;
    v74.size.height = recta;
    MinX = CGRectGetMinX(v74);
    v75.origin.x = v29;
    v75.origin.y = y;
    v75.size.width = v28;
    v75.size.height = recta;
    v37 = fmin(fmax(v34, MinX), CGRectGetMaxX(v75));
    v76.origin.x = v29;
    v76.origin.y = y;
    v76.size.width = v28;
    v76.size.height = recta;
    MinY = CGRectGetMinY(v76);
    v77.origin.x = v29;
    v77.origin.y = y;
    v77.size.width = v28;
    v77.size.height = recta;
    v39 = fmin(fmax(v35, MinY), CGRectGetMaxY(v77));
    v40 = (v34 - v37) * (v34 - v37) + (v35 - v39) * (v35 - v39);
    v41 = v59;
    if (v30 < v59)
      v41 = v30;
    return v40 < v41 * 0.5 * (v41 * 0.5);
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (self->_clusteringIdentifier || self->_displayPriority < 1000.0)
  {
    -[MKAnnotationView _defaultCollisionAlignmentRectInsets](self, "_defaultCollisionAlignmentRectInsets");
  }
  else
  {
    v2 = 0.0;
    v3 = 0.0;
    v4 = 0.0;
    v5 = 0.0;
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setTitleVisibility:(int64_t)a3
{
  if (self->_titleVisibility != a3)
  {
    self->_titleVisibility = a3;
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", 1);
  }
}

- (void)setSubtitleVisibility:(int64_t)a3
{
  if (self->_subtitleVisibility != a3)
  {
    self->_subtitleVisibility = a3;
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", 1);
  }
}

- (id)customFeatureAnnotation
{
  _MKAnnotationViewCustomFeatureAnnotation *customFeatureAnnotation;
  _MKAnnotationViewCustomFeatureAnnotation *v4;
  _MKAnnotationViewCustomFeatureAnnotation *v5;

  customFeatureAnnotation = self->_customFeatureAnnotation;
  if (!customFeatureAnnotation)
  {
    v4 = (_MKAnnotationViewCustomFeatureAnnotation *)objc_opt_new();
    v5 = self->_customFeatureAnnotation;
    self->_customFeatureAnnotation = v4;

    -[_MKAnnotationViewCustomFeatureAnnotation setAnnotationView:](self->_customFeatureAnnotation, "setAnnotationView:", self);
    customFeatureAnnotation = self->_customFeatureAnnotation;
  }
  return customFeatureAnnotation;
}

- (BOOL)_titleRequiresCustomFeature
{
  void *v3;
  BOOL v4;

  if (-[MKAnnotationView titleVisibility](self, "titleVisibility") != 1
    || -[MKAnnotationView subtitleVisibility](self, "subtitleVisibility") != 1)
  {
    return 1;
  }
  -[MKAnnotationView _mapItem](self, "_mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isProvidingCustomFeature
{
  _BOOL4 v3;
  float v4;

  if (-[MKAnnotationView isHidden](self, "isHidden"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[MKAnnotationView displayPriority](self, "displayPriority");
    if (v4 < 1000.0 || (v3 = -[MKAnnotationView _titleRequiresCustomFeature](self, "_titleRequiresCustomFeature")))
      LOBYTE(v3) = -[MKAnnotationView dragState](self, "dragState") == MKAnnotationViewDragStateNone;
  }
  return v3;
}

- (void)invalidateCustomFeatureForced:(BOOL)a3
{
  -[MKAnnotationView _invalidateCustomFeatureForced:coordinates:count:](self, "_invalidateCustomFeatureForced:coordinates:count:", a3, &self->_coordinate, 1);
}

- (void)_invalidateCustomFeatureForced:(BOOL)a3 coordinates:(CLLocationCoordinate2D *)a4 count:(unint64_t)a5
{
  _MKAnnotationViewCustomFeatureAnnotation *customFeatureAnnotation;
  BOOL v6;
  CLLocationDegrees *p_longitude;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  customFeatureAnnotation = self->_customFeatureAnnotation;
  if (customFeatureAnnotation)
    v6 = 0;
  else
    v6 = !a3;
  if (!v6)
  {
    self->_customFeatureAnnotation = 0;

    if (a5)
    {
      p_longitude = &a4->longitude;
      do
      {
        if (*p_longitude >= -180.0 && *p_longitude <= 180.0)
        {
          v11 = *(p_longitude - 1);
          if (v11 >= -90.0 && v11 <= 90.0)
          {
            GEOMapPointForCoordinate();
            v23 = v12;
            v24 = v13;
            GEOMapRectBoundingMapPoints();
            v15 = v14;
            v17 = v16;
            v19 = v18;
            v21 = v20;
            -[MKAnnotationView _annotationContainer](self, "_annotationContainer", v23, v24);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "invalidateCustomFeatureDataSourceRect:", v15, v17, v19, v21);

          }
        }
        p_longitude += 2;
        --a5;
      }
      while (a5);
    }
  }
}

- (BOOL)_isProvidingVKLabelContents
{
  int64_t titleVisibility;
  BOOL v4;
  void *v5;
  void *v6;

  titleVisibility = self->_titleVisibility;
  if (titleVisibility != 1)
  {
    -[MKAnnotationView _effectiveTitleIsCollidable:](self, "_effectiveTitleIsCollidable:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
      goto LABEL_10;
    }
    if (self->_subtitleVisibility == 1)
    {
      v5 = 0;
      v4 = 0;
      goto LABEL_10;
    }
LABEL_8:
    -[MKAnnotationView _effectiveSubtitle](self, "_effectiveSubtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6 != 0;

    if (titleVisibility == 1)
      return v4;
    v5 = 0;
LABEL_10:

    return v4;
  }
  if (self->_subtitleVisibility != 1)
    goto LABEL_8;
  return 0;
}

- (id)_effectiveTitleIsCollidable:(BOOL *)a3
{
  void *v5;
  char v6;
  int64_t titleVisibility;
  BOOL v8;
  void *v9;
  void *v10;

  if (-[MKAnnotationView isSelected](self, "isSelected") && -[MKAnnotationView canShowCallout](self, "canShowCallout"))
    goto LABEL_10;
  -[MKAnnotationView annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    goto LABEL_10;
  titleVisibility = self->_titleVisibility;
  if (titleVisibility != 2)
  {
    if (!titleVisibility)
    {
      v8 = -[MKAnnotationView isSelected](self, "isSelected");
      if (a3 && !v8)
        *a3 = 1;
      goto LABEL_9;
    }
LABEL_10:
    v10 = 0;
    return v10;
  }
LABEL_9:
  -[MKAnnotationView annotation](self, "annotation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_effectiveSubtitle
{
  void *v3;
  int64_t subtitleVisibility;
  void *v5;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!-[MKAnnotationView isSelected](self, "isSelected")
     || !-[MKAnnotationView canShowCallout](self, "canShowCallout"))
    && (objc_opt_respondsToSelector() & 1) != 0
    && ((subtitleVisibility = self->_subtitleVisibility, subtitleVisibility == 2)
     || !subtitleVisibility
     && (-[MKAnnotationView isSelected](self, "isSelected") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))))
  {
    objc_msgSend(v3, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)configureCustomFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;

  v4 = a3;
  v8 = 0;
  -[MKAnnotationView _effectiveTitleIsCollidable:](self, "_effectiveTitleIsCollidable:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView _effectiveSubtitle](self, "_effectiveSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v4, "setText:locale:", v5, 0);
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v4, "setAnnotationText:locale:", v6, 0);
  if (objc_msgSend(v6, "length") || objc_msgSend(v5, "length"))
  {
    if (v8)
      v7 = 1;
    else
      v7 = 2;
    objc_msgSend(v4, "setTextDisplayMode:", v7);
  }
  if (-[_MKDeferredSelectionAccessoryPresentation reason](self->_deferredSelectionAccessory, "reason") == 2)
    -[_MKDeferredSelectionAccessoryPresentation setReady:](self->_deferredSelectionAccessory, "setReady:", 1);

}

- (id)_mapItem
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MKAnnotation _representedMapItem](self->_annotation, "_representedMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)_direction
{
  return self->_direction;
}

- (id)_presentationCoordinateChangedCallback
{
  return self->_presentationCoordinateChangedCallback;
}

- (double)_presentationCourse
{
  return self->_presentationCourse;
}

- (void)_setPresentationCourse:(double)a3
{
  self->_presentationCourse = a3;
}

- (BOOL)_isAnimatingToCoordinate
{
  return self->_animatingToCoordinate;
}

- (BOOL)_isTracking
{
  return self->_tracking;
}

- (void)_setCalloutView:(id)a3
{
  objc_storeStrong((id *)&self->_calloutView, a3);
}

- (BOOL)_shouldKeepCalloutVisible
{
  return self->_shouldKeepCalloutVisible;
}

- (void)_setShouldKeepCalloutVisible:(BOOL)a3
{
  self->_shouldKeepCalloutVisible = a3;
}

- (CGRect)_collisionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_collisionFrame.origin.x;
  y = self->_collisionFrame.origin.y;
  width = self->_collisionFrame.size.width;
  height = self->_collisionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)leftCalloutOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_leftCalloutOffset.x;
  y = self->_leftCalloutOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLeftCalloutOffset:(CGPoint)leftCalloutOffset
{
  self->_leftCalloutOffset = leftCalloutOffset;
}

- (CGPoint)rightCalloutOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_rightCalloutOffset.x;
  y = self->_rightCalloutOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRightCalloutOffset:(CGPoint)rightCalloutOffset
{
  self->_rightCalloutOffset = rightCalloutOffset;
}

- (CGPoint)_bottomCalloutOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomCalloutOffset.x;
  y = self->_bottomCalloutOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setBottomCalloutOffset:(CGPoint)a3
{
  self->_bottomCalloutOffset = a3;
}

- (unint64_t)_allowedCalloutEdges
{
  return self->_allowedCalloutEdges;
}

- (void)_setAllowedCalloutEdges:(unint64_t)a3
{
  self->_allowedCalloutEdges = a3;
}

- (GEORouteMatch)_routeMatch
{
  return self->_routeMatch;
}

- (void)_setRouteMatch:(id)a3
{
  objc_storeStrong((id *)&self->_routeMatch, a3);
}

- (double)_mapRotationRadians
{
  return self->_mapRotationRadians;
}

- (float)_selectionPriority
{
  return self->_selectionPriority;
}

- (void)_setSelectionPriority:(float)a3
{
  self->_selectionPriority = a3;
}

- (void)_setStaticMapView:(id)a3
{
  objc_storeWeak((id *)&self->_staticMapView, a3);
}

- (BOOL)_isPendingSelectionAnimated
{
  return self->_pendingSelectionAnimated;
}

- (void)_setPendingSelectionAnimated:(BOOL)a3
{
  self->_pendingSelectionAnimated = a3;
}

- (BOOL)_skipDrawingForSnapshots
{
  return self->_skipDrawingForSnapshots;
}

- (void)_setSkipDrawingForSnapshots:(BOOL)a3
{
  self->_skipDrawingForSnapshots = a3;
}

- (MKAnnotationView)clusterAnnotationView
{
  return (MKAnnotationView *)objc_loadWeakRetained((id *)&self->_clusterAnnotationView);
}

- (CGPoint)accessoryOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_accessoryOffset.x;
  y = self->_accessoryOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAccessoryOffset:(CGPoint)a3
{
  self->_accessoryOffset = a3;
}

- (MKSelectionAccessoryView)_selectionAccessoryView
{
  return self->_selectionAccessoryView;
}

- (MKUsageCounter)_usageCounter
{
  return (MKUsageCounter *)objc_loadWeakRetained((id *)&self->_usageCounter);
}

- (void)setAnnotationTrackingInsets:(UIEdgeInsets)a3
{
  self->_annotationTrackingInsets = a3;
}

- (unint64_t)_featureId
{
  return self->_featureId;
}

- (void)_setFeatureId:(unint64_t)a3
{
  self->_featureId = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_usageCounter);
  objc_storeStrong((id *)&self->_selectionAccessoryView, 0);
  objc_destroyWeak((id *)&self->_staticMapView);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_destroyWeak((id *)&self->_clusterAnnotationView);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_detailCalloutAccessoryView, 0);
  objc_storeStrong((id *)&self->_rightCalloutAccessoryView, 0);
  objc_storeStrong((id *)&self->_leftCalloutAccessoryView, 0);
  objc_storeStrong((id *)&self->_calloutView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_clusteringIdentifier, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_selectionAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_selectionAccessoryMapItemRequest, 0);
  objc_storeStrong((id *)&self->_deferredSelectionAccessory, 0);
  objc_storeStrong((id *)&self->_resolvedSelectionAccessory, 0);
  objc_storeStrong((id *)&self->_activeSelectionAccessory, 0);
  objc_storeStrong((id *)&self->_customFeatureAnnotation, 0);
  objc_storeStrong((id *)&self->_annotationObserver, 0);
  objc_storeStrong((id *)&self->_hiddenCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_userLocationProxy, 0);
  objc_storeStrong(&self->_presentationCoordinateChangedCallback, 0);
}

@end

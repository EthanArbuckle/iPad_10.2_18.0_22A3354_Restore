@implementation MKUserLocationView

- (void)_updateFromMap
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _updateFromMap](&v3, sel__updateFromMap);
  -[_MKPuckAnnotationView _updateFromMap](self->_mkUserLocationView, "_updateFromMap");
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (CGPoint)centerOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[MKAnnotationView centerOffset](self->_mkUserLocationView, "centerOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_setMapRotationRadians:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _setMapRotationRadians:](&v5, sel__setMapRotationRadians_);
  -[_MKPuckAnnotationView _setMapRotationRadians:](self->_mkUserLocationView, "_setMapRotationRadians:", a3);
}

- (_MKUserLocationView)_mkUserLocationView
{
  return self->_mkUserLocationView;
}

- (BOOL)isDraggable
{
  return 0;
}

- (id)detailCalloutAccessoryView
{
  return -[MKAnnotationView detailCalloutAccessoryView](self->_mkUserLocationView, "detailCalloutAccessoryView");
}

- (MKUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  MKUserLocationView *v7;
  _MKUserLocationInternalView *v8;
  _MKUserLocationView *mkUserLocationView;
  _MKUserLocationInternalView *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKUserLocationView;
  v7 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v12, sel_initWithAnnotation_reuseIdentifier_, v6, a4);
  if (v7)
  {
    v8 = -[_MKUserLocationView initWithAnnotation:reuseIdentifier:]([_MKUserLocationInternalView alloc], "initWithAnnotation:reuseIdentifier:", v6, 0);
    -[_MKUserLocationInternalView bounds](v8, "bounds");
    -[_MKUserLocationInternalView setFrame:](v8, "setFrame:");
    -[_MKUserLocationInternalView setParentView:](v8, "setParentView:", v7);
    mkUserLocationView = v7->_mkUserLocationView;
    v7->_mkUserLocationView = &v8->super;
    v10 = v8;

    v7->super._collisionMode = 2;
    -[_MKUserLocationView bounds](v7->_mkUserLocationView, "bounds");
    -[MKUserLocationView setFrame:](v7, "setFrame:");
    -[MKUserLocationView addSubview:](v7, "addSubview:", v7->_mkUserLocationView);

  }
  return v7;
}

- (void)prepareForDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView prepareForDisplay](&v3, sel_prepareForDisplay);
  -[MKAnnotationView prepareForDisplay](self->_mkUserLocationView, "prepareForDisplay");
}

- (void)setAnnotation:(id)a3
{
  _MKUserLocationView *mkUserLocationView;
  id v5;
  objc_super v6;

  mkUserLocationView = self->_mkUserLocationView;
  v5 = a3;
  -[_MKUserLocationView setAnnotation:](mkUserLocationView, "setAnnotation:", v5);
  v6.receiver = self;
  v6.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView setAnnotation:](&v6, sel_setAnnotation_, v5);

}

- (BOOL)canShowCallout
{
  return -[MKAnnotationView canShowCallout](self->_mkUserLocationView, "canShowCallout");
}

- (void)_setMapType:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _setMapType:](&v5, sel__setMapType_);
  -[_MKPuckAnnotationView _setMapType:](self->_mkUserLocationView, "_setMapType:", a3);
}

- (void)_setMapPitchRadians:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _setMapPitchRadians:](&v5, sel__setMapPitchRadians_);
  -[_MKPuckAnnotationView _setMapPitchRadians:](self->_mkUserLocationView, "_setMapPitchRadians:", a3);
}

- (void)_setMapDisplayStyle:(id)a3
{
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKUserLocationView;
  v4 = *(_QWORD *)&a3.var0 & 0xFFFFFFFFFFFFLL;
  -[MKAnnotationView _setMapDisplayStyle:](&v5, sel__setMapDisplayStyle_, *(_QWORD *)&a3.var0 & 0xFFFFFFFFFFFFLL);
  -[_MKPuckAnnotationView _setMapDisplayStyle:](self->_mkUserLocationView, "_setMapDisplayStyle:", v4);
}

- (float)_selectionPriority
{
  float result;

  -[_MKPuckAnnotationView _selectionPriority](self->_mkUserLocationView, "_selectionPriority");
  return result;
}

- (void)_setSelectionPriority:(float)a3
{
  -[MKAnnotationView _setSelectionPriority:](self->_mkUserLocationView, "_setSelectionPriority:");
}

- (void)setCenterOffset:(CGPoint)a3
{
  -[MKAnnotationView setCenterOffset:](self->_mkUserLocationView, "setCenterOffset:", a3.x, a3.y);
}

- (void)setCanShowCallout:(BOOL)a3
{
  -[MKAnnotationView setCanShowCallout:](self->_mkUserLocationView, "setCanShowCallout:", a3);
}

- (CGPoint)calloutOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[_MKPuckAnnotationView calloutOffset](self->_mkUserLocationView, "calloutOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCalloutOffset:(CGPoint)a3
{
  -[MKAnnotationView setCalloutOffset:](self->_mkUserLocationView, "setCalloutOffset:", a3.x, a3.y);
}

- (CGPoint)leftCalloutOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[MKAnnotationView leftCalloutOffset](self->_mkUserLocationView, "leftCalloutOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLeftCalloutOffset:(CGPoint)a3
{
  -[MKAnnotationView setLeftCalloutOffset:](self->_mkUserLocationView, "setLeftCalloutOffset:", a3.x, a3.y);
}

- (CGPoint)rightCalloutOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[MKAnnotationView rightCalloutOffset](self->_mkUserLocationView, "rightCalloutOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setRightCalloutOffset:(CGPoint)a3
{
  -[MKAnnotationView setRightCalloutOffset:](self->_mkUserLocationView, "setRightCalloutOffset:", a3.x, a3.y);
}

- (id)leftCalloutAccessoryView
{
  return -[MKAnnotationView leftCalloutAccessoryView](self->_mkUserLocationView, "leftCalloutAccessoryView");
}

- (void)setLeftCalloutAccessoryView:(id)a3
{
  -[_MKUserLocationView setLeftCalloutAccessoryView:](self->_mkUserLocationView, "setLeftCalloutAccessoryView:", a3);
}

- (id)rightCalloutAccessoryView
{
  return -[MKAnnotationView rightCalloutAccessoryView](self->_mkUserLocationView, "rightCalloutAccessoryView");
}

- (void)setRightCalloutAccessoryView:(id)a3
{
  -[_MKUserLocationView setRightCalloutAccessoryView:](self->_mkUserLocationView, "setRightCalloutAccessoryView:", a3);
}

- (void)setDetailCalloutAccessoryView:(id)a3
{
  -[_MKUserLocationView setDetailCalloutAccessoryView:](self->_mkUserLocationView, "setDetailCalloutAccessoryView:", a3);
}

- (BOOL)_allowedToShowCallout
{
  return 0;
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  self->_selected = a3;
  -[MKAnnotationView _setSelected:animated:](self->_mkUserLocationView, "_setSelected:animated:");
  v7.receiver = self;
  v7.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView _setSelected:animated:](&v7, sel__setSelected_animated_, v5, v4);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKUserLocationView;
  -[MKAnnotationView prepareForReuse](&v3, sel_prepareForReuse);
  -[MKAnnotationView prepareForReuse](self->_mkUserLocationView, "prepareForReuse");
}

- (CGRect)_mapkit_visibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[_MKPuckAnnotationView _mapkit_visibleRect](self->_mkUserLocationView, "_mapkit_visibleRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_lastLocation
{
  return -[_MKPuckAnnotationView lastLocation](self->_mkUserLocationView, "lastLocation");
}

- (void)_updateStateFromLocation:(id)a3 duration:(double)a4
{
  -[_MKPuckAnnotationView updateStateFromLocation:duration:](self->_mkUserLocationView, "updateStateFromLocation:duration:", a3, a4);
}

- (void)_locationManagerFailedToUpdateLocation
{
  -[_MKPuckAnnotationView locationManagerFailedToUpdateLocation](self->_mkUserLocationView, "locationManagerFailedToUpdateLocation");
}

- (BOOL)_isStale
{
  return -[_MKPuckAnnotationView isStale](self->_mkUserLocationView, "isStale");
}

- (BOOL)_shouldDisplayHeading
{
  return -[_MKPuckAnnotationView shouldDisplayHeading](self->_mkUserLocationView, "shouldDisplayHeading");
}

- (void)_setShouldDisplayHeading:(BOOL)a3
{
  -[_MKPuckAnnotationView setShouldDisplayHeading:](self->_mkUserLocationView, "setShouldDisplayHeading:", a3);
}

- (BOOL)_canShowHeadingIndicator
{
  return -[_MKPuckAnnotationView canShowHeadingIndicator](self->_mkUserLocationView, "canShowHeadingIndicator");
}

- (void)_setCanShowHeadingIndicator:(BOOL)a3
{
  -[_MKPuckAnnotationView setCanShowHeadingIndicator:](self->_mkUserLocationView, "setCanShowHeadingIndicator:", a3);
}

- (double)_heading
{
  double result;

  -[_MKPuckAnnotationView heading](self->_mkUserLocationView, "heading");
  return result;
}

- (void)_setHeading:(double)a3
{
  -[_MKPuckAnnotationView setHeading:](self->_mkUserLocationView, "setHeading:", a3);
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_MKPuckAnnotationView _annotationTrackingInsets](self->_mkUserLocationView, "_annotationTrackingInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)_headingIndicatorStyle
{
  return -[_MKPuckAnnotationView headingIndicatorStyle](self->_mkUserLocationView, "headingIndicatorStyle");
}

- (void)_setHeadingIndicatorStyle:(int64_t)a3
{
  -[_MKPuckAnnotationView setHeadingIndicatorStyle:](self->_mkUserLocationView, "setHeadingIndicatorStyle:", a3);
}

- (BOOL)_allowsPulse
{
  return -[_MKPuckAnnotationView allowsPulse](self->_mkUserLocationView, "allowsPulse");
}

- (void)_setAllowsPulse:(BOOL)a3
{
  -[_MKPuckAnnotationView setAllowsPulse:](self->_mkUserLocationView, "setAllowsPulse:", a3);
}

- (BOOL)_shouldInnerPulse
{
  return -[_MKPuckAnnotationView shouldInnerPulse](self->_mkUserLocationView, "shouldInnerPulse");
}

- (void)_setShouldInnerPulse:(BOOL)a3
{
  -[_MKPuckAnnotationView setShouldInnerPulse:](self->_mkUserLocationView, "setShouldInnerPulse:", a3);
}

- (BOOL)_shouldShowOuterRing
{
  return -[_MKPuckAnnotationView shouldShowOuterRing](self->_mkUserLocationView, "shouldShowOuterRing");
}

- (void)_setShouldShowOuterRing:(BOOL)a3
{
  -[_MKPuckAnnotationView setShouldShowOuterRing:](self->_mkUserLocationView, "setShouldShowOuterRing:", a3);
}

- (BOOL)_allowsAccuracyRing
{
  return -[_MKPuckAnnotationView allowsAccuracyRing](self->_mkUserLocationView, "allowsAccuracyRing");
}

- (void)_setAllowsAccuracyRing:(BOOL)a3
{
  -[_MKPuckAnnotationView setAllowsAccuracyRing:](self->_mkUserLocationView, "setAllowsAccuracyRing:", a3);
}

- (double)_maxRadiusToShowAccuracyRing
{
  double result;

  -[_MKPuckAnnotationView maxRadiusToShowAccuracyRing](self->_mkUserLocationView, "maxRadiusToShowAccuracyRing");
  return result;
}

- (void)_setMaxRadiusToShowAccuracyRing:(double)a3
{
  -[_MKUserLocationView setMaxRadiusToShowAccuracyRing:](self->_mkUserLocationView, "setMaxRadiusToShowAccuracyRing:", a3);
}

- (double)_puckAlpha
{
  double result;

  -[_MKPuckAnnotationView puckAlpha](self->_mkUserLocationView, "puckAlpha");
  return result;
}

- (void)_setPuckAlpha:(double)a3
{
  -[_MKPuckAnnotationView setPuckAlpha:](self->_mkUserLocationView, "setPuckAlpha:", a3);
}

- (double)_accuracyRingAlpha
{
  double result;

  -[_MKPuckAnnotationView accuracyRingAlpha](self->_mkUserLocationView, "accuracyRingAlpha");
  return result;
}

- (void)_setAccuracyRingAlpha:(double)a3
{
  -[_MKPuckAnnotationView setAccuracyRingAlpha:](self->_mkUserLocationView, "setAccuracyRingAlpha:", a3);
}

- (void)_setPuckScale:(double)a3
{
  -[_MKPuckAnnotationView setPuckScale:](self->_mkUserLocationView, "setPuckScale:", a3);
}

- (id)_innerImageMask
{
  return -[_MKPuckAnnotationView innerImageMask](self->_mkUserLocationView, "innerImageMask");
}

- (void)_setInnerImageMask:(id)a3
{
  -[_MKPuckAnnotationView setInnerImageMask:](self->_mkUserLocationView, "setInnerImageMask:", a3);
}

- (BOOL)_rotateInnerImageToMatchCourse
{
  return -[_MKPuckAnnotationView rotateInnerImageToMatchCourse](self->_mkUserLocationView, "rotateInnerImageToMatchCourse");
}

- (void)_setRotateInnerImageToMatchCourse:(BOOL)a3
{
  -[_MKPuckAnnotationView setRotateInnerImageToMatchCourse:](self->_mkUserLocationView, "setRotateInnerImageToMatchCourse:", a3);
}

- (void)_setMKUserLocationView:(id)a3
{
  objc_storeStrong((id *)&self->_mkUserLocationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mkUserLocationView, 0);
}

@end

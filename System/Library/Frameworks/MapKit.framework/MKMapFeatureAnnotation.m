@implementation MKMapFeatureAnnotation

- (MKMapFeatureAnnotation)initWithVKLabelMarker:(id)a3 isHybridMap:(BOOL)a4
{
  id v7;
  MKMapFeatureAnnotation *v8;
  MKMapFeatureAnnotation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKMapFeatureAnnotation;
  v8 = -[MKMapFeatureAnnotation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_marker, a3);
    v9->_isHybridMap = a4;
    -[MKMapFeatureAnnotation _setProperties](v9, "_setProperties");
  }

  return v9;
}

- (CLLocationCoordinate2D)coordinate
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v8;
  CLLocationCoordinate2D result;

  -[VKLabelMarker coordinate](self->_marker, "coordinate");
  v4 = v3;
  -[VKLabelMarker coordinate](self->_marker, "coordinate");
  v8 = CLLocationCoordinate2DMake(v4, v5);
  longitude = v8.longitude;
  latitude = v8.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSString)title
{
  return (NSString *)-[VKLabelMarker text](self->_marker, "text");
}

- (NSString)subtitle
{
  return (NSString *)-[VKLabelMarker subtext](self->_marker, "subtext");
}

- (void)_setProperties
{
  int64_t v3;
  void *v4;
  NSString *v5;
  NSString *pointOfInterestCategory;
  MKIconStyle *v7;
  MKIconStyle *iconStyle;
  id v9;

  if (-[VKLabelMarker externalFeatureCategory](self->_marker, "externalFeatureCategory") == 3)
  {
    v3 = 2;
LABEL_5:
    self->_featureType = v3;
    return;
  }
  if (-[VKLabelMarker externalFeatureCategory](self->_marker, "externalFeatureCategory") == 2)
  {
    v3 = 1;
    goto LABEL_5;
  }
  if (-[VKLabelMarker externalFeatureCategory](self->_marker, "externalFeatureCategory") == 1)
  {
    -[VKLabelMarker styleAttributes](self->_marker, "styleAttributes");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    self->_featureType = 0;
    objc_msgSend(v9, "poiCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MKPointOfInterestCategoryForGEOPOICategory(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    pointOfInterestCategory = self->_pointOfInterestCategory;
    self->_pointOfInterestCategory = v5;

    v7 = -[MKIconStyle initWithStyleAttributes:isHybridMap:]([MKIconStyle alloc], "initWithStyleAttributes:isHybridMap:", v9, self->_isHybridMap);
    iconStyle = self->_iconStyle;
    self->_iconStyle = v7;

  }
}

- (MKMapFeatureType)featureType
{
  return self->_featureType;
}

- (MKIconStyle)iconStyle
{
  return self->_iconStyle;
}

- (MKPointOfInterestCategory)pointOfInterestCategory
{
  return self->_pointOfInterestCategory;
}

- (VKLabelMarker)marker
{
  return self->_marker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
  objc_storeStrong((id *)&self->_pointOfInterestCategory, 0);
  objc_storeStrong((id *)&self->_iconStyle, 0);
}

@end

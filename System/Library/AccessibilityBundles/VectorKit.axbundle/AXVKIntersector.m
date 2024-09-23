@implementation AXVKIntersector

- (AXVKIntersector)initWithFeatureWrapper:(id)a3 coordinates:(id)a4 isDeadEnd:(BOOL)a5
{
  double var1;
  double var0;
  id v10;
  AXVKIntersector *v11;
  AXVKIntersector *v12;
  objc_super v14;

  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXVKIntersector;
  v11 = -[AXVKIntersector init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_featureWrapper, a3);
    v12->_coordinates.latitude = var0;
    v12->_coordinates.longitude = var1;
    v12->_isDeadEnd = a5;
  }

  return v12;
}

- (AXVKIntersector)initWithFeature:(id)a3 coordinates:(id)a4 isDeadEnd:(BOOL)a5
{
  _BOOL8 v5;
  double var1;
  double var0;
  id v9;
  AXVKMultiSectionFeatureWrapper *v10;
  AXVKIntersector *v11;

  v5 = a5;
  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = -[AXVKMultiSectionFeatureWrapper initWithFeature:]([AXVKMultiSectionFeatureWrapper alloc], "initWithFeature:", v9);
  v11 = -[AXVKIntersector initWithFeatureWrapper:coordinates:isDeadEnd:](self, "initWithFeatureWrapper:coordinates:isDeadEnd:", v10, v5, var0, var1);

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXVKMultiSectionFeatureWrapper featureName](self->_featureWrapper, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p: %@ - (%f, %f)"), v4, self, v5, *(_QWORD *)&self->_coordinates.latitude, *(_QWORD *)&self->_coordinates.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AXVKIntersector *v4;
  AXVKIntersector *v5;
  void *v6;
  char IsSameRoad;
  double latitude;
  double v9;
  double v10;
  double longitude;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;

  v4 = (AXVKIntersector *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXVKIntersector featureWrapper](v5, "featureWrapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      IsSameRoad = GEOMultiSectionFeatureIsSameRoad();

      latitude = self->_coordinates.latitude;
      -[AXVKIntersector coordinates](v5, "coordinates");
      v10 = v9;
      longitude = self->_coordinates.longitude;
      -[AXVKIntersector coordinates](v5, "coordinates");
      v13 = vabdd_f64(longitude, v12);
      if (vabdd_f64(latitude, v10) < 0.001)
        v14 = IsSameRoad;
      else
        v14 = 0;
      v15 = v13 < 0.001 && v14;

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[GEOMultiSectionFeature feature](self->_featureWrapper->_feature, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AXVKFeatureLabelsAndShieldsHash(v3);

  return (unint64_t)(self->_coordinates.longitude
                          + (double)(53
                                   * (unint64_t)(self->_coordinates.latitude
                                                      + (double)(unint64_t)(53 * v4 + 2809))));
}

- (AXVKMultiSectionFeatureWrapper)featureWrapper
{
  return self->_featureWrapper;
}

- (void)setFeatureWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_featureWrapper, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinates.latitude;
  longitude = self->_coordinates.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinates:(id)a3
{
  self->_coordinates = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (BOOL)isDeadEnd
{
  return self->_isDeadEnd;
}

- (void)setIsDeadEnd:(BOOL)a3
{
  self->_isDeadEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureWrapper, 0);
}

@end

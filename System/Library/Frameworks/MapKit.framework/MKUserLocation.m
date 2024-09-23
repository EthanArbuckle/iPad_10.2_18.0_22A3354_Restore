@implementation MKUserLocation

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[MKAnnotationPrivate coordinate](self->_internal->_annotation, "coordinate");
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (id)annotation
{
  return self->_internal->_annotation;
}

- (void)setFixedLocation:(id)a3
{
  -[MKUserLocationInternal setFixedLocation:](self->_internal, "setFixedLocation:", a3);
}

- (void)setHeading:(id)a3
{
  -[MKUserLocationInternal setHeading:](self->_internal, "setHeading:", a3);
}

- (void)setExpectedHeadingUpdateInterval:(double)a3
{
  self->_expectedHeadingUpdateInterval = a3;
}

+ (id)keyPathsForValuesAffectingSubtitle
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("annotation.subtitle"));
}

- (void)setUpdating:(BOOL)a3
{
  -[MKUserLocationInternal setUpdating:](self->_internal, "setUpdating:", a3);
}

- (BOOL)isUpdating
{
  return -[MKUserLocationInternal isUpdating](self->_internal, "isUpdating");
}

- (MKUserLocation)init
{
  MKUserLocation *v2;
  MKUserLocationInternal *v3;
  MKUserLocationInternal *internal;
  objc_class *v5;
  MKAnnotationPrivate *v6;
  MKUserLocationInternal *v7;
  MKAnnotationPrivate *annotation;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKUserLocation;
  v2 = -[MKUserLocation init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MKUserLocationInternal);
    internal = v2->_internal;
    v2->_internal = v3;

    v5 = (objc_class *)sAnnotationClass;
    if (!sAnnotationClass)
      v5 = (objc_class *)objc_opt_class();
    v6 = (MKAnnotationPrivate *)objc_alloc_init(v5);
    v7 = v2->_internal;
    annotation = v7->_annotation;
    v7->_annotation = v6;

  }
  return v2;
}

- (void)setPredictedLocation:(id)a3
{
  -[MKUserLocationInternal setPredictedLocation:](self->_internal, "setPredictedLocation:", a3);
}

- (void)setLocation:(id)a3
{
  id v4;
  double v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 != v6)
    {
      -[MKAnnotationPrivate setLocation:](self->_internal->_annotation, "setLocation:", v6);
      -[MKUserLocation _updateCoordinate](self, "_updateCoordinate");
      objc_msgSend(v6, "course");
      self->_internal->course = v5;
    }
  }

}

- (void)setExpectedCoordinateUpdateInterval:(double)a3
{
  self->_expectedCoordinateUpdateInterval = a3;
}

- (double)expectedCoordinateUpdateInterval
{
  return self->_expectedCoordinateUpdateInterval;
}

- (void)_updateCoordinate
{
  void *v3;
  double v4;
  id v5;

  -[MKUserLocation location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
    objc_msgSend(v3, "coordinate");
  else
    v4 = -180.0;
  -[MKUserLocation setCoordinate:](self, "setCoordinate:", v4);

}

- (CLLocation)location
{
  CLLocation *fixedLocation;
  CLLocation *v3;

  fixedLocation = self->_internal->fixedLocation;
  if (fixedLocation)
  {
    v3 = fixedLocation;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
    v3 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MKAnnotationPrivate setCoordinate:](self->_internal->_annotation, "setCoordinate:", latitude, longitude);
}

- (CLHeading)heading
{
  return -[MKUserLocationInternal heading](self->_internal, "heading");
}

+ (id)title
{
  void *v2;
  uint64_t v3;
  void *v4;

  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isLocationServicesApproved")
    && (objc_msgSend(v2, "isAuthorizedForPreciseLocation") & 1) == 0)
  {
    MKLocalizedStringForApproximateLocation();
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MKLocalizedStringForCurrentLocation();
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

+ (void)_setAnnotationClass:(Class)a3
{
  if ((Class)sAnnotationClass != a3)
  {
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE00AC80))
      sAnnotationClass = (uint64_t)a3;
  }
}

- (void)dealloc
{
  MKUserLocationInternal *internal;
  MKAnnotationPrivate *annotation;
  objc_super v5;

  -[MKUserLocation setLocation:](self, "setLocation:", 0);
  -[MKUserLocation setFixedLocation:](self, "setFixedLocation:", 0);
  -[MKUserLocation setPredictedLocation:](self, "setPredictedLocation:", 0);
  -[MKUserLocation setHeading:](self, "setHeading:", 0);
  internal = self->_internal;
  annotation = internal->_annotation;
  internal->_annotation = 0;

  v5.receiver = self;
  v5.super_class = (Class)MKUserLocation;
  -[MKUserLocation dealloc](&v5, sel_dealloc);
}

- (CLLocation)fixedLocation
{
  return -[MKUserLocationInternal fixedLocation](self->_internal, "fixedLocation");
}

- (CLLocation)predictedLocation
{
  return -[MKUserLocationInternal predictedLocation](self->_internal, "predictedLocation");
}

- (double)timestamp
{
  double result;

  -[MKUserLocationInternal timestamp](self->_internal, "timestamp");
  return result;
}

- (void)setTimestamp:(double)a3
{
  -[MKUserLocationInternal setTimestamp:](self->_internal, "setTimestamp:", a3);
}

- (NSString)title
{
  void *v3;
  void *v4;

  -[MKUserLocationInternal title](self->_internal, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKUserLocationInternal setTitle:](self->_internal, "setTitle:", v4);

  }
  return -[MKUserLocationInternal title](self->_internal, "title");
}

- (void)setTitle:(NSString *)title
{
  -[MKUserLocationInternal setTitle:](self->_internal, "setTitle:", title);
}

- (double)course
{
  double result;

  -[MKUserLocationInternal course](self->_internal, "course");
  return result;
}

- (void)setCourse:(double)a3
{
  -[MKUserLocationInternal setCourse:](self->_internal, "setCourse:", a3);
}

- (NSString)subtitle
{
  void *v3;
  char v4;
  void *v5;
  NSString *v6;

  -[MKUserLocation annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MKUserLocation annotation](self, "annotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitle");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self->_internal->subtitle;
  }
  return v6;
}

- (void)setSubtitle:(NSString *)subtitle
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  MKUserLocationInternal *internal;
  NSString *v9;

  v9 = subtitle;
  -[MKUserLocation annotation](self, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKUserLocation annotation](self, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitle:", v9);
  }
  else
  {
    v7 = -[NSString copy](v9, "copy");
    internal = self->_internal;
    v6 = internal->subtitle;
    internal->subtitle = (NSString *)v7;
  }

}

- (double)accuracy
{
  void *v3;
  double v4;
  double v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return -1.0;
  -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "horizontalAccuracy");
  v5 = v4;

  return v5;
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    if (objc_msgSend(v5, "_navigation_isEqualToLocationCoordinate:"))
    {
      -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "horizontalAccuracy");
      v8 = v7;
      objc_msgSend(v4, "horizontalAccuracy");
      if (vabdd_f64(v8, v9) >= 0.001)
      {
        v14 = 0;
      }
      else
      {
        -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "type");
        if (v11 == objc_msgSend(v4, "type"))
        {
          -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "_navigation_isStale");
          if (v13 == objc_msgSend(v4, "_navigation_isStale"))
          {
            -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "_navigation_hasValidCourse");
            if (v16 == objc_msgSend(v4, "_navigation_hasValidCourse"))
            {
              -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_opt_class();
              if (v18 == objc_opt_class())
              {
                -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "_navigation_routeMatch");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "_navigation_routeMatch");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = v20 == v21;

              }
              else
              {
                v14 = 0;
              }

            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)hasValidHeading
{
  CLHeading *heading;
  double v3;

  heading = self->_internal->heading;
  if (heading)
  {
    -[CLHeading headingAccuracy](heading, "headingAccuracy");
    LOBYTE(heading) = v3 >= 0.0;
  }
  return (char)heading;
}

- (double)headingDegrees
{
  double result;

  -[CLHeading heading](self->_internal->heading, "heading");
  return result;
}

- (NSString)shortDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MKUserLocationInternal *internal;
  CLLocation *fixedLocation;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CLLocation *predictedLocation;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CLHeading *heading;
  void *v21;
  objc_super v23;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v23.receiver = self;
  v23.super_class = (Class)MKUserLocation;
  -[MKUserLocation description](&v23, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MKAnnotationPrivate location](self->_internal->_annotation, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "coordinate");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v10);

    }
  }
  internal = self->_internal;
  fixedLocation = internal->fixedLocation;
  if (fixedLocation)
  {
    -[CLLocation coordinate](fixedLocation, "coordinate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" fixed:%@"), v15);

    internal = self->_internal;
  }
  predictedLocation = internal->predictedLocation;
  if (predictedLocation)
  {
    -[CLLocation coordinate](predictedLocation, "coordinate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" predicted:%@"), v19);

    internal = self->_internal;
  }
  heading = internal->heading;
  if (heading)
  {
    -[CLHeading compactDescription](heading, "compactDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" heading:%@"), v21);

  }
  return (NSString *)v5;
}

- (void)reset
{
  -[MKUserLocation setLocation:](self, "setLocation:", 0);
  -[MKUserLocation setFixedLocation:](self, "setFixedLocation:", 0);
  -[MKUserLocation setPredictedLocation:](self, "setPredictedLocation:", 0);
  -[MKUserLocation setHeading:](self, "setHeading:", 0);
}

- (double)expectedHeadingUpdateInterval
{
  return self->_expectedHeadingUpdateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end

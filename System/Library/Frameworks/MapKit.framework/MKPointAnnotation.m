@implementation MKPointAnnotation

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  MKPointAnnotation *v7;
  void *v8;
  uint64_t v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  MKPointAnnotation *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;
  CLLocationCoordinate2D v20;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[16];

  v6 = a3;
  v7 = -[MKPointAnnotation init](self, "init");
  if (!v7)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _geoJSONGeometryType((uint64_t)v8);

    if (v9 == 1)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("coordinates"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((unint64_t)objc_msgSend(v10, "count") > 1)
        {
          if ((unint64_t)objc_msgSend(v10, "count") >= 4)
          {
            MKGetMKGeoJSONSerializationLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_INFO, "GeoJSON positions SHOULD NOT extend positions beyond three elements", buf, 2u);
            }

          }
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v16, "doubleValue");
            v18 = v17;
            objc_msgSend(v15, "doubleValue");
            v20 = CLLocationCoordinate2DMake(v18, v19);
            if (v20.longitude >= -180.0 && v20.longitude <= 180.0 && v20.latitude >= -90.0 && v20.latitude <= 90.0)
            {

              -[MKPointAnnotation setCoordinate:](v7, "setCoordinate:", v20.latitude, v20.longitude);
              v13 = v7;
LABEL_32:

              goto LABEL_33;
            }
            if (a4)
            {
              v22 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&v20.latitude, *(_QWORD *)&v20.longitude);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringWithFormat:", CFSTR("Invalid coordinate position: %@"), v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              _errorWithReason(v24);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          else if (a4)
          {
            _errorWithReason(CFSTR("GeoJSON positions must be an array of numbers"));
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else if (a4)
        {
          v11 = CFSTR("GeoJSON positions must have at least two values");
LABEL_16:
          _errorWithReason(v11);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a4)
      {
        v11 = CFSTR("coordinate value is not an array");
        goto LABEL_16;
      }

      v13 = 0;
      goto LABEL_32;
    }
    if (a4)
    {
      v12 = CFSTR("Input is not a Point GeoJSON object");
      goto LABEL_12;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_33;
  }
  if (!a4)
    goto LABEL_13;
  v12 = CFSTR("Point object must be a dictionary");
LABEL_12:
  _errorWithReason(v12);
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v13;
}

- (MKPointAnnotation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPointAnnotation;
  return -[MKPointAnnotation init](&v3, sel_init);
}

- (MKPointAnnotation)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude;
  double latitude;
  MKPointAnnotation *v5;
  MKPointAnnotation *v6;
  MKPointAnnotation *v7;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v5 = -[MKPointAnnotation init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[MKPointAnnotation setCoordinate:](v5, "setCoordinate:", latitude, longitude);
    v7 = v6;
  }

  return v6;
}

- (MKPointAnnotation)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle
{
  double longitude;
  double latitude;
  NSString *v9;
  NSString *v10;
  MKPointAnnotation *v11;
  MKPointAnnotation *v12;
  MKPointAnnotation *v13;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v9 = title;
  v10 = subtitle;
  v11 = -[MKPointAnnotation init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[MKPointAnnotation setCoordinate:](v11, "setCoordinate:", latitude, longitude);
    -[MKShape setTitle:](v12, "setTitle:", v9);
    -[MKShape setSubtitle:](v12, "setSubtitle:", v10);
    v13 = v12;
  }

  return v12;
}

- (id)feature
{
  VKCustomFeature *customFeature;
  VKCustomFeature *v4;
  VKCustomFeature *v5;
  void *v6;
  uint64_t v7;
  VKCustomFeature *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  VKCustomFeature *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  customFeature = self->_customFeature;
  if (!customFeature)
  {
    if (!self->_representation)
      return 0;
    v4 = (VKCustomFeature *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D8]), "initWithCoordinate:", self->_coordinate.latitude, self->_coordinate.longitude);
    v5 = self->_customFeature;
    self->_customFeature = v4;

    -[MKShape title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v8 = self->_customFeature;
    if (v7)
    {
      -[MKShape title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCustomFeature setText:locale:](v8, "setText:locale:", v9, 0);

    }
    else
    {
      -[VKCustomFeature setText:locale:](self->_customFeature, "setText:locale:", CFSTR(" "), 0);
    }
    -[MKShape subtitle](self, "subtitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      v13 = self->_customFeature;
      -[MKShape subtitle](self, "subtitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCustomFeature setAnnotationText:locale:](v13, "setAnnotationText:locale:", v14, 0);

    }
    objc_msgSend(MEMORY[0x1E0D270A8], "genericMarkerStyleAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (self->_representation == 2)
    {
      v17 = 0x100010022;
      objc_msgSend(v15, "replaceAttributes:count:", &v17, 1);
    }
    -[VKCustomFeature setStyleAttributes:](self->_customFeature, "setStyleAttributes:", v16);

    customFeature = self->_customFeature;
  }
  return customFeature;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldRepresentSelf
{
  return self->_representation != 0;
}

- (id)viewRepresentation
{
  return 0;
}

- (id)reuseIdentifier
{
  return 0;
}

- (BOOL)isPersistent
{
  return 0;
}

- (BOOL)_isPendingSelectionAnimated
{
  return 1;
}

- (BOOL)_shouldDeselectWhenDragged
{
  return 1;
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

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
  self->_coordinate = coordinate;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int64_t)representation
{
  return self->_representation;
}

- (void)setRepresentation:(int64_t)a3
{
  self->_representation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_customFeature, 0);
}

@end

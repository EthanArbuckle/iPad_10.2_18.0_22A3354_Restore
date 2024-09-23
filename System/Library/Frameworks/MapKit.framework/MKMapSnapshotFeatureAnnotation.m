@implementation MKMapSnapshotFeatureAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapSnapshotFeatureAnnotation)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  MKMapSnapshotFeatureAnnotation *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("coordinate.latitude"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("coordinate.longitude"));
  v8 = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("representation"));

  v11 = -[MKMapSnapshotFeatureAnnotation initWithCoordinate:title:representation:](self, "initWithCoordinate:title:representation:", v9, v10, v6, v8);
  return v11;
}

- (MKMapSnapshotFeatureAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4 representation:(int64_t)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v9;
  MKMapSnapshotFeatureAnnotation *v10;
  MKMapSnapshotFeatureAnnotation *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  VKCustomFeature *customFeature;
  void *v16;
  void *v17;
  uint64_t v19;
  objc_super v20;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MKMapSnapshotFeatureAnnotation;
  v10 = -[MKMapSnapshotFeatureAnnotation init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_representation = a5;
    v10->_coordinate.latitude = latitude;
    v10->_coordinate.longitude = longitude;
    v12 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D8]), "initWithCoordinate:", v11->_coordinate.latitude, v11->_coordinate.longitude);
    customFeature = v11->_customFeature;
    v11->_customFeature = (VKCustomFeature *)v14;

    -[VKCustomFeature setSortKey:](v11->_customFeature, "setSortKey:", 0);
    if (objc_msgSend(v9, "length"))
      -[VKCustomFeature setText:locale:](v11->_customFeature, "setText:locale:", v9, 0);
    objc_msgSend(MEMORY[0x1E0D270A8], "annotationViewProvidedCustomFeatureStyleAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a5 == 2)
    {
      v19 = 0x100010022;
      objc_msgSend(v16, "replaceAttributes:count:", &v19, 1);
    }
    -[VKCustomFeature setStyleAttributes:](v11->_customFeature, "setStyleAttributes:", v17);

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude;
  id v5;

  latitude = self->_coordinate.latitude;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("coordinate.latitude"), latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("coordinate.longitude"), self->_coordinate.longitude);
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_representation, CFSTR("representation"));

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)feature
{
  return self->_customFeature;
}

- (int64_t)representation
{
  return self->_representation;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MKMapSnapshotFeatureAnnotation;
  -[MKMapSnapshotFeatureAnnotation description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_representation == 1)
    v7 = CFSTR("Generic");
  else
    v7 = CFSTR("Search");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ coordinate:%@ title:'%@' representation:%@"), v4, v5, self->_title, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFeature, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

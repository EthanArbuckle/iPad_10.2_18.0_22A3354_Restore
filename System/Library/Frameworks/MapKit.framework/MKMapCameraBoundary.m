@implementation MKMapCameraBoundary

- (MKMapCameraBoundary)initWithMapRect:(MKMapRect)mapRect
{
  double height;
  double width;
  double y;
  double x;
  MKMapCameraBoundary *v7;
  MKMapCameraBoundary *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  id v19;
  VKCameraRegionRestriction *vkRestriction;
  uint64_t v21;
  VKCameraRegionRestriction *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MKMapCameraBoundary *v27;
  uint64_t v28;
  objc_super v30;

  height = mapRect.size.height;
  width = mapRect.size.width;
  y = mapRect.origin.y;
  x = mapRect.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)MKMapCameraBoundary;
  v7 = -[MKMapCameraBoundary init](&v30, sel_init);
  v8 = v7;
  if (!v7)
  {
LABEL_19:
    v27 = v8;
    goto LABEL_20;
  }
  if (-[MKMapCameraBoundary isValidMapRect:](v7, "isValidMapRect:", x, y, width, height))
  {
    -[MKMapCameraBoundary _clampedMapRectForMapRect:](v8, "_clampedMapRectForMapRect:", x, y, width, height);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    v8->_mapRect.origin.x = v9;
    v8->_mapRect.origin.y = v10;
    v8->_mapRect.size.width = v11;
    v8->_mapRect.size.height = v12;
    if (v9 == 0.0
      && (v10 == 0.0 ? (v17 = v11 == 268435456.0) : (v17 = 0), v17 ? (v18 = v12 == 268435456.0) : (v18 = 0), v18))
    {
      v8->_region.center = (CLLocationCoordinate2D)MKCoordinateRegionWorld;
      v8->_region.span = ($2AEA816EAF9616B0E64737FB4BB06332)unk_18B2AFA00;
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC64C8]), "initWithMapRegion:", 0);
      vkRestriction = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v28;
    }
    else
    {
      v8->_region = ($81FBFA6FC28C00D72B6EC59C78D6FC53)MKCoordinateRegionForMapRect(*(MKMapRect *)&v9);
      if (v15 == 0.0)
        v15 = 0.00000001;
      if (v16 == 0.0)
        v16 = 0.00000001;
      v19 = objc_alloc(MEMORY[0x1E0DC64C8]);
      vkRestriction = (VKCameraRegionRestriction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithMapRect:", v13, v14, v15, v16);
      v21 = objc_msgSend(v19, "initWithMapRegion:", vkRestriction);
      v22 = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v21;

    }
    goto LABEL_19;
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&x, *(_QWORD *)&y);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&width, *(_QWORD *)&height);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("{%@, %@}"), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Invalid MKMapRect provided to MKMapCameraBoundary initializer: %@"), v26);
  v27 = 0;
LABEL_20:

  return v27;
}

- (BOOL)isValidMapRect:(id)a3
{
  BOOL v3;
  BOOL result;

  v3 = a3.var0.var0 == INFINITY && a3.var0.var1 == INFINITY;
  result = 1;
  if (v3 && a3.var1.var1 == 0.0 && a3.var1.var0 == 0.0)
    return 0;
  return result;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_clampedMapRectForMapRect:(id)result
{
  double v3;
  double v4;
  double v5;

  v3 = result.var0.var1 + result.var1.var1;
  if (result.var0.var1 + result.var1.var1 > 268435456.0)
    result.var1.var1 = 268435456.0 - result.var0.var1;
  if (result.var0.var1 < 0.0)
  {
    result.var1.var1 = v3;
    result.var0.var1 = 0.0;
  }
  if (result.var1.var1 < 0.0)
    result.var1.var1 = 0.0;
  v4 = fmin(result.var1.var1, 268435456.0);
  if (result.var1.var0 < 0.0)
    result.var1.var0 = 0.0;
  v5 = fmin(result.var1.var0, 268435456.0);
  if (v5 == 268435456.0)
    result.var0.var0 = 0.0;
  result.var1.var1 = v4;
  result.var1.var0 = v5;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapCameraBoundary)init
{
  return -[MKMapCameraBoundary initWithMapRect:](self, "initWithMapRect:", 0.0, 0.0, 268435456.0, 268435456.0);
}

- (MKMapCameraBoundary)initWithCoordinateRegion:(MKCoordinateRegion)region
{
  double longitudeDelta;
  double latitudeDelta;
  double longitude;
  double latitude;
  MKMapCameraBoundary *v7;
  MKMapCameraBoundary *v8;
  double v9;
  CLLocationDegrees v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  VKCameraRegionRestriction *v18;
  void *v19;
  void *v20;
  void *v21;
  MKMapCameraBoundary *v22;
  uint64_t v23;
  VKCameraRegionRestriction *vkRestriction;
  objc_super v26;

  longitudeDelta = region.span.longitudeDelta;
  latitudeDelta = region.span.latitudeDelta;
  longitude = region.center.longitude;
  latitude = region.center.latitude;
  v26.receiver = self;
  v26.super_class = (Class)MKMapCameraBoundary;
  v7 = -[MKMapCameraBoundary init](&v26, sel_init);
  v8 = v7;
  if (!v7)
  {
LABEL_8:
    v22 = v8;
    goto LABEL_9;
  }
  if (-[MKMapCameraBoundary isValidCoordinateRegion:](v7, "isValidCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta))
  {
    -[MKMapCameraBoundary _clampedCoordinateRegionForCoordinateRegion:](v8, "_clampedCoordinateRegionForCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
    v8->_region.center.latitude = v9;
    v8->_region.center.longitude = v10;
    v8->_region.span.latitudeDelta = v11;
    v8->_region.span.longitudeDelta = v12;
    if (v9 == 0.0)
    {
      v8->_mapRect = ($8D326A409DE759287A73E3EC6ECA4C4F)MKMapRectWorld;
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC64C8]), "initWithMapRegion:", 0);
      vkRestriction = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v23;
    }
    else
    {
      GEOMapRectForCoordinateRegion();
      v8->_mapRect.origin.x = v13;
      v8->_mapRect.origin.y = v14;
      v8->_mapRect.size.width = v15;
      v8->_mapRect.size.height = v16;
      vkRestriction = (VKCameraRegionRestriction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithCoordinateRegion:", v8->_region.center.longitude, v8->_region.center.latitude, v8->_region.span.latitudeDelta, v8->_region.span.longitudeDelta);
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC64C8]), "initWithMapRegion:", vkRestriction);
      v18 = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v17;

    }
    goto LABEL_8;
  }
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v20, *(_QWORD *)&latitudeDelta, *(_QWORD *)&longitudeDelta);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Invalid MKCoordinateRegion provided to MKMapCameraBoundary initializer: %@"), v21);
  v22 = 0;
LABEL_9:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMapRect:", self->_mapRect.origin.x, self->_mapRect.origin.y, self->_mapRect.size.width, self->_mapRect.size.height);
}

- (BOOL)isValidCoordinateRegion:(id *)a3
{
  double v3;
  double v4;
  BOOL result;

  result = 0;
  if (v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0)
    return v3 <= 90.0;
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)_clampedCoordinateRegionForCoordinateRegion:(SEL)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[MKMapCameraBoundary isEqualToMapCameraBoundary:](self, "isEqualToMapCameraBoundary:", v4);

  return v5;
}

- (BOOL)isEqualToMapCameraBoundary:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "mapRect");
  if (self->_mapRect.origin.x != v7 || self->_mapRect.origin.y != v4)
    return 0;
  if (self->_mapRect.size.height == v6)
    return self->_mapRect.size.width == v5;
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  VKCameraRegionRestriction *vkRestriction;
  id v6;

  v4 = a3;
  vkRestriction = self->_vkRestriction;
  v6 = v4;
  if (vkRestriction)
  {
    objc_msgSend(v4, "encodeObject:forKey:", vkRestriction, CFSTR("MKMapCameraBoundaryVKRestriction"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryRegionLatitude"), self->_region.center.latitude);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryRegionLongitude"), self->_region.center.longitude);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryRegionLatitudeSpan"), self->_region.span.latitudeDelta);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryRegionLongitudeSpan"), self->_region.span.longitudeDelta);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryMapRectX"), self->_mapRect.origin.x);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryMapRectY"), self->_mapRect.origin.y);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryMapRectWidth"), self->_mapRect.size.width);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MKMapCameraBoundaryMapRectHeight"), self->_mapRect.size.height);

}

- (MKMapCameraBoundary)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  MKMapCameraBoundary *v5;
  uint64_t v6;
  VKCameraRegionRestriction *vkRestriction;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  CLLocationCoordinate2D v18;
  double v19;
  double v20;
  double v21;
  MKMapCameraBoundary *v22;
  objc_super v24;

  v4 = coder;
  v24.receiver = self;
  v24.super_class = (Class)MKMapCameraBoundary;
  v5 = -[MKMapCameraBoundary init](&v24, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMapCameraBoundaryVKRestriction"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v22 = 0;
      goto LABEL_6;
    }
    vkRestriction = v5->_vkRestriction;
    v5->_vkRestriction = (VKCameraRegionRestriction *)v6;

    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryMapRectX"));
    v9 = v8;
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryMapRectY"));
    v11 = v10;
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryMapRectWidth"));
    v13 = v12;
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryMapRectHeight"));
    v5->_mapRect.origin.x = v9;
    v5->_mapRect.origin.y = v11;
    v5->_mapRect.size.width = v13;
    v5->_mapRect.size.height = v14;
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryRegionLatitude"));
    v16 = v15;
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryRegionLongitude"));
    v18 = CLLocationCoordinate2DMake(v16, v17);
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryRegionLatitudeSpan"));
    v20 = v19;
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("MKMapCameraBoundaryRegionLongitudeSpan"));
    v5->_region.center = v18;
    v5->_region.span.latitudeDelta = v20;
    v5->_region.span.longitudeDelta = v21;
  }
  v22 = v5;
LABEL_6:

  return v22;
}

- (BOOL)_isEmpty
{
  VKCameraRegionRestriction *vkRestriction;

  vkRestriction = self->_vkRestriction;
  if (vkRestriction)
    return -[VKCameraRegionRestriction isEmpty](vkRestriction, "isEmpty");
  else
    return 1;
}

- (id)_vkRegionRestriction
{
  return self->_vkRestriction;
}

- (BOOL)_containsCoordinate:(CLLocationCoordinate2D)a3
{
  return -[VKCameraRegionRestriction containsCoordinate:](self->_vkRestriction, "containsCoordinate:", a3.latitude, a3.longitude);
}

- (CLLocationCoordinate2D)_clampedCoordinateForCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v7;
  CLLocationCoordinate2D result;

  -[VKCameraRegionRestriction clampedCoordinate:](self->_vkRestriction, "clampedCoordinate:", a3.latitude, a3.longitude);
  v7 = CLLocationCoordinate2DMake(v3, v4);
  longitude = v7.longitude;
  latitude = v7.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (MKMapRect)mapRect
{
  double x;
  double y;
  double width;
  double height;
  MKMapRect result;

  x = self->_mapRect.origin.x;
  y = self->_mapRect.origin.y;
  width = self->_mapRect.size.width;
  height = self->_mapRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (MKCoordinateRegion)region
{
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  MKCoordinateRegion result;

  latitude = self->_region.center.latitude;
  longitude = self->_region.center.longitude;
  latitudeDelta = self->_region.span.latitudeDelta;
  longitudeDelta = self->_region.span.longitudeDelta;
  result.span.longitudeDelta = longitudeDelta;
  result.span.latitudeDelta = latitudeDelta;
  result.center.longitude = longitude;
  result.center.latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vkRestriction, 0);
}

@end

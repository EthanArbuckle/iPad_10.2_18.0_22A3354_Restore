@implementation MKMapCameraZoomRange

- (MKMapCameraZoomRange)init
{
  return -[MKMapCameraZoomRange initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:](self, "initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:", -1.0, -1.0);
}

- (MKMapCameraZoomRange)initWithMinCenterCoordinateDistance:(CLLocationDistance)minDistance maxCenterCoordinateDistance:(CLLocationDistance)maxDistance
{
  MKMapCameraZoomRange *v6;
  MKMapCameraZoomRange *v7;
  BOOL v8;
  BOOL v9;
  MKMapCameraZoomRange *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MKMapCameraZoomRange;
  v6 = -[MKMapCameraZoomRange init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    if (minDistance < 0.0 && fabs(minDistance + 1.0) >= 0.000001
      || (fabs(maxDistance + 1.0) >= 0.000001 ? (v8 = maxDistance < 0.0) : (v8 = 0),
          minDistance > maxDistance ? (v9 = maxDistance == -1.0) : (v9 = 1),
          !v9 || v8))
    {
      NSLog(CFSTR("Unable to create zoom range satisfying min distance %f and max distance %f."), *(_QWORD *)&minDistance, *(_QWORD *)&maxDistance);
      v10 = 0;
      goto LABEL_16;
    }
    v6->_minCenterCoordinateDistance = minDistance;
    v6->_maxCenterCoordinateDistance = maxDistance;
    v6->_bouncesZoom = 0;
  }
  v10 = v6;
LABEL_16:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapCameraZoomRange)initWithMinCenterCoordinateDistance:(CLLocationDistance)minDistance
{
  return -[MKMapCameraZoomRange initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:](self, "initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:", minDistance, -1.0);
}

- (MKMapCameraZoomRange)initWithMaxCenterCoordinateDistance:(CLLocationDistance)maxDistance
{
  return -[MKMapCameraZoomRange initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:](self, "initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:", -1.0, maxDistance);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  void *v5;
  _BYTE *v6;

  v4 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:", self->_minCenterCoordinateDistance, self->_maxCenterCoordinateDistance);
  v5 = v4;
  if (v4)
  {
    v4[8] = self->_bouncesZoom;
    v6 = v4;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[MKMapCameraZoomRange isEqualToMapCameraZoomRange:](self, "isEqualToMapCameraZoomRange:", v4)
    && v4[8] == self->_bouncesZoom;

  return v5;
}

- (BOOL)isEqualToMapCameraZoomRange:(id)a3
{
  id v4;
  double minCenterCoordinateDistance;
  double v6;
  double maxCenterCoordinateDistance;
  double v8;
  int bouncesZoom;
  BOOL v10;

  v4 = a3;
  minCenterCoordinateDistance = self->_minCenterCoordinateDistance;
  objc_msgSend(v4, "minCenterCoordinateDistance");
  if (minCenterCoordinateDistance == v6
    && (maxCenterCoordinateDistance = self->_maxCenterCoordinateDistance,
        objc_msgSend(v4, "maxCenterCoordinateDistance"),
        maxCenterCoordinateDistance == v8))
  {
    bouncesZoom = self->_bouncesZoom;
    v10 = bouncesZoom == objc_msgSend(v4, "_bouncesZoom");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MKMapCameraZoomRangeMinDistance"), self->_minCenterCoordinateDistance);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MKMapCameraZoomRangeMaxDistance"), self->_maxCenterCoordinateDistance);
  if (self->_bouncesZoom)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("MKMapCameraZoomRangeBouncesZoom"));

}

- (MKMapCameraZoomRange)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  MKMapCameraZoomRange *v10;
  MKMapCameraZoomRange *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MKMapCameraZoomRangeMinDistance"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MKMapCameraZoomRangeMaxDistance"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MKMapCameraZoomRangeBouncesZoom"));

  v10 = -[MKMapCameraZoomRange initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:](self, "initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:", v6, v8);
  v11 = v10;
  if (v9)
    -[MKMapCameraZoomRange _setBouncesZoom:](v10, "_setBouncesZoom:", 1);

  return v11;
}

- (CLLocationDistance)minCenterCoordinateDistance
{
  return self->_minCenterCoordinateDistance;
}

- (CLLocationDistance)maxCenterCoordinateDistance
{
  return self->_maxCenterCoordinateDistance;
}

- (BOOL)_bouncesZoom
{
  return self->_bouncesZoom;
}

- (void)_setBouncesZoom:(BOOL)a3
{
  self->_bouncesZoom = a3;
}

@end

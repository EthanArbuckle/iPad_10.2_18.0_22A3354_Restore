@implementation ARGeoAnchor

- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude;
  double latitude;
  ARGeoAnchor *v5;
  ARGeoAnchor *v6;
  objc_super v8;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v8.receiver = self;
  v8.super_class = (Class)ARGeoAnchor;
  v5 = -[ARAnchor initWithTransform:](&v8, sel_initWithTransform_, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  v6 = v5;
  if (v5)
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v5, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 0, 0, latitude, longitude, 0.0, 0.0);
  return v6;
}

- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude
{
  double longitude;
  double latitude;
  ARGeoAnchor *v7;
  ARGeoAnchor *v8;
  objc_super v10;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v10.receiver = self;
  v10.super_class = (Class)ARGeoAnchor;
  v7 = -[ARAnchor initWithTransform:](&v10, sel_initWithTransform_, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  v8 = v7;
  if (v7)
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v7, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 3, 0, latitude, longitude, altitude, 0.0);
  return v8;
}

- (ARGeoAnchor)initWithName:(NSString *)name coordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude;
  double latitude;
  ARGeoAnchor *v6;
  ARGeoAnchor *v7;
  objc_super v9;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v9.receiver = self;
  v9.super_class = (Class)ARGeoAnchor;
  v6 = -[ARAnchor initWithName:transform:](&v9, sel_initWithName_transform_, name, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  v7 = v6;
  if (v6)
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v6, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 0, 0, latitude, longitude, 0.0, 0.0);
  return v7;
}

- (ARGeoAnchor)initWithName:(NSString *)name coordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude
{
  double longitude;
  double latitude;
  ARGeoAnchor *v8;
  ARGeoAnchor *v9;
  objc_super v11;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v11.receiver = self;
  v11.super_class = (Class)ARGeoAnchor;
  v8 = -[ARAnchor initWithName:transform:](&v11, sel_initWithName_transform_, name, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  v9 = v8;
  if (v8)
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v8, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 3, 0, latitude, longitude, altitude, 0.0);
  return v9;
}

- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 altitudeSource:(int64_t)a5 isAltitudeAvailable:(BOOL)a6 undulation:(double)a7
{
  CLLocationDegrees v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  ARGeoAnchor *v18;
  ARGeoAnchor *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CLLocationDegrees latitude;
  __int128 v26;
  CLLocationDegrees longitude;
  __int128 v28;
  __int128 v29;
  _OWORD v30[4];
  _OWORD v31[2];
  _BYTE buf[32];
  _BYTE v33[32];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  self->_altitudeSource = a5;
  self->_isAltitudeAvailable = a6;
  self->_undulation = a7;
  self->_coordinate = a3;
  latitude = a3.latitude;
  longitude = a3.longitude;
  v10 = a3.longitude;
  *(CLLocationCoordinate2D *)self->_locationLLA = a3;
  *(_OWORD *)&self->_locationLLA[16] = *(_OWORD *)&a4;
  if (_ARLogTechnique_onceToken_11 != -1)
    dispatch_once(&_ARLogTechnique_onceToken_11, &__block_literal_global_65);
  v11 = (void *)_ARLogTechnique_logObj_11;
  if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2049;
    *(CLLocationDegrees *)&buf[24] = latitude;
    *(_WORD *)v33 = 2049;
    *(CLLocationDegrees *)&v33[2] = longitude;
    *(_WORD *)&v33[10] = 2048;
    *(_QWORD *)&v33[12] = a5;
    _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: GeoAnchor<- %{private}.8f,%{private}.8f,%li", buf, 0x34u);

  }
  v26 = *(_OWORD *)self->_locationLLA;
  v28 = *(_OWORD *)&self->_locationLLA[16];
  v15 = ARMSLToWGS84Altitude(a4, a7);
  *((_QWORD *)&v16 + 1) = *((_QWORD *)&v28 + 1);
  *(double *)&v16 = v15;
  v29 = v16;
  v30[2] = v26;
  v30[3] = v16;
  ARLLAToECEF(v31);
  v17 = v31[1];
  *(_OWORD *)self->_locationECEF = v31[0];
  *(_OWORD *)&self->_locationECEF[16] = v17;
  v18 = self + 1;
  v30[0] = v26;
  v30[1] = v29;
  ARAnchorToECEFTransform(v30, buf);
  v20 = v35;
  *(_OWORD *)&v18->super._anon_30[16] = v34;
  *(_OWORD *)&v18->super._anon_30[32] = v20;
  v21 = v37;
  *(_OWORD *)&v18->super._anon_30[48] = v36;
  *(_OWORD *)v18->_anon_70 = v21;
  v22 = *(_OWORD *)&buf[16];
  *(_OWORD *)&v18->super.super.isa = *(_OWORD *)buf;
  *(_OWORD *)&v18->super._identifier = v22;
  v23 = *(_OWORD *)&v33[16];
  *(_OWORD *)&v18->super._sessionIdentifier = *(_OWORD *)v33;
  *(_OWORD *)v18->super._anon_30 = v23;
  return result;
}

- (CLLocationDistance)altitude
{
  return *(double *)&self->_locationLLA[16];
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  uint64_t v8;
  uint64_t v9;
  ARAltitudeSource v10;
  const __CFString *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ARGeoAnchor;
  -[ARAnchor description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)MEMORY[0x1E0CB3940];
  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  -[ARGeoAnchor altitude](self, "altitude");
  v9 = v8;
  v10 = -[ARGeoAnchor altitudeSource](self, "altitudeSource");
  if ((unint64_t)v10 > ARAltitudeSourceUserDefined)
    v11 = CFSTR("???");
  else
    v11 = off_1E6674708[v10];
  v12 = -[ARGeoAnchor isAltitudeAvailable](self, "isAltitudeAvailable");
  -[ARGeoAnchor undulation](self, "undulation");
  objc_msgSend(v5, "stringWithFormat:", CFSTR(" coordinate=(%f,%f,%f) altitudeSource=%@ isAltitudeAvailable=%d undulation=%f>"), *(_QWORD *)&latitude, *(_QWORD *)&longitude, v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4 - 1, 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (ARGeoAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARGeoAnchor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARGeoAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v16, sel_initWithAnchor_, v4);
  if (v5)
  {
    objc_msgSend(v4, "coordinate");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v4, "altitude");
    v11 = v10;
    v12 = objc_msgSend(v4, "altitudeSource");
    v13 = objc_msgSend(v4, "isAltitudeAvailable");
    objc_msgSend(v4, "undulation");
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v5, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", v12, v13, v7, v9, v11, v14);
    -[ARGeoAnchor setIsTracked:](v5, "setIsTracked:", objc_msgSend(v4, "isTracked"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARGeoAnchor;
  v4 = a3;
  -[ARAnchor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("latitude"), self->_coordinate.latitude, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("longitude"), self->_coordinate.longitude);
  -[ARGeoAnchor altitude](self, "altitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("altitude"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_altitudeSource, CFSTR("altitudeSource"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isAltitudeAvailable, CFSTR("isAltitudeAvailable"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("undulation"), self->_undulation);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTracked, CFSTR("tracked"));

}

- (ARGeoAnchor)initWithCoder:(id)a3
{
  id v4;
  ARGeoAnchor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARGeoAnchor;
  v5 = -[ARAnchor initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
    v11 = v10;
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("altitudeSource"));
    v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAltitudeAvailable"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("undulation"));
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v5, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", v12, v13, v7, v9, v11, v14);
    v5->_isTracked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tracked"));
  }

  return v5;
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

- (ARAltitudeSource)altitudeSource
{
  return self->_altitudeSource;
}

- (BOOL)isAltitudeAvailable
{
  return self->_isAltitudeAvailable;
}

- (BOOL)isAltitudeLookupInProgress
{
  return self->_isAltitudeLookupInProgress;
}

- (void)setIsAltitudeLookupInProgress:(BOOL)a3
{
  self->_isAltitudeLookupInProgress = a3;
}

- (double)undulation
{
  return self->_undulation;
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (__n128)locationLLA
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 224);
  v3 = *(_OWORD *)(a1 + 240);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)locationECEF
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 256);
  v3 = *(_OWORD *)(a1 + 272);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)ecefFromAnchor
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 368);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 352);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 400);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 384);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 304);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 320);
  v6 = *(_OWORD *)(a1 + 336);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

@end

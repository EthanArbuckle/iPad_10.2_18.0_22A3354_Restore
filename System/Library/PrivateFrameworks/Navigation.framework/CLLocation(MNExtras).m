@implementation CLLocation(MNExtras)

- (void)_navigation_setGtLog:()MNExtras
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_navigation_gtLogKey, v2, (void *)1);

}

- (uint64_t)_navigation_gtLog
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, &_navigation_gtLogKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (double)_navigation_speedAccuracy
{
  double v2;

  objc_msgSend(a1, "clientLocation");
  return v2;
}

- (uint64_t)_navigation_hasMatch
{
  return 0;
}

- (uint64_t)_navigation_isStale
{
  return 0;
}

- (uint64_t)_navigation_routeMatch
{
  return 0;
}

+ (const)_navigation_stringWithType:()MNExtras
{
  if ((a3 - 1) > 0xC)
    return CFSTR("Unknown");
  else
    return off_1E61D7010[a3 - 1];
}

- (uint64_t)initWithCoordinate:()MNExtras rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:
{
  return objc_msgSend(a1, "initWithCoordinate:rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:serializedCoarseMetaData:", a3, a4, 0);
}

- (id)initWithCoordinate:()MNExtras rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:serializedCoarseMetaData:
{
  void *v21;
  id v22;
  int v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  int v35;
  unint64_t v36;
  int v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;

  v24 = 0xFFFF;
  v25 = a2;
  v26 = a3;
  v27 = a20;
  v28 = a18;
  v29 = a21;
  v30 = a9;
  v31 = a17;
  v32 = a6;
  v33 = a8;
  v34 = a19;
  v35 = 0;
  v36 = 0xBFF0000000000000;
  v37 = a11;
  v38 = a4;
  v39 = a5;
  v40 = a7;
  v41 = 0;
  v42 = a12;
  v44 = 0;
  v43 = 0;
  v45 = 0;
  if (a13)
    v21 = (void *)objc_msgSend(a1, "initWithClientLocation:coarseMetaData:", &v24, a13);
  else
    v21 = (void *)objc_msgSend(a1, "initWithClientLocation:", &v24);
  v22 = v21;

  return v22;
}

- (uint64_t)initWithGeoLocation:()MNExtras
{
  id v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  void *v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  void *v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  double v43;
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "latLng");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lat");
  v7 = v6;
  objc_msgSend(v4, "latLng");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lng");
  v10 = CLLocationCoordinate2DMake(v7, v9);

  objc_msgSend(v4, "rawCoordinate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lat");
  v13 = v12;
  objc_msgSend(v4, "rawCoordinate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lng");
  v16 = CLLocationCoordinate2DMake(v13, v15);

  if (objc_msgSend(v4, "hasCoarseMetadata"))
  {
    v17 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v4, "coarseMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v44;

    if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v20;
      _os_log_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to encode coarse location metadata: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v4, "course");
  v43 = v21;
  objc_msgSend(v4, "rawCourse");
  v23 = v22;
  objc_msgSend(v4, "courseAccuracy");
  v25 = v24;
  objc_msgSend(v4, "speed");
  v27 = v26;
  objc_msgSend(v4, "speedAccuracy");
  v29 = v28;
  v30 = objc_msgSend(v4, "altitude");
  objc_msgSend(v4, "timestamp");
  v32 = v31;
  objc_msgSend(v4, "horizontalAccuracy");
  v34 = v33;
  objc_msgSend(v4, "verticalAccuracy");
  v36 = v35;
  v37 = objc_msgSend(v4, "type") - 1;
  if (v37 > 2)
    v38 = 0;
  else
    v38 = dword_1B0BF32E8[v37];
  v39 = objc_msgSend(v4, "referenceFrame");
  if (v39 == 1)
    v40 = 1;
  else
    v40 = 2 * (v39 == 2);
  v41 = objc_msgSend(a1, "initWithCoordinate:rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:serializedCoarseMetaData:", v38, v40, v19, v10.latitude, v10.longitude, v16.latitude, v16.longitude, v43, v23, v25, v27, v29, (double)v30, v32, v34, v36);

  return v41;
}

- (uint64_t)_navigation_hasValidCourse
{
  double v2;
  double v4;
  double v5;

  objc_msgSend(a1, "course");
  if (v2 < 0.0)
    return 0;
  objc_msgSend(a1, "courseAccuracy");
  if ((int)v4 < 0)
    return GEOConfigGetBOOL();
  objc_msgSend(a1, "courseAccuracy");
  if (v5 >= 180.0)
    return GEOConfigGetBOOL();
  else
    return 1;
}

- (uint64_t)_navigation_locationDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "coordinate");
  v4 = v3;
  objc_msgSend(a1, "coordinate");
  v6 = v5;
  objc_msgSend(a1, "horizontalAccuracy");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("(%+.5f, %+.5f) ±%.2fm"), v4, v6, v7);
}

+ (uint64_t)_navigation_isLocation:()MNExtras equalTo:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
LABEL_2:
    v8 = 1;
    goto LABEL_3;
  }
  v8 = 0;
  if (v5 && v6)
  {
    if (v5 != v6)
    {
      objc_msgSend((id)v6, "coordinate");
      v8 = objc_msgSend((id)v5, "_navigation_isEqualToLocationCoordinate:");
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v8;
}

- (BOOL)_navigation_isEqualToLocationCoordinate:()MNExtras
{
  double v5;
  _BOOL4 v6;
  double v7;

  objc_msgSend(a1, "coordinate");
  v6 = vabdd_f64(v5, a2) < 0.000000999999997;
  return vabdd_f64(v7, a3) < 0.000000999999997 && v6;
}

- (double)_navigation_rawShiftedCoordinate
{
  return *MEMORY[0x1E0C9E500];
}

- (uint64_t)_navigation_detailedMatchInfo
{
  return 0;
}

- (id)_navigation_geoLocation
{
  id v2;
  double v3;
  double v4;

  v2 = objc_alloc(MEMORY[0x1E0D27168]);
  objc_msgSend(a1, "coordinate");
  v4 = v3;
  objc_msgSend(a1, "coordinate");
  return (id)objc_msgSend(v2, "initWithLatitude:longitude:", v4);
}

- (double)_navigation_geoCoordinate
{
  double v2;
  double v3;

  objc_msgSend(a1, "coordinate");
  v3 = v2;
  objc_msgSend(a1, "coordinate");
  return v3;
}

- (double)_navigation_geoCoordinate3D
{
  double v2;
  double v3;

  objc_msgSend(a1, "coordinate");
  v3 = v2;
  objc_msgSend(a1, "coordinate");
  objc_msgSend(a1, "altitude");
  return v3;
}

@end

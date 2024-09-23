@implementation GEOURLOptions

- (GEOURLOptions)initWithUrlRepresentation:(id)a3
{
  id v4;
  GEOURLOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  GEOURLCamera *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  GEOURLRouteHandle *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  GEOURLTimePoint *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  GEOURLOptions *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)GEOURLOptions;
  v5 = -[GEOURLOptions init](&v44, sel_init);
  if (!v5)
    goto LABEL_61;
  objc_msgSend(v4, "objectForKey:", CFSTR("maptype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("standard")) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("hybrid")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("satellite")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("transit")) & 1) != 0)
    {
      v7 = 3;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("driving")))
        goto LABEL_14;
      v7 = 4;
    }
    -[GEOURLOptions setMapType:](v5, "setMapType:", v7);
  }
LABEL_14:
  objc_msgSend(v4, "objectForKey:", CFSTR("camera"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(GEOURLCamera);
    objc_msgSend(v8, "objectForKey:", CFSTR("center"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "count") == 2)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12 && v13)
      {
        objc_msgSend(v12, "doubleValue");
        -[GEOURLCamera setLatitude:](v9, "setLatitude:");
        objc_msgSend(v14, "doubleValue");
        -[GEOURLCamera setLongitude:](v9, "setLongitude:");
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("heading"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "doubleValue");
        -[GEOURLCamera setHeading:](v9, "setHeading:");
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("pitch"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "doubleValue");
        -[GEOURLCamera setPitch:](v9, "setPitch:");
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("altitude"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "doubleValue");
        -[GEOURLCamera setAltitude:](v9, "setAltitude:");
      }
      -[GEOURLOptions setCamera:](v5, "setCamera:", v9);

      v19 = v6;
    }
    else
    {
      v19 = v6;
    }
  }
  else
  {
    v9 = objc_alloc_init(GEOURLCenterSpan);
    objc_msgSend(v4, "objectForKey:", CFSTR("region"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
    objc_msgSend(v19, "objectForKey:", CFSTR("center"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 && objc_msgSend(v20, "count") == 2)
    {
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastObject");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v22 && v23)
      {
        objc_msgSend(v22, "doubleValue");
        -[GEOURLCamera setLatitude:](v9, "setLatitude:");
        objc_msgSend(v24, "doubleValue");
        -[GEOURLCamera setLongitude:](v9, "setLongitude:");
      }

    }
    objc_msgSend(v19, "objectForKey:", CFSTR("span"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && objc_msgSend(v11, "count") == 2)
    {
      objc_msgSend(v11, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v25 && v26)
      {
        objc_msgSend(v25, "doubleValue");
        -[GEOURLCamera setLatitudeDelta:](v9, "setLatitudeDelta:");
        objc_msgSend(v27, "doubleValue");
        -[GEOURLCamera setLongitudeDelta:](v9, "setLongitudeDelta:");
      }

    }
    -[GEOURLOptions setCenterSpan:](v5, "setCenterSpan:", v9);
  }

LABEL_43:
  objc_msgSend(v4, "objectForKey:", CFSTR("traffic"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[GEOURLOptions setEnableTraffic:](v5, "setEnableTraffic:", objc_msgSend(v28, "BOOLValue"));
  objc_msgSend(v4, "objectForKey:", CFSTR("referralIdentifier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[GEOURLOptions setReferralIdentifier:](v5, "setReferralIdentifier:", v29);
  objc_msgSend(v4, "objectForKey:", CFSTR("routeHandle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = objc_alloc_init(GEOURLRouteHandle);
    objc_msgSend(v30, "objectForKey:", CFSTR("routeHandleDirectionsResponseID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLRouteHandle setDirectionsResponseID:](v31, "setDirectionsResponseID:", v32);

    objc_msgSend(v30, "objectForKey:", CFSTR("routeHandleRouteID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLRouteHandle setRouteID:](v31, "setRouteID:", v33);

    objc_msgSend(v30, "objectForKey:", CFSTR("routeHandleZilch"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLRouteHandle setZilchPoints:](v31, "setZilchPoints:", v34);

    objc_msgSend(v30, "objectForKey:", CFSTR("routeHandleTransit"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLRouteHandle setTransitData:](v31, "setTransitData:", v35);

    -[GEOURLOptions setRouteHandle:](v5, "setRouteHandle:", v31);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("timePoint"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_58;
  v37 = objc_alloc_init(GEOURLTimePoint);
  objc_msgSend(v36, "objectForKey:", CFSTR("type"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v38, "isEqualToString:", CFSTR("arrival")) & 1) != 0)
  {
    v39 = 1;
LABEL_54:
    -[GEOURLTimePoint setType:](v37, "setType:", v39);
    goto LABEL_55;
  }
  if (objc_msgSend(v38, "isEqualToString:", CFSTR("departure")))
  {
    v39 = 0;
    goto LABEL_54;
  }
LABEL_55:
  objc_msgSend(v36, "objectForKey:", CFSTR("time"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v40, "doubleValue");
    -[GEOURLTimePoint setTime:](v37, "setTime:");
  }
  -[GEOURLOptions setTimePoint:](v5, "setTimePoint:", v37);

LABEL_58:
  objc_msgSend(v4, "objectForKey:", CFSTR("connectedToCar"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[GEOURLOptions setConnectedToCar:](v5, "setConnectedToCar:", objc_msgSend(v41, "BOOLValue"));
  v42 = v5;

LABEL_61:
  return v5;
}

- (id)urlRepresentation
{
  id v3;
  unsigned int v4;
  const __CFString *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[2];
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  if (!-[GEOURLOptions hasEnableTraffic](self, "hasEnableTraffic")
    && !-[GEOURLOptions hasMapType](self, "hasMapType")
    && !-[GEOURLOptions hasTransportType](self, "hasTransportType")
    && !-[GEOURLOptions hasCenterSpan](self, "hasCenterSpan")
    && !-[GEOURLOptions hasCamera](self, "hasCamera")
    && !-[GEOURLOptions hasReferralIdentifier](self, "hasReferralIdentifier")
    && !-[GEOURLOptions hasRouteHandle](self, "hasRouteHandle")
    && !-[GEOURLOptions hasTimePoint](self, "hasTimePoint"))
  {
    return 0;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[GEOURLOptions hasMapType](self, "hasMapType"))
  {
    v4 = -[GEOURLOptions mapType](self, "mapType") - 1;
    if (v4 > 3)
      v5 = CFSTR("standard");
    else
      v5 = off_1E1C033E0[v4];
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("maptype"));
  }
  if (-[GEOURLOptions hasTransportType](self, "hasTransportType"))
  {
    v6 = -[GEOURLOptions transportType](self, "transportType");
    if (v6 > 3)
      v7 = CFSTR("preferred");
    else
      v7 = off_1E1C03400[v6];
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dirtype"));
  }
  if (-[GEOURLOptions hasCenterSpan](self, "hasCenterSpan"))
  {
    -[GEOURLOptions centerSpan](self, "centerSpan");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v8, "hasLatitude") && objc_msgSend(v8, "hasLongitude"))
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "latitude");
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v11;
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "longitude");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("center"));

    }
    if (objc_msgSend(v8, "hasLatitudeDelta") && objc_msgSend(v8, "hasLongitudeDelta"))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "latitudeDelta");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v16;
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "longitudeDelta");
      objc_msgSend(v17, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("span"));

    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("region"));

  }
  if (-[GEOURLOptions hasCamera](self, "hasCamera"))
  {
    -[GEOURLOptions camera](self, "camera");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = CFSTR("center");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "latitude");
    objc_msgSend(v21, "numberWithDouble:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v49;
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "longitude");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v24;
    v53[1] = CFSTR("heading");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "heading");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v26;
    v53[2] = CFSTR("pitch");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "pitch");
    objc_msgSend(v27, "numberWithDouble:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v28;
    v53[3] = CFSTR("altitude");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "altitude");
    objc_msgSend(v29, "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("camera"));

  }
  if (-[GEOURLOptions hasEnableTraffic](self, "hasEnableTraffic"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GEOURLOptions enableTraffic](self, "enableTraffic"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("traffic"));

  }
  if (-[GEOURLOptions hasReferralIdentifier](self, "hasReferralIdentifier"))
  {
    -[GEOURLOptions referralIdentifier](self, "referralIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("referralIdentifier"));

  }
  if (-[GEOURLOptions hasRouteHandle](self, "hasRouteHandle"))
  {
    -[GEOURLOptions routeHandle](self, "routeHandle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = CFSTR("routeHandleDirectionsResponseID");
    objc_msgSend(v34, "directionsResponseID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v35;
    v50[1] = CFSTR("routeHandleRouteID");
    objc_msgSend(v34, "routeID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v36;
    v50[2] = CFSTR("routeHandleZilch");
    objc_msgSend(v34, "zilchPoints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v37;
    v50[3] = CFSTR("routeHandleTransit");
    objc_msgSend(v34, "transitData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("routeHandle"));

  }
  if (-[GEOURLOptions hasTimePoint](self, "hasTimePoint"))
  {
    -[GEOURLOptions timePoint](self, "timePoint");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v40, "hasType"))
    {
      v42 = objc_msgSend(v40, "type");
      v43 = CFSTR("departure");
      if (v42)
        v43 = 0;
      if (v42 == 1)
        v44 = CFSTR("arrival");
      else
        v44 = v43;
      objc_msgSend(v41, "setObject:forKey:", v44, CFSTR("type"));
    }
    if (objc_msgSend(v40, "hasTime"))
    {
      v45 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v40, "time");
      objc_msgSend(v45, "numberWithDouble:");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKey:", v46, CFSTR("time"));

    }
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("timePoint"));

  }
  if (-[GEOURLOptions hasConnectedToCar](self, "hasConnectedToCar"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GEOURLOptions connectedToCar](self, "connectedToCar"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("connectedToCar"));

  }
  return v3;
}

- (GEOURLOptions)init
{
  GEOURLOptions *v2;
  GEOURLOptions *v3;
  GEOURLOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOURLOptions;
  v2 = -[GEOURLOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLOptions)initWithData:(id)a3
{
  GEOURLOptions *v3;
  GEOURLOptions *v4;
  GEOURLOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOURLOptions;
  v3 = -[GEOURLOptions initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)enableTraffic
{
  return self->_enableTraffic;
}

- (void)setEnableTraffic:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_enableTraffic = a3;
}

- (void)setHasEnableTraffic:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4112;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasEnableTraffic
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)mapType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_mapType;
  else
    return 0;
}

- (void)setMapType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasMapType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E1C08D78 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Standard")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Satellite")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hybrid")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Transit")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Driving")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTransportType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return *(&off_1E1C08DA0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCenterSpan
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenterSpan_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCenterSpan
{
  -[GEOURLOptions _readCenterSpan]((uint64_t)self);
  return self->_centerSpan != 0;
}

- (GEOURLCenterSpan)centerSpan
{
  -[GEOURLOptions _readCenterSpan]((uint64_t)self);
  return self->_centerSpan;
}

- (void)setCenterSpan:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_centerSpan, a3);
}

- (void)_readCamera
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCamera_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCamera
{
  -[GEOURLOptions _readCamera]((uint64_t)self);
  return self->_camera != 0;
}

- (GEOURLCamera)camera
{
  -[GEOURLOptions _readCamera]((uint64_t)self);
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_camera, a3);
}

- (void)_readReferralIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReferralIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasReferralIdentifier
{
  -[GEOURLOptions _readReferralIdentifier]((uint64_t)self);
  return self->_referralIdentifier != 0;
}

- (NSString)referralIdentifier
{
  -[GEOURLOptions _readReferralIdentifier]((uint64_t)self);
  return self->_referralIdentifier;
}

- (void)setReferralIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_referralIdentifier, a3);
}

- (int)userTrackingMode
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_userTrackingMode;
  else
    return 0;
}

- (void)setUserTrackingMode:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_userTrackingMode = a3;
}

- (void)setHasUserTrackingMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasUserTrackingMode
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)userTrackingModeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E1C08DD8 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserTrackingMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Follow")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FollowWithHeading")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readRouteHandle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteHandle_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteHandle
{
  -[GEOURLOptions _readRouteHandle]((uint64_t)self);
  return self->_routeHandle != 0;
}

- (GEOURLRouteHandle)routeHandle
{
  -[GEOURLOptions _readRouteHandle]((uint64_t)self);
  return self->_routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (void)_readTimePoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimePoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTimePoint
{
  -[GEOURLOptions _readTimePoint]((uint64_t)self);
  return self->_timePoint != 0;
}

- (GEOURLTimePoint)timePoint
{
  -[GEOURLOptions _readTimePoint]((uint64_t)self);
  return self->_timePoint;
}

- (void)setTimePoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_timePoint, a3);
}

- (BOOL)connectedToCar
{
  return self->_connectedToCar;
}

- (void)setConnectedToCar:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_connectedToCar = a3;
}

- (void)setHasConnectedToCar:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasConnectedToCar
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)pitchedWhileTracking
{
  return self->_pitchedWhileTracking;
}

- (void)setPitchedWhileTracking:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  self->_pitchedWhileTracking = a3;
}

- (void)setHasPitchedWhileTracking:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4160;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasPitchedWhileTracking
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)ignoreLabelPreference
{
  return self->_ignoreLabelPreference;
}

- (void)setIgnoreLabelPreference:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_ignoreLabelPreference = a3;
}

- (void)setHasIgnoreLabelPreference:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4128;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasIgnoreLabelPreference
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOURLOptions;
  -[GEOURLOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int16 v26;
  void *v27;
  void *v28;
  void *v29;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("enableTraffic"));

    v5 = *(_WORD *)(a1 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_4;
  }
  v7 = *(int *)(a1 + 68);
  if (v7 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *(&off_1E1C08D78 + v7);
  }
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("mapType"));

  if ((*(_WORD *)(a1 + 84) & 2) != 0)
  {
LABEL_11:
    v9 = *(int *)(a1 + 72);
    if (v9 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_1E1C08DA0 + v9);
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("transportType"));

  }
LABEL_15:
  objc_msgSend((id)a1, "centerSpan");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("centerSpan"));

  }
  objc_msgSend((id)a1, "camera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v14, "jsonRepresentation");
    else
      objc_msgSend(v14, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("camera"));

  }
  objc_msgSend((id)a1, "referralIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("referralIdentifier"));

  if ((*(_WORD *)(a1 + 84) & 4) != 0)
  {
    v18 = *(int *)(a1 + 76);
    if (v18 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = *(&off_1E1C08DD8 + v18);
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("userTrackingMode"));

  }
  objc_msgSend((id)a1, "routeHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v20, "jsonRepresentation");
    else
      objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("routeHandle"));

  }
  objc_msgSend((id)a1, "timePoint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v23, "jsonRepresentation");
    else
      objc_msgSend(v23, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("timePoint"));

  }
  v26 = *(_WORD *)(a1 + 84);
  if ((v26 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("connectedToCar"));

    v26 = *(_WORD *)(a1 + 84);
    if ((v26 & 0x40) == 0)
    {
LABEL_44:
      if ((v26 & 0x20) == 0)
        return v4;
      goto LABEL_48;
    }
  }
  else if ((v26 & 0x40) == 0)
  {
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 83));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("pitchedWhileTracking"));

  if ((*(_WORD *)(a1 + 84) & 0x20) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 82));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("ignoreLabelPreference"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOURLOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOURLOptions)initWithDictionary:(id)a3
{
  return (GEOURLOptions *)-[GEOURLOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  GEOURLCenterSpan *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GEOURLCamera *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  GEOURLRouteHandle *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  GEOURLTimePoint *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = a2;
  if (!a1)
    goto LABEL_82;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_82;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enableTraffic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnableTraffic:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Standard")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Satellite")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Hybrid")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Transit")) & 1) != 0)
    {
      v9 = 3;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Driving")))
    {
      v9 = 4;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setMapType:", v9);
LABEL_21:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v12 = 5;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v12 = 6;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_41;
    v12 = objc_msgSend(v10, "intValue");
  }
  objc_msgSend(a1, "setTransportType:", v12);
LABEL_41:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("centerSpan"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOURLCenterSpan alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOURLCenterSpan initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOURLCenterSpan initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setCenterSpan:", v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("camera"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOURLCamera alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOURLCamera initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOURLCamera initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setCamera:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("referralIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(a1, "setReferralIdentifier:", v22);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userTrackingMode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v23;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("None")) & 1) != 0)
    {
      v25 = 0;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Follow")) & 1) != 0)
    {
      v25 = 1;
    }
    else if (objc_msgSend(v24, "isEqualToString:", CFSTR("FollowWithHeading")))
    {
      v25 = 2;
    }
    else
    {
      v25 = 0;
    }

    goto LABEL_64;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = objc_msgSend(v23, "intValue");
LABEL_64:
    objc_msgSend(a1, "setUserTrackingMode:", v25);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeHandle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOURLRouteHandle alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEOURLRouteHandle initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEOURLRouteHandle initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setRouteHandle:", v28);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timePoint"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEOURLTimePoint alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEOURLTimePoint initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEOURLTimePoint initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setTimePoint:", v32);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("connectedToCar"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setConnectedToCar:", objc_msgSend(v34, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pitchedWhileTracking"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPitchedWhileTracking:", objc_msgSend(v35, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ignoreLabelPreference"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIgnoreLabelPreference:", objc_msgSend(v36, "BOOLValue"));

LABEL_82:
  return a1;
}

- (GEOURLOptions)initWithJSON:(id)a3
{
  return (GEOURLOptions *)-[GEOURLOptions _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_160;
    else
      v8 = (int *)&readAll__nonRecursiveTag_161;
    GEOURLOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOURLOptionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  __int16 v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOURLOptionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_30;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOURLOptions readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_centerSpan)
    PBDataWriterWriteSubmessage();
  if (self->_camera)
    PBDataWriterWriteSubmessage();
  if (self->_referralIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_routeHandle)
    PBDataWriterWriteSubmessage();
  if (self->_timePoint)
    PBDataWriterWriteSubmessage();
  v6 = (__int16)self->_flags;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (__int16)self->_flags;
    if ((v6 & 0x40) == 0)
    {
LABEL_21:
      if ((v6 & 0x20) == 0)
        goto LABEL_30;
      goto LABEL_28;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
LABEL_28:
    PBDataWriterWriteBOOLField();
LABEL_30:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOURLOptions readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v7;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_BYTE *)v7 + 81) = self->_enableTraffic;
    *((_WORD *)v7 + 42) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v7 + 17) = self->_mapType;
  *((_WORD *)v7 + 42) |= 1u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v7 + 18) = self->_transportType;
    *((_WORD *)v7 + 42) |= 2u;
  }
LABEL_5:
  if (self->_centerSpan)
  {
    objc_msgSend(v7, "setCenterSpan:");
    v4 = v7;
  }
  if (self->_camera)
  {
    objc_msgSend(v7, "setCamera:");
    v4 = v7;
  }
  if (self->_referralIdentifier)
  {
    objc_msgSend(v7, "setReferralIdentifier:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_userTrackingMode;
    *((_WORD *)v4 + 42) |= 4u;
  }
  if (self->_routeHandle)
  {
    objc_msgSend(v7, "setRouteHandle:");
    v4 = v7;
  }
  if (self->_timePoint)
  {
    objc_msgSend(v7, "setTimePoint:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 8) == 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_19;
LABEL_26:
    *((_BYTE *)v4 + 83) = self->_pitchedWhileTracking;
    *((_WORD *)v4 + 42) |= 0x40u;
    if ((*(_WORD *)&self->_flags & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  *((_BYTE *)v4 + 80) = self->_connectedToCar;
  *((_WORD *)v4 + 42) |= 8u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x40) != 0)
    goto LABEL_26;
LABEL_19:
  if ((v6 & 0x20) != 0)
  {
LABEL_20:
    *((_BYTE *)v4 + 82) = self->_ignoreLabelPreference;
    *((_WORD *)v4 + 42) |= 0x20u;
  }
LABEL_21:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  __int16 v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOURLOptions readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_BYTE *)(v5 + 81) = self->_enableTraffic;
      *(_WORD *)(v5 + 84) |= 0x10u;
      flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 68) = self->_mapType;
    *(_WORD *)(v5 + 84) |= 1u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
    {
LABEL_9:
      v10 = -[GEOURLCenterSpan copyWithZone:](self->_centerSpan, "copyWithZone:", a3);
      v11 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v10;

      v12 = -[GEOURLCamera copyWithZone:](self->_camera, "copyWithZone:", a3);
      v13 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v12;

      v14 = -[NSString copyWithZone:](self->_referralIdentifier, "copyWithZone:", a3);
      v15 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = v14;

      if ((*(_WORD *)&self->_flags & 4) != 0)
      {
        *(_DWORD *)(v5 + 76) = self->_userTrackingMode;
        *(_WORD *)(v5 + 84) |= 4u;
      }
      v16 = -[GEOURLRouteHandle copyWithZone:](self->_routeHandle, "copyWithZone:", a3);
      v17 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v16;

      v18 = -[GEOURLTimePoint copyWithZone:](self->_timePoint, "copyWithZone:", a3);
      v19 = *(void **)(v5 + 48);
      *(_QWORD *)(v5 + 48) = v18;

      v20 = (__int16)self->_flags;
      if ((v20 & 8) != 0)
      {
        *(_BYTE *)(v5 + 80) = self->_connectedToCar;
        *(_WORD *)(v5 + 84) |= 8u;
        v20 = (__int16)self->_flags;
        if ((v20 & 0x40) == 0)
        {
LABEL_13:
          if ((v20 & 0x20) == 0)
            return (id)v5;
LABEL_14:
          *(_BYTE *)(v5 + 82) = self->_ignoreLabelPreference;
          *(_WORD *)(v5 + 84) |= 0x20u;
          return (id)v5;
        }
      }
      else if ((v20 & 0x40) == 0)
      {
        goto LABEL_13;
      }
      *(_BYTE *)(v5 + 83) = self->_pitchedWhileTracking;
      *(_WORD *)(v5 + 84) |= 0x40u;
      if ((*(_WORD *)&self->_flags & 0x20) == 0)
        return (id)v5;
      goto LABEL_14;
    }
LABEL_8:
    *(_DWORD *)(v5 + 72) = self->_transportType;
    *(_WORD *)(v5 + 84) |= 2u;
    goto LABEL_9;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOURLOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOURLCenterSpan *centerSpan;
  GEOURLCamera *camera;
  NSString *referralIdentifier;
  __int16 v10;
  GEOURLRouteHandle *routeHandle;
  GEOURLTimePoint *timePoint;
  __int16 v13;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  -[GEOURLOptions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 42);
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_53;
    if (self->_enableTraffic)
    {
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 81))
    {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_53;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_mapType != *((_DWORD *)v4 + 17))
      goto LABEL_53;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_53;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_transportType != *((_DWORD *)v4 + 18))
      goto LABEL_53;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_53;
  }
  centerSpan = self->_centerSpan;
  if ((unint64_t)centerSpan | *((_QWORD *)v4 + 3) && !-[GEOURLCenterSpan isEqual:](centerSpan, "isEqual:"))
    goto LABEL_53;
  camera = self->_camera;
  if ((unint64_t)camera | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOURLCamera isEqual:](camera, "isEqual:"))
      goto LABEL_53;
  }
  referralIdentifier = self->_referralIdentifier;
  if ((unint64_t)referralIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](referralIdentifier, "isEqual:"))
      goto LABEL_53;
  }
  v10 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_userTrackingMode != *((_DWORD *)v4 + 19))
      goto LABEL_53;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_53;
  }
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((_QWORD *)v4 + 5) && !-[GEOURLRouteHandle isEqual:](routeHandle, "isEqual:"))
    goto LABEL_53;
  timePoint = self->_timePoint;
  if ((unint64_t)timePoint | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOURLTimePoint isEqual:](timePoint, "isEqual:"))
      goto LABEL_53;
  }
  v13 = (__int16)self->_flags;
  v14 = *((_WORD *)v4 + 42);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0)
      goto LABEL_53;
    if (self->_connectedToCar)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_53;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_53;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0)
      goto LABEL_53;
    if (self->_pitchedWhileTracking)
    {
      if (!*((_BYTE *)v4 + 83))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 83))
    {
      goto LABEL_53;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_53;
  }
  v15 = (v14 & 0x20) == 0;
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) != 0)
    {
      if (self->_ignoreLabelPreference)
      {
        if (!*((_BYTE *)v4 + 82))
          goto LABEL_53;
      }
      else if (*((_BYTE *)v4 + 82))
      {
        goto LABEL_53;
      }
      v15 = 1;
      goto LABEL_54;
    }
LABEL_53:
    v15 = 0;
  }
LABEL_54:

  return v15;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  -[GEOURLOptions readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    v17 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((flags & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v17 = 2654435761 * self->_enableTraffic;
  if ((flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_mapType;
  if ((flags & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_transportType;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[GEOURLCenterSpan hash](self->_centerSpan, "hash");
  v7 = -[GEOURLCamera hash](self->_camera, "hash");
  v8 = -[NSString hash](self->_referralIdentifier, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v9 = 2654435761 * self->_userTrackingMode;
  else
    v9 = 0;
  v10 = -[GEOURLRouteHandle hash](self->_routeHandle, "hash");
  v11 = -[GEOURLTimePoint hash](self->_timePoint, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 8) == 0)
  {
    v13 = 0;
    if ((v12 & 0x40) != 0)
      goto LABEL_13;
LABEL_16:
    v14 = 0;
    if ((v12 & 0x20) != 0)
      goto LABEL_14;
LABEL_17:
    v15 = 0;
    return v4 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
  }
  v13 = 2654435761 * self->_connectedToCar;
  if ((v12 & 0x40) == 0)
    goto LABEL_16;
LABEL_13:
  v14 = 2654435761 * self->_pitchedWhileTracking;
  if ((v12 & 0x20) == 0)
    goto LABEL_17;
LABEL_14:
  v15 = 2654435761 * self->_ignoreLabelPreference;
  return v4 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  GEOURLCenterSpan *centerSpan;
  uint64_t v7;
  GEOURLCamera *camera;
  uint64_t v9;
  GEOURLRouteHandle *routeHandle;
  uint64_t v11;
  GEOURLTimePoint *timePoint;
  uint64_t v13;
  __int16 v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "readAll:", 0);
  v4 = v15;
  v5 = *((_WORD *)v15 + 42);
  if ((v5 & 0x10) != 0)
  {
    self->_enableTraffic = *((_BYTE *)v15 + 81);
    *(_WORD *)&self->_flags |= 0x10u;
    v5 = *((_WORD *)v15 + 42);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_mapType = *((_DWORD *)v15 + 17);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v15 + 42) & 2) != 0)
  {
LABEL_4:
    self->_transportType = *((_DWORD *)v15 + 18);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_5:
  centerSpan = self->_centerSpan;
  v7 = *((_QWORD *)v15 + 3);
  if (centerSpan)
  {
    if (!v7)
      goto LABEL_14;
    -[GEOURLCenterSpan mergeFrom:](centerSpan, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_14;
    -[GEOURLOptions setCenterSpan:](self, "setCenterSpan:");
  }
  v4 = v15;
LABEL_14:
  camera = self->_camera;
  v9 = *((_QWORD *)v4 + 2);
  if (camera)
  {
    if (!v9)
      goto LABEL_20;
    -[GEOURLCamera mergeFrom:](camera, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_20;
    -[GEOURLOptions setCamera:](self, "setCamera:");
  }
  v4 = v15;
LABEL_20:
  if (*((_QWORD *)v4 + 4))
  {
    -[GEOURLOptions setReferralIdentifier:](self, "setReferralIdentifier:");
    v4 = v15;
  }
  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
    self->_userTrackingMode = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 4u;
  }
  routeHandle = self->_routeHandle;
  v11 = *((_QWORD *)v4 + 5);
  if (routeHandle)
  {
    if (!v11)
      goto LABEL_30;
    -[GEOURLRouteHandle mergeFrom:](routeHandle, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_30;
    -[GEOURLOptions setRouteHandle:](self, "setRouteHandle:");
  }
  v4 = v15;
LABEL_30:
  timePoint = self->_timePoint;
  v13 = *((_QWORD *)v4 + 6);
  if (timePoint)
  {
    if (!v13)
      goto LABEL_36;
    -[GEOURLTimePoint mergeFrom:](timePoint, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_36;
    -[GEOURLOptions setTimePoint:](self, "setTimePoint:");
  }
  v4 = v15;
LABEL_36:
  v14 = *((_WORD *)v4 + 42);
  if ((v14 & 8) == 0)
  {
    if ((v14 & 0x40) == 0)
      goto LABEL_38;
LABEL_42:
    self->_pitchedWhileTracking = *((_BYTE *)v4 + 83);
    *(_WORD *)&self->_flags |= 0x40u;
    if ((*((_WORD *)v4 + 42) & 0x20) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
  self->_connectedToCar = *((_BYTE *)v4 + 80);
  *(_WORD *)&self->_flags |= 8u;
  v14 = *((_WORD *)v4 + 42);
  if ((v14 & 0x40) != 0)
    goto LABEL_42;
LABEL_38:
  if ((v14 & 0x20) != 0)
  {
LABEL_39:
    self->_ignoreLabelPreference = *((_BYTE *)v4 + 82);
    *(_WORD *)&self->_flags |= 0x20u;
  }
LABEL_40:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePoint, 0);
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_referralIdentifier, 0);
  objc_storeStrong((id *)&self->_centerSpan, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end

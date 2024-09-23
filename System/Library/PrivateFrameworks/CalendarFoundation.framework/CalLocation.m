@implementation CalLocation

+ (id)fullDisplayStringWithTitle:(id)a3 address:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(a1, "displayStringForAddress:withoutTitle:", v7, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v9, "length"))
      {
        v7 = v9;
        goto LABEL_10;
      }
      objc_msgSend(v8, "appendString:", CFSTR("\n"));
      v7 = v9;
    }
    else
    {
      v9 = v7;
    }
    objc_msgSend(v8, "appendString:", v9);
  }
LABEL_10:

  return v8;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setLocation:(id)a3
{
  CLLocation *v5;
  CLLocation **p_location;
  CLLocation *location;
  CLLocation *v8;

  v5 = (CLLocation *)a3;
  location = self->_location;
  p_location = &self->_location;
  if (location != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_location, a3);
    v5 = v8;
  }

}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void)setMapKitHandle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (CLLocation)location
{
  CLLocation *location;
  CLLocation *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  location = self->_location;
  if (location)
  {
    v3 = location;
  }
  else
  {
    -[CalLocation placemark](self, "placemark");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_6;
    v6 = (void *)v5;
    -[CalLocation placemark](self, "placemark");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CalLocation placemark](self, "placemark");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "location");
      v3 = (CLLocation *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_6:
      v3 = 0;
    }
  }
  return v3;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CalLocation location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v14, "encodeBool:forKey:", 1, CFSTR("hasValidLocation"));
    -[CalLocation location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v14, "encodeDouble:forKey:", CFSTR("latitude"));

    -[CalLocation location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v14, "encodeDouble:forKey:", CFSTR("longitude"), v7);

  }
  objc_msgSend(v14, "encodeInteger:forKey:", -[CalLocation type](self, "type"), CFSTR("type"));
  -[CalLocation address](self, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("address"));

  -[CalLocation title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("title"));

  -[CalLocation abURLString](self, "abURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("abURLString"));

  -[CalLocation displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("displayName"));

  -[CalLocation radius](self, "radius");
  objc_msgSend(v14, "encodeDouble:forKey:", CFSTR("radius"));
  -[CalLocation routeType](self, "routeType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("routeType"));

  -[CalLocation mapKitHandle](self, "mapKitHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("mapKitHandle"));

}

- (CLPlacemark)placemark
{
  return (CLPlacemark *)objc_getProperty(self, a2, 48, 1);
}

- (int)type
{
  return self->_type;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)abURLString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (double)radius
{
  double radius;
  float v3;
  void *v4;
  void *v5;
  double v6;

  radius = self->_radius;
  v3 = radius;
  if (fabsf(v3) < 0.00000011921)
  {
    -[CalLocation placemark](self, "placemark");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
    {
      objc_msgSend(v5, "radius");
      radius = v6;
    }

  }
  return radius;
}

- (NSString)routeType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)mapKitHandle
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeType, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_abURLString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalLocation)initWithCoder:(id)a3
{
  id v4;
  CalLocation *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  CLLocation *location;
  void *v11;
  uint64_t v12;
  NSString *address;
  void *v14;
  uint64_t v15;
  NSString *title;
  void *v17;
  uint64_t v18;
  NSString *abURLString;
  void *v20;
  uint64_t v21;
  NSString *displayName;
  double v23;
  void *v24;
  uint64_t v25;
  NSString *routeType;
  void *v27;
  uint64_t v28;
  NSData *mapKitHandle;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CalLocation;
  v5 = -[CalLocation init](&v31, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasValidLocation")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
      v7 = v6;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v8, v7);
      location = v5->_location;
      v5->_location = (CLLocation *)v9;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    address = v5->_address;
    v5->_address = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abURLString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    abURLString = v5->_abURLString;
    v5->_abURLString = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v21;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radius"));
    v5->_radius = v23;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routeType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    routeType = v5->_routeType;
    v5->_routeType = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapKitHandle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    mapKitHandle = v5->_mapKitHandle;
    v5->_mapKitHandle = (NSData *)v28;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CalLocation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(CalLocation);
  -[CalLocation location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setLocation:](v4, "setLocation:", v5);

  -[CalLocation address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setAddress:](v4, "setAddress:", v6);

  -[CalLocation title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setTitle:](v4, "setTitle:", v7);

  -[CalLocation displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setDisplayName:](v4, "setDisplayName:", v8);

  -[CalLocation abURLString](self, "abURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setAbURLString:](v4, "setAbURLString:", v9);

  -[CalLocation setType:](v4, "setType:", -[CalLocation type](self, "type"));
  -[CalLocation radius](self, "radius");
  -[CalLocation setRadius:](v4, "setRadius:");
  -[CalLocation routeType](self, "routeType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setRouteType:](v4, "setRouteType:", v10);

  -[CalLocation mapKitHandle](self, "mapKitHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setMapKitHandle:](v4, "setMapKitHandle:", v11);

  return v4;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setAbURLString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setRouteType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalLocation displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tdisplayName: %@"), v7);

  -[CalLocation title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\ttitle: %@"), v8);

  -[CalLocation address](self, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\taddress: %@"), v9);

  -[CalLocation location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tlocation: %@"), v10);

  -[CalLocation typeString](self, "typeString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\ttype: %@"), v11);

  -[CalLocation geoURLString](self, "geoURLString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tgeoURLString: %@"), v12);

  -[CalLocation abURLString](self, "abURLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tabURLString: %@"), v13);

  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tisCurrentLocation: %d"), -[CalLocation isCurrentLocation](self, "isCurrentLocation"));
  -[CalLocation radius](self, "radius");
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tradius: %f"), v14);
  return v6;
}

- (id)typeString
{
  unsigned int v2;

  v2 = -[CalLocation type](self, "type");
  if (v2 > 8)
    return &stru_1E2A86598;
  else
    return off_1E2A85CC8[v2];
}

- (id)geoURLString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[CalLocation location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CalLocation location](self, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CalLocation placemark](self, "placemark");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CalLocation placemark](self, "placemark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CalLocation placemark](self, "placemark");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "location");
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
  }
  objc_msgSend((id)objc_opt_class(), "geoURLStringFromCoordinates:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)geoURLStringFromCoordinates:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = v7;

  objc_msgSend(v3, "stringWithFormat:", CFSTR("geo:%f,%f"), v6, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isCurrentLocation
{
  return self->_type == 2;
}

- (id)displayString
{
  void *v3;
  void *v4;
  void *v5;

  -[CalLocation displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CalLocation displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CalLocation title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CalLocation title](self, "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (void)setPlacemark:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CalLocation *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
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
  int v24;
  double v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = (CalLocation *)a3;
  if (self == v5)
  {
    LOBYTE(v7) = 1;
    goto LABEL_39;
  }
  v6 = objc_opt_class();
  if (v6 != objc_opt_class())
  {
    LOBYTE(v7) = 0;
    goto LABEL_39;
  }
  -[CalLocation address](self, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[CalLocation address](v5, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  -[CalLocation address](self, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation address](v5, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_10;
LABEL_11:

  -[CalLocation title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[CalLocation title](v5, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_14;
  }
  -[CalLocation title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation title](v5, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 &= objc_msgSend(v13, "isEqual:", v14);

  if (!v12)
LABEL_14:

  -[CalLocation displayName](self, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[CalLocation displayName](v5, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_18;
  }
  -[CalLocation displayName](self, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation displayName](v5, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11 &= objc_msgSend(v16, "isEqual:", v17);

  if (!v15)
LABEL_18:

  -[CalLocation abURLString](self, "abURLString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[CalLocation abURLString](v5, "abURLString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_22;
  }
  -[CalLocation abURLString](self, "abURLString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation abURLString](v5, "abURLString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v11 &= objc_msgSend(v19, "isEqual:", v20);

  if (!v18)
LABEL_22:

  -[CalLocation placemark](self, "placemark");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    -[CalLocation placemark](v5, "placemark");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_26;
  }
  -[CalLocation placemark](self, "placemark");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation placemark](v5, "placemark");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 &= objc_msgSend(v22, "isEqual:", v23);

  if (!v21)
LABEL_26:

  v24 = -[CalLocation type](self, "type");
  if (v24 != -[CalLocation type](v5, "type"))
    v11 = 0;
  -[CalLocation radius](self, "radius");
  v26 = v25;
  -[CalLocation radius](v5, "radius");
  if (vabdd_f64(v26, v27) < 2.22044605e-16)
    v28 = v11;
  else
    v28 = 0;
  -[CalLocation routeType](self, "routeType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation routeType](v5, "routeType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 != v30)
    v28 = 0;

  v31 = -[CalLocation isCurrentLocation](self, "isCurrentLocation");
  v7 = v28 & (v31 ^ -[CalLocation isCurrentLocation](v5, "isCurrentLocation") ^ 1);
  -[CalLocation mapKitHandle](self, "mapKitHandle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    -[CalLocation mapKitHandle](v5, "mapKitHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_37;
  }
  -[CalLocation mapKitHandle](self, "mapKitHandle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation mapKitHandle](v5, "mapKitHandle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v7 &= objc_msgSend(v33, "isEqual:", v34);

  if (!v32)
LABEL_37:

LABEL_39:
  return v7;
}

- (double)distanceFromLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[CalLocation location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "distanceFromLocation:", v6);
  v8 = v7;

  return v8;
}

- (id)fullTitleAndAddressString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[CalLocation title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullDisplayStringWithTitle:address:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)coordinatesFromGeoURLString:(id)a3
{
  void *v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  BOOL v8;
  id v11;
  double v13;
  double v14;

  if (a3)
  {
    v13 = 0.0;
    v14 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "scanString:intoString:", CFSTR("geo:"), 0);
    v5 = objc_msgSend(v3, "scanDouble:", &v14);
    v6 = objc_msgSend(v3, "scanString:intoString:", CFSTR(","), 0);
    v7 = 0;
    if (objc_msgSend(v3, "scanDouble:", &v13))
      v8 = v6 == 0;
    else
      v8 = 1;
    if (!v8 && v5 != 0 && v4 != 0)
    {
      v11 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      v7 = (void *)objc_msgSend(v11, "initWithLatitude:longitude:", v14, v13);
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)displayStringForAddress:(id)a3 withoutTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", v6))
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v6, &stru_1E2A86598);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)routeTypeStringForCalLocationRoutingMode:(int64_t)a3
{
  int64_t v3;
  id v4;

  v3 = a3 + 1;
  if ((unint64_t)(a3 + 1) <= 5 && ((0x3Du >> v3) & 1) != 0)
    v4 = (id)*off_1E2A85D10[v3];
  else
    v4 = 0;
  return v4;
}

+ (int64_t)routingModeEnumForCalRouteType:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CalRouteType_Driving) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CalRouteType_Walking) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CalRouteType_Transit) & 1) != 0)
    {
      v5 = 3;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CalRouteType_Bicycle))
    {
      v5 = 4;
    }
    else
    {
      v5 = -1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

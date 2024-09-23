@implementation CTGeofenceInfo

- (CTGeofenceInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTGeofenceInfo;
  return -[CTGeofenceInfo init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTGeofenceInfo longitude](self, "longitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", longitude=%@"), v4);

  -[CTGeofenceInfo latitude](self, "latitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", latitude=%@"), v5);

  -[CTGeofenceInfo radius](self, "radius");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", radius=%@"), v6);

  -[CTGeofenceInfo geofenceId](self, "geofenceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", geofenceId=%@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTGeofenceInfo longitude](self, "longitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLongitude:", v6);

  -[CTGeofenceInfo latitude](self, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setLatitude:", v8);

  -[CTGeofenceInfo radius](self, "radius");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setRadius:", v10);

  -[CTGeofenceInfo geofenceId](self, "geofenceId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setGeofenceId:", v12);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CTGeofenceInfo longitude](self, "longitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("longitude"));

  -[CTGeofenceInfo latitude](self, "latitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("latitude"));

  -[CTGeofenceInfo radius](self, "radius");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("radius"));

  -[CTGeofenceInfo geofenceId](self, "geofenceId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("geofenceId"));

}

- (CTGeofenceInfo)initWithCoder:(id)a3
{
  id v4;
  CTGeofenceInfo *v5;
  uint64_t v6;
  NSNumber *longitude;
  uint64_t v8;
  NSNumber *latitude;
  uint64_t v10;
  NSNumber *radius;
  uint64_t v12;
  NSString *geofenceId;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTGeofenceInfo;
  v5 = -[CTGeofenceInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longitude"));
    v6 = objc_claimAutoreleasedReturnValue();
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latitude"));
    v8 = objc_claimAutoreleasedReturnValue();
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radius"));
    v10 = objc_claimAutoreleasedReturnValue();
    radius = v5->_radius;
    v5->_radius = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geofenceId"));
    v12 = objc_claimAutoreleasedReturnValue();
    geofenceId = v5->_geofenceId;
    v5->_geofenceId = (NSString *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (NSNumber)radius
{
  return self->_radius;
}

- (void)setRadius:(id)a3
{
  objc_storeStrong((id *)&self->_radius, a3);
}

- (NSString)geofenceId
{
  return self->_geofenceId;
}

- (void)setGeofenceId:(id)a3
{
  objc_storeStrong((id *)&self->_geofenceId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geofenceId, 0);
  objc_storeStrong((id *)&self->_radius, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
}

@end

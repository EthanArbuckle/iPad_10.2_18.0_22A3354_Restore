@implementation MCGeofenceInfo

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_longitude)
    objc_msgSend(v3, "appendFormat:", CFSTR("Longitude : %@\n"), self->_longitude);
  if (self->_latitude)
    objc_msgSend(v4, "appendFormat:", CFSTR("Latitude  : %@\n"), self->_latitude);
  if (self->_radius)
    objc_msgSend(v4, "appendFormat:", CFSTR("Radius    : %@\n"), self->_radius);
  if (self->_geofenceId)
    objc_msgSend(v4, "appendFormat:", CFSTR("Id        : %@\n"), self->_geofenceId);
  return v4;
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

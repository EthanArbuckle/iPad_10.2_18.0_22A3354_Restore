@implementation _AFLocationSnapshotMutation

- (_AFLocationSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFLocationSnapshotMutation *v6;
  _AFLocationSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFLocationSnapshotMutation;
  v6 = -[_AFLocationSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getLatitude
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_latitude;
  }
  else
  {
    -[AFLocationSnapshot latitude](self->_base, "latitude");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getLongitude
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_longitude;
  }
  else
  {
    -[AFLocationSnapshot longitude](self->_base, "longitude");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getAltitude
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_altitude;
  }
  else
  {
    -[AFLocationSnapshot altitude](self->_base, "altitude");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAltitude:(id)a3
{
  objc_storeStrong((id *)&self->_altitude, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getDirection
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_direction;
  }
  else
  {
    -[AFLocationSnapshot direction](self->_base, "direction");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDirection:(id)a3
{
  objc_storeStrong((id *)&self->_direction, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getSpeed
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_speed;
  }
  else
  {
    -[AFLocationSnapshot speed](self->_base, "speed");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_speed, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getVerticalAccuracy
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_verticalAccuracy;
  }
  else
  {
    -[AFLocationSnapshot verticalAccuracy](self->_base, "verticalAccuracy");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setVerticalAccuracy:(id)a3
{
  objc_storeStrong((id *)&self->_verticalAccuracy, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getHorizontalAccuracy
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_horizontalAccuracy;
  }
  else
  {
    -[AFLocationSnapshot horizontalAccuracy](self->_base, "horizontalAccuracy");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHorizontalAccuracy:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalAccuracy, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getPreciseLocationEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_preciseLocationEnabled;
  else
    return -[AFLocationSnapshot preciseLocationEnabled](self->_base, "preciseLocationEnabled");
}

- (void)setPreciseLocationEnabled:(BOOL)a3
{
  self->_preciseLocationEnabled = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (int64_t)getAccessState
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
    return self->_accessState;
  else
    return -[AFLocationSnapshot accessState](self->_base, "accessState");
}

- (void)setAccessState:(int64_t)a3
{
  self->_accessState = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_verticalAccuracy, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end

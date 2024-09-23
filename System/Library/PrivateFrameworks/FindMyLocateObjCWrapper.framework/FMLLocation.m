@implementation FMLLocation

- (FMLLocation)initWithAddress:(id)a3 altitude:(double)a4 longitude:(double)a5 speed:(double)a6 floorLevel:(int)a7 horizontalAccuracy:(double)a8 labels:(id)a9 latitude:(double)a10 timestamp:(double)a11 verticalAccuracy:(double)a12 locationType:(int64_t)a13 coarseAddressLabel:(id)a14
{
  uint64_t v21;
  id v26;
  id v27;
  id v28;
  FMLLocation *v29;
  FMLLocation *v30;
  void *v31;
  objc_super v33;

  v21 = *(_QWORD *)&a7;
  v26 = a3;
  v27 = a9;
  v28 = a14;
  v33.receiver = self;
  v33.super_class = (Class)FMLLocation;
  v29 = -[FMLLocation init](&v33, sel_init);
  v30 = v29;
  if (v29)
  {
    -[FMLLocation setAddress:](v29, "setAddress:", v26);
    -[FMLLocation setAltitude:](v30, "setAltitude:", a4);
    -[FMLLocation setLongitude:](v30, "setLongitude:", a5);
    -[FMLLocation setSpeed:](v30, "setSpeed:", a6);
    -[FMLLocation setFloorLevel:](v30, "setFloorLevel:", v21);
    -[FMLLocation setHorizontalAccuracy:](v30, "setHorizontalAccuracy:", a8);
    v31 = (void *)objc_msgSend(v27, "copy");
    -[FMLLocation setLabels:](v30, "setLabels:", v31);

    -[FMLLocation setLatitude:](v30, "setLatitude:", a10);
    -[FMLLocation setLongitude:](v30, "setLongitude:", a5);
    -[FMLLocation setTimestamp:](v30, "setTimestamp:", a11);
    -[FMLLocation setVerticalAccuracy:](v30, "setVerticalAccuracy:", a12);
    -[FMLLocation setLocationType:](v30, "setLocationType:", a13);
    -[FMLLocation setCoarseAddressLabel:](v30, "setCoarseAddressLabel:", v28);
  }

  return v30;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FMLLocation longitude](self, "longitude");
  v5 = v4;
  -[FMLLocation latitude](self, "latitude");
  v7 = v6;
  -[FMLLocation locationTypeDescription](self, "locationTypeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLLocation coarseAddressLabel](self, "coarseAddressLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[FMLLocation coarseAddressLabel](self, "coarseAddressLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("longitude:%.2f latitude:%.2f type:%@ coarseAddressLabel:%@"), v5, v7, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("longitude:%.2f latitude:%.2f type:%@ coarseAddressLabel:%@"), v5, v7, v8, &stru_250C9FBD0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[FMLLocation description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)locationTypeDescription
{
  unint64_t v2;

  v2 = self->_locationType - 1;
  if (v2 > 2)
    return CFSTR("legacy");
  else
    return off_250C9E658[v2];
}

- (FMLPlaceMark)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (int)floorLevel
{
  return self->_floorLevel;
}

- (void)setFloorLevel:(int)a3
{
  self->_floorLevel = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)coarseAddressLabel
{
  return self->_coarseAddressLabel;
}

- (void)setCoarseAddressLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coarseAddressLabel, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end

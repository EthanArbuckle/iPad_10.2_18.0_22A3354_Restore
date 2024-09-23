@implementation GEORoadMatch

- (GEORoadMatch)initWithCoordinateOnRoad:(id)a3 courseOnRoad:(double)a4
{
  double var2;
  double var1;
  double var0;
  GEORoadMatch *result;
  objc_super v9;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v9.receiver = self;
  v9.super_class = (Class)GEORoadMatch;
  result = -[GEORoadMatch init](&v9, sel_init);
  if (result)
  {
    result->_coordinateOnRoad.latitude = var0;
    result->_coordinateOnRoad.longitude = var1;
    result->_coordinateOnRoad.altitude = var2;
    result->_courseOnRoad = a4;
  }
  return result;
}

- (void)setRoadFeature:(id)a3
{
  objc_storeStrong((id *)&self->_roadFeature, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORoadMatch)initWithCoder:(id)a3
{
  id v4;
  GEORoadMatch *v5;
  id v6;
  const void *v7;
  size_t v8;
  double v9;
  GEORoadMatch *v10;
  unint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEORoadMatch;
  v5 = -[GEORoadMatch init](&v13, sel_init);
  if (v5)
  {
    v12 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_coordinateOnRoad"), &v12);
    if (v12 && v7)
    {
      if (v12 >= 0x18)
        v8 = 24;
      else
        v8 = v12;
      memcpy(&v5->_coordinateOnRoad, v7, v8);
    }
    objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("_courseOnRoad"));
    v5->_courseOnRoad = v9;
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_coordinateOnRoad, 24, CFSTR("_coordinateOnRoad"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_courseOnRoad"), self->_courseOnRoad);

}

- (GEOMultiSectionFeature)roadFeature
{
  return self->_roadFeature;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (void)setRoadName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnRoad
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_coordinateOnRoad.latitude;
  longitude = self->_coordinateOnRoad.longitude;
  altitude = self->_coordinateOnRoad.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinateOnRoad:(id)a3
{
  self->_coordinateOnRoad = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (double)courseOnRoad
{
  return self->_courseOnRoad;
}

- (void)setCourseOnRoad:(double)a3
{
  self->_courseOnRoad = a3;
}

- (double)distanceFromRoad
{
  return self->_distanceFromRoad;
}

- (void)setDistanceFromRoad:(double)a3
{
  self->_distanceFromRoad = a3;
}

- (double)roadWidth
{
  return self->_roadWidth;
}

- (void)setRoadWidth:(double)a3
{
  self->_roadWidth = a3;
}

- (double)distanceFromJunction
{
  return self->_distanceFromJunction;
}

- (void)setDistanceFromJunction:(double)a3
{
  self->_distanceFromJunction = a3;
}

- (double)junctionRadius
{
  return self->_junctionRadius;
}

- (void)setJunctionRadius:(double)a3
{
  self->_junctionRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_roadFeature, 0);
}

@end

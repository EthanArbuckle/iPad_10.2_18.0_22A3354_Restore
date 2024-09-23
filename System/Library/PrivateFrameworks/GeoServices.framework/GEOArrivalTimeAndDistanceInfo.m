@implementation GEOArrivalTimeAndDistanceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOArrivalTimeAndDistanceInfo)initWithCoder:(id)a3
{
  id v4;
  GEOArrivalTimeAndDistanceInfo *v5;
  uint64_t v6;
  NSArray *arrivalTimeInfo;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOArrivalTimeAndDistanceInfo;
  v5 = -[GEOArrivalTimeAndDistanceInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_arrivalTimeInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    arrivalTimeInfo = v5->_arrivalTimeInfo;
    v5->_arrivalTimeInfo = (NSArray *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distanceRemainingToEndOfLeg"));
    v5->_distanceRemainingToEndOfLeg = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distanceRemainingToEndOfRoute"));
    v5->_distanceRemainingToEndOfRoute = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *arrivalTimeInfo;
  id v5;

  arrivalTimeInfo = self->_arrivalTimeInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", arrivalTimeInfo, CFSTR("_arrivalTimeInfo"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distanceRemainingToEndOfLeg"), self->_distanceRemainingToEndOfLeg);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distanceRemainingToEndOfRoute"), self->_distanceRemainingToEndOfRoute);

}

- (NSArray)arrivalTimeInfo
{
  return self->_arrivalTimeInfo;
}

- (void)setArrivalTimeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalTimeInfo, a3);
}

- (double)distanceRemainingToEndOfLeg
{
  return self->_distanceRemainingToEndOfLeg;
}

- (void)setDistanceRemainingToEndOfLeg:(double)a3
{
  self->_distanceRemainingToEndOfLeg = a3;
}

- (double)distanceRemainingToEndOfRoute
{
  return self->_distanceRemainingToEndOfRoute;
}

- (void)setDistanceRemainingToEndOfRoute:(double)a3
{
  self->_distanceRemainingToEndOfRoute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalTimeInfo, 0);
}

@end

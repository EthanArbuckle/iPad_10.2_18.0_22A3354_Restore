@implementation GEORerouteInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORerouteInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSDate *v9;
  NSDate *time;
  double v11;
  GEORerouteInfo *v12;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("DistancePenaltyKey"));
    self->_distancePenalty = v6;
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("ThrottledReroutesPenaltyKey"));
    self->_throttledReroutesPenalty = v7;
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("PenaltyKey"));
    self->_penalty = v8;
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimeKey"));
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    time = self->_time;
    self->_time = v9;

    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("DistanceFromDestinationKey"));
    self->_distanceFromDestination = v11;
    v12 = self;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("DistancePenaltyKey"), self->_distancePenalty);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ThrottledReroutesPenaltyKey"), self->_throttledReroutesPenalty);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("PenaltyKey"), self->_penalty);
  objc_msgSend(v4, "encodeObject:forKey:", self->_time, CFSTR("TimeKey"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("DistanceFromDestinationKey"), self->_distanceFromDestination);

}

- (void)updateWithCurrentTime:(id)a3 location:(id)a4 isMostRecentReroute:(BOOL)a5 destinationCoordinate:(id)a6 numThrottledReroutes:(unint64_t)a7
{
  double var1;
  double var0;
  _BOOL4 v10;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  id v25;

  var1 = a6.var1;
  var0 = a6.var0;
  v10 = a5;
  v25 = a3;
  v13 = a4;
  v14 = v13;
  if (v10)
  {
    objc_msgSend(v13, "latLng");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coordinate");
    v17 = v16;
    v19 = v18;

    v20 = GEOCalculateDistanceRadius(v17, v19, var0, var1, 6367000.0) - self->_distanceFromDestination;
    if (v20 > 100.0)
      self->_distancePenalty = (v20 + -100.0) * 0.002;
    self->_throttledReroutesPenalty = (1.0 - pow((double)(a7 + 1), -0.7)) * 0.2;
  }
  objc_msgSend(v25, "timeIntervalSinceDate:", self->_time);
  v22 = v21 / 600.0;
  if (v22 < 0.0)
    v22 = 0.0;
  if (v22 > 1.0)
    v22 = 1.0;
  v23 = self->_distancePenalty + 0.2 + self->_throttledReroutesPenalty;
  v24 = v22;
  self->_penalty = v23 + (0.0 - v23) * v24;

}

- (double)penalty
{
  return self->_penalty;
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (double)distanceFromDestination
{
  return self->_distanceFromDestination;
}

- (void)setDistanceFromDestination:(double)a3
{
  self->_distanceFromDestination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
}

@end

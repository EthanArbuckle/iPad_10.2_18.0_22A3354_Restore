@implementation GEOComposedETARouteStep

- (GEOComposedETARouteStep)init
{
  GEOComposedETARouteStep *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOComposedETARouteStep;
  result = -[GEOComposedETARouteStep init](&v3, sel_init);
  if (result)
    result->_routeCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
  return result;
}

- (NSString)description
{
  return (NSString *)-[GEOComposedETARouteStep descriptionWithPrecision:](self, "descriptionWithPrecision:", 0);
}

- (id)descriptionWithPrecision:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  unint64_t stepID;
  void *v9;
  void *v10;

  v5 = self->_length / self->_travelDuration;
  v6 = v5 * 2.237;
  v7 = (void *)MEMORY[0x1E0CB37A0];
  stepID = self->_stepID;
  GEOPolylineCoordinateRangeAsString(*(_QWORD *)&self->_routeCoordinateRange.start, *(_QWORD *)&self->_routeCoordinateRange.end, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%*d: [%@] %gm, %gs, %0.1f mph"), a3, stepID, v9, *(_QWORD *)&self->_length, *(_QWORD *)&self->_travelDuration, *(_QWORD *)&v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[GEOTimeCheckpoints distToNextCheckpointsCount](self->_timeCheckpoints, "distToNextCheckpointsCount"))
    objc_msgSend(v10, "appendFormat:", CFSTR(" | timeCheckpoints: %d"), -[GEOTimeCheckpoints distToNextCheckpointsCount](self->_timeCheckpoints, "distToNextCheckpointsCount"));
  return v10;
}

- (double)distance
{
  return self->_length;
}

- (double)travelTime
{
  return self->_travelDuration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedETARouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedETARouteStep *v5;
  id v6;
  const void *v7;
  size_t v8;
  double v9;
  double v10;
  uint64_t v11;
  GEOTimeCheckpoints *timeCheckpoints;
  unint64_t v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedETARouteStep;
  v5 = -[GEOComposedETARouteStep init](&v15, sel_init);
  if (v5)
  {
    v5->_stepID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepID"));
    v14 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinateRange"), &v14);
    if (v14 && v7)
    {
      if (v14 >= 0x10)
        v8 = 16;
      else
        v8 = v14;
      memcpy(&v5->_routeCoordinateRange, v7, v8);
    }
    objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("_travelDuration"));
    v5->_travelDuration = v9;
    objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("_length"));
    v5->_length = v10;
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timeCheckpoints"));
    v11 = objc_claimAutoreleasedReturnValue();
    timeCheckpoints = v5->_timeCheckpoints;
    v5->_timeCheckpoints = (GEOTimeCheckpoints *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t stepID;
  id v5;

  stepID = self->_stepID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", stepID, CFSTR("_stepID"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_routeCoordinateRange, 16, CFSTR("_routeCoordinateRange"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_travelDuration"), self->_travelDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_length"), self->_length);
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeCheckpoints, CFSTR("_timeCheckpoints"));

}

- (unint64_t)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unint64_t)a3
{
  self->_stepID = a3;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_routeCoordinateRange.end;
  start = self->_routeCoordinateRange.start;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setRouteCoordinateRange:(GEOPolylineCoordinateRange)a3
{
  self->_routeCoordinateRange = a3;
}

- (double)travelDuration
{
  return self->_travelDuration;
}

- (void)setTravelDuration:(double)a3
{
  self->_travelDuration = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (GEOTimeCheckpoints)timeCheckpoints
{
  return self->_timeCheckpoints;
}

- (void)setTimeCheckpoints:(id)a3
{
  objc_storeStrong((id *)&self->_timeCheckpoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeCheckpoints, 0);
}

@end

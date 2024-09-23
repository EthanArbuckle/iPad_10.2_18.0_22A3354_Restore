@implementation RTDistanceInterval

- (RTDistanceInterval)initWithStartDistance:(double)a3 endDistance:(double)a4
{
  RTDistanceInterval *v6;
  RTDistanceInterval *v7;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RTDistanceInterval;
  v6 = -[RTDistanceInterval init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_startDistance = a3;
    if (a3 <= a4)
    {
      v6->_endDistance = a4;
      v6->_intervalLength = a4 - a3;
    }
    else
    {
      v6->_endDistance = a3;
      v6->_intervalLength = 0.0;
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "RTDistanceInterval: startDistance > endDistance. Negative distances not supported, assigning endDistance = startDistance.", v10, 2u);
      }

    }
  }
  return v7;
}

- (RTDistanceInterval)initWithStartDate:(double)a3 length:(double)a4
{
  return -[RTDistanceInterval initWithStartDistance:endDistance:](self, "initWithStartDistance:endDistance:", a3, a3 + a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double startDistance;
  id v5;

  startDistance = self->_startDistance;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("startDistance"), startDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("endDistance"), self->_endDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("intervalLength"), self->_intervalLength);

}

- (RTDistanceInterval)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startDistance"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endDistance"));
  v8 = v7;

  return -[RTDistanceInterval initWithStartDistance:endDistance:](self, "initWithStartDistance:endDistance:", v6, v8);
}

- (BOOL)isEqual:(id)a3
{
  double startDistance;
  id v5;
  double v6;
  BOOL v7;
  double endDistance;
  double v9;
  double v10;
  double intervalLength;
  double v12;
  double v13;
  BOOL v14;

  startDistance = self->_startDistance;
  v5 = a3;
  objc_msgSend(v5, "startDistance");
  v7 = startDistance == v6;
  endDistance = self->_endDistance;
  objc_msgSend(v5, "endDistance");
  v10 = v9;
  intervalLength = self->_intervalLength;
  objc_msgSend(v5, "intervalLength");
  v13 = v12;

  v14 = endDistance == v10 && v7;
  return intervalLength == v13 && v14;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("startDistance,%.3f,endDistance,%.3f,intervalLength,%.3f"), *(_QWORD *)&self->_startDistance, *(_QWORD *)&self->_endDistance, *(_QWORD *)&self->_intervalLength);
}

- (double)startDistance
{
  return self->_startDistance;
}

- (double)endDistance
{
  return self->_endDistance;
}

- (double)intervalLength
{
  return self->_intervalLength;
}

@end

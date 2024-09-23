@implementation GEOAlmanacRiseTransitSet

- (GEOAlmanacRiseTransitSet)initWithRise:(const _GEORiseTransitSetEvent *)a3 transit:(const _GEORiseTransitSetEvent *)a4 set:(const _GEORiseTransitSetEvent *)a5
{
  GEOAlmanacRiseTransitSet *result;
  double JD;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GEOAlmanacRiseTransitSet;
  result = -[GEOAlmanacRiseTransitSet init](&v12, sel_init);
  if (result)
  {
    JD = a3->JD;
    result->_rise.type = a3->type;
    result->_rise.JD = JD;
    v10 = a4->JD;
    result->_transit.type = a4->type;
    result->_transit.JD = v10;
    v11 = a5->JD;
    result->_set.type = a5->type;
    result->_set.JD = v11;
  }
  return result;
}

- (NSDate)rise
{
  void *v2;

  if (self->_rise.JD <= 0.0
    || (objc_msgSend(MEMORY[0x1E0C99D68], "geo_dateWithJulianDay:"),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (NSDate)transit
{
  void *v2;

  if (self->_transit.JD <= 0.0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "geo_dateWithJulianDay:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (NSDate)set
{
  void *v2;

  if (self->_set.JD <= 0.0
    || (objc_msgSend(MEMORY[0x1E0C99D68], "geo_dateWithJulianDay:"),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p> {\n"), v5, self);

  StringFromGEOSolarEventType(self->_rise.type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  %@: %f\n"), v6, *(_QWORD *)&self->_rise.JD);

  StringFromGEOSolarEventType(self->_transit.type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  %@: %f\n"), v7, *(_QWORD *)&self->_transit.JD);

  StringFromGEOSolarEventType(self->_set.type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  %@: %f\n"), v8, *(_QWORD *)&self->_set.JD);

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (BOOL)isIdeal
{
  double JD;
  double v3;
  double v4;
  BOOL v5;

  JD = self->_rise.JD;
  if (JD <= 0.0)
    return 0;
  v3 = self->_transit.JD;
  if (v3 <= 0.0)
    return 0;
  v4 = self->_set.JD;
  v5 = JD < v3;
  if (v4 <= 0.0)
    v5 = 0;
  return v3 < v4 && v5;
}

- (_GEORiseTransitSetEvent)firstItem
{
  _GEORiseTransitSetEvent *p_transit;
  double JD;
  double v4;
  double v5;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  _GEORiseTransitSetEvent result;

  p_transit = &self->_transit;
  JD = self->_transit.JD;
  v4 = 1.79769313e308;
  if (self->_rise.JD <= 0.0)
    v5 = 1.79769313e308;
  else
    v5 = self->_rise.JD;
  if (JD <= 0.0)
    JD = 1.79769313e308;
  if (self->_set.JD > 0.0)
    v4 = self->_set.JD;
  if (v5 < JD && v5 < v4)
  {
    v8 = self->_rise.JD;
    v7 = 16;
  }
  else
  {
    v7 = 48;
    if (JD < v5 && JD < v4)
      v7 = 32;
    else
      p_transit = &self->_set;
    v8 = p_transit->JD;
  }
  v9 = *(uint64_t *)((char *)&self->super.isa + v7);
  v10 = v8;
  result.type = v9;
  result.JD = v10;
  return result;
}

- (_GEORiseTransitSetEvent)lastItem
{
  _GEORiseTransitSetEvent *p_transit;
  double JD;
  double v4;
  double v5;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  _GEORiseTransitSetEvent result;

  p_transit = &self->_transit;
  JD = self->_transit.JD;
  v4 = 2.22507386e-308;
  if (self->_rise.JD <= 0.0)
    v5 = 2.22507386e-308;
  else
    v5 = self->_rise.JD;
  if (JD <= 0.0)
    JD = 2.22507386e-308;
  if (self->_set.JD > 0.0)
    v4 = self->_set.JD;
  if (v5 <= JD || v5 <= v4)
  {
    v8 = 48;
    if (JD > v5 && JD > v4)
      v8 = 32;
    else
      p_transit = &self->_set;
    v7 = p_transit->JD;
  }
  else
  {
    v7 = self->_rise.JD;
    v8 = 16;
  }
  v9 = *(uint64_t *)((char *)&self->super.isa + v8);
  v10 = v7;
  result.type = v9;
  result.JD = v10;
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0xBFF0000000000000;
  *((_DWORD *)self + 4) = -1;
  *((_QWORD *)self + 3) = 0xBFF0000000000000;
  *((_DWORD *)self + 8) = -1;
  *((_QWORD *)self + 5) = 0xBFF0000000000000;
  *((_DWORD *)self + 12) = -1;
  return self;
}

@end

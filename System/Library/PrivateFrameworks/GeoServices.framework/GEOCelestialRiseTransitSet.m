@implementation GEOCelestialRiseTransitSet

- (id).cxx_construct
{
  *((_BYTE *)self + 16) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_WORD *)self + 16) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_BYTE *)self + 48) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (int)_numberOfEvents
{
  return self->_riseTransitSet.bTransitValid + self->_riseTransitSet.bRiseValid + self->_riseTransitSet.bSetValid;
}

- (GEOCelestialRiseTransitSet)initWithJulianDay:(double)a3 riseTransitSet:(CAARiseTransitSetDetails *)a4
{
  GEOCelestialRiseTransitSet *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOCelestialRiseTransitSet;
  result = -[GEOCelestialRiseTransitSet init](&v9, sel_init);
  if (result)
  {
    result->_julianDay = a3;
    v7 = *(_OWORD *)&a4->bRiseValid;
    v8 = *(_OWORD *)&a4->bSetValid;
    *(_OWORD *)&result->_riseTransitSet.bTransitValid = *(_OWORD *)&a4->bTransitValid;
    *(_OWORD *)&result->_riseTransitSet.bSetValid = v8;
    *(_OWORD *)&result->_riseTransitSet.bRiseValid = v7;
  }
  return result;
}

- (double)_oldestEventInJulianDay
{
  double Rise;

  if (self->_riseTransitSet.bRiseValid)
  {
    Rise = 1.79769313e308;
    if (self->_riseTransitSet.Rise < 1.79769313e308)
      Rise = self->_riseTransitSet.Rise;
  }
  else
  {
    Rise = 1.79769313e308;
  }
  if (self->_riseTransitSet.bTransitValid && self->_riseTransitSet.Transit < Rise)
    Rise = self->_riseTransitSet.Transit;
  if (self->_riseTransitSet.bSetValid && self->_riseTransitSet.Set < Rise)
    Rise = self->_riseTransitSet.Set;
  return self->_julianDay + Rise / 24.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_transit, 0);
  objc_storeStrong((id *)&self->_rise, 0);
}

- (id)_dateFromOffset:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "geo_dateWithJulianDay:", a3 / 24.0 + self->_julianDay);
}

- (NSDate)rise
{
  NSDate *rise;
  NSDate *v4;
  NSDate *v5;

  rise = self->_rise;
  if (!rise)
  {
    if (self->_riseTransitSet.bRiseValid)
    {
      -[GEOCelestialRiseTransitSet _dateFromOffset:](self, "_dateFromOffset:", self->_riseTransitSet.Rise);
      v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v5 = self->_rise;
      self->_rise = v4;

      rise = self->_rise;
    }
    else
    {
      rise = 0;
    }
  }
  return rise;
}

- (NSDate)transit
{
  NSDate *transit;
  NSDate *v4;
  NSDate *v5;

  transit = self->_transit;
  if (!transit)
  {
    if (self->_riseTransitSet.bTransitValid)
    {
      -[GEOCelestialRiseTransitSet _dateFromOffset:](self, "_dateFromOffset:", self->_riseTransitSet.Transit);
      v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v5 = self->_transit;
      self->_transit = v4;

      transit = self->_transit;
    }
    else
    {
      transit = 0;
    }
  }
  return transit;
}

- (NSDate)set
{
  NSDate *set;
  NSDate *v4;
  NSDate *v5;

  set = self->_set;
  if (!set)
  {
    if (self->_riseTransitSet.bSetValid)
    {
      -[GEOCelestialRiseTransitSet _dateFromOffset:](self, "_dateFromOffset:", self->_riseTransitSet.Set);
      v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v5 = self->_set;
      self->_set = v4;

      set = self->_set;
    }
    else
    {
      set = 0;
    }
  }
  return set;
}

- (BOOL)isTransitAboveHorizon
{
  return self->_riseTransitSet.bTransitAboveHorizon;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  double julianDay;
  const char *v7;
  double Rise;
  void *v9;
  const char *v10;
  double Transit;
  void *v12;
  _BOOL4 bSetValid;
  double Set;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  julianDay = self->_julianDay;
  if (self->_riseTransitSet.bRiseValid)
    v7 = "YES";
  else
    v7 = "NO";
  Rise = self->_riseTransitSet.Rise;
  v20 = (void *)v5;
  -[GEOCelestialRiseTransitSet rise](self, "rise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_riseTransitSet.bTransitValid)
    v10 = "YES";
  else
    v10 = "NO";
  Transit = self->_riseTransitSet.Transit;
  -[GEOCelestialRiseTransitSet transit](self, "transit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  bSetValid = self->_riseTransitSet.bSetValid;
  Set = self->_riseTransitSet.Set;
  -[GEOCelestialRiseTransitSet set](self, "set");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (bSetValid)
    v17 = "YES";
  else
    v17 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p jd: %f rise %s:%f:%@ transit %s:%f:%@ set %s:%f:%@>"), v20, self, *(_QWORD *)&julianDay, v7, *(_QWORD *)&Rise, v9, v10, *(_QWORD *)&Transit, v12, v17, *(_QWORD *)&Set, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)julianDay
{
  return self->_julianDay;
}

- (CAARiseTransitSetDetails)riseTransitSet
{
  __int128 v3;

  v3 = *(_OWORD *)&self->bSetValid;
  *(_OWORD *)&retstr->bRiseValid = *(_OWORD *)&self->bTransitValid;
  *(_OWORD *)&retstr->bTransitValid = v3;
  *(_OWORD *)&retstr->bSetValid = *(_OWORD *)&self[1].bRiseValid;
  return self;
}

@end

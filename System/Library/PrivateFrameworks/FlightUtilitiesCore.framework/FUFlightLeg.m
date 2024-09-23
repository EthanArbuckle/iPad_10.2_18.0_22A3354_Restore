@implementation FUFlightLeg

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[FUFlightLeg status](self, "status");
    if (v7 == objc_msgSend(v6, "status"))
    {
      -[FUFlightLeg duration](self, "duration");
      v9 = v8;
      objc_msgSend(v6, "duration");
      if (v9 == v10)
      {
        -[FUFlightLeg baggageClaim](self, "baggageClaim");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "baggageClaim");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 != v12)
        {
          -[FUFlightLeg baggageClaim](self, "baggageClaim");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "baggageClaim");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v4))
          {
            v13 = 0;
            goto LABEL_19;
          }
        }
        -[FUFlightLeg arrival](self, "arrival");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "arrival");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 != v16)
        {
          -[FUFlightLeg arrival](self, "arrival");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "arrival");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "isEqual:", v18))
          {
            v13 = 0;
            goto LABEL_17;
          }
          v29 = v18;
          v30 = v17;
        }
        -[FUFlightLeg departure](self, "departure");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "departure");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v19 == (void *)v20)
        {

          v13 = 1;
        }
        else
        {
          v21 = (void *)v20;
          -[FUFlightLeg departure](self, "departure");
          v28 = v3;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "departure");
          v27 = v15;
          v23 = v12;
          v24 = v11;
          v25 = v4;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v22, "isEqual:", v26);

          v4 = v25;
          v11 = v24;
          v12 = v23;
          v15 = v27;

          v3 = v28;
        }
        v18 = v29;
        v17 = v30;
        if (v15 == v16)
        {
LABEL_18:

          if (v11 == v12)
          {
LABEL_20:

            goto LABEL_8;
          }
LABEL_19:

          goto LABEL_20;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (double)currentProgress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;

  -[FUFlightLeg departure](self, "departure");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runwayTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FUFlightLeg arrival](self, "arrival");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runwayTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[FUFlightLeg arrival](self, "arrival");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "time");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "date");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = 0.0;
    if (v10)
    {
      objc_msgSend(v10, "timeIntervalSinceDate:", v5);
      v17 = v16;
      +[FUUtils testDate](FUUtils, "testDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "timeIntervalSinceDate:", v5);
        v21 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceDate:", v5);
        v21 = v23;

      }
      v24 = v21 / v17;

      if (v24 <= 1.0)
      {
        if (v24 >= 0.0)
          v13 = v24;
      }
      else
      {
        v13 = 1.0;
      }
    }
  }
  else
  {
    -[FUFlightLeg departure](self, "departure");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "time");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = 0.0;
    else
      v13 = -1.0;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[FUFlightLeg departure](self, "departure");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "airport");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "IATACode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightLeg arrival](self, "arrival");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "airport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "IATACode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FUFlightLeg status](self, "status") - 1;
  if (v7 > 5)
    v8 = CFSTR("Status not defined");
  else
    v8 = off_24D21B9C8[v7];
  -[FUFlightLeg departure](self, "departure");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightLeg arrival](self, "arrival");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "time");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightLeg baggageClaim](self, "baggageClaim");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Leg: %@ => %@ %@ Takeoff %@ Landing %@ baggage %@"), v3, v6, v8, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[FUFlightLeg status](self, "status"), CFSTR("status"));
  -[FUFlightLeg duration](self, "duration");
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("duration"));
  -[FUFlightLeg departure](self, "departure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUFlightLeg departure](self, "departure");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("departure"));

  }
  -[FUFlightLeg arrival](self, "arrival");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FUFlightLeg arrival](self, "arrival");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("arrival"));

  }
  -[FUFlightLeg baggageClaim](self, "baggageClaim");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FUFlightLeg baggageClaim](self, "baggageClaim");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("baggageClaim"));

  }
}

- (FUFlightLeg)initWithCoder:(id)a3
{
  id v4;
  FUFlightLeg *v5;
  double v6;
  uint64_t v7;
  FUFlightStep *departure;
  uint64_t v9;
  FUFlightStep *arrival;
  uint64_t v11;
  NSString *baggageClaim;
  FUFlightLeg *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FUFlightLeg;
  v5 = -[FUFlightLeg init](&v15, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departure"));
    v7 = objc_claimAutoreleasedReturnValue();
    departure = v5->_departure;
    v5->_departure = (FUFlightStep *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrival"));
    v9 = objc_claimAutoreleasedReturnValue();
    arrival = v5->_arrival;
    v5->_arrival = (FUFlightStep *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baggageClaim"));
    v11 = objc_claimAutoreleasedReturnValue();
    baggageClaim = v5->_baggageClaim;
    v5->_baggageClaim = (NSString *)v11;

    v13 = v5;
  }

  return v5;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (FUFlightStep)departure
{
  return (FUFlightStep *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeparture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FUFlightStep)arrival
{
  return (FUFlightStep *)objc_getProperty(self, a2, 32, 1);
}

- (void)setArrival:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)baggageClaim
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBaggageClaim:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baggageClaim, 0);
  objc_storeStrong((id *)&self->_arrival, 0);
  objc_storeStrong((id *)&self->_departure, 0);
}

@end

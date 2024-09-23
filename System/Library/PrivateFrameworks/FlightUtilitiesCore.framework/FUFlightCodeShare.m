@implementation FUFlightCodeShare

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FUFlightCodeShare airline](self, "airline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[FUFlightCodeShare airline](self, "airline"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "airline"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v10 = -[FUFlightCodeShare flightNumber](self, "flightNumber");
      v9 = v10 == objc_msgSend(v6, "flightNumber");
      if (v7 == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FUFlightCodeShare airline](self, "airline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUFlightCodeShare airline](self, "airline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("airline"));

  }
  objc_msgSend(v6, "encodeInteger:forKey:", -[FUFlightCodeShare flightNumber](self, "flightNumber"), CFSTR("flightNumber"));

}

- (FUFlightCodeShare)initWithCoder:(id)a3
{
  id v4;
  FUFlightCodeShare *v5;
  uint64_t v6;
  FUAirline *airline;
  FUFlightCodeShare *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FUFlightCodeShare;
  v5 = -[FUFlightCodeShare init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airline"));
    v6 = objc_claimAutoreleasedReturnValue();
    airline = v5->_airline;
    v5->_airline = (FUAirline *)v6;

    v5->_flightNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flightNumber"));
    v8 = v5;
  }

  return v5;
}

- (FUAirline)airline
{
  return (FUAirline *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAirline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)flightNumber
{
  return self->_flightNumber;
}

- (void)setFlightNumber:(unint64_t)a3
{
  self->_flightNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airline, 0);
}

@end

@implementation FHTripPart

- (FHTripPart)initWithPPTripPart:(id)a3
{
  id v4;
  FHTripPart *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHTripPart;
  v5 = -[FHTripPart init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "eventIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTripPart setEventIdentifiers:](v5, "setEventIdentifiers:", v6);

    objc_msgSend(v4, "mainLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTripPart setMainLocation:](v5, "setMainLocation:", v7);

    v8 = objc_msgSend(v4, "tripMode");
    if (v8 >= 3)
      v9 = 3;
    else
      v9 = v8;
    -[FHTripPart setTripMode:](v5, "setTripMode:", v9);
  }

  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("eventIdentifiers"), self->_eventIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("mainLocation"), self->_mainLocation);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("tripMode"), self->_tripMode);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (void)setEventIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CLPlacemark)mainLocation
{
  return self->_mainLocation;
}

- (void)setMainLocation:(id)a3
{
  objc_storeStrong((id *)&self->_mainLocation, a3);
}

- (unint64_t)tripMode
{
  return self->_tripMode;
}

- (void)setTripMode:(unint64_t)a3
{
  self->_tripMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainLocation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
}

@end

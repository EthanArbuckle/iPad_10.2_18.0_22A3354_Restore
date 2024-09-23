@implementation MKETAResponse

- (MKETAResponse)initWithSource:(id)a3 destination:(id)a4 expectedTravelTime:(double)a5 distance:(double)a6 sortedETAs:(id)a7
{
  id v13;
  id v14;
  id v15;
  MKETAResponse *v16;
  MKETAResponse *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  NSDate *expectedDepartureDate;
  void *v24;
  double v25;
  uint64_t v26;
  NSDate *expectedArrivalDate;
  MKETAResponse *v28;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MKETAResponse;
  v16 = -[MKETAResponse init](&v30, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_source, a3);
    objc_storeStrong((id *)&v17->_destination, a4);
    v17->_expectedTravelTime = a5;
    v17->_distance = a6;
    objc_storeStrong((id *)&v17->_sortedETAs, a7);
    -[NSArray firstObject](v17->_sortedETAs, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[NSArray firstObject](v17->_sortedETAs, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_transportType = -[MKETAResponse _transportType:](v17, "_transportType:", objc_msgSend(v19, "transportType"));
      objc_msgSend(v19, "expectedTimeOfDeparture");
      if (v20 > 0.0)
      {
        v21 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v19, "expectedTimeOfDeparture");
        objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
        v22 = objc_claimAutoreleasedReturnValue();
        expectedDepartureDate = v17->_expectedDepartureDate;
        v17->_expectedDepartureDate = (NSDate *)v22;

        v24 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v19, "expectedTimeOfDeparture");
        objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:", v25 + a5);
        v26 = objc_claimAutoreleasedReturnValue();
        expectedArrivalDate = v17->_expectedArrivalDate;
        v17->_expectedArrivalDate = (NSDate *)v26;

      }
    }
    v28 = v17;
  }

  return v17;
}

- (unint64_t)_transportType:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_18B2A9750[a3];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MKETAResponse;
  -[MKETAResponse description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ source: %@ destination: %@ etas: %@"), v4, self->_source, self->_destination, self->_sortedETAs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MKMapItem)source
{
  return self->_source;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (NSTimeInterval)expectedTravelTime
{
  return self->_expectedTravelTime;
}

- (CLLocationDistance)distance
{
  return self->_distance;
}

- (NSArray)_sortedETAs
{
  return self->_sortedETAs;
}

- (MKDirectionsTransportType)transportType
{
  return self->_transportType;
}

- (NSDate)expectedArrivalDate
{
  return self->_expectedArrivalDate;
}

- (void)setExpectedArrivalDate:(id)a3
{
  objc_storeStrong((id *)&self->_expectedArrivalDate, a3);
}

- (NSDate)expectedDepartureDate
{
  return self->_expectedDepartureDate;
}

- (void)setExpectedDepartureDate:(id)a3
{
  objc_storeStrong((id *)&self->_expectedDepartureDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedDepartureDate, 0);
  objc_storeStrong((id *)&self->_expectedArrivalDate, 0);
  objc_storeStrong((id *)&self->_sortedETAs, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end

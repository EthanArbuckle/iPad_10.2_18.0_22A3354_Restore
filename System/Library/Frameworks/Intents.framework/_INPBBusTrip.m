@implementation _INPBBusTrip

- (void)setArrivalBusStopLocation:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalBusStopLocation, a3);
}

- (BOOL)hasArrivalBusStopLocation
{
  return self->_arrivalBusStopLocation != 0;
}

- (void)setArrivalPlatform:(id)a3
{
  NSString *v4;
  NSString *arrivalPlatform;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  arrivalPlatform = self->_arrivalPlatform;
  self->_arrivalPlatform = v4;

}

- (BOOL)hasArrivalPlatform
{
  return self->_arrivalPlatform != 0;
}

- (void)setBusName:(id)a3
{
  NSString *v4;
  NSString *busName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  busName = self->_busName;
  self->_busName = v4;

}

- (BOOL)hasBusName
{
  return self->_busName != 0;
}

- (void)setBusNumber:(id)a3
{
  NSString *v4;
  NSString *busNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  busNumber = self->_busNumber;
  self->_busNumber = v4;

}

- (BOOL)hasBusNumber
{
  return self->_busNumber != 0;
}

- (void)setDepartureBusStopLocation:(id)a3
{
  objc_storeStrong((id *)&self->_departureBusStopLocation, a3);
}

- (BOOL)hasDepartureBusStopLocation
{
  return self->_departureBusStopLocation != 0;
}

- (void)setDeparturePlatform:(id)a3
{
  NSString *v4;
  NSString *departurePlatform;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  departurePlatform = self->_departurePlatform;
  self->_departurePlatform = v4;

}

- (BOOL)hasDeparturePlatform
{
  return self->_departurePlatform != 0;
}

- (void)setProvider:(id)a3
{
  NSString *v4;
  NSString *provider;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  provider = self->_provider;
  self->_provider = v4;

}

- (BOOL)hasProvider
{
  return self->_provider != 0;
}

- (void)setTripDuration:(id)a3
{
  objc_storeStrong((id *)&self->_tripDuration, a3);
}

- (BOOL)hasTripDuration
{
  return self->_tripDuration != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBusTripReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[_INPBBusTrip arrivalBusStopLocation](self, "arrivalBusStopLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBBusTrip arrivalBusStopLocation](self, "arrivalBusStopLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBusTrip arrivalPlatform](self, "arrivalPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBBusTrip busName](self, "busName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[_INPBBusTrip busNumber](self, "busNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_INPBBusTrip departureBusStopLocation](self, "departureBusStopLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBBusTrip departureBusStopLocation](self, "departureBusStopLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBusTrip departurePlatform](self, "departurePlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_INPBBusTrip provider](self, "provider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[_INPBBusTrip tripDuration](self, "tripDuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBBusTrip tripDuration](self, "tripDuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBBusTrip)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBBusTrip *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBBusTrip *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBBusTrip *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBBusTrip initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBBusTrip data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBBusTrip *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v5 = -[_INPBBusTrip init](+[_INPBBusTrip allocWithZone:](_INPBBusTrip, "allocWithZone:"), "init");
  v6 = -[_INPBLocationValue copyWithZone:](self->_arrivalBusStopLocation, "copyWithZone:", a3);
  -[_INPBBusTrip setArrivalBusStopLocation:](v5, "setArrivalBusStopLocation:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_arrivalPlatform, "copyWithZone:", a3);
  -[_INPBBusTrip setArrivalPlatform:](v5, "setArrivalPlatform:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_busName, "copyWithZone:", a3);
  -[_INPBBusTrip setBusName:](v5, "setBusName:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_busNumber, "copyWithZone:", a3);
  -[_INPBBusTrip setBusNumber:](v5, "setBusNumber:", v9);

  v10 = -[_INPBLocationValue copyWithZone:](self->_departureBusStopLocation, "copyWithZone:", a3);
  -[_INPBBusTrip setDepartureBusStopLocation:](v5, "setDepartureBusStopLocation:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_departurePlatform, "copyWithZone:", a3);
  -[_INPBBusTrip setDeparturePlatform:](v5, "setDeparturePlatform:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_provider, "copyWithZone:", a3);
  -[_INPBBusTrip setProvider:](v5, "setProvider:", v12);

  v13 = -[_INPBDateTimeRange copyWithZone:](self->_tripDuration, "copyWithZone:", a3);
  -[_INPBBusTrip setTripDuration:](v5, "setTripDuration:", v13);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  BOOL v47;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[_INPBBusTrip arrivalBusStopLocation](self, "arrivalBusStopLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalBusStopLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBBusTrip arrivalBusStopLocation](self, "arrivalBusStopLocation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBBusTrip arrivalBusStopLocation](self, "arrivalBusStopLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalBusStopLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBBusTrip arrivalPlatform](self, "arrivalPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBBusTrip arrivalPlatform](self, "arrivalPlatform");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBBusTrip arrivalPlatform](self, "arrivalPlatform");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalPlatform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBBusTrip busName](self, "busName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "busName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBBusTrip busName](self, "busName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBBusTrip busName](self, "busName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "busName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBBusTrip busNumber](self, "busNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "busNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBBusTrip busNumber](self, "busNumber");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBBusTrip busNumber](self, "busNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "busNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBBusTrip departureBusStopLocation](self, "departureBusStopLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureBusStopLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBBusTrip departureBusStopLocation](self, "departureBusStopLocation");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBBusTrip departureBusStopLocation](self, "departureBusStopLocation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureBusStopLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBBusTrip departurePlatform](self, "departurePlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departurePlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBBusTrip departurePlatform](self, "departurePlatform");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBBusTrip departurePlatform](self, "departurePlatform");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departurePlatform");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBBusTrip provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBBusTrip provider](self, "provider");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBBusTrip provider](self, "provider");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBBusTrip tripDuration](self, "tripDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tripDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBBusTrip tripDuration](self, "tripDuration");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {

LABEL_45:
      v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    -[_INPBBusTrip tripDuration](self, "tripDuration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tripDuration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if ((v46 & 1) != 0)
      goto LABEL_45;
  }
  else
  {
LABEL_41:

  }
LABEL_42:
  v47 = 0;
LABEL_43:

  return v47;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[_INPBLocationValue hash](self->_arrivalBusStopLocation, "hash");
  v4 = -[NSString hash](self->_arrivalPlatform, "hash") ^ v3;
  v5 = -[NSString hash](self->_busName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_busNumber, "hash");
  v7 = -[_INPBLocationValue hash](self->_departureBusStopLocation, "hash");
  v8 = v7 ^ -[NSString hash](self->_departurePlatform, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_provider, "hash");
  return v9 ^ -[_INPBDateTimeRange hash](self->_tripDuration, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBBusTrip arrivalBusStopLocation](self, "arrivalBusStopLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("arrivalBusStopLocation"));

  if (self->_arrivalPlatform)
  {
    -[_INPBBusTrip arrivalPlatform](self, "arrivalPlatform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("arrivalPlatform"));

  }
  if (self->_busName)
  {
    -[_INPBBusTrip busName](self, "busName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("busName"));

  }
  if (self->_busNumber)
  {
    -[_INPBBusTrip busNumber](self, "busNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("busNumber"));

  }
  -[_INPBBusTrip departureBusStopLocation](self, "departureBusStopLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("departureBusStopLocation"));

  if (self->_departurePlatform)
  {
    -[_INPBBusTrip departurePlatform](self, "departurePlatform");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("departurePlatform"));

  }
  if (self->_provider)
  {
    -[_INPBBusTrip provider](self, "provider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("provider"));

  }
  -[_INPBBusTrip tripDuration](self, "tripDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("tripDuration"));

  return v3;
}

- (_INPBLocationValue)arrivalBusStopLocation
{
  return self->_arrivalBusStopLocation;
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (NSString)busName
{
  return self->_busName;
}

- (NSString)busNumber
{
  return self->_busNumber;
}

- (_INPBLocationValue)departureBusStopLocation
{
  return self->_departureBusStopLocation;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (NSString)provider
{
  return self->_provider;
}

- (_INPBDateTimeRange)tripDuration
{
  return self->_tripDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_departureBusStopLocation, 0);
  objc_storeStrong((id *)&self->_busNumber, 0);
  objc_storeStrong((id *)&self->_busName, 0);
  objc_storeStrong((id *)&self->_arrivalPlatform, 0);
  objc_storeStrong((id *)&self->_arrivalBusStopLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation _INPBFlight

- (void)setAirline:(id)a3
{
  objc_storeStrong((id *)&self->_airline, a3);
}

- (BOOL)hasAirline
{
  return self->_airline != 0;
}

- (void)setArrivalAirportGate:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalAirportGate, a3);
}

- (BOOL)hasArrivalAirportGate
{
  return self->_arrivalAirportGate != 0;
}

- (void)setBoardingTime:(id)a3
{
  objc_storeStrong((id *)&self->_boardingTime, a3);
}

- (BOOL)hasBoardingTime
{
  return self->_boardingTime != 0;
}

- (void)setDepartureAirportGate:(id)a3
{
  objc_storeStrong((id *)&self->_departureAirportGate, a3);
}

- (BOOL)hasDepartureAirportGate
{
  return self->_departureAirportGate != 0;
}

- (void)setFlightDuration:(id)a3
{
  objc_storeStrong((id *)&self->_flightDuration, a3);
}

- (BOOL)hasFlightDuration
{
  return self->_flightDuration != 0;
}

- (void)setFlightNumber:(id)a3
{
  NSString *v4;
  NSString *flightNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  flightNumber = self->_flightNumber;
  self->_flightNumber = v4;

}

- (BOOL)hasFlightNumber
{
  return self->_flightNumber != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFlightReadFrom(self, (uint64_t)a3);
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
  void *v15;
  id v16;

  v16 = a3;
  -[_INPBFlight airline](self, "airline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBFlight airline](self, "airline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFlight arrivalAirportGate](self, "arrivalAirportGate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBFlight arrivalAirportGate](self, "arrivalAirportGate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFlight boardingTime](self, "boardingTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBFlight boardingTime](self, "boardingTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFlight departureAirportGate](self, "departureAirportGate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBFlight departureAirportGate](self, "departureAirportGate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFlight flightDuration](self, "flightDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBFlight flightDuration](self, "flightDuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFlight flightNumber](self, "flightNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v16;
  if (v14)
  {
    PBDataWriterWriteStringField();
    v15 = v16;
  }

}

- (_INPBFlight)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFlight *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFlight *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFlight *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFlight initWithData:](self, "initWithData:", v6);

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
  -[_INPBFlight data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFlight *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v5 = -[_INPBFlight init](+[_INPBFlight allocWithZone:](_INPBFlight, "allocWithZone:"), "init");
  v6 = -[_INPBAirline copyWithZone:](self->_airline, "copyWithZone:", a3);
  -[_INPBFlight setAirline:](v5, "setAirline:", v6);

  v7 = -[_INPBAirportGate copyWithZone:](self->_arrivalAirportGate, "copyWithZone:", a3);
  -[_INPBFlight setArrivalAirportGate:](v5, "setArrivalAirportGate:", v7);

  v8 = -[_INPBDateTimeRange copyWithZone:](self->_boardingTime, "copyWithZone:", a3);
  -[_INPBFlight setBoardingTime:](v5, "setBoardingTime:", v8);

  v9 = -[_INPBAirportGate copyWithZone:](self->_departureAirportGate, "copyWithZone:", a3);
  -[_INPBFlight setDepartureAirportGate:](v5, "setDepartureAirportGate:", v9);

  v10 = -[_INPBDateTimeRange copyWithZone:](self->_flightDuration, "copyWithZone:", a3);
  -[_INPBFlight setFlightDuration:](v5, "setFlightDuration:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_flightNumber, "copyWithZone:", a3);
  -[_INPBFlight setFlightNumber:](v5, "setFlightNumber:", v11);

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
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_INPBFlight airline](self, "airline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "airline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBFlight airline](self, "airline");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBFlight airline](self, "airline");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "airline");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBFlight arrivalAirportGate](self, "arrivalAirportGate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalAirportGate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBFlight arrivalAirportGate](self, "arrivalAirportGate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBFlight arrivalAirportGate](self, "arrivalAirportGate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalAirportGate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBFlight boardingTime](self, "boardingTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boardingTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBFlight boardingTime](self, "boardingTime");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBFlight boardingTime](self, "boardingTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boardingTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBFlight departureAirportGate](self, "departureAirportGate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureAirportGate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBFlight departureAirportGate](self, "departureAirportGate");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBFlight departureAirportGate](self, "departureAirportGate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureAirportGate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBFlight flightDuration](self, "flightDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBFlight flightDuration](self, "flightDuration");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBFlight flightDuration](self, "flightDuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flightDuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBFlight flightNumber](self, "flightNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBFlight flightNumber](self, "flightNumber");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_INPBFlight flightNumber](self, "flightNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flightNumber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[_INPBAirline hash](self->_airline, "hash");
  v4 = -[_INPBAirportGate hash](self->_arrivalAirportGate, "hash") ^ v3;
  v5 = -[_INPBDateTimeRange hash](self->_boardingTime, "hash");
  v6 = v4 ^ v5 ^ -[_INPBAirportGate hash](self->_departureAirportGate, "hash");
  v7 = -[_INPBDateTimeRange hash](self->_flightDuration, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_flightNumber, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBFlight airline](self, "airline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("airline"));

  -[_INPBFlight arrivalAirportGate](self, "arrivalAirportGate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("arrivalAirportGate"));

  -[_INPBFlight boardingTime](self, "boardingTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("boardingTime"));

  -[_INPBFlight departureAirportGate](self, "departureAirportGate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("departureAirportGate"));

  -[_INPBFlight flightDuration](self, "flightDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("flightDuration"));

  if (self->_flightNumber)
  {
    -[_INPBFlight flightNumber](self, "flightNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("flightNumber"));

  }
  return v3;
}

- (_INPBAirline)airline
{
  return self->_airline;
}

- (_INPBAirportGate)arrivalAirportGate
{
  return self->_arrivalAirportGate;
}

- (_INPBDateTimeRange)boardingTime
{
  return self->_boardingTime;
}

- (_INPBAirportGate)departureAirportGate
{
  return self->_departureAirportGate;
}

- (_INPBDateTimeRange)flightDuration
{
  return self->_flightDuration;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_flightDuration, 0);
  objc_storeStrong((id *)&self->_departureAirportGate, 0);
  objc_storeStrong((id *)&self->_boardingTime, 0);
  objc_storeStrong((id *)&self->_arrivalAirportGate, 0);
  objc_storeStrong((id *)&self->_airline, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

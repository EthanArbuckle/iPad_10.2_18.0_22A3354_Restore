@implementation _INPBBoatTrip

- (void)setArrivalBoatTerminalLocation:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalBoatTerminalLocation, a3);
}

- (BOOL)hasArrivalBoatTerminalLocation
{
  return self->_arrivalBoatTerminalLocation != 0;
}

- (void)setBoatName:(id)a3
{
  NSString *v4;
  NSString *boatName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  boatName = self->_boatName;
  self->_boatName = v4;

}

- (BOOL)hasBoatName
{
  return self->_boatName != 0;
}

- (void)setBoatNumber:(id)a3
{
  NSString *v4;
  NSString *boatNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  boatNumber = self->_boatNumber;
  self->_boatNumber = v4;

}

- (BOOL)hasBoatNumber
{
  return self->_boatNumber != 0;
}

- (void)setDepartureBoatTerminalLocation:(id)a3
{
  objc_storeStrong((id *)&self->_departureBoatTerminalLocation, a3);
}

- (BOOL)hasDepartureBoatTerminalLocation
{
  return self->_departureBoatTerminalLocation != 0;
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
  return _INPBBoatTripReadFrom(self, (uint64_t)a3);
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
  id v13;

  v13 = a3;
  -[_INPBBoatTrip arrivalBoatTerminalLocation](self, "arrivalBoatTerminalLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBBoatTrip arrivalBoatTerminalLocation](self, "arrivalBoatTerminalLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBoatTrip boatName](self, "boatName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBBoatTrip boatNumber](self, "boatNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[_INPBBoatTrip departureBoatTerminalLocation](self, "departureBoatTerminalLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBBoatTrip departureBoatTerminalLocation](self, "departureBoatTerminalLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBoatTrip provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBBoatTrip tripDuration](self, "tripDuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBBoatTrip tripDuration](self, "tripDuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBBoatTrip)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBBoatTrip *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBBoatTrip *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBBoatTrip *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBBoatTrip initWithData:](self, "initWithData:", v6);

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
  -[_INPBBoatTrip data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBBoatTrip *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = -[_INPBBoatTrip init](+[_INPBBoatTrip allocWithZone:](_INPBBoatTrip, "allocWithZone:"), "init");
  v6 = -[_INPBLocationValue copyWithZone:](self->_arrivalBoatTerminalLocation, "copyWithZone:", a3);
  -[_INPBBoatTrip setArrivalBoatTerminalLocation:](v5, "setArrivalBoatTerminalLocation:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_boatName, "copyWithZone:", a3);
  -[_INPBBoatTrip setBoatName:](v5, "setBoatName:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_boatNumber, "copyWithZone:", a3);
  -[_INPBBoatTrip setBoatNumber:](v5, "setBoatNumber:", v8);

  v9 = -[_INPBLocationValue copyWithZone:](self->_departureBoatTerminalLocation, "copyWithZone:", a3);
  -[_INPBBoatTrip setDepartureBoatTerminalLocation:](v5, "setDepartureBoatTerminalLocation:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_provider, "copyWithZone:", a3);
  -[_INPBBoatTrip setProvider:](v5, "setProvider:", v10);

  v11 = -[_INPBDateTimeRange copyWithZone:](self->_tripDuration, "copyWithZone:", a3);
  -[_INPBBoatTrip setTripDuration:](v5, "setTripDuration:", v11);

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
  -[_INPBBoatTrip arrivalBoatTerminalLocation](self, "arrivalBoatTerminalLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalBoatTerminalLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBBoatTrip arrivalBoatTerminalLocation](self, "arrivalBoatTerminalLocation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBBoatTrip arrivalBoatTerminalLocation](self, "arrivalBoatTerminalLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalBoatTerminalLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBBoatTrip boatName](self, "boatName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boatName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBBoatTrip boatName](self, "boatName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBBoatTrip boatName](self, "boatName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boatName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBBoatTrip boatNumber](self, "boatNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boatNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBBoatTrip boatNumber](self, "boatNumber");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBBoatTrip boatNumber](self, "boatNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boatNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBBoatTrip departureBoatTerminalLocation](self, "departureBoatTerminalLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureBoatTerminalLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBBoatTrip departureBoatTerminalLocation](self, "departureBoatTerminalLocation");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBBoatTrip departureBoatTerminalLocation](self, "departureBoatTerminalLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureBoatTerminalLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBBoatTrip provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBBoatTrip provider](self, "provider");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBBoatTrip provider](self, "provider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBBoatTrip tripDuration](self, "tripDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tripDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBBoatTrip tripDuration](self, "tripDuration");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_INPBBoatTrip tripDuration](self, "tripDuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tripDuration");
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
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;

  v3 = -[_INPBLocationValue hash](self->_arrivalBoatTerminalLocation, "hash");
  v4 = -[NSString hash](self->_boatName, "hash") ^ v3;
  v5 = -[NSString hash](self->_boatNumber, "hash");
  v6 = v4 ^ v5 ^ -[_INPBLocationValue hash](self->_departureBoatTerminalLocation, "hash");
  v7 = -[NSString hash](self->_provider, "hash");
  return v6 ^ v7 ^ -[_INPBDateTimeRange hash](self->_tripDuration, "hash");
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
  -[_INPBBoatTrip arrivalBoatTerminalLocation](self, "arrivalBoatTerminalLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("arrivalBoatTerminalLocation"));

  if (self->_boatName)
  {
    -[_INPBBoatTrip boatName](self, "boatName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("boatName"));

  }
  if (self->_boatNumber)
  {
    -[_INPBBoatTrip boatNumber](self, "boatNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("boatNumber"));

  }
  -[_INPBBoatTrip departureBoatTerminalLocation](self, "departureBoatTerminalLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("departureBoatTerminalLocation"));

  if (self->_provider)
  {
    -[_INPBBoatTrip provider](self, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("provider"));

  }
  -[_INPBBoatTrip tripDuration](self, "tripDuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("tripDuration"));

  return v3;
}

- (_INPBLocationValue)arrivalBoatTerminalLocation
{
  return self->_arrivalBoatTerminalLocation;
}

- (NSString)boatName
{
  return self->_boatName;
}

- (NSString)boatNumber
{
  return self->_boatNumber;
}

- (_INPBLocationValue)departureBoatTerminalLocation
{
  return self->_departureBoatTerminalLocation;
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
  objc_storeStrong((id *)&self->_departureBoatTerminalLocation, 0);
  objc_storeStrong((id *)&self->_boatNumber, 0);
  objc_storeStrong((id *)&self->_boatName, 0);
  objc_storeStrong((id *)&self->_arrivalBoatTerminalLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

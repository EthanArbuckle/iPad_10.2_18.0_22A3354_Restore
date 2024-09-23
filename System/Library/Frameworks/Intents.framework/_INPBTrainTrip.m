@implementation _INPBTrainTrip

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

- (void)setArrivalStationLocation:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalStationLocation, a3);
}

- (BOOL)hasArrivalStationLocation
{
  return self->_arrivalStationLocation != 0;
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

- (void)setDepartureStationLocation:(id)a3
{
  objc_storeStrong((id *)&self->_departureStationLocation, a3);
}

- (BOOL)hasDepartureStationLocation
{
  return self->_departureStationLocation != 0;
}

- (void)setOnlineCheckInTime:(id)a3
{
  objc_storeStrong((id *)&self->_onlineCheckInTime, a3);
}

- (BOOL)hasOnlineCheckInTime
{
  return self->_onlineCheckInTime != 0;
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

- (void)setTrainName:(id)a3
{
  NSString *v4;
  NSString *trainName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  trainName = self->_trainName;
  self->_trainName = v4;

}

- (BOOL)hasTrainName
{
  return self->_trainName != 0;
}

- (void)setTrainNumber:(id)a3
{
  NSString *v4;
  NSString *trainNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  trainNumber = self->_trainNumber;
  self->_trainNumber = v4;

}

- (BOOL)hasTrainNumber
{
  return self->_trainNumber != 0;
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
  return _INPBTrainTripReadFrom(self, (uint64_t)a3);
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
  void *v16;
  id v17;

  v17 = a3;
  -[_INPBTrainTrip arrivalPlatform](self, "arrivalPlatform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBTrainTrip arrivalStationLocation](self, "arrivalStationLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBTrainTrip arrivalStationLocation](self, "arrivalStationLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTrainTrip departurePlatform](self, "departurePlatform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[_INPBTrainTrip departureStationLocation](self, "departureStationLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBTrainTrip departureStationLocation](self, "departureStationLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTrainTrip onlineCheckInTime](self, "onlineCheckInTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBTrainTrip onlineCheckInTime](self, "onlineCheckInTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTrainTrip provider](self, "provider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[_INPBTrainTrip trainName](self, "trainName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[_INPBTrainTrip trainNumber](self, "trainNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[_INPBTrainTrip tripDuration](self, "tripDuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBTrainTrip tripDuration](self, "tripDuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBTrainTrip)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTrainTrip *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTrainTrip *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTrainTrip *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTrainTrip initWithData:](self, "initWithData:", v6);

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
  -[_INPBTrainTrip data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTrainTrip *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = -[_INPBTrainTrip init](+[_INPBTrainTrip allocWithZone:](_INPBTrainTrip, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_arrivalPlatform, "copyWithZone:", a3);
  -[_INPBTrainTrip setArrivalPlatform:](v5, "setArrivalPlatform:", v6);

  v7 = -[_INPBLocationValue copyWithZone:](self->_arrivalStationLocation, "copyWithZone:", a3);
  -[_INPBTrainTrip setArrivalStationLocation:](v5, "setArrivalStationLocation:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_departurePlatform, "copyWithZone:", a3);
  -[_INPBTrainTrip setDeparturePlatform:](v5, "setDeparturePlatform:", v8);

  v9 = -[_INPBLocationValue copyWithZone:](self->_departureStationLocation, "copyWithZone:", a3);
  -[_INPBTrainTrip setDepartureStationLocation:](v5, "setDepartureStationLocation:", v9);

  v10 = -[_INPBDateTime copyWithZone:](self->_onlineCheckInTime, "copyWithZone:", a3);
  -[_INPBTrainTrip setOnlineCheckInTime:](v5, "setOnlineCheckInTime:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_provider, "copyWithZone:", a3);
  -[_INPBTrainTrip setProvider:](v5, "setProvider:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_trainName, "copyWithZone:", a3);
  -[_INPBTrainTrip setTrainName:](v5, "setTrainName:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_trainNumber, "copyWithZone:", a3);
  -[_INPBTrainTrip setTrainNumber:](v5, "setTrainNumber:", v13);

  v14 = -[_INPBDateTimeRange copyWithZone:](self->_tripDuration, "copyWithZone:", a3);
  -[_INPBTrainTrip setTripDuration:](v5, "setTripDuration:", v14);

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
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[_INPBTrainTrip arrivalPlatform](self, "arrivalPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip arrivalPlatform](self, "arrivalPlatform");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBTrainTrip arrivalPlatform](self, "arrivalPlatform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalPlatform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip arrivalStationLocation](self, "arrivalStationLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalStationLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip arrivalStationLocation](self, "arrivalStationLocation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBTrainTrip arrivalStationLocation](self, "arrivalStationLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalStationLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip departurePlatform](self, "departurePlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departurePlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip departurePlatform](self, "departurePlatform");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBTrainTrip departurePlatform](self, "departurePlatform");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departurePlatform");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip departureStationLocation](self, "departureStationLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureStationLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip departureStationLocation](self, "departureStationLocation");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBTrainTrip departureStationLocation](self, "departureStationLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureStationLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip onlineCheckInTime](self, "onlineCheckInTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onlineCheckInTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip onlineCheckInTime](self, "onlineCheckInTime");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBTrainTrip onlineCheckInTime](self, "onlineCheckInTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onlineCheckInTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip provider](self, "provider");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBTrainTrip provider](self, "provider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip trainName](self, "trainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip trainName](self, "trainName");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBTrainTrip trainName](self, "trainName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trainName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip trainNumber](self, "trainNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trainNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBTrainTrip trainNumber](self, "trainNumber");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBTrainTrip trainNumber](self, "trainNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trainNumber");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBTrainTrip tripDuration](self, "tripDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tripDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBTrainTrip tripDuration](self, "tripDuration");
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
    {

LABEL_50:
      v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    -[_INPBTrainTrip tripDuration](self, "tripDuration");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tripDuration");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if ((v51 & 1) != 0)
      goto LABEL_50;
  }
  else
  {
LABEL_46:

  }
LABEL_47:
  v52 = 0;
LABEL_48:

  return v52;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_arrivalPlatform, "hash");
  v4 = -[_INPBLocationValue hash](self->_arrivalStationLocation, "hash") ^ v3;
  v5 = -[NSString hash](self->_departurePlatform, "hash");
  v6 = v4 ^ v5 ^ -[_INPBLocationValue hash](self->_departureStationLocation, "hash");
  v7 = -[_INPBDateTime hash](self->_onlineCheckInTime, "hash");
  v8 = v7 ^ -[NSString hash](self->_provider, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_trainName, "hash");
  v10 = -[NSString hash](self->_trainNumber, "hash");
  return v9 ^ v10 ^ -[_INPBDateTimeRange hash](self->_tripDuration, "hash");
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
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_arrivalPlatform)
  {
    -[_INPBTrainTrip arrivalPlatform](self, "arrivalPlatform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("arrivalPlatform"));

  }
  -[_INPBTrainTrip arrivalStationLocation](self, "arrivalStationLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("arrivalStationLocation"));

  if (self->_departurePlatform)
  {
    -[_INPBTrainTrip departurePlatform](self, "departurePlatform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("departurePlatform"));

  }
  -[_INPBTrainTrip departureStationLocation](self, "departureStationLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("departureStationLocation"));

  -[_INPBTrainTrip onlineCheckInTime](self, "onlineCheckInTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("onlineCheckInTime"));

  if (self->_provider)
  {
    -[_INPBTrainTrip provider](self, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("provider"));

  }
  if (self->_trainName)
  {
    -[_INPBTrainTrip trainName](self, "trainName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("trainName"));

  }
  if (self->_trainNumber)
  {
    -[_INPBTrainTrip trainNumber](self, "trainNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("trainNumber"));

  }
  -[_INPBTrainTrip tripDuration](self, "tripDuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("tripDuration"));

  return v3;
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (_INPBLocationValue)arrivalStationLocation
{
  return self->_arrivalStationLocation;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (_INPBLocationValue)departureStationLocation
{
  return self->_departureStationLocation;
}

- (_INPBDateTime)onlineCheckInTime
{
  return self->_onlineCheckInTime;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)trainName
{
  return self->_trainName;
}

- (NSString)trainNumber
{
  return self->_trainNumber;
}

- (_INPBDateTimeRange)tripDuration
{
  return self->_tripDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_trainNumber, 0);
  objc_storeStrong((id *)&self->_trainName, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_onlineCheckInTime, 0);
  objc_storeStrong((id *)&self->_departureStationLocation, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_arrivalStationLocation, 0);
  objc_storeStrong((id *)&self->_arrivalPlatform, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

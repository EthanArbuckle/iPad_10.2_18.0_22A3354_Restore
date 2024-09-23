@implementation _INPBLodgingReservation

- (void)setLodgingBusinessLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lodgingBusinessLocation, a3);
}

- (BOOL)hasLodgingBusinessLocation
{
  return self->_lodgingBusinessLocation != 0;
}

- (void)setNumberOfAdults:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfAdults, a3);
}

- (BOOL)hasNumberOfAdults
{
  return self->_numberOfAdults != 0;
}

- (void)setNumberOfChildren:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfChildren, a3);
}

- (BOOL)hasNumberOfChildren
{
  return self->_numberOfChildren != 0;
}

- (void)setReservation:(id)a3
{
  objc_storeStrong((id *)&self->_reservation, a3);
}

- (BOOL)hasReservation
{
  return self->_reservation != 0;
}

- (void)setReservationDuration:(id)a3
{
  objc_storeStrong((id *)&self->_reservationDuration, a3);
}

- (BOOL)hasReservationDuration
{
  return self->_reservationDuration != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLodgingReservationReadFrom(self, (uint64_t)a3);
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
  id v14;

  v14 = a3;
  -[_INPBLodgingReservation lodgingBusinessLocation](self, "lodgingBusinessLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBLodgingReservation lodgingBusinessLocation](self, "lodgingBusinessLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBLodgingReservation numberOfAdults](self, "numberOfAdults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBLodgingReservation numberOfAdults](self, "numberOfAdults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBLodgingReservation numberOfChildren](self, "numberOfChildren");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBLodgingReservation numberOfChildren](self, "numberOfChildren");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBLodgingReservation reservation](self, "reservation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBLodgingReservation reservation](self, "reservation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBLodgingReservation reservationDuration](self, "reservationDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBLodgingReservation reservationDuration](self, "reservationDuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBLodgingReservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBLodgingReservation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBLodgingReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBLodgingReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBLodgingReservation initWithData:](self, "initWithData:", v6);

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
  -[_INPBLodgingReservation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBLodgingReservation *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBLodgingReservation init](+[_INPBLodgingReservation allocWithZone:](_INPBLodgingReservation, "allocWithZone:"), "init");
  v6 = -[_INPBLocation copyWithZone:](self->_lodgingBusinessLocation, "copyWithZone:", a3);
  -[_INPBLodgingReservation setLodgingBusinessLocation:](v5, "setLodgingBusinessLocation:", v6);

  v7 = -[_INPBInteger copyWithZone:](self->_numberOfAdults, "copyWithZone:", a3);
  -[_INPBLodgingReservation setNumberOfAdults:](v5, "setNumberOfAdults:", v7);

  v8 = -[_INPBInteger copyWithZone:](self->_numberOfChildren, "copyWithZone:", a3);
  -[_INPBLodgingReservation setNumberOfChildren:](v5, "setNumberOfChildren:", v8);

  v9 = -[_INPBReservation copyWithZone:](self->_reservation, "copyWithZone:", a3);
  -[_INPBLodgingReservation setReservation:](v5, "setReservation:", v9);

  v10 = -[_INPBDateTimeRange copyWithZone:](self->_reservationDuration, "copyWithZone:", a3);
  -[_INPBLodgingReservation setReservationDuration:](v5, "setReservationDuration:", v10);

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
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBLodgingReservation lodgingBusinessLocation](self, "lodgingBusinessLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lodgingBusinessLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBLodgingReservation lodgingBusinessLocation](self, "lodgingBusinessLocation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBLodgingReservation lodgingBusinessLocation](self, "lodgingBusinessLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lodgingBusinessLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBLodgingReservation numberOfAdults](self, "numberOfAdults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfAdults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBLodgingReservation numberOfAdults](self, "numberOfAdults");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBLodgingReservation numberOfAdults](self, "numberOfAdults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberOfAdults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBLodgingReservation numberOfChildren](self, "numberOfChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBLodgingReservation numberOfChildren](self, "numberOfChildren");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBLodgingReservation numberOfChildren](self, "numberOfChildren");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberOfChildren");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBLodgingReservation reservation](self, "reservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBLodgingReservation reservation](self, "reservation");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBLodgingReservation reservation](self, "reservation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBLodgingReservation reservationDuration](self, "reservationDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservationDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBLodgingReservation reservationDuration](self, "reservationDuration");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBLodgingReservation reservationDuration](self, "reservationDuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservationDuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[_INPBLocation hash](self->_lodgingBusinessLocation, "hash");
  v4 = -[_INPBInteger hash](self->_numberOfAdults, "hash") ^ v3;
  v5 = -[_INPBInteger hash](self->_numberOfChildren, "hash");
  v6 = v4 ^ v5 ^ -[_INPBReservation hash](self->_reservation, "hash");
  return v6 ^ -[_INPBDateTimeRange hash](self->_reservationDuration, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBLodgingReservation lodgingBusinessLocation](self, "lodgingBusinessLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lodgingBusinessLocation"));

  -[_INPBLodgingReservation numberOfAdults](self, "numberOfAdults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfAdults"));

  -[_INPBLodgingReservation numberOfChildren](self, "numberOfChildren");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numberOfChildren"));

  -[_INPBLodgingReservation reservation](self, "reservation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("reservation"));

  -[_INPBLodgingReservation reservationDuration](self, "reservationDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("reservationDuration"));

  return v3;
}

- (_INPBLocation)lodgingBusinessLocation
{
  return self->_lodgingBusinessLocation;
}

- (_INPBInteger)numberOfAdults
{
  return self->_numberOfAdults;
}

- (_INPBInteger)numberOfChildren
{
  return self->_numberOfChildren;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBDateTimeRange)reservationDuration
{
  return self->_reservationDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationDuration, 0);
  objc_storeStrong((id *)&self->_reservation, 0);
  objc_storeStrong((id *)&self->_numberOfChildren, 0);
  objc_storeStrong((id *)&self->_numberOfAdults, 0);
  objc_storeStrong((id *)&self->_lodgingBusinessLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation _INPBRestaurantReservation

- (void)setPartySize:(id)a3
{
  objc_storeStrong((id *)&self->_partySize, a3);
}

- (BOOL)hasPartySize
{
  return self->_partySize != 0;
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

- (void)setRestaurantLocation:(id)a3
{
  objc_storeStrong((id *)&self->_restaurantLocation, a3);
}

- (BOOL)hasRestaurantLocation
{
  return self->_restaurantLocation != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRestaurantReservationReadFrom(self, (uint64_t)a3);
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
  id v12;

  v12 = a3;
  -[_INPBRestaurantReservation partySize](self, "partySize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRestaurantReservation partySize](self, "partySize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRestaurantReservation reservation](self, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBRestaurantReservation reservation](self, "reservation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRestaurantReservation reservationDuration](self, "reservationDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBRestaurantReservation reservationDuration](self, "reservationDuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRestaurantReservation restaurantLocation](self, "restaurantLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBRestaurantReservation restaurantLocation](self, "restaurantLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBRestaurantReservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRestaurantReservation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRestaurantReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRestaurantReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRestaurantReservation initWithData:](self, "initWithData:", v6);

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
  -[_INPBRestaurantReservation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRestaurantReservation *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBRestaurantReservation init](+[_INPBRestaurantReservation allocWithZone:](_INPBRestaurantReservation, "allocWithZone:"), "init");
  v6 = -[_INPBInteger copyWithZone:](self->_partySize, "copyWithZone:", a3);
  -[_INPBRestaurantReservation setPartySize:](v5, "setPartySize:", v6);

  v7 = -[_INPBReservation copyWithZone:](self->_reservation, "copyWithZone:", a3);
  -[_INPBRestaurantReservation setReservation:](v5, "setReservation:", v7);

  v8 = -[_INPBDateTimeRange copyWithZone:](self->_reservationDuration, "copyWithZone:", a3);
  -[_INPBRestaurantReservation setReservationDuration:](v5, "setReservationDuration:", v8);

  v9 = -[_INPBLocation copyWithZone:](self->_restaurantLocation, "copyWithZone:", a3);
  -[_INPBRestaurantReservation setRestaurantLocation:](v5, "setRestaurantLocation:", v9);

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
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBRestaurantReservation partySize](self, "partySize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partySize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRestaurantReservation partySize](self, "partySize");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRestaurantReservation partySize](self, "partySize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "partySize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRestaurantReservation reservation](self, "reservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRestaurantReservation reservation](self, "reservation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRestaurantReservation reservation](self, "reservation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRestaurantReservation reservationDuration](self, "reservationDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservationDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRestaurantReservation reservationDuration](self, "reservationDuration");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRestaurantReservation reservationDuration](self, "reservationDuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservationDuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRestaurantReservation restaurantLocation](self, "restaurantLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restaurantLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRestaurantReservation restaurantLocation](self, "restaurantLocation");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBRestaurantReservation restaurantLocation](self, "restaurantLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restaurantLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[_INPBInteger hash](self->_partySize, "hash");
  v4 = -[_INPBReservation hash](self->_reservation, "hash") ^ v3;
  v5 = -[_INPBDateTimeRange hash](self->_reservationDuration, "hash");
  return v4 ^ v5 ^ -[_INPBLocation hash](self->_restaurantLocation, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBRestaurantReservation partySize](self, "partySize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("partySize"));

  -[_INPBRestaurantReservation reservation](self, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reservation"));

  -[_INPBRestaurantReservation reservationDuration](self, "reservationDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("reservationDuration"));

  -[_INPBRestaurantReservation restaurantLocation](self, "restaurantLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("restaurantLocation"));

  return v3;
}

- (_INPBInteger)partySize
{
  return self->_partySize;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBDateTimeRange)reservationDuration
{
  return self->_reservationDuration;
}

- (_INPBLocation)restaurantLocation
{
  return self->_restaurantLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantLocation, 0);
  objc_storeStrong((id *)&self->_reservationDuration, 0);
  objc_storeStrong((id *)&self->_reservation, 0);
  objc_storeStrong((id *)&self->_partySize, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

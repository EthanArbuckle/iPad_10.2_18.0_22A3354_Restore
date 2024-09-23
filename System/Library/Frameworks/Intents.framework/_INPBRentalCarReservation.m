@implementation _INPBRentalCarReservation

- (void)setDropOffLocation:(id)a3
{
  objc_storeStrong((id *)&self->_dropOffLocation, a3);
}

- (BOOL)hasDropOffLocation
{
  return self->_dropOffLocation != 0;
}

- (void)setPickupLocation:(id)a3
{
  objc_storeStrong((id *)&self->_pickupLocation, a3);
}

- (BOOL)hasPickupLocation
{
  return self->_pickupLocation != 0;
}

- (void)setRentalCar:(id)a3
{
  objc_storeStrong((id *)&self->_rentalCar, a3);
}

- (BOOL)hasRentalCar
{
  return self->_rentalCar != 0;
}

- (void)setRentalDuration:(id)a3
{
  objc_storeStrong((id *)&self->_rentalDuration, a3);
}

- (BOOL)hasRentalDuration
{
  return self->_rentalDuration != 0;
}

- (void)setReservation:(id)a3
{
  objc_storeStrong((id *)&self->_reservation, a3);
}

- (BOOL)hasReservation
{
  return self->_reservation != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRentalCarReservationReadFrom(self, (uint64_t)a3);
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
  -[_INPBRentalCarReservation dropOffLocation](self, "dropOffLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRentalCarReservation dropOffLocation](self, "dropOffLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRentalCarReservation pickupLocation](self, "pickupLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBRentalCarReservation pickupLocation](self, "pickupLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRentalCarReservation rentalCar](self, "rentalCar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBRentalCarReservation rentalCar](self, "rentalCar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRentalCarReservation rentalDuration](self, "rentalDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBRentalCarReservation rentalDuration](self, "rentalDuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRentalCarReservation reservation](self, "reservation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBRentalCarReservation reservation](self, "reservation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBRentalCarReservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRentalCarReservation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRentalCarReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRentalCarReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRentalCarReservation initWithData:](self, "initWithData:", v6);

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
  -[_INPBRentalCarReservation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRentalCarReservation *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBRentalCarReservation init](+[_INPBRentalCarReservation allocWithZone:](_INPBRentalCarReservation, "allocWithZone:"), "init");
  v6 = -[_INPBLocationValue copyWithZone:](self->_dropOffLocation, "copyWithZone:", a3);
  -[_INPBRentalCarReservation setDropOffLocation:](v5, "setDropOffLocation:", v6);

  v7 = -[_INPBLocationValue copyWithZone:](self->_pickupLocation, "copyWithZone:", a3);
  -[_INPBRentalCarReservation setPickupLocation:](v5, "setPickupLocation:", v7);

  v8 = -[_INPBRentalCar copyWithZone:](self->_rentalCar, "copyWithZone:", a3);
  -[_INPBRentalCarReservation setRentalCar:](v5, "setRentalCar:", v8);

  v9 = -[_INPBDateTimeRange copyWithZone:](self->_rentalDuration, "copyWithZone:", a3);
  -[_INPBRentalCarReservation setRentalDuration:](v5, "setRentalDuration:", v9);

  v10 = -[_INPBReservation copyWithZone:](self->_reservation, "copyWithZone:", a3);
  -[_INPBRentalCarReservation setReservation:](v5, "setReservation:", v10);

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
  -[_INPBRentalCarReservation dropOffLocation](self, "dropOffLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dropOffLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCarReservation dropOffLocation](self, "dropOffLocation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRentalCarReservation dropOffLocation](self, "dropOffLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dropOffLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCarReservation pickupLocation](self, "pickupLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickupLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCarReservation pickupLocation](self, "pickupLocation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRentalCarReservation pickupLocation](self, "pickupLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickupLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCarReservation rentalCar](self, "rentalCar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rentalCar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCarReservation rentalCar](self, "rentalCar");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRentalCarReservation rentalCar](self, "rentalCar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rentalCar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCarReservation rentalDuration](self, "rentalDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rentalDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCarReservation rentalDuration](self, "rentalDuration");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBRentalCarReservation rentalDuration](self, "rentalDuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rentalDuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCarReservation reservation](self, "reservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRentalCarReservation reservation](self, "reservation");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBRentalCarReservation reservation](self, "reservation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservation");
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

  v3 = -[_INPBLocationValue hash](self->_dropOffLocation, "hash");
  v4 = -[_INPBLocationValue hash](self->_pickupLocation, "hash") ^ v3;
  v5 = -[_INPBRentalCar hash](self->_rentalCar, "hash");
  v6 = v4 ^ v5 ^ -[_INPBDateTimeRange hash](self->_rentalDuration, "hash");
  return v6 ^ -[_INPBReservation hash](self->_reservation, "hash");
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
  -[_INPBRentalCarReservation dropOffLocation](self, "dropOffLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dropOffLocation"));

  -[_INPBRentalCarReservation pickupLocation](self, "pickupLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pickupLocation"));

  -[_INPBRentalCarReservation rentalCar](self, "rentalCar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rentalCar"));

  -[_INPBRentalCarReservation rentalDuration](self, "rentalDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rentalDuration"));

  -[_INPBRentalCarReservation reservation](self, "reservation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("reservation"));

  return v3;
}

- (_INPBLocationValue)dropOffLocation
{
  return self->_dropOffLocation;
}

- (_INPBLocationValue)pickupLocation
{
  return self->_pickupLocation;
}

- (_INPBRentalCar)rentalCar
{
  return self->_rentalCar;
}

- (_INPBDateTimeRange)rentalDuration
{
  return self->_rentalDuration;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservation, 0);
  objc_storeStrong((id *)&self->_rentalDuration, 0);
  objc_storeStrong((id *)&self->_rentalCar, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation _INPBTrainReservation

- (void)setReservation:(id)a3
{
  objc_storeStrong((id *)&self->_reservation, a3);
}

- (BOOL)hasReservation
{
  return self->_reservation != 0;
}

- (void)setReservedSeat:(id)a3
{
  objc_storeStrong((id *)&self->_reservedSeat, a3);
}

- (BOOL)hasReservedSeat
{
  return self->_reservedSeat != 0;
}

- (void)setTrainTrip:(id)a3
{
  objc_storeStrong((id *)&self->_trainTrip, a3);
}

- (BOOL)hasTrainTrip
{
  return self->_trainTrip != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTrainReservationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBTrainReservation reservation](self, "reservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBTrainReservation reservation](self, "reservation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTrainReservation reservedSeat](self, "reservedSeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBTrainReservation reservedSeat](self, "reservedSeat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTrainReservation trainTrip](self, "trainTrip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBTrainReservation trainTrip](self, "trainTrip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBTrainReservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTrainReservation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTrainReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTrainReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTrainReservation initWithData:](self, "initWithData:", v6);

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
  -[_INPBTrainReservation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTrainReservation *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBTrainReservation init](+[_INPBTrainReservation allocWithZone:](_INPBTrainReservation, "allocWithZone:"), "init");
  v6 = -[_INPBReservation copyWithZone:](self->_reservation, "copyWithZone:", a3);
  -[_INPBTrainReservation setReservation:](v5, "setReservation:", v6);

  v7 = -[_INPBSeat copyWithZone:](self->_reservedSeat, "copyWithZone:", a3);
  -[_INPBTrainReservation setReservedSeat:](v5, "setReservedSeat:", v7);

  v8 = -[_INPBTrainTrip copyWithZone:](self->_trainTrip, "copyWithZone:", a3);
  -[_INPBTrainReservation setTrainTrip:](v5, "setTrainTrip:", v8);

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBTrainReservation reservation](self, "reservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBTrainReservation reservation](self, "reservation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBTrainReservation reservation](self, "reservation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBTrainReservation reservedSeat](self, "reservedSeat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservedSeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBTrainReservation reservedSeat](self, "reservedSeat");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBTrainReservation reservedSeat](self, "reservedSeat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservedSeat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBTrainReservation trainTrip](self, "trainTrip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trainTrip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBTrainReservation trainTrip](self, "trainTrip");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBTrainReservation trainTrip](self, "trainTrip");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trainTrip");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBReservation hash](self->_reservation, "hash");
  v4 = -[_INPBSeat hash](self->_reservedSeat, "hash") ^ v3;
  return v4 ^ -[_INPBTrainTrip hash](self->_trainTrip, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBTrainReservation reservation](self, "reservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("reservation"));

  -[_INPBTrainReservation reservedSeat](self, "reservedSeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reservedSeat"));

  -[_INPBTrainReservation trainTrip](self, "trainTrip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("trainTrip"));

  return v3;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (_INPBTrainTrip)trainTrip
{
  return self->_trainTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainTrip, 0);
  objc_storeStrong((id *)&self->_reservedSeat, 0);
  objc_storeStrong((id *)&self->_reservation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

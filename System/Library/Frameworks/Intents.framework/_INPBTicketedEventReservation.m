@implementation _INPBTicketedEventReservation

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

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

- (BOOL)readFrom:(id)a3
{
  return _INPBTicketedEventReservationReadFrom(self, (uint64_t)a3);
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
  -[_INPBTicketedEventReservation event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBTicketedEventReservation event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTicketedEventReservation reservation](self, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBTicketedEventReservation reservation](self, "reservation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTicketedEventReservation reservedSeat](self, "reservedSeat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBTicketedEventReservation reservedSeat](self, "reservedSeat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBTicketedEventReservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTicketedEventReservation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTicketedEventReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTicketedEventReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTicketedEventReservation initWithData:](self, "initWithData:", v6);

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
  -[_INPBTicketedEventReservation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTicketedEventReservation *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBTicketedEventReservation init](+[_INPBTicketedEventReservation allocWithZone:](_INPBTicketedEventReservation, "allocWithZone:"), "init");
  v6 = -[_INPBTicketedEvent copyWithZone:](self->_event, "copyWithZone:", a3);
  -[_INPBTicketedEventReservation setEvent:](v5, "setEvent:", v6);

  v7 = -[_INPBReservation copyWithZone:](self->_reservation, "copyWithZone:", a3);
  -[_INPBTicketedEventReservation setReservation:](v5, "setReservation:", v7);

  v8 = -[_INPBSeat copyWithZone:](self->_reservedSeat, "copyWithZone:", a3);
  -[_INPBTicketedEventReservation setReservedSeat:](v5, "setReservedSeat:", v8);

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
  -[_INPBTicketedEventReservation event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBTicketedEventReservation event](self, "event");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBTicketedEventReservation event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBTicketedEventReservation reservation](self, "reservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBTicketedEventReservation reservation](self, "reservation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBTicketedEventReservation reservation](self, "reservation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBTicketedEventReservation reservedSeat](self, "reservedSeat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservedSeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBTicketedEventReservation reservedSeat](self, "reservedSeat");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBTicketedEventReservation reservedSeat](self, "reservedSeat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservedSeat");
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

  v3 = -[_INPBTicketedEvent hash](self->_event, "hash");
  v4 = -[_INPBReservation hash](self->_reservation, "hash") ^ v3;
  return v4 ^ -[_INPBSeat hash](self->_reservedSeat, "hash");
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
  -[_INPBTicketedEventReservation event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("event"));

  -[_INPBTicketedEventReservation reservation](self, "reservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reservation"));

  -[_INPBTicketedEventReservation reservedSeat](self, "reservedSeat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("reservedSeat"));

  return v3;
}

- (_INPBTicketedEvent)event
{
  return self->_event;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedSeat, 0);
  objc_storeStrong((id *)&self->_reservation, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

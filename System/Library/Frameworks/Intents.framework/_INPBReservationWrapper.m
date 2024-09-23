@implementation _INPBReservationWrapper

- (void)setBoatReservation:(id)a3
{
  objc_storeStrong((id *)&self->_boatReservation, a3);
}

- (BOOL)hasBoatReservation
{
  return self->_boatReservation != 0;
}

- (void)setBusReservation:(id)a3
{
  objc_storeStrong((id *)&self->_busReservation, a3);
}

- (BOOL)hasBusReservation
{
  return self->_busReservation != 0;
}

- (void)setFlightReservation:(id)a3
{
  objc_storeStrong((id *)&self->_flightReservation, a3);
}

- (BOOL)hasFlightReservation
{
  return self->_flightReservation != 0;
}

- (void)setLodgingReservation:(id)a3
{
  objc_storeStrong((id *)&self->_lodgingReservation, a3);
}

- (BOOL)hasLodgingReservation
{
  return self->_lodgingReservation != 0;
}

- (void)setRentalCarReservation:(id)a3
{
  objc_storeStrong((id *)&self->_rentalCarReservation, a3);
}

- (BOOL)hasRentalCarReservation
{
  return self->_rentalCarReservation != 0;
}

- (void)setRestaurantReservation:(id)a3
{
  objc_storeStrong((id *)&self->_restaurantReservation, a3);
}

- (BOOL)hasRestaurantReservation
{
  return self->_restaurantReservation != 0;
}

- (void)setTicketedEventReservation:(id)a3
{
  objc_storeStrong((id *)&self->_ticketedEventReservation, a3);
}

- (BOOL)hasTicketedEventReservation
{
  return self->_ticketedEventReservation != 0;
}

- (void)setTrainReservation:(id)a3
{
  objc_storeStrong((id *)&self->_trainReservation, a3);
}

- (BOOL)hasTrainReservation
{
  return self->_trainReservation != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReservationWrapperReadFrom(self, (uint64_t)a3);
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
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[_INPBReservationWrapper boatReservation](self, "boatReservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBReservationWrapper boatReservation](self, "boatReservation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationWrapper busReservation](self, "busReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBReservationWrapper busReservation](self, "busReservation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationWrapper flightReservation](self, "flightReservation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBReservationWrapper flightReservation](self, "flightReservation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationWrapper lodgingReservation](self, "lodgingReservation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBReservationWrapper lodgingReservation](self, "lodgingReservation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationWrapper rentalCarReservation](self, "rentalCarReservation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBReservationWrapper rentalCarReservation](self, "rentalCarReservation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationWrapper restaurantReservation](self, "restaurantReservation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBReservationWrapper restaurantReservation](self, "restaurantReservation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationWrapper ticketedEventReservation](self, "ticketedEventReservation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBReservationWrapper ticketedEventReservation](self, "ticketedEventReservation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationWrapper trainReservation](self, "trainReservation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_INPBReservationWrapper trainReservation](self, "trainReservation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBReservationWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBReservationWrapper *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBReservationWrapper *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBReservationWrapper *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBReservationWrapper initWithData:](self, "initWithData:", v6);

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
  -[_INPBReservationWrapper data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBReservationWrapper *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = -[_INPBReservationWrapper init](+[_INPBReservationWrapper allocWithZone:](_INPBReservationWrapper, "allocWithZone:"), "init");
  v6 = -[_INPBBoatReservation copyWithZone:](self->_boatReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setBoatReservation:](v5, "setBoatReservation:", v6);

  v7 = -[_INPBBusReservation copyWithZone:](self->_busReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setBusReservation:](v5, "setBusReservation:", v7);

  v8 = -[_INPBFlightReservation copyWithZone:](self->_flightReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setFlightReservation:](v5, "setFlightReservation:", v8);

  v9 = -[_INPBLodgingReservation copyWithZone:](self->_lodgingReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setLodgingReservation:](v5, "setLodgingReservation:", v9);

  v10 = -[_INPBRentalCarReservation copyWithZone:](self->_rentalCarReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setRentalCarReservation:](v5, "setRentalCarReservation:", v10);

  v11 = -[_INPBRestaurantReservation copyWithZone:](self->_restaurantReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setRestaurantReservation:](v5, "setRestaurantReservation:", v11);

  v12 = -[_INPBTicketedEventReservation copyWithZone:](self->_ticketedEventReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setTicketedEventReservation:](v5, "setTicketedEventReservation:", v12);

  v13 = -[_INPBTrainReservation copyWithZone:](self->_trainReservation, "copyWithZone:", a3);
  -[_INPBReservationWrapper setTrainReservation:](v5, "setTrainReservation:", v13);

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
  -[_INPBReservationWrapper boatReservation](self, "boatReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boatReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBReservationWrapper boatReservation](self, "boatReservation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBReservationWrapper boatReservation](self, "boatReservation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boatReservation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBReservationWrapper busReservation](self, "busReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "busReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBReservationWrapper busReservation](self, "busReservation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBReservationWrapper busReservation](self, "busReservation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "busReservation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBReservationWrapper flightReservation](self, "flightReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBReservationWrapper flightReservation](self, "flightReservation");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBReservationWrapper flightReservation](self, "flightReservation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flightReservation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBReservationWrapper lodgingReservation](self, "lodgingReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lodgingReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBReservationWrapper lodgingReservation](self, "lodgingReservation");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBReservationWrapper lodgingReservation](self, "lodgingReservation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lodgingReservation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBReservationWrapper rentalCarReservation](self, "rentalCarReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rentalCarReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBReservationWrapper rentalCarReservation](self, "rentalCarReservation");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBReservationWrapper rentalCarReservation](self, "rentalCarReservation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rentalCarReservation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBReservationWrapper restaurantReservation](self, "restaurantReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restaurantReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBReservationWrapper restaurantReservation](self, "restaurantReservation");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBReservationWrapper restaurantReservation](self, "restaurantReservation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restaurantReservation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBReservationWrapper ticketedEventReservation](self, "ticketedEventReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ticketedEventReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[_INPBReservationWrapper ticketedEventReservation](self, "ticketedEventReservation");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBReservationWrapper ticketedEventReservation](self, "ticketedEventReservation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ticketedEventReservation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_42;
  }
  else
  {

  }
  -[_INPBReservationWrapper trainReservation](self, "trainReservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trainReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBReservationWrapper trainReservation](self, "trainReservation");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {

LABEL_45:
      v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    -[_INPBReservationWrapper trainReservation](self, "trainReservation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trainReservation");
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
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[_INPBBoatReservation hash](self->_boatReservation, "hash");
  v4 = -[_INPBBusReservation hash](self->_busReservation, "hash") ^ v3;
  v5 = -[_INPBFlightReservation hash](self->_flightReservation, "hash");
  v6 = v4 ^ v5 ^ -[_INPBLodgingReservation hash](self->_lodgingReservation, "hash");
  v7 = -[_INPBRentalCarReservation hash](self->_rentalCarReservation, "hash");
  v8 = v7 ^ -[_INPBRestaurantReservation hash](self->_restaurantReservation, "hash");
  v9 = v6 ^ v8 ^ -[_INPBTicketedEventReservation hash](self->_ticketedEventReservation, "hash");
  return v9 ^ -[_INPBTrainReservation hash](self->_trainReservation, "hash");
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
  -[_INPBReservationWrapper boatReservation](self, "boatReservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("boatReservation"));

  -[_INPBReservationWrapper busReservation](self, "busReservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("busReservation"));

  -[_INPBReservationWrapper flightReservation](self, "flightReservation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("flightReservation"));

  -[_INPBReservationWrapper lodgingReservation](self, "lodgingReservation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("lodgingReservation"));

  -[_INPBReservationWrapper rentalCarReservation](self, "rentalCarReservation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("rentalCarReservation"));

  -[_INPBReservationWrapper restaurantReservation](self, "restaurantReservation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("restaurantReservation"));

  -[_INPBReservationWrapper ticketedEventReservation](self, "ticketedEventReservation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("ticketedEventReservation"));

  -[_INPBReservationWrapper trainReservation](self, "trainReservation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("trainReservation"));

  return v3;
}

- (_INPBBoatReservation)boatReservation
{
  return self->_boatReservation;
}

- (_INPBBusReservation)busReservation
{
  return self->_busReservation;
}

- (_INPBFlightReservation)flightReservation
{
  return self->_flightReservation;
}

- (_INPBLodgingReservation)lodgingReservation
{
  return self->_lodgingReservation;
}

- (_INPBRentalCarReservation)rentalCarReservation
{
  return self->_rentalCarReservation;
}

- (_INPBRestaurantReservation)restaurantReservation
{
  return self->_restaurantReservation;
}

- (_INPBTicketedEventReservation)ticketedEventReservation
{
  return self->_ticketedEventReservation;
}

- (_INPBTrainReservation)trainReservation
{
  return self->_trainReservation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainReservation, 0);
  objc_storeStrong((id *)&self->_ticketedEventReservation, 0);
  objc_storeStrong((id *)&self->_restaurantReservation, 0);
  objc_storeStrong((id *)&self->_rentalCarReservation, 0);
  objc_storeStrong((id *)&self->_lodgingReservation, 0);
  objc_storeStrong((id *)&self->_flightReservation, 0);
  objc_storeStrong((id *)&self->_busReservation, 0);
  objc_storeStrong((id *)&self->_boatReservation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

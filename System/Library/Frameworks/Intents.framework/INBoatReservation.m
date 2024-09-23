@implementation INBoatReservation

- (INBoatReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8 url:(id)a9 reservedSeat:(id)a10 boatTrip:(id)a11
{
  return -[INBoatReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:boatTrip:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:boatTrip:", a3, a4, a5, a6, a7, a8);
}

- (INBoatReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat boatTrip:(INBoatTrip *)boatTrip
{
  INSeat *v18;
  INBoatTrip *v19;
  INBoatReservation *v20;
  uint64_t v21;
  INSeat *v22;
  uint64_t v23;
  INBoatTrip *v24;
  objc_super v26;

  v18 = reservedSeat;
  v19 = boatTrip;
  v26.receiver = self;
  v26.super_class = (Class)INBoatReservation;
  v20 = -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](&v26, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_, itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, URL);
  if (v20)
  {
    v21 = -[INSeat copy](v18, "copy");
    v22 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v21;

    v23 = -[INBoatTrip copy](v19, "copy");
    v24 = v20->_boatTrip;
    v20->_boatTrip = (INBoatTrip *)v23;

  }
  return v20;
}

- (id)_duration
{
  return -[INBoatTrip tripDuration](self->_boatTrip, "tripDuration");
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INBoatReservation;
  v3 = -[INReservation hash](&v6, sel_hash);
  v4 = -[INSeat hash](self->_reservedSeat, "hash") ^ v3;
  return v4 ^ -[INBoatTrip hash](self->_boatTrip, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INBoatReservation *v4;
  INBoatReservation *v5;
  INSeat *reservedSeat;
  INBoatTrip *boatTrip;
  BOOL v8;
  objc_super v10;

  v4 = (INBoatReservation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INBoatReservation,
          -[INReservation isEqual:](&v10, sel_isEqual_, v4)))
    {
      v5 = v4;
      reservedSeat = self->_reservedSeat;
      v8 = 0;
      if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:"))
      {
        boatTrip = self->_boatTrip;
        if (boatTrip == v5->_boatTrip || -[INBoatTrip isEqual:](boatTrip, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INBoatReservation)initWithCoder:(id)a3
{
  id v4;
  INBoatReservation *v5;
  uint64_t v6;
  INSeat *reservedSeat;
  uint64_t v8;
  INBoatTrip *boatTrip;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INBoatReservation;
  v5 = -[INReservation initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservedSeat"));
    v6 = objc_claimAutoreleasedReturnValue();
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boatTrip"));
    v8 = objc_claimAutoreleasedReturnValue();
    boatTrip = v5->_boatTrip;
    v5->_boatTrip = (INBoatTrip *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INBoatReservation;
  v4 = a3;
  -[INReservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_reservedSeat, CFSTR("reservedSeat"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_boatTrip, CFSTR("boatTrip"));

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INSeat *reservedSeat;
  void *v6;
  INBoatTrip *boatTrip;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)INBoatReservation;
  -[INReservation _dictionaryRepresentation](&v11, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v12[0] = CFSTR("reservedSeat");
  reservedSeat = self->_reservedSeat;
  v6 = reservedSeat;
  if (!reservedSeat)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = CFSTR("boatTrip");
  v13[0] = v6;
  boatTrip = self->_boatTrip;
  v8 = boatTrip;
  if (!boatTrip)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

  if (!boatTrip)
  {

    if (reservedSeat)
      return v4;
LABEL_9:

    return v4;
  }
  if (!reservedSeat)
    goto LABEL_9;
  return v4;
}

- (INSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (INBoatTrip)boatTrip
{
  return self->_boatTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boatTrip, 0);
  objc_storeStrong((id *)&self->_reservedSeat, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

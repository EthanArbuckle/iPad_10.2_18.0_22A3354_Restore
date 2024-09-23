@implementation INBusReservation

- (INBusReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8 url:(id)a9 reservedSeat:(id)a10 busTrip:(id)a11
{
  return -[INBusReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:busTrip:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:busTrip:", a3, a4, a5, a6, a7, a8);
}

- (INBusReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat busTrip:(INBusTrip *)busTrip
{
  INSeat *v18;
  INBusTrip *v19;
  INBusReservation *v20;
  uint64_t v21;
  INSeat *v22;
  uint64_t v23;
  INBusTrip *v24;
  objc_super v26;

  v18 = reservedSeat;
  v19 = busTrip;
  v26.receiver = self;
  v26.super_class = (Class)INBusReservation;
  v20 = -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](&v26, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_, itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, URL);
  if (v20)
  {
    v21 = -[INSeat copy](v18, "copy");
    v22 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v21;

    v23 = -[INBusTrip copy](v19, "copy");
    v24 = v20->_busTrip;
    v20->_busTrip = (INBusTrip *)v23;

  }
  return v20;
}

- (id)_duration
{
  return -[INBusTrip tripDuration](self->_busTrip, "tripDuration");
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INBusReservation;
  v3 = -[INReservation hash](&v6, sel_hash);
  v4 = -[INSeat hash](self->_reservedSeat, "hash") ^ v3;
  return v4 ^ -[INBusTrip hash](self->_busTrip, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INBusReservation *v4;
  INBusReservation *v5;
  INSeat *reservedSeat;
  INBusTrip *busTrip;
  BOOL v8;
  objc_super v10;

  v4 = (INBusReservation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INBusReservation,
          -[INReservation isEqual:](&v10, sel_isEqual_, v4)))
    {
      v5 = v4;
      reservedSeat = self->_reservedSeat;
      v8 = 0;
      if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:"))
      {
        busTrip = self->_busTrip;
        if (busTrip == v5->_busTrip || -[INBusTrip isEqual:](busTrip, "isEqual:"))
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

- (INBusReservation)initWithCoder:(id)a3
{
  id v4;
  INBusReservation *v5;
  uint64_t v6;
  INSeat *reservedSeat;
  uint64_t v8;
  INBusTrip *busTrip;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INBusReservation;
  v5 = -[INReservation initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservedSeat"));
    v6 = objc_claimAutoreleasedReturnValue();
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("busTrip"));
    v8 = objc_claimAutoreleasedReturnValue();
    busTrip = v5->_busTrip;
    v5->_busTrip = (INBusTrip *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INBusReservation;
  v4 = a3;
  -[INReservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_reservedSeat, CFSTR("reservedSeat"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_busTrip, CFSTR("busTrip"));

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INSeat *reservedSeat;
  void *v6;
  INBusTrip *busTrip;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)INBusReservation;
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
  v12[1] = CFSTR("busTrip");
  v13[0] = v6;
  busTrip = self->_busTrip;
  v8 = busTrip;
  if (!busTrip)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

  if (!busTrip)
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

- (INBusTrip)busTrip
{
  return self->_busTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_busTrip, 0);
  objc_storeStrong((id *)&self->_reservedSeat, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

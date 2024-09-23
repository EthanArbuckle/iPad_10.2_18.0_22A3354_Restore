@implementation INTrainReservation

- (INTrainReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat trainTrip:(INTrainTrip *)trainTrip
{
  INSeat *v18;
  INTrainTrip *v19;
  INTrainReservation *v20;
  uint64_t v21;
  INSeat *v22;
  uint64_t v23;
  INTrainTrip *v24;
  objc_super v26;

  v18 = reservedSeat;
  v19 = trainTrip;
  v26.receiver = self;
  v26.super_class = (Class)INTrainReservation;
  v20 = -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](&v26, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_, itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, URL);
  if (v20)
  {
    v21 = -[INSeat copy](v18, "copy");
    v22 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v21;

    v23 = -[INTrainTrip copy](v19, "copy");
    v24 = v20->_trainTrip;
    v20->_trainTrip = (INTrainTrip *)v23;

  }
  return v20;
}

- (INTrainReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat trainTrip:(INTrainTrip *)trainTrip
{
  return -[INTrainReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:trainTrip:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:trainTrip:", itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, 0, reservedSeat, trainTrip);
}

- (id)_duration
{
  return -[INTrainTrip tripDuration](self->_trainTrip, "tripDuration");
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INTrainReservation;
  v3 = -[INReservation hash](&v6, sel_hash);
  v4 = -[INSeat hash](self->_reservedSeat, "hash") ^ v3;
  return v4 ^ -[INTrainTrip hash](self->_trainTrip, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INTrainReservation *v4;
  INTrainReservation *v5;
  INSeat *reservedSeat;
  INTrainTrip *trainTrip;
  BOOL v8;
  objc_super v10;

  v4 = (INTrainReservation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INTrainReservation,
          -[INReservation isEqual:](&v10, sel_isEqual_, v4)))
    {
      v5 = v4;
      reservedSeat = self->_reservedSeat;
      v8 = 0;
      if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:"))
      {
        trainTrip = self->_trainTrip;
        if (trainTrip == v5->_trainTrip || -[INTrainTrip isEqual:](trainTrip, "isEqual:"))
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

- (INTrainReservation)initWithCoder:(id)a3
{
  id v4;
  INTrainReservation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  INSeat *reservedSeat;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  INTrainTrip *trainTrip;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INTrainReservation;
  v5 = -[INReservation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_reservedSeat);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_trainTrip);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    trainTrip = v5->_trainTrip;
    v5->_trainTrip = (INTrainTrip *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  INSeat *reservedSeat;
  void *v6;
  INTrainTrip *trainTrip;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INTrainReservation;
  v4 = a3;
  -[INReservation encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  reservedSeat = self->_reservedSeat;
  NSStringFromSelector(sel_reservedSeat);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", reservedSeat, v6, v9.receiver, v9.super_class);

  trainTrip = self->_trainTrip;
  NSStringFromSelector(sel_trainTrip);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", trainTrip, v8);

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INSeat *reservedSeat;
  void *v6;
  INTrainTrip *trainTrip;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)INTrainReservation;
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
  v12[1] = CFSTR("trainTrip");
  v13[0] = v6;
  trainTrip = self->_trainTrip;
  v8 = trainTrip;
  if (!trainTrip)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

  if (!trainTrip)
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

- (INTrainTrip)trainTrip
{
  return self->_trainTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainTrip, 0);
  objc_storeStrong((id *)&self->_reservedSeat, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

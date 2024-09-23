@implementation INTicketedEventReservation

- (INTicketedEventReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat event:(INTicketedEvent *)event
{
  INSeat *v18;
  INTicketedEvent *v19;
  INTicketedEventReservation *v20;
  uint64_t v21;
  INTicketedEvent *v22;
  uint64_t v23;
  INSeat *v24;
  objc_super v26;

  v18 = reservedSeat;
  v19 = event;
  v26.receiver = self;
  v26.super_class = (Class)INTicketedEventReservation;
  v20 = -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](&v26, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_, itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, URL);
  if (v20)
  {
    v21 = -[INTicketedEvent copy](v19, "copy");
    v22 = v20->_event;
    v20->_event = (INTicketedEvent *)v21;

    v23 = -[INSeat copy](v18, "copy");
    v24 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v23;

  }
  return v20;
}

- (INTicketedEventReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat event:(INTicketedEvent *)event
{
  return -[INTicketedEventReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:event:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:event:", itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, 0, reservedSeat, event);
}

- (id)_duration
{
  return -[INTicketedEvent eventDuration](self->_event, "eventDuration");
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INTicketedEventReservation;
  v3 = -[INReservation hash](&v6, sel_hash);
  v4 = -[INTicketedEvent hash](self->_event, "hash") ^ v3;
  return v4 ^ -[INSeat hash](self->_reservedSeat, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INTicketedEventReservation *v4;
  INTicketedEventReservation *v5;
  INTicketedEvent *event;
  INSeat *reservedSeat;
  BOOL v8;
  objc_super v10;

  v4 = (INTicketedEventReservation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INTicketedEventReservation,
          -[INReservation isEqual:](&v10, sel_isEqual_, v4)))
    {
      v5 = v4;
      event = self->_event;
      v8 = 0;
      if (event == v5->_event || -[INTicketedEvent isEqual:](event, "isEqual:"))
      {
        reservedSeat = self->_reservedSeat;
        if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:"))
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

- (INTicketedEventReservation)initWithCoder:(id)a3
{
  id v4;
  INTicketedEventReservation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  INTicketedEvent *event;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  INSeat *reservedSeat;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INTicketedEventReservation;
  v5 = -[INReservation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_event);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    event = v5->_event;
    v5->_event = (INTicketedEvent *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_reservedSeat);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  INTicketedEvent *event;
  void *v6;
  INSeat *reservedSeat;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INTicketedEventReservation;
  v4 = a3;
  -[INReservation encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  event = self->_event;
  NSStringFromSelector(sel_event);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", event, v6, v9.receiver, v9.super_class);

  reservedSeat = self->_reservedSeat;
  NSStringFromSelector(sel_reservedSeat);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", reservedSeat, v8);

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INTicketedEvent *event;
  void *v6;
  INSeat *reservedSeat;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)INTicketedEventReservation;
  -[INReservation _dictionaryRepresentation](&v11, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v12[0] = CFSTR("event");
  event = self->_event;
  v6 = event;
  if (!event)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = CFSTR("reservedSeat");
  v13[0] = v6;
  reservedSeat = self->_reservedSeat;
  v8 = reservedSeat;
  if (!reservedSeat)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

  if (!reservedSeat)
  {

    if (event)
      return v4;
LABEL_9:

    return v4;
  }
  if (!event)
    goto LABEL_9;
  return v4;
}

- (INTicketedEvent)event
{
  return self->_event;
}

- (INSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedSeat, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation INLodgingReservation

- (INLodgingReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL lodgingBusinessLocation:(CLPlacemark *)lodgingBusinessLocation reservationDuration:(INDateComponentsRange *)reservationDuration numberOfAdults:(NSNumber *)numberOfAdults numberOfChildren:(NSNumber *)numberOfChildren
{
  CLPlacemark *v18;
  INDateComponentsRange *v19;
  NSNumber *v20;
  NSNumber *v21;
  INLodgingReservation *v22;
  uint64_t v23;
  CLPlacemark *v24;
  uint64_t v25;
  INDateComponentsRange *v26;
  uint64_t v27;
  NSNumber *v28;
  uint64_t v29;
  NSNumber *v30;
  objc_super v34;

  v18 = lodgingBusinessLocation;
  v19 = reservationDuration;
  v20 = numberOfAdults;
  v21 = numberOfChildren;
  v34.receiver = self;
  v34.super_class = (Class)INLodgingReservation;
  v22 = -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](&v34, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_, itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, URL);
  if (v22)
  {
    v23 = -[CLPlacemark copy](v18, "copy");
    v24 = v22->_lodgingBusinessLocation;
    v22->_lodgingBusinessLocation = (CLPlacemark *)v23;

    v25 = -[INDateComponentsRange copy](v19, "copy");
    v26 = v22->_reservationDuration;
    v22->_reservationDuration = (INDateComponentsRange *)v25;

    v27 = -[NSNumber copy](v20, "copy");
    v28 = v22->_numberOfAdults;
    v22->_numberOfAdults = (NSNumber *)v27;

    v29 = -[NSNumber copy](v21, "copy");
    v30 = v22->_numberOfChildren;
    v22->_numberOfChildren = (NSNumber *)v29;

  }
  return v22;
}

- (INLodgingReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions lodgingBusinessLocation:(CLPlacemark *)lodgingBusinessLocation reservationDuration:(INDateComponentsRange *)reservationDuration numberOfAdults:(NSNumber *)numberOfAdults numberOfChildren:(NSNumber *)numberOfChildren
{
  return -[INLodgingReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:lodgingBusinessLocation:reservationDuration:numberOfAdults:numberOfChildren:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:lodgingBusinessLocation:reservationDuration:numberOfAdults:numberOfChildren:", itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, 0, lodgingBusinessLocation, reservationDuration, numberOfAdults, numberOfChildren);
}

- (id)_duration
{
  return self->_reservationDuration;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INLodgingReservation;
  v3 = -[INReservation hash](&v8, sel_hash);
  v4 = -[CLPlacemark hash](self->_lodgingBusinessLocation, "hash") ^ v3;
  v5 = -[INDateComponentsRange hash](self->_reservationDuration, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_numberOfAdults, "hash");
  return v6 ^ -[NSNumber hash](self->_numberOfChildren, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INLodgingReservation *v4;
  INLodgingReservation *v5;
  CLPlacemark *lodgingBusinessLocation;
  INDateComponentsRange *reservationDuration;
  NSNumber *numberOfAdults;
  NSNumber *numberOfChildren;
  BOOL v10;
  objc_super v12;

  v4 = (INLodgingReservation *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v12.receiver = self,
          v12.super_class = (Class)INLodgingReservation,
          -[INReservation isEqual:](&v12, sel_isEqual_, v4)))
    {
      v5 = v4;
      lodgingBusinessLocation = self->_lodgingBusinessLocation;
      v10 = 0;
      if (lodgingBusinessLocation == v5->_lodgingBusinessLocation
        || -[CLPlacemark isEqual:](lodgingBusinessLocation, "isEqual:"))
      {
        reservationDuration = self->_reservationDuration;
        if (reservationDuration == v5->_reservationDuration
          || -[INDateComponentsRange isEqual:](reservationDuration, "isEqual:"))
        {
          numberOfAdults = self->_numberOfAdults;
          if (numberOfAdults == v5->_numberOfAdults || -[NSNumber isEqual:](numberOfAdults, "isEqual:"))
          {
            numberOfChildren = self->_numberOfChildren;
            if (numberOfChildren == v5->_numberOfChildren
              || -[NSNumber isEqual:](numberOfChildren, "isEqual:"))
            {
              v10 = 1;
            }
          }
        }
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (INLodgingReservation)initWithCoder:(id)a3
{
  id v4;
  INLodgingReservation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CLPlacemark *lodgingBusinessLocation;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  INDateComponentsRange *reservationDuration;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSNumber *numberOfAdults;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSNumber *numberOfChildren;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INLodgingReservation;
  v5 = -[INReservation initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_lodgingBusinessLocation);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    lodgingBusinessLocation = v5->_lodgingBusinessLocation;
    v5->_lodgingBusinessLocation = (CLPlacemark *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_reservationDuration);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    reservationDuration = v5->_reservationDuration;
    v5->_reservationDuration = (INDateComponentsRange *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_numberOfAdults);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    numberOfAdults = v5->_numberOfAdults;
    v5->_numberOfAdults = (NSNumber *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_numberOfChildren);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    numberOfChildren = v5->_numberOfChildren;
    v5->_numberOfChildren = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CLPlacemark *lodgingBusinessLocation;
  void *v6;
  INDateComponentsRange *reservationDuration;
  void *v8;
  NSNumber *numberOfAdults;
  void *v10;
  NSNumber *numberOfChildren;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)INLodgingReservation;
  v4 = a3;
  -[INReservation encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  lodgingBusinessLocation = self->_lodgingBusinessLocation;
  NSStringFromSelector(sel_lodgingBusinessLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", lodgingBusinessLocation, v6, v13.receiver, v13.super_class);

  reservationDuration = self->_reservationDuration;
  NSStringFromSelector(sel_reservationDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", reservationDuration, v8);

  numberOfAdults = self->_numberOfAdults;
  NSStringFromSelector(sel_numberOfAdults);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", numberOfAdults, v10);

  numberOfChildren = self->_numberOfChildren;
  NSStringFromSelector(sel_numberOfChildren);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", numberOfChildren, v12);

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  CLPlacemark *lodgingBusinessLocation;
  void *v6;
  INDateComponentsRange *reservationDuration;
  void *v8;
  NSNumber *numberOfAdults;
  void *v10;
  NSNumber *numberOfChildren;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)INLodgingReservation;
  -[INReservation _dictionaryRepresentation](&v15, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v16[0] = CFSTR("lodgingBusinessLocation");
  lodgingBusinessLocation = self->_lodgingBusinessLocation;
  v6 = lodgingBusinessLocation;
  if (!lodgingBusinessLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v6;
  v16[1] = CFSTR("reservationDuration");
  reservationDuration = self->_reservationDuration;
  v8 = reservationDuration;
  if (!reservationDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v8;
  v16[2] = CFSTR("numberOfAdults");
  numberOfAdults = self->_numberOfAdults;
  v10 = numberOfAdults;
  if (!numberOfAdults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v10;
  v16[3] = CFSTR("numberOfChildren");
  numberOfChildren = self->_numberOfChildren;
  v12 = numberOfChildren;
  if (!numberOfChildren)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v13);

  if (numberOfChildren)
  {
    if (numberOfAdults)
      goto LABEL_11;
  }
  else
  {

    if (numberOfAdults)
    {
LABEL_11:
      if (reservationDuration)
        goto LABEL_12;
LABEL_16:

      if (lodgingBusinessLocation)
        return v4;
LABEL_17:

      return v4;
    }
  }

  if (!reservationDuration)
    goto LABEL_16;
LABEL_12:
  if (!lodgingBusinessLocation)
    goto LABEL_17;
  return v4;
}

- (CLPlacemark)lodgingBusinessLocation
{
  return self->_lodgingBusinessLocation;
}

- (INDateComponentsRange)reservationDuration
{
  return self->_reservationDuration;
}

- (NSNumber)numberOfAdults
{
  return self->_numberOfAdults;
}

- (NSNumber)numberOfChildren
{
  return self->_numberOfChildren;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfChildren, 0);
  objc_storeStrong((id *)&self->_numberOfAdults, 0);
  objc_storeStrong((id *)&self->_reservationDuration, 0);
  objc_storeStrong((id *)&self->_lodgingBusinessLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

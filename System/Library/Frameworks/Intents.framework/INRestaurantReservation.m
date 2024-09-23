@implementation INRestaurantReservation

- (INRestaurantReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservationDuration:(INDateComponentsRange *)reservationDuration partySize:(NSNumber *)partySize restaurantLocation:(CLPlacemark *)restaurantLocation
{
  INDateComponentsRange *v18;
  NSNumber *v19;
  CLPlacemark *v20;
  INRestaurantReservation *v21;
  uint64_t v22;
  INDateComponentsRange *v23;
  uint64_t v24;
  NSNumber *v25;
  uint64_t v26;
  CLPlacemark *v27;
  objc_super v30;

  v18 = reservationDuration;
  v19 = partySize;
  v20 = restaurantLocation;
  v30.receiver = self;
  v30.super_class = (Class)INRestaurantReservation;
  v21 = -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](&v30, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_, itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, URL);
  if (v21)
  {
    v22 = -[INDateComponentsRange copy](v18, "copy");
    v23 = v21->_reservationDuration;
    v21->_reservationDuration = (INDateComponentsRange *)v22;

    v24 = -[NSNumber copy](v19, "copy");
    v25 = v21->_partySize;
    v21->_partySize = (NSNumber *)v24;

    v26 = -[CLPlacemark copy](v20, "copy");
    v27 = v21->_restaurantLocation;
    v21->_restaurantLocation = (CLPlacemark *)v26;

  }
  return v21;
}

- (INRestaurantReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservationDuration:(INDateComponentsRange *)reservationDuration partySize:(NSNumber *)partySize restaurantLocation:(CLPlacemark *)restaurantLocation
{
  return -[INRestaurantReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservationDuration:partySize:restaurantLocation:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservationDuration:partySize:restaurantLocation:", itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, 0, reservationDuration, partySize, restaurantLocation);
}

- (id)_duration
{
  return self->_reservationDuration;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INRestaurantReservation;
  v3 = -[INReservation hash](&v7, sel_hash);
  v4 = -[INDateComponentsRange hash](self->_reservationDuration, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_partySize, "hash");
  return v4 ^ v5 ^ -[CLPlacemark hash](self->_restaurantLocation, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INRestaurantReservation *v4;
  INRestaurantReservation *v5;
  INDateComponentsRange *reservationDuration;
  NSNumber *partySize;
  CLPlacemark *restaurantLocation;
  BOOL v9;
  objc_super v11;

  v4 = (INRestaurantReservation *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)INRestaurantReservation,
          -[INReservation isEqual:](&v11, sel_isEqual_, v4)))
    {
      v5 = v4;
      reservationDuration = self->_reservationDuration;
      v9 = 0;
      if (reservationDuration == v5->_reservationDuration
        || -[INDateComponentsRange isEqual:](reservationDuration, "isEqual:"))
      {
        partySize = self->_partySize;
        if (partySize == v5->_partySize || -[NSNumber isEqual:](partySize, "isEqual:"))
        {
          restaurantLocation = self->_restaurantLocation;
          if (restaurantLocation == v5->_restaurantLocation
            || -[CLPlacemark isEqual:](restaurantLocation, "isEqual:"))
          {
            v9 = 1;
          }
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INRestaurantReservation)initWithCoder:(id)a3
{
  id v4;
  INRestaurantReservation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  INDateComponentsRange *reservationDuration;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSNumber *partySize;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  CLPlacemark *restaurantLocation;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INRestaurantReservation;
  v5 = -[INReservation initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_reservationDuration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    reservationDuration = v5->_reservationDuration;
    v5->_reservationDuration = (INDateComponentsRange *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_partySize);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    partySize = v5->_partySize;
    v5->_partySize = (NSNumber *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_restaurantLocation);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    restaurantLocation = v5->_restaurantLocation;
    v5->_restaurantLocation = (CLPlacemark *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  INDateComponentsRange *reservationDuration;
  void *v6;
  NSNumber *partySize;
  void *v8;
  CLPlacemark *restaurantLocation;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INRestaurantReservation;
  v4 = a3;
  -[INReservation encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  reservationDuration = self->_reservationDuration;
  NSStringFromSelector(sel_reservationDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", reservationDuration, v6, v11.receiver, v11.super_class);

  partySize = self->_partySize;
  NSStringFromSelector(sel_partySize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", partySize, v8);

  restaurantLocation = self->_restaurantLocation;
  NSStringFromSelector(sel_restaurantLocation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", restaurantLocation, v10);

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INDateComponentsRange *reservationDuration;
  void *v6;
  NSNumber *partySize;
  void *v8;
  CLPlacemark *restaurantLocation;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)INRestaurantReservation;
  -[INReservation _dictionaryRepresentation](&v13, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v14[0] = CFSTR("reservationDuration");
  reservationDuration = self->_reservationDuration;
  v6 = reservationDuration;
  if (!reservationDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v6;
  v14[1] = CFSTR("partySize");
  partySize = self->_partySize;
  v8 = partySize;
  if (!partySize)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v8;
  v14[2] = CFSTR("restaurantLocation");
  restaurantLocation = self->_restaurantLocation;
  v10 = restaurantLocation;
  if (!restaurantLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v11);

  if (restaurantLocation)
  {
    if (partySize)
      goto LABEL_9;
LABEL_12:

    if (reservationDuration)
      return v4;
LABEL_13:

    return v4;
  }

  if (!partySize)
    goto LABEL_12;
LABEL_9:
  if (!reservationDuration)
    goto LABEL_13;
  return v4;
}

- (INDateComponentsRange)reservationDuration
{
  return self->_reservationDuration;
}

- (NSNumber)partySize
{
  return self->_partySize;
}

- (CLPlacemark)restaurantLocation
{
  return self->_restaurantLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantLocation, 0);
  objc_storeStrong((id *)&self->_partySize, 0);
  objc_storeStrong((id *)&self->_reservationDuration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

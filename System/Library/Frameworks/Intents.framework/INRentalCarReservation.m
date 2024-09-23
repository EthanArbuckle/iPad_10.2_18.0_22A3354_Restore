@implementation INRentalCarReservation

- (INRentalCarReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL rentalCar:(INRentalCar *)rentalCar rentalDuration:(INDateComponentsRange *)rentalDuration pickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation
{
  INRentalCar *v18;
  INDateComponentsRange *v19;
  CLPlacemark *v20;
  CLPlacemark *v21;
  INRentalCarReservation *v22;
  uint64_t v23;
  INRentalCar *v24;
  uint64_t v25;
  INDateComponentsRange *v26;
  uint64_t v27;
  CLPlacemark *v28;
  uint64_t v29;
  CLPlacemark *v30;
  objc_super v34;

  v18 = rentalCar;
  v19 = rentalDuration;
  v20 = pickupLocation;
  v21 = dropOffLocation;
  v34.receiver = self;
  v34.super_class = (Class)INRentalCarReservation;
  v22 = -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](&v34, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_, itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, URL);
  if (v22)
  {
    v23 = -[INRentalCar copy](v18, "copy");
    v24 = v22->_rentalCar;
    v22->_rentalCar = (INRentalCar *)v23;

    v25 = -[INDateComponentsRange copy](v19, "copy");
    v26 = v22->_rentalDuration;
    v22->_rentalDuration = (INDateComponentsRange *)v25;

    v27 = -[CLPlacemark copy](v20, "copy");
    v28 = v22->_pickupLocation;
    v22->_pickupLocation = (CLPlacemark *)v27;

    v29 = -[CLPlacemark copy](v21, "copy");
    v30 = v22->_dropOffLocation;
    v22->_dropOffLocation = (CLPlacemark *)v29;

  }
  return v22;
}

- (INRentalCarReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions rentalCar:(INRentalCar *)rentalCar rentalDuration:(INDateComponentsRange *)rentalDuration pickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation
{
  return -[INRentalCarReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:rentalCar:rentalDuration:pickupLocation:dropOffLocation:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:rentalCar:rentalDuration:pickupLocation:dropOffLocation:", itemReference, reservationNumber, bookingTime, reservationStatus, reservationHolderName, actions, 0, rentalCar, rentalDuration, pickupLocation, dropOffLocation);
}

- (id)_duration
{
  return self->_rentalDuration;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INRentalCarReservation;
  v3 = -[INReservation hash](&v8, sel_hash);
  v4 = -[INRentalCar hash](self->_rentalCar, "hash") ^ v3;
  v5 = -[INDateComponentsRange hash](self->_rentalDuration, "hash");
  v6 = v4 ^ v5 ^ -[CLPlacemark hash](self->_pickupLocation, "hash");
  return v6 ^ -[CLPlacemark hash](self->_dropOffLocation, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INRentalCarReservation *v4;
  INRentalCarReservation *v5;
  INRentalCar *rentalCar;
  INDateComponentsRange *rentalDuration;
  CLPlacemark *pickupLocation;
  CLPlacemark *dropOffLocation;
  BOOL v10;
  objc_super v12;

  v4 = (INRentalCarReservation *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v12.receiver = self,
          v12.super_class = (Class)INRentalCarReservation,
          -[INReservation isEqual:](&v12, sel_isEqual_, v4)))
    {
      v5 = v4;
      rentalCar = self->_rentalCar;
      v10 = 0;
      if (rentalCar == v5->_rentalCar || -[INRentalCar isEqual:](rentalCar, "isEqual:"))
      {
        rentalDuration = self->_rentalDuration;
        if (rentalDuration == v5->_rentalDuration || -[INDateComponentsRange isEqual:](rentalDuration, "isEqual:"))
        {
          pickupLocation = self->_pickupLocation;
          if (pickupLocation == v5->_pickupLocation
            || -[CLPlacemark isEqual:](pickupLocation, "isEqual:"))
          {
            dropOffLocation = self->_dropOffLocation;
            if (dropOffLocation == v5->_dropOffLocation
              || -[CLPlacemark isEqual:](dropOffLocation, "isEqual:"))
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

- (INRentalCarReservation)initWithCoder:(id)a3
{
  id v4;
  INRentalCarReservation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  INRentalCar *rentalCar;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  INDateComponentsRange *rentalDuration;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  CLPlacemark *pickupLocation;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  CLPlacemark *dropOffLocation;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INRentalCarReservation;
  v5 = -[INReservation initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_rentalCar);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    rentalCar = v5->_rentalCar;
    v5->_rentalCar = (INRentalCar *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_rentalDuration);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    rentalDuration = v5->_rentalDuration;
    v5->_rentalDuration = (INDateComponentsRange *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_pickupLocation);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    pickupLocation = v5->_pickupLocation;
    v5->_pickupLocation = (CLPlacemark *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_dropOffLocation);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    dropOffLocation = v5->_dropOffLocation;
    v5->_dropOffLocation = (CLPlacemark *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  INRentalCar *rentalCar;
  void *v6;
  INDateComponentsRange *rentalDuration;
  void *v8;
  CLPlacemark *pickupLocation;
  void *v10;
  CLPlacemark *dropOffLocation;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)INRentalCarReservation;
  v4 = a3;
  -[INReservation encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  rentalCar = self->_rentalCar;
  NSStringFromSelector(sel_rentalCar);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", rentalCar, v6, v13.receiver, v13.super_class);

  rentalDuration = self->_rentalDuration;
  NSStringFromSelector(sel_rentalDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", rentalDuration, v8);

  pickupLocation = self->_pickupLocation;
  NSStringFromSelector(sel_pickupLocation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", pickupLocation, v10);

  dropOffLocation = self->_dropOffLocation;
  NSStringFromSelector(sel_dropOffLocation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", dropOffLocation, v12);

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INRentalCar *rentalCar;
  void *v6;
  INDateComponentsRange *rentalDuration;
  void *v8;
  CLPlacemark *pickupLocation;
  void *v10;
  CLPlacemark *dropOffLocation;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)INRentalCarReservation;
  -[INReservation _dictionaryRepresentation](&v15, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v16[0] = CFSTR("rentalCar");
  rentalCar = self->_rentalCar;
  v6 = rentalCar;
  if (!rentalCar)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v6;
  v16[1] = CFSTR("rentalDuration");
  rentalDuration = self->_rentalDuration;
  v8 = rentalDuration;
  if (!rentalDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v8;
  v16[2] = CFSTR("pickupLocation");
  pickupLocation = self->_pickupLocation;
  v10 = pickupLocation;
  if (!pickupLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v10;
  v16[3] = CFSTR("dropOffLocation");
  dropOffLocation = self->_dropOffLocation;
  v12 = dropOffLocation;
  if (!dropOffLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v13);

  if (dropOffLocation)
  {
    if (pickupLocation)
      goto LABEL_11;
  }
  else
  {

    if (pickupLocation)
    {
LABEL_11:
      if (rentalDuration)
        goto LABEL_12;
LABEL_16:

      if (rentalCar)
        return v4;
LABEL_17:

      return v4;
    }
  }

  if (!rentalDuration)
    goto LABEL_16;
LABEL_12:
  if (!rentalCar)
    goto LABEL_17;
  return v4;
}

- (INRentalCar)rentalCar
{
  return self->_rentalCar;
}

- (INDateComponentsRange)rentalDuration
{
  return self->_rentalDuration;
}

- (CLPlacemark)pickupLocation
{
  return self->_pickupLocation;
}

- (CLPlacemark)dropOffLocation
{
  return self->_dropOffLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_rentalDuration, 0);
  objc_storeStrong((id *)&self->_rentalCar, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

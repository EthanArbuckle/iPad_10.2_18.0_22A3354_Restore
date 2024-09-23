@implementation INReservation

- (INReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8
{
  return -[INReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:", a3, a4, a5, a6, a7, a8, 0);
}

- (INReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8 URL:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  INReservation *v21;
  uint64_t v22;
  INSpeakableString *itemReference;
  uint64_t v24;
  NSString *reservationNumber;
  uint64_t v26;
  NSDate *bookingTime;
  uint64_t v28;
  NSString *reservationHolderName;
  uint64_t v30;
  NSArray *actions;
  uint64_t v32;
  NSURL *URL;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)INReservation;
  v21 = -[INReservation init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    itemReference = v21->_itemReference;
    v21->_itemReference = (INSpeakableString *)v22;

    v24 = objc_msgSend(v16, "copy");
    reservationNumber = v21->_reservationNumber;
    v21->_reservationNumber = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    bookingTime = v21->_bookingTime;
    v21->_bookingTime = (NSDate *)v26;

    v21->_reservationStatus = a6;
    v28 = objc_msgSend(v18, "copy");
    reservationHolderName = v21->_reservationHolderName;
    v21->_reservationHolderName = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    actions = v21->_actions;
    v21->_actions = (NSArray *)v30;

    v32 = objc_msgSend(v20, "copy");
    URL = v21->_URL;
    v21->_URL = (NSURL *)v32;

  }
  return v21;
}

- (id)url
{
  return self->_URL;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;

  v3 = -[INSpeakableString hash](self->_itemReference, "hash");
  v4 = -[NSString hash](self->_reservationNumber, "hash") ^ v3;
  v5 = v4 ^ -[NSDate hash](self->_bookingTime, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reservationStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = -[NSString hash](self->_reservationHolderName, "hash");
  v9 = v8 ^ -[NSArray hash](self->_actions, "hash");
  v10 = v7 ^ v9 ^ -[NSURL hash](self->_URL, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  INReservation *v4;
  INReservation *v5;
  INSpeakableString *itemReference;
  NSString *reservationNumber;
  NSDate *bookingTime;
  NSString *reservationHolderName;
  NSArray *actions;
  NSURL *URL;
  BOOL v12;

  v4 = (INReservation *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      itemReference = self->_itemReference;
      v12 = 0;
      if (itemReference == v5->_itemReference || -[INSpeakableString isEqual:](itemReference, "isEqual:"))
      {
        reservationNumber = self->_reservationNumber;
        if (reservationNumber == v5->_reservationNumber
          || -[NSString isEqual:](reservationNumber, "isEqual:"))
        {
          bookingTime = self->_bookingTime;
          if ((bookingTime == v5->_bookingTime || -[NSDate isEqual:](bookingTime, "isEqual:"))
            && self->_reservationStatus == v5->_reservationStatus)
          {
            reservationHolderName = self->_reservationHolderName;
            if (reservationHolderName == v5->_reservationHolderName
              || -[NSString isEqual:](reservationHolderName, "isEqual:"))
            {
              actions = self->_actions;
              if (actions == v5->_actions || -[NSArray isEqual:](actions, "isEqual:"))
              {
                URL = self->_URL;
                if (URL == v5->_URL || -[NSURL isEqual:](URL, "isEqual:"))
                  v12 = 1;
              }
            }
          }
        }
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (INReservation)initWithCoder:(id)a3
{
  id v4;
  INReservation *v5;
  uint64_t v6;
  INSpeakableString *itemReference;
  uint64_t v8;
  NSString *reservationNumber;
  uint64_t v10;
  NSDate *bookingTime;
  uint64_t v12;
  NSString *reservationHolderName;
  uint64_t v14;
  NSURL *URL;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INReservation;
  v5 = -[INReservation init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemReference"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemReference = v5->_itemReference;
    v5->_itemReference = (INSpeakableString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservationNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    reservationNumber = v5->_reservationNumber;
    v5->_reservationNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookingTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    bookingTime = v5->_bookingTime;
    v5->_bookingTime = (NSDate *)v10;

    v5->_reservationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reservationStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservationHolderName"));
    v12 = objc_claimAutoreleasedReturnValue();
    reservationHolderName = v5->_reservationHolderName;
    v5->_reservationHolderName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v14 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *itemReference;
  id v5;

  itemReference = self->_itemReference;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemReference, CFSTR("itemReference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reservationNumber, CFSTR("reservationNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookingTime, CFSTR("bookingTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reservationStatus, CFSTR("reservationStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reservationHolderName, CFSTR("reservationHolderName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_URL, CFSTR("URL"));

}

- (id)description
{
  return -[INReservation descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INReservation;
  -[INReservation description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INReservation _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INSpeakableString *itemReference;
  uint64_t v4;
  NSString *reservationNumber;
  uint64_t v6;
  NSDate *bookingTime;
  void *v8;
  void *v9;
  NSString *reservationHolderName;
  void *v11;
  NSURL *URL;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("itemReference");
  itemReference = self->_itemReference;
  v4 = (uint64_t)itemReference;
  if (!itemReference)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v4;
  v19[0] = v4;
  v18[1] = CFSTR("reservationNumber");
  reservationNumber = self->_reservationNumber;
  v6 = (uint64_t)reservationNumber;
  if (!reservationNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v6;
  v19[1] = v6;
  v18[2] = CFSTR("bookingTime");
  bookingTime = self->_bookingTime;
  v8 = bookingTime;
  if (!bookingTime)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[2] = v8;
  v18[3] = CFSTR("reservationStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reservationStatus);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v18[4] = CFSTR("reservationHolderName");
  reservationHolderName = self->_reservationHolderName;
  v11 = reservationHolderName;
  if (!reservationHolderName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[4] = v11;
  v18[5] = CFSTR("URL");
  URL = self->_URL;
  v13 = URL;
  if (!URL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (URL)
  {
    if (reservationHolderName)
      goto LABEL_13;
  }
  else
  {

    if (reservationHolderName)
      goto LABEL_13;
  }

LABEL_13:
  if (bookingTime)
  {
    if (reservationNumber)
      goto LABEL_15;
LABEL_20:

    if (itemReference)
      return v14;
LABEL_21:

    return v14;
  }

  if (!reservationNumber)
    goto LABEL_20;
LABEL_15:
  if (!itemReference)
    goto LABEL_21;
  return v14;
}

- (INSpeakableString)itemReference
{
  return self->_itemReference;
}

- (NSString)reservationNumber
{
  return self->_reservationNumber;
}

- (NSDate)bookingTime
{
  return self->_bookingTime;
}

- (INReservationStatus)reservationStatus
{
  return self->_reservationStatus;
}

- (NSString)reservationHolderName
{
  return self->_reservationHolderName;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSURL)URL
{
  return self->_URL;
}

- (INDateComponentsRange)_duration
{
  return self->__duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__duration, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_reservationHolderName, 0);
  objc_storeStrong((id *)&self->_bookingTime, 0);
  objc_storeStrong((id *)&self->_reservationNumber, 0);
  objc_storeStrong((id *)&self->_itemReference, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

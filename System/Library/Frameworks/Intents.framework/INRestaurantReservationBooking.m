@implementation INRestaurantReservationBooking

- (INRestaurantReservationBooking)init
{
  INRestaurant *v3;
  void *v4;
  INRestaurant *v5;
  void *v6;
  INRestaurantReservationBooking *v7;

  v3 = [INRestaurant alloc];
  v4 = (void *)objc_opt_new();
  v5 = -[INRestaurant initWithLocation:name:vendorIdentifier:restaurantIdentifier:](v3, "initWithLocation:name:vendorIdentifier:restaurantIdentifier:", v4, &stru_1E2295770, &stru_1E2295770, &stru_1E2295770);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INRestaurantReservationBooking initWithRestaurant:bookingDate:partySize:bookingIdentifier:](self, "initWithRestaurant:bookingDate:partySize:bookingIdentifier:", v5, v6, 0, &stru_1E2295770);

  return v7;
}

- (INRestaurantReservationBooking)initWithRestaurant:(INRestaurant *)restaurant bookingDate:(NSDate *)bookingDate partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier
{
  INRestaurant *v10;
  NSDate *v11;
  NSString *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v10 = restaurant;
  v11 = bookingDate;
  v12 = bookingIdentifier;
  v21.receiver = self;
  v21.super_class = (Class)INRestaurantReservationBooking;
  v13 = -[INRestaurantReservationBooking init](&v21, sel_init);
  if (v13)
  {
    v14 = -[INRestaurant copy](v10, "copy");
    v15 = (void *)*((_QWORD *)v13 + 2);
    *((_QWORD *)v13 + 2) = v14;

    v16 = -[NSDate copy](v11, "copy");
    v17 = (void *)*((_QWORD *)v13 + 4);
    *((_QWORD *)v13 + 4) = v16;

    *((_QWORD *)v13 + 5) = partySize;
    v18 = -[NSString copy](v12, "copy");
    v19 = (void *)*((_QWORD *)v13 + 6);
    *((_QWORD *)v13 + 6) = v18;

    v13[8] = 1;
    *(_DWORD *)(v13 + 9) = 0;
  }

  return (INRestaurantReservationBooking *)v13;
}

- (INRestaurantReservationBooking)initWithCoder:(id)a3
{
  id v4;
  INRestaurantReservationBooking *v5;
  uint64_t v6;
  INRestaurant *restaurant;
  uint64_t v8;
  NSDate *bookingDate;
  uint64_t v10;
  NSString *bookingIdentifier;
  uint64_t v12;
  NSString *bookingDescription;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *offers;
  INRestaurantReservationBooking *v19;
  NSObject *v20;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[INRestaurantReservationBooking init](self, "init");
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restaurant"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v20 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 136315394;
    v23 = "-[INRestaurantReservationBooking initWithCoder:]";
    v24 = 2080;
    v25 = "_restaurant";
LABEL_13:
    _os_log_error_impl(&dword_18BEBC000, v20, OS_LOG_TYPE_ERROR, "%s Null value for %s", buf, 0x16u);
    goto LABEL_14;
  }
  restaurant = v5->_restaurant;
  v5->_restaurant = (INRestaurant *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookingDate"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v20 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 136315394;
    v23 = "-[INRestaurantReservationBooking initWithCoder:]";
    v24 = 2080;
    v25 = "_bookingDate";
    goto LABEL_13;
  }
  bookingDate = v5->_bookingDate;
  v5->_bookingDate = (NSDate *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookingIdentifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v20 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[INRestaurantReservationBooking initWithCoder:]";
      v24 = 2080;
      v25 = "_bookingIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  bookingIdentifier = v5->_bookingIdentifier;
  v5->_bookingIdentifier = (NSString *)v10;

  v5->_partySize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partySize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookingDescription"));
  v12 = objc_claimAutoreleasedReturnValue();
  bookingDescription = v5->_bookingDescription;
  v5->_bookingDescription = (NSString *)v12;

  v5->_bookingAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBookingAvailable"));
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("offers"));
  v17 = objc_claimAutoreleasedReturnValue();
  offers = v5->_offers;
  v5->_offers = (NSArray *)v17;

  v5->_requiresManualRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresManualRequest"));
  v5->_requiresName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresName"));
  v5->_requiresPhoneNumber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresPhoneNumber"));
  v5->_requiresEmailAddress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresEmailAddress"));
LABEL_6:
  v19 = v5;
LABEL_15:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  INRestaurant *restaurant;
  id v5;

  restaurant = self->_restaurant;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", restaurant, CFSTR("restaurant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookingDescription, CFSTR("bookingDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookingDate, CFSTR("bookingDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_partySize, CFSTR("partySize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookingIdentifier, CFSTR("bookingIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_bookingAvailable, CFSTR("isBookingAvailable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offers, CFSTR("offers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresManualRequest, CFSTR("requiresManualRequest"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresName, CFSTR("requiresName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresPhoneNumber, CFSTR("requiresPhoneNumber"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresEmailAddress, CFSTR("requiresEmailAddress"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[INRestaurantReservationBooking restaurant](self, "restaurant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestaurant:", v5);

  -[INRestaurantReservationBooking bookingDescription](self, "bookingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBookingDescription:", v6);

  -[INRestaurantReservationBooking bookingDate](self, "bookingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBookingDate:", v7);

  objc_msgSend(v4, "setPartySize:", -[INRestaurantReservationBooking partySize](self, "partySize"));
  -[INRestaurantReservationBooking bookingIdentifier](self, "bookingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBookingIdentifier:", v8);

  objc_msgSend(v4, "setBookingAvailable:", -[INRestaurantReservationBooking isBookingAvailable](self, "isBookingAvailable"));
  -[INRestaurantReservationBooking offers](self, "offers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[INRestaurantReservationBooking offers](self, "offers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 1);
    objc_msgSend(v4, "setOffers:", v12);

  }
  objc_msgSend(v4, "setRequiresManualRequest:", -[INRestaurantReservationBooking requiresManualRequest](self, "requiresManualRequest"));
  objc_msgSend(v4, "setRequiresName:", -[INRestaurantReservationBooking requiresName](self, "requiresName"));
  objc_msgSend(v4, "setRequiresPhoneNumber:", -[INRestaurantReservationBooking requiresPhoneNumber](self, "requiresPhoneNumber"));
  objc_msgSend(v4, "setRequiresEmailAddress:", -[INRestaurantReservationBooking requiresEmailAddress](self, "requiresEmailAddress"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INRestaurantReservationBooking *v5;
  INRestaurantReservationBooking *v6;
  void *v7;
  INRestaurantReservationBooking *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v31;
  void *v32;
  void *v33;

  v5 = (INRestaurantReservationBooking *)a3;
  v6 = v5;
  if (v5 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    if (v5)
    {
      v7 = (void *)objc_opt_class();
      if (objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
      {
        v8 = v6;
        -[INRestaurantReservationBooking bookingDescription](v8, "bookingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (-[INRestaurantReservationBooking bookingDescription](self, "bookingDescription"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[INRestaurantReservationBooking bookingDescription](v8, "bookingDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[INRestaurantReservationBooking bookingDescription](self, "bookingDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[INRestaurantReservationBooking bookingDescription](self, "bookingDescription");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v10, "isEqualToString:", v12);

          }
          else
          {
            v13 = objc_msgSend(v10, "isEqualToString:", &stru_1E2295770);
          }

          if (v9)
          {
LABEL_15:

            -[INRestaurantReservationBooking offers](v8, "offers");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15
              || (-[INRestaurantReservationBooking offers](self, "offers"),
                  (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[INRestaurantReservationBooking offers](v8, "offers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[INRestaurantReservationBooking offers](self, "offers");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                -[INRestaurantReservationBooking offers](self, "offers");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v16, "isEqualToArray:", v18);

              }
              else
              {
                v19 = objc_msgSend(v16, "isEqualToArray:", MEMORY[0x1E0C9AA60]);
              }

              if (v15)
              {
LABEL_24:

                -[INRestaurantReservationBooking restaurant](v8, "restaurant");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[INRestaurantReservationBooking restaurant](self, "restaurant");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v20, "isEqual:", v21) & v13) != 1)
                {
                  LOBYTE(v14) = 0;
LABEL_38:

                  goto LABEL_39;
                }
                -[INRestaurantReservationBooking bookingDate](v8, "bookingDate");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[INRestaurantReservationBooking bookingDate](self, "bookingDate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v22, "isEqualToDate:", v23)
                  || (v24 = -[INRestaurantReservationBooking partySize](v8, "partySize"),
                      v24 != -[INRestaurantReservationBooking partySize](self, "partySize")))
                {
                  LOBYTE(v14) = 0;
                  goto LABEL_37;
                }
                -[INRestaurantReservationBooking bookingIdentifier](v8, "bookingIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[INRestaurantReservationBooking bookingIdentifier](self, "bookingIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v25, "isEqualToString:"))
                {
                  v32 = v25;
                  v26 = -[INRestaurantReservationBooking isBookingAvailable](v8, "isBookingAvailable");
                  LOBYTE(v14) = 0;
                  if (v26 != -[INRestaurantReservationBooking isBookingAvailable](self, "isBookingAvailable"))
                  {
                    v25 = v32;
                    goto LABEL_34;
                  }
                  v25 = v32;
                  if (((v19 ^ 1) & 1) != 0)
                  {
LABEL_34:

LABEL_37:
                    goto LABEL_38;
                  }
                  v27 = -[INRestaurantReservationBooking requiresManualRequest](v8, "requiresManualRequest");
                  if (v27 == -[INRestaurantReservationBooking requiresManualRequest](self, "requiresManualRequest"))
                  {
                    v28 = -[INRestaurantReservationBooking requiresName](v8, "requiresName");
                    if (v28 == -[INRestaurantReservationBooking requiresName](self, "requiresName"))
                    {
                      v29 = -[INRestaurantReservationBooking requiresPhoneNumber](v8, "requiresPhoneNumber");
                      if (v29 == -[INRestaurantReservationBooking requiresPhoneNumber](self, "requiresPhoneNumber"))
                      {
                        v31 = -[INRestaurantReservationBooking requiresEmailAddress](v8, "requiresEmailAddress");
                        v14 = v31 ^ -[INRestaurantReservationBooking requiresEmailAddress](self, "requiresEmailAddress") ^ 1;
                        goto LABEL_34;
                      }
                    }
                  }
                }
                LOBYTE(v14) = 0;
                goto LABEL_34;
              }
            }
            else
            {
              v19 = 1;
            }

            goto LABEL_24;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_15;
      }
    }
    LOBYTE(v14) = 0;
  }
LABEL_39:

  return v14;
}

- (NSString)description
{
  return (NSString *)-[INRestaurantReservationBooking descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INRestaurantReservationBooking;
  -[INRestaurantReservationBooking description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantReservationBooking _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t restaurant;
  uint64_t bookingDescription;
  NSDate *bookingDate;
  uint64_t v6;
  NSString *bookingIdentifier;
  uint64_t v8;
  void *v9;
  NSArray *offers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[11];
  _QWORD v26[13];

  v26[11] = *MEMORY[0x1E0C80C00];
  restaurant = (uint64_t)self->_restaurant;
  v24 = restaurant;
  v25[0] = CFSTR("restaurant");
  if (!restaurant)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    restaurant = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)restaurant;
  v26[0] = restaurant;
  v25[1] = CFSTR("bookingDescription");
  bookingDescription = (uint64_t)self->_bookingDescription;
  v23 = bookingDescription;
  if (!bookingDescription)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    bookingDescription = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)bookingDescription;
  v26[1] = bookingDescription;
  v25[2] = CFSTR("bookingDate");
  bookingDate = self->_bookingDate;
  v6 = (uint64_t)bookingDate;
  if (!bookingDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v6;
  v26[2] = v6;
  v25[3] = CFSTR("partySize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_partySize);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v22;
  v25[4] = CFSTR("bookingIdentifier");
  bookingIdentifier = self->_bookingIdentifier;
  v8 = (uint64_t)bookingIdentifier;
  if (!bookingIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v8;
  v26[4] = v8;
  v25[5] = CFSTR("isBookingAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INRestaurantReservationBooking isBookingAvailable](self, "isBookingAvailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v9;
  v25[6] = CFSTR("offers");
  offers = self->_offers;
  v11 = offers;
  if (!offers)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[6] = v11;
  v25[7] = CFSTR("requiresManualRequest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresManualRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v12;
  v25[8] = CFSTR("requiresEmailAddress");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresEmailAddress);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v13;
  v25[9] = CFSTR("requiresName");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v14;
  v25[10] = CFSTR("requiresPhoneNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresPhoneNumber);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[10] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!offers)
  if (!bookingIdentifier)

  if (!bookingDate)
  if (!v23)

  if (!v24)
  return v16;
}

- (INRestaurant)restaurant
{
  return self->_restaurant;
}

- (void)setRestaurant:(INRestaurant *)restaurant
{
  objc_setProperty_nonatomic_copy(self, a2, restaurant, 16);
}

- (NSString)bookingDescription
{
  return self->_bookingDescription;
}

- (void)setBookingDescription:(NSString *)bookingDescription
{
  objc_setProperty_nonatomic_copy(self, a2, bookingDescription, 24);
}

- (NSDate)bookingDate
{
  return self->_bookingDate;
}

- (void)setBookingDate:(NSDate *)bookingDate
{
  objc_setProperty_nonatomic_copy(self, a2, bookingDate, 32);
}

- (NSUInteger)partySize
{
  return self->_partySize;
}

- (void)setPartySize:(NSUInteger)partySize
{
  self->_partySize = partySize;
}

- (NSString)bookingIdentifier
{
  return self->_bookingIdentifier;
}

- (void)setBookingIdentifier:(NSString *)bookingIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, bookingIdentifier, 48);
}

- (BOOL)isBookingAvailable
{
  return self->_bookingAvailable;
}

- (void)setBookingAvailable:(BOOL)bookingAvailable
{
  self->_bookingAvailable = bookingAvailable;
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(NSArray *)offers
{
  objc_setProperty_nonatomic_copy(self, a2, offers, 56);
}

- (BOOL)requiresManualRequest
{
  return self->_requiresManualRequest;
}

- (void)setRequiresManualRequest:(BOOL)requiresManualRequest
{
  self->_requiresManualRequest = requiresManualRequest;
}

- (BOOL)requiresEmailAddress
{
  return self->_requiresEmailAddress;
}

- (void)setRequiresEmailAddress:(BOOL)requiresEmailAddress
{
  self->_requiresEmailAddress = requiresEmailAddress;
}

- (BOOL)requiresName
{
  return self->_requiresName;
}

- (void)setRequiresName:(BOOL)requiresName
{
  self->_requiresName = requiresName;
}

- (BOOL)requiresPhoneNumber
{
  return self->_requiresPhoneNumber;
}

- (void)setRequiresPhoneNumber:(BOOL)requiresPhoneNumber
{
  self->_requiresPhoneNumber = requiresPhoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_bookingIdentifier, 0);
  objc_storeStrong((id *)&self->_bookingDate, 0);
  objc_storeStrong((id *)&self->_bookingDescription, 0);
  objc_storeStrong((id *)&self->_restaurant, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

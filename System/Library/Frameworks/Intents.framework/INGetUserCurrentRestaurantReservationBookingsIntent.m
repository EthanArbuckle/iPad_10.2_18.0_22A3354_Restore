@implementation INGetUserCurrentRestaurantReservationBookingsIntent

- (INGetUserCurrentRestaurantReservationBookingsIntent)initWithRestaurant:(INRestaurant *)restaurant reservationIdentifier:(NSString *)reservationIdentifier maximumNumberOfResults:(NSNumber *)maximumNumberOfResults earliestBookingDateForResults:(NSDate *)earliestBookingDateForResults
{
  INRestaurant *v10;
  NSString *v11;
  NSNumber *v12;
  NSDate *v13;
  INGetUserCurrentRestaurantReservationBookingsIntent *v14;
  INGetUserCurrentRestaurantReservationBookingsIntent *v15;
  objc_super v17;

  v10 = restaurant;
  v11 = reservationIdentifier;
  v12 = maximumNumberOfResults;
  v13 = earliestBookingDateForResults;
  v17.receiver = self;
  v17.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  v14 = -[INIntent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[INGetUserCurrentRestaurantReservationBookingsIntent setRestaurant:](v14, "setRestaurant:", v10);
    -[INGetUserCurrentRestaurantReservationBookingsIntent setReservationIdentifier:](v15, "setReservationIdentifier:", v11);
    -[INGetUserCurrentRestaurantReservationBookingsIntent setMaximumNumberOfResults:](v15, "setMaximumNumberOfResults:", v12);
    -[INGetUserCurrentRestaurantReservationBookingsIntent setEarliestBookingDateForResults:](v15, "setEarliestBookingDateForResults:", v13);
  }

  return v15;
}

- (INGetUserCurrentRestaurantReservationBookingsIntent)initWithCoder:(id)a3
{
  id v4;
  INGetUserCurrentRestaurantReservationBookingsIntent *v5;
  uint64_t v6;
  INRestaurant *restaurant;
  uint64_t v8;
  NSString *reservationIdentifier;
  uint64_t v10;
  NSNumber *maximumNumberOfResults;
  uint64_t v12;
  NSDate *earliestBookingDateForResults;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  v5 = -[INIntent initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restaurant"));
    v6 = objc_claimAutoreleasedReturnValue();
    restaurant = v5->_restaurant;
    v5->_restaurant = (INRestaurant *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    reservationIdentifier = v5->_reservationIdentifier;
    v5->_reservationIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumNumberOfResults"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumNumberOfResults = v5->_maximumNumberOfResults;
    v5->_maximumNumberOfResults = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestBookingDateForResults"));
    v12 = objc_claimAutoreleasedReturnValue();
    earliestBookingDateForResults = v5->_earliestBookingDateForResults;
    v5->_earliestBookingDateForResults = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  v4 = a3;
  -[INIntent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_restaurant, CFSTR("restaurant"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_reservationIdentifier, CFSTR("reservationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumNumberOfResults, CFSTR("maximumNumberOfResults"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_earliestBookingDateForResults, CFSTR("earliestBookingDateForResults"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  INGetUserCurrentRestaurantReservationBookingsIntent *v7;
  INGetUserCurrentRestaurantReservationBookingsIntent *v8;
  INGetUserCurrentRestaurantReservationBookingsIntent *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char isKindOfClass;

  v7 = (INGetUserCurrentRestaurantReservationBookingsIntent *)a3;
  v8 = v7;
  if (self == v7)
  {
    v11 = 1;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        -[INGetUserCurrentRestaurantReservationBookingsIntent restaurant](v9, "restaurant");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10
          || (-[INGetUserCurrentRestaurantReservationBookingsIntent restaurant](self, "restaurant"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if (v10)
          {
LABEL_12:

            -[INGetUserCurrentRestaurantReservationBookingsIntent reservationIdentifier](v9, "reservationIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12
              || (-[INGetUserCurrentRestaurantReservationBookingsIntent reservationIdentifier](self, "reservationIdentifier"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[INGetUserCurrentRestaurantReservationBookingsIntent reservationIdentifier](v9, "reservationIdentifier");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              -[INGetUserCurrentRestaurantReservationBookingsIntent reservationIdentifier](self, "reservationIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                -[INGetUserCurrentRestaurantReservationBookingsIntent reservationIdentifier](self, "reservationIdentifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v5, "isEqualToString:", v14);

              }
              else
              {
                v15 = objc_msgSend(v5, "isEqualToString:", &stru_1E2295770);
              }

              if (v12)
              {
LABEL_21:

                -[INGetUserCurrentRestaurantReservationBookingsIntent maximumNumberOfResults](v9, "maximumNumberOfResults");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16
                  || (-[INGetUserCurrentRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[INGetUserCurrentRestaurantReservationBookingsIntent maximumNumberOfResults](v9, "maximumNumberOfResults");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[INGetUserCurrentRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v18)
                  {
                    -[INGetUserCurrentRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = objc_msgSend(v17, "isEqualToNumber:", v19);

                  }
                  else
                  {
                    v20 = objc_msgSend(v17, "isEqualToNumber:", &unk_1E23E9AA8);
                  }

                  if (v16)
                  {
LABEL_30:

                    -[INGetUserCurrentRestaurantReservationBookingsIntent earliestBookingDateForResults](v9, "earliestBookingDateForResults");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v21
                      || (-[INGetUserCurrentRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      -[INGetUserCurrentRestaurantReservationBookingsIntent earliestBookingDateForResults](v9, "earliestBookingDateForResults");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      -[INGetUserCurrentRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v23)
                        -[INGetUserCurrentRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults");
                      else
                        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v22, "isEqualToDate:", v24);

                      if (v21)
                        goto LABEL_39;
                    }
                    else
                    {
                      v25 = 1;
                    }

LABEL_39:
                    v11 = isKindOfClass & v15 & v20 & v25;

                    goto LABEL_40;
                  }
                }
                else
                {
                  v20 = 1;
                }

                goto LABEL_30;
              }
            }
            else
            {
              v15 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          isKindOfClass = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_40:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  v4 = -[INIntent copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[INGetUserCurrentRestaurantReservationBookingsIntent restaurant](self, "restaurant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestaurant:", v5);

  -[INGetUserCurrentRestaurantReservationBookingsIntent reservationIdentifier](self, "reservationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReservationIdentifier:", v6);

  -[INGetUserCurrentRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfResults:", v7);

  -[INGetUserCurrentRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEarliestBookingDateForResults:", v8);

  return v4;
}

- (id)_dictionaryRepresentation
{
  INRestaurant *restaurant;
  void *v4;
  NSString *reservationIdentifier;
  void *v6;
  NSNumber *maximumNumberOfResults;
  void *v8;
  NSDate *earliestBookingDateForResults;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("restaurant");
  restaurant = self->_restaurant;
  v4 = restaurant;
  if (!restaurant)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("reservationIdentifier");
  reservationIdentifier = self->_reservationIdentifier;
  v6 = reservationIdentifier;
  if (!reservationIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("maximumNumberOfResults");
  maximumNumberOfResults = self->_maximumNumberOfResults;
  v8 = maximumNumberOfResults;
  if (!maximumNumberOfResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("earliestBookingDateForResults");
  earliestBookingDateForResults = self->_earliestBookingDateForResults;
  v10 = earliestBookingDateForResults;
  if (!earliestBookingDateForResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (earliestBookingDateForResults)
  {
    if (maximumNumberOfResults)
      goto LABEL_11;
  }
  else
  {

    if (maximumNumberOfResults)
    {
LABEL_11:
      if (reservationIdentifier)
        goto LABEL_12;
LABEL_16:

      if (restaurant)
        return v11;
LABEL_17:

      return v11;
    }
  }

  if (!reservationIdentifier)
    goto LABEL_16;
LABEL_12:
  if (!restaurant)
    goto LABEL_17;
  return v11;
}

- (INRestaurant)restaurant
{
  return self->_restaurant;
}

- (void)setRestaurant:(INRestaurant *)restaurant
{
  objc_setProperty_nonatomic_copy(self, a2, restaurant, 136);
}

- (NSString)reservationIdentifier
{
  return self->_reservationIdentifier;
}

- (void)setReservationIdentifier:(NSString *)reservationIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, reservationIdentifier, 144);
}

- (NSNumber)maximumNumberOfResults
{
  return self->_maximumNumberOfResults;
}

- (void)setMaximumNumberOfResults:(NSNumber *)maximumNumberOfResults
{
  objc_setProperty_nonatomic_copy(self, a2, maximumNumberOfResults, 152);
}

- (NSDate)earliestBookingDateForResults
{
  return self->_earliestBookingDateForResults;
}

- (void)setEarliestBookingDateForResults:(NSDate *)earliestBookingDateForResults
{
  objc_setProperty_nonatomic_copy(self, a2, earliestBookingDateForResults, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestBookingDateForResults, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfResults, 0);
  objc_storeStrong((id *)&self->_reservationIdentifier, 0);
  objc_storeStrong((id *)&self->_restaurant, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intentDescription
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__INGetUserCurrentRestaurantReservationBookingsIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken_36050 != -1)
    dispatch_once(&intentDescription_onceToken_36050, block);
  return (id)intentDescription_intentDescription_36051;
}

void __72__INGetUserCurrentRestaurantReservationBookingsIntent_intentDescription__block_invoke()
{
  INIntentSlotDescription *v0;
  INIntentSlotDescription *v1;
  void *v2;
  INIntentDescription *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("restaurant"), 1, CFSTR("restaurant"), 0, 0, 0, 0, 1, &unk_1E23F9750, &unk_1E23F9768, objc_opt_class(), sel_resolveRestaurantForGetUserCurrentRestaurantReservationBookings_withCompletion_, 0, CFSTR("restaurant"));
  v6[0] = v0;
  v5[1] = CFSTR("reservationIdentifier");
  v1 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("reservationIdentifier"), 2, CFSTR("reservationIdentifier"), 0, 0, 1, 30, 1, 0, 0, 0, 0);
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:]([INIntentDescription alloc], "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetUserCurrentRestaurantReservationBookingsIntent"), CFSTR("GetUserCurrentRestaurantReservationBookingsIntentResponse"), objc_opt_class(), 0, 0, 0, sel_handleGetUserCurrentRestaurantReservationBookings_completion_, sel_confirmGetUserCurrentRestaurantReservationBookings_completion_, v2);
  v4 = (void *)intentDescription_intentDescription_36051;
  intentDescription_intentDescription_36051 = (uint64_t)v3;

}

@end

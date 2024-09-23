@implementation INGetAvailableRestaurantReservationBookingDefaultsIntent

- (INGetAvailableRestaurantReservationBookingDefaultsIntent)initWithRestaurant:(INRestaurant *)restaurant
{
  INRestaurant *v4;
  INGetAvailableRestaurantReservationBookingDefaultsIntent *v5;
  INGetAvailableRestaurantReservationBookingDefaultsIntent *v6;
  objc_super v8;

  v4 = restaurant;
  v8.receiver = self;
  v8.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntent;
  v5 = -[INIntent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[INGetAvailableRestaurantReservationBookingDefaultsIntent setRestaurant:](v5, "setRestaurant:", v4);

  return v6;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntent)initWithCoder:(id)a3
{
  id v4;
  INGetAvailableRestaurantReservationBookingDefaultsIntent *v5;
  uint64_t v6;
  INRestaurant *restaurant;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntent;
  v5 = -[INIntent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restaurant"));
    v6 = objc_claimAutoreleasedReturnValue();
    restaurant = v5->_restaurant;
    v5->_restaurant = (INRestaurant *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntent;
  v4 = a3;
  -[INIntent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_restaurant, CFSTR("restaurant"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INGetAvailableRestaurantReservationBookingDefaultsIntent *v5;
  INGetAvailableRestaurantReservationBookingDefaultsIntent *v6;
  INGetAvailableRestaurantReservationBookingDefaultsIntent *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (INGetAvailableRestaurantReservationBookingDefaultsIntent *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[INGetAvailableRestaurantReservationBookingDefaultsIntent restaurant](v7, "restaurant");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[INGetAvailableRestaurantReservationBookingDefaultsIntent restaurant](self, "restaurant"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[INGetAvailableRestaurantReservationBookingDefaultsIntent restaurant](v7, "restaurant");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[INGetAvailableRestaurantReservationBookingDefaultsIntent restaurant](self, "restaurant");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (id)_dictionaryRepresentation
{
  INRestaurant *restaurant;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("restaurant");
  restaurant = self->_restaurant;
  v3 = restaurant;
  if (!restaurant)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!restaurant)

  return v4;
}

- (INRestaurant)restaurant
{
  return self->_restaurant;
}

- (void)setRestaurant:(INRestaurant *)restaurant
{
  objc_setProperty_nonatomic_copy(self, a2, restaurant, 136);
}

- (void).cxx_destruct
{
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
  block[2] = __77__INGetAvailableRestaurantReservationBookingDefaultsIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken != -1)
    dispatch_once(&intentDescription_onceToken, block);
  return (id)intentDescription_intentDescription;
}

void __77__INGetAvailableRestaurantReservationBookingDefaultsIntent_intentDescription__block_invoke()
{
  INIntentSlotDescription *v0;
  void *v1;
  INIntentDescription *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("restaurant"), 1, CFSTR("restaurant"), 0, 0, 0, 0, 1, &unk_1E23F9708, &unk_1E23F9720, objc_opt_class(), sel_resolveRestaurantForGetAvailableRestaurantReservationBookingDefaults_withCompletion_, 0, CFSTR("restaurant"));
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:]([INIntentDescription alloc], "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetAvailableRestaurantReservationBookingDefaultsIntent"), CFSTR("GetAvailableRestaurantReservationBookingDefaultsIntentResponse"), objc_opt_class(), 0, 0, 0, sel_handleGetAvailableRestaurantReservationBookingDefaults_completion_, sel_confirmGetAvailableRestaurantReservationBookingDefaults_completion_, v1);
  v3 = (void *)intentDescription_intentDescription;
  intentDescription_intentDescription = (uint64_t)v2;

}

@end

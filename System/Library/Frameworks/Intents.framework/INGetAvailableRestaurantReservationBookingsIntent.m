@implementation INGetAvailableRestaurantReservationBookingsIntent

- (INGetAvailableRestaurantReservationBookingsIntent)initWithRestaurant:(INRestaurant *)restaurant partySize:(NSUInteger)partySize preferredBookingDateComponents:(NSDateComponents *)preferredBookingDateComponents maximumNumberOfResults:(NSNumber *)maximumNumberOfResults earliestBookingDateForResults:(NSDate *)earliestBookingDateForResults latestBookingDateForResults:(NSDate *)latestBookingDateForResults
{
  INRestaurant *v14;
  NSDateComponents *v15;
  NSNumber *v16;
  NSDate *v17;
  NSDate *v18;
  INGetAvailableRestaurantReservationBookingsIntent *v19;
  INGetAvailableRestaurantReservationBookingsIntent *v20;
  objc_super v22;

  v14 = restaurant;
  v15 = preferredBookingDateComponents;
  v16 = maximumNumberOfResults;
  v17 = earliestBookingDateForResults;
  v18 = latestBookingDateForResults;
  v22.receiver = self;
  v22.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  v19 = -[INIntent init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    -[INGetAvailableRestaurantReservationBookingsIntent setRestaurant:](v19, "setRestaurant:", v14);
    -[INGetAvailableRestaurantReservationBookingsIntent setPartySize:](v20, "setPartySize:", partySize);
    -[INGetAvailableRestaurantReservationBookingsIntent setPreferredBookingDateComponents:](v20, "setPreferredBookingDateComponents:", v15);
    -[INGetAvailableRestaurantReservationBookingsIntent setMaximumNumberOfResults:](v20, "setMaximumNumberOfResults:", v16);
    -[INGetAvailableRestaurantReservationBookingsIntent setEarliestBookingDateForResults:](v20, "setEarliestBookingDateForResults:", v17);
    -[INGetAvailableRestaurantReservationBookingsIntent setLatestBookingDateForResults:](v20, "setLatestBookingDateForResults:", v18);
  }

  return v20;
}

- (INGetAvailableRestaurantReservationBookingsIntent)initWithCoder:(id)a3
{
  id v4;
  INGetAvailableRestaurantReservationBookingsIntent *v5;
  uint64_t v6;
  INRestaurant *restaurant;
  uint64_t v8;
  NSDate *preferredBookingDate;
  uint64_t v10;
  NSDateComponents *preferredBookingDateComponents;
  uint64_t v12;
  NSNumber *maximumNumberOfResults;
  uint64_t v14;
  NSDate *earliestBookingDateForResults;
  uint64_t v16;
  NSDate *latestBookingDateForResults;
  INGetAvailableRestaurantReservationBookingsIntent *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  v5 = -[INIntent initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restaurant"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    restaurant = v5->_restaurant;
    v5->_restaurant = (INRestaurant *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredBookingDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    preferredBookingDate = v5->_preferredBookingDate;
    v5->_preferredBookingDate = (NSDate *)v8;

    v5->_partySize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partySize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredBookingDateComponents"));
    v10 = objc_claimAutoreleasedReturnValue();
    preferredBookingDateComponents = v5->_preferredBookingDateComponents;
    v5->_preferredBookingDateComponents = (NSDateComponents *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumNumberOfResults"));
    v12 = objc_claimAutoreleasedReturnValue();
    maximumNumberOfResults = v5->_maximumNumberOfResults;
    v5->_maximumNumberOfResults = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestBookingDateForResults"));
    v14 = objc_claimAutoreleasedReturnValue();
    earliestBookingDateForResults = v5->_earliestBookingDateForResults;
    v5->_earliestBookingDateForResults = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestBookingDateForResults"));
    v16 = objc_claimAutoreleasedReturnValue();
    latestBookingDateForResults = v5->_latestBookingDateForResults;
    v5->_latestBookingDateForResults = (NSDate *)v16;

LABEL_4:
    v18 = v5;
    goto LABEL_8;
  }
  v19 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[INGetAvailableRestaurantReservationBookingsIntent initWithCoder:]";
    v24 = 2080;
    v25 = "_restaurant";
    _os_log_error_impl(&dword_18BEBC000, v19, OS_LOG_TYPE_ERROR, "%s Null value for %s", buf, 0x16u);
  }
  v18 = 0;
LABEL_8:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  v4 = a3;
  -[INIntent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredBookingDate, CFSTR("preferredBookingDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_restaurant, CFSTR("restaurant"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_partySize, CFSTR("partySize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredBookingDateComponents, CFSTR("preferredBookingDateComponents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumNumberOfResults, CFSTR("maximumNumberOfResults"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_earliestBookingDateForResults, CFSTR("earliestBookingDateForResults"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_latestBookingDateForResults, CFSTR("latestBookingDateForResults"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INGetAvailableRestaurantReservationBookingsIntent *v5;
  INGetAvailableRestaurantReservationBookingsIntent *v6;
  INGetAvailableRestaurantReservationBookingsIntent *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSUInteger v39;
  char v40;

  v5 = (INGetAvailableRestaurantReservationBookingsIntent *)a3;
  v6 = v5;
  if (self == v5)
  {
    v10 = 1;
    goto LABEL_37;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = 0;
    goto LABEL_37;
  }
  v7 = v6;
  -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](v7, "preferredBookingDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](self, "preferredBookingDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11 == 0;

  }
  -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](v7, "preferredBookingDateComponents");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](self, "preferredBookingDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](v7, "preferredBookingDateComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](self, "preferredBookingDateComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v15, "isEqual:", v16);

    }
  }
  -[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](v7, "maximumNumberOfResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    -[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v20 = 1;
LABEL_17:

      goto LABEL_18;
    }
  }
  -[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](v7, "maximumNumberOfResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if (!v17)
    goto LABEL_17;
LABEL_18:

  -[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](v7, "earliestBookingDateForResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = 0;
  }
  else
  {
    -[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v23 == 0;

  }
  -[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](v7, "earliestBookingDateForResults");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](v7, "earliestBookingDateForResults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v27, "isEqualToDate:", v28);

    }
  }
  -[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](v7, "latestBookingDateForResults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = 0;
  }
  else
  {
    -[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v31 == 0;

  }
  -[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](v7, "latestBookingDateForResults");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](v7, "latestBookingDateForResults");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v35, "isEqualToDate:", v36);

    }
  }
  -[INGetAvailableRestaurantReservationBookingsIntent restaurant](self, "restaurant");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetAvailableRestaurantReservationBookingsIntent restaurant](v7, "restaurant");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "isEqual:", v38))
  {
    v39 = -[INGetAvailableRestaurantReservationBookingsIntent partySize](self, "partySize");
    if (v39 == -[INGetAvailableRestaurantReservationBookingsIntent partySize](v7, "partySize"))
      v40 = v9;
    else
      v40 = 0;
    v10 = v40 & v20 & v22 & v30;
  }
  else
  {
    v10 = 0;
  }

LABEL_37:
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  v4 = -[INIntent copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[INGetAvailableRestaurantReservationBookingsIntent restaurant](self, "restaurant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestaurant:", v5);

  objc_msgSend(v4, "setPartySize:", -[INGetAvailableRestaurantReservationBookingsIntent partySize](self, "partySize"));
  -[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfResults:", v6);

  -[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEarliestBookingDateForResults:", v7);

  -[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLatestBookingDateForResults:", v8);

  -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](self, "preferredBookingDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredBookingDateComponents:", v9);

  -[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDate](self, "preferredBookingDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredBookingDate:", v10);

  return v4;
}

- (id)_dictionaryRepresentation
{
  INRestaurant *restaurant;
  uint64_t v4;
  NSDateComponents *preferredBookingDateComponents;
  void *v6;
  NSNumber *maximumNumberOfResults;
  void *v8;
  NSDate *earliestBookingDateForResults;
  void *v10;
  NSDate *latestBookingDateForResults;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("restaurant");
  restaurant = self->_restaurant;
  v4 = (uint64_t)restaurant;
  if (!restaurant)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("partySize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_partySize);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  v17[2] = CFSTR("preferredBookingDateComponents");
  preferredBookingDateComponents = self->_preferredBookingDateComponents;
  v6 = preferredBookingDateComponents;
  if (!preferredBookingDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v6;
  v17[3] = CFSTR("maximumNumberOfResults");
  maximumNumberOfResults = self->_maximumNumberOfResults;
  v8 = maximumNumberOfResults;
  if (!maximumNumberOfResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v8;
  v17[4] = CFSTR("earliestBookingDateForResults");
  earliestBookingDateForResults = self->_earliestBookingDateForResults;
  v10 = earliestBookingDateForResults;
  if (!earliestBookingDateForResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[4] = v10;
  v17[5] = CFSTR("latestBookingDateForResults");
  latestBookingDateForResults = self->_latestBookingDateForResults;
  v12 = latestBookingDateForResults;
  if (!latestBookingDateForResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (latestBookingDateForResults)
  {
    if (earliestBookingDateForResults)
      goto LABEL_13;
  }
  else
  {

    if (earliestBookingDateForResults)
    {
LABEL_13:
      if (maximumNumberOfResults)
        goto LABEL_14;
LABEL_20:

      if (preferredBookingDateComponents)
        goto LABEL_15;
      goto LABEL_21;
    }
  }

  if (!maximumNumberOfResults)
    goto LABEL_20;
LABEL_14:
  if (preferredBookingDateComponents)
    goto LABEL_15;
LABEL_21:

LABEL_15:
  if (!restaurant)

  return v13;
}

- (INRestaurant)restaurant
{
  return self->_restaurant;
}

- (void)setRestaurant:(INRestaurant *)restaurant
{
  objc_setProperty_nonatomic_copy(self, a2, restaurant, 136);
}

- (NSUInteger)partySize
{
  return self->_partySize;
}

- (void)setPartySize:(NSUInteger)partySize
{
  self->_partySize = partySize;
}

- (NSDateComponents)preferredBookingDateComponents
{
  return self->_preferredBookingDateComponents;
}

- (void)setPreferredBookingDateComponents:(NSDateComponents *)preferredBookingDateComponents
{
  objc_setProperty_nonatomic_copy(self, a2, preferredBookingDateComponents, 152);
}

- (NSNumber)maximumNumberOfResults
{
  return self->_maximumNumberOfResults;
}

- (void)setMaximumNumberOfResults:(NSNumber *)maximumNumberOfResults
{
  objc_setProperty_nonatomic_copy(self, a2, maximumNumberOfResults, 160);
}

- (NSDate)earliestBookingDateForResults
{
  return self->_earliestBookingDateForResults;
}

- (void)setEarliestBookingDateForResults:(NSDate *)earliestBookingDateForResults
{
  objc_setProperty_nonatomic_copy(self, a2, earliestBookingDateForResults, 168);
}

- (NSDate)latestBookingDateForResults
{
  return self->_latestBookingDateForResults;
}

- (void)setLatestBookingDateForResults:(NSDate *)latestBookingDateForResults
{
  objc_setProperty_nonatomic_copy(self, a2, latestBookingDateForResults, 176);
}

- (NSDate)preferredBookingDate
{
  return self->_preferredBookingDate;
}

- (void)setPreferredBookingDate:(id)a3
{
  objc_storeStrong((id *)&self->_preferredBookingDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBookingDate, 0);
  objc_storeStrong((id *)&self->_latestBookingDateForResults, 0);
  objc_storeStrong((id *)&self->_earliestBookingDateForResults, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfResults, 0);
  objc_storeStrong((id *)&self->_preferredBookingDateComponents, 0);
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
  block[2] = __70__INGetAvailableRestaurantReservationBookingsIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken_39279 != -1)
    dispatch_once(&intentDescription_onceToken_39279, block);
  return (id)intentDescription_intentDescription_39280;
}

void __70__INGetAvailableRestaurantReservationBookingsIntent_intentDescription__block_invoke()
{
  INIntentSlotDescription *v0;
  INIntentSlotDescription *v1;
  INIntentSlotDescription *v2;
  INIntentSlotDescription *v3;
  INIntentSlotDescription *v4;
  INIntentSlotDescription *v5;
  void *v6;
  INIntentDescription *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v0 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("restaurant"), 1, CFSTR("restaurant"), 0, 0, 0, 0, 1, &unk_1E23F9780, &unk_1E23F9798, objc_opt_class(), sel_resolveRestaurantForGetAvailableRestaurantReservationBookings_withCompletion_, 0, CFSTR("restaurant"));
  v10[0] = v0;
  v9[1] = CFSTR("partySize");
  v1 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("partySize"), 2, CFSTR("partySize"), 0, 0, 0, 8, 1, &unk_1E23F97B0, &unk_1E23F97C8, objc_opt_class(), sel_resolvePartySizeForGetAvailableRestaurantReservationBookings_withCompletion_, 0);
  v10[1] = v1;
  v9[2] = CFSTR("preferredBookingDateComponents");
  v2 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("preferredBookingDateComponents"), 3, CFSTR("preferredBookingDateComponents"), 0, 0, 0, 14, 1, &unk_1E23F97E0, &unk_1E23F97F8, objc_opt_class(), sel_resolvePreferredBookingDateComponentsForGetAvailableRestaurantReservationBookings_withCompletion_, 0);
  v10[2] = v2;
  v9[3] = CFSTR("maximumNumberOfResults");
  v3 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("maximumNumberOfResults"), 4, CFSTR("maximumNumberOfResults"), 0, 0, 1, 24, 2, 0, 0, 0, 0);
  v10[3] = v3;
  v9[4] = CFSTR("earliestBookingDateForResults");
  v4 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("earliestBookingDateForResults"), 5, CFSTR("earliestBookingDateForResults"), 0, 0, 1, 14, 1, 0, 0, 0, 0);
  v10[4] = v4;
  v9[5] = CFSTR("latestBookingDateForResults");
  v5 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("latestBookingDateForResults"), 6, CFSTR("latestBookingDateForResults"), 0, 0, 1, 14, 1, 0, 0, 0, 0);
  v10[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:]([INIntentDescription alloc], "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetAvailableRestaurantReservationBookingsIntent"), CFSTR("GetAvailableRestaurantReservationBookingsIntentResponse"), objc_opt_class(), 0, 0, 0, sel_handleGetAvailableRestaurantReservationBookings_completion_, sel_confirmGetAvailableRestaurantReservationBookings_completion_, v6);
  v8 = (void *)intentDescription_intentDescription_39280;
  intentDescription_intentDescription_39280 = (uint64_t)v7;

}

@end

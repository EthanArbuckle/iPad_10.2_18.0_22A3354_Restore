@implementation INBookRestaurantReservationIntent

- (INBookRestaurantReservationIntent)initWithRestaurant:(INRestaurant *)restaurant bookingDateComponents:(NSDateComponents *)bookingDateComponents partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier guest:(INRestaurantGuest *)guest selectedOffer:(INRestaurantOffer *)selectedOffer guestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText
{
  INRestaurant *v15;
  NSDateComponents *v16;
  NSString *v17;
  INRestaurantGuest *v18;
  INRestaurantOffer *v19;
  NSString *v20;
  INBookRestaurantReservationIntent *v21;
  INBookRestaurantReservationIntent *v22;
  objc_super v24;

  v15 = restaurant;
  v16 = bookingDateComponents;
  v17 = bookingIdentifier;
  v18 = guest;
  v19 = selectedOffer;
  v20 = guestProvidedSpecialRequestText;
  v24.receiver = self;
  v24.super_class = (Class)INBookRestaurantReservationIntent;
  v21 = -[INIntent init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    -[INBookRestaurantReservationIntent setRestaurant:](v21, "setRestaurant:", v15);
    -[INBookRestaurantReservationIntent setBookingDateComponents:](v22, "setBookingDateComponents:", v16);
    -[INBookRestaurantReservationIntent setPartySize:](v22, "setPartySize:", partySize);
    -[INBookRestaurantReservationIntent setBookingIdentifier:](v22, "setBookingIdentifier:", v17);
    -[INBookRestaurantReservationIntent setGuest:](v22, "setGuest:", v18);
    -[INBookRestaurantReservationIntent setSelectedOffer:](v22, "setSelectedOffer:", v19);
    -[INBookRestaurantReservationIntent setGuestProvidedSpecialRequestText:](v22, "setGuestProvidedSpecialRequestText:", v20);
  }

  return v22;
}

- (INBookRestaurantReservationIntent)initWithCoder:(id)a3
{
  id v4;
  INBookRestaurantReservationIntent *v5;
  uint64_t v6;
  INRestaurant *restaurant;
  uint64_t v8;
  NSDateComponents *bookingDateComponents;
  uint64_t v10;
  NSDate *bookingDate;
  uint64_t v12;
  NSString *bookingIdentifier;
  uint64_t v14;
  INRestaurantGuest *guest;
  uint64_t v16;
  NSString *guestProvidedSpecialRequestText;
  uint64_t v18;
  INRestaurantOffer *selectedOffer;
  INBookRestaurantReservationIntent *v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INBookRestaurantReservationIntent;
  v5 = -[INIntent initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restaurant"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v21 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      v20 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315394;
    v25 = "-[INBookRestaurantReservationIntent initWithCoder:]";
    v26 = 2080;
    v27 = "_restaurant";
LABEL_12:
    _os_log_error_impl(&dword_18BEBC000, v21, OS_LOG_TYPE_ERROR, "%s Null value for %s", buf, 0x16u);
    goto LABEL_9;
  }
  restaurant = v5->_restaurant;
  v5->_restaurant = (INRestaurant *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookingDateComponents"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v21 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 136315394;
    v25 = "-[INBookRestaurantReservationIntent initWithCoder:]";
    v26 = 2080;
    v27 = "_bookingDateComponents";
    goto LABEL_12;
  }
  bookingDateComponents = v5->_bookingDateComponents;
  v5->_bookingDateComponents = (NSDateComponents *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookingDate"));
  v10 = objc_claimAutoreleasedReturnValue();
  bookingDate = v5->_bookingDate;
  v5->_bookingDate = (NSDate *)v10;

  v5->_partySize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partySize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookingIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue();
  bookingIdentifier = v5->_bookingIdentifier;
  v5->_bookingIdentifier = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guest"));
  v14 = objc_claimAutoreleasedReturnValue();
  guest = v5->_guest;
  v5->_guest = (INRestaurantGuest *)v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guestProvidedSpecialRequestText"));
  v16 = objc_claimAutoreleasedReturnValue();
  guestProvidedSpecialRequestText = v5->_guestProvidedSpecialRequestText;
  v5->_guestProvidedSpecialRequestText = (NSString *)v16;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedOffer"));
  v18 = objc_claimAutoreleasedReturnValue();
  selectedOffer = v5->_selectedOffer;
  v5->_selectedOffer = (INRestaurantOffer *)v18;

LABEL_5:
  v20 = v5;
LABEL_10:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INBookRestaurantReservationIntent;
  v4 = a3;
  -[INIntent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bookingDate, CFSTR("bookingDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_restaurant, CFSTR("restaurant"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bookingDateComponents, CFSTR("bookingDateComponents"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_partySize, CFSTR("partySize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bookingIdentifier, CFSTR("bookingIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_guest, CFSTR("guest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_guestProvidedSpecialRequestText, CFSTR("guestProvidedSpecialRequestText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedOffer, CFSTR("selectedOffer"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  INBookRestaurantReservationIntent *v8;
  INBookRestaurantReservationIntent *v9;
  INBookRestaurantReservationIntent *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;

  v8 = (INBookRestaurantReservationIntent *)a3;
  v9 = v8;
  if (v8 == self)
  {
    LOBYTE(v12) = 1;
    goto LABEL_40;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v12) = 0;
    goto LABEL_40;
  }
  v10 = v9;
  -[INBookRestaurantReservationIntent bookingIdentifier](self, "bookingIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[INBookRestaurantReservationIntent bookingIdentifier](v10, "bookingIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v28 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[INBookRestaurantReservationIntent bookingIdentifier](self, "bookingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBookRestaurantReservationIntent bookingIdentifier](v10, "bookingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[INBookRestaurantReservationIntent bookingIdentifier](v10, "bookingIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v4, "isEqualToString:", v6);

  }
  else
  {
    v28 = objc_msgSend(v4, "isEqualToString:", &stru_1E2295770);
  }

  if (!v11)
    goto LABEL_14;
LABEL_15:

  -[INBookRestaurantReservationIntent guest](self, "guest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[INBookRestaurantReservationIntent guest](v10, "guest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v14 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  -[INBookRestaurantReservationIntent guest](self, "guest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBookRestaurantReservationIntent guest](v10, "guest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqual:", v6);

  if (!v13)
    goto LABEL_20;
LABEL_21:

  -[INBookRestaurantReservationIntent guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[INBookRestaurantReservationIntent guestProvidedSpecialRequestText](v10, "guestProvidedSpecialRequestText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v18 = 1;
LABEL_29:

      goto LABEL_30;
    }
  }
  -[INBookRestaurantReservationIntent guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBookRestaurantReservationIntent guestProvidedSpecialRequestText](v10, "guestProvidedSpecialRequestText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[INBookRestaurantReservationIntent guestProvidedSpecialRequestText](v10, "guestProvidedSpecialRequestText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v6, "isEqualToString:", v17);

  }
  else
  {
    v18 = objc_msgSend(v6, "isEqualToString:", &stru_1E2295770);
  }

  if (!v15)
    goto LABEL_29;
LABEL_30:

  -[INBookRestaurantReservationIntent selectedOffer](self, "selectedOffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    -[INBookRestaurantReservationIntent selectedOffer](v10, "selectedOffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v22 = 1;
LABEL_35:

      goto LABEL_36;
    }
  }
  -[INBookRestaurantReservationIntent selectedOffer](self, "selectedOffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBookRestaurantReservationIntent selectedOffer](v10, "selectedOffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (!v19)
    goto LABEL_35;
LABEL_36:

  -[INBookRestaurantReservationIntent restaurant](self, "restaurant");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBookRestaurantReservationIntent restaurant](v10, "restaurant");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isEqual:", v24))
  {
    -[INBookRestaurantReservationIntent bookingDateComponents](self, "bookingDateComponents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[INBookRestaurantReservationIntent bookingDateComponents](v10, "bookingDateComponents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v25, "isEqual:", v26) & v18 & v28 & v14 & v22;

  }
  else
  {
    LOBYTE(v12) = 0;
  }

LABEL_40:
  return v12;
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
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)INBookRestaurantReservationIntent;
  v4 = -[INIntent copyWithZone:](&v13, sel_copyWithZone_, a3);
  -[INBookRestaurantReservationIntent restaurant](self, "restaurant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestaurant:", v5);

  -[INBookRestaurantReservationIntent bookingDateComponents](self, "bookingDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBookingDateComponents:", v6);

  objc_msgSend(v4, "setPartySize:", -[INBookRestaurantReservationIntent partySize](self, "partySize"));
  -[INBookRestaurantReservationIntent bookingIdentifier](self, "bookingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBookingIdentifier:", v7);

  -[INBookRestaurantReservationIntent guest](self, "guest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuest:", v8);

  -[INBookRestaurantReservationIntent guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuestProvidedSpecialRequestText:", v9);

  -[INBookRestaurantReservationIntent selectedOffer](self, "selectedOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedOffer:", v10);

  -[INBookRestaurantReservationIntent bookingDate](self, "bookingDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBookingDate:", v11);

  return v4;
}

- (id)_dictionaryRepresentation
{
  uint64_t restaurant;
  NSDateComponents *bookingDateComponents;
  uint64_t v5;
  NSString *bookingIdentifier;
  void *v7;
  INRestaurantGuest *guest;
  void *v9;
  INRestaurantOffer *selectedOffer;
  void *v11;
  NSString *guestProvidedSpecialRequestText;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[7];
  _QWORD v21[9];

  v21[7] = *MEMORY[0x1E0C80C00];
  restaurant = (uint64_t)self->_restaurant;
  v19 = restaurant;
  v20[0] = CFSTR("restaurant");
  if (!restaurant)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    restaurant = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)restaurant;
  v21[0] = restaurant;
  v20[1] = CFSTR("bookingDateComponents");
  bookingDateComponents = self->_bookingDateComponents;
  v5 = (uint64_t)bookingDateComponents;
  if (!bookingDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v5;
  v20[2] = CFSTR("partySize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_partySize, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v18;
  v20[3] = CFSTR("bookingIdentifier");
  bookingIdentifier = self->_bookingIdentifier;
  v7 = bookingIdentifier;
  if (!bookingIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[3] = v7;
  v20[4] = CFSTR("guest");
  guest = self->_guest;
  v9 = guest;
  if (!guest)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v9;
  v20[5] = CFSTR("selectedOffer");
  selectedOffer = self->_selectedOffer;
  v11 = selectedOffer;
  if (!selectedOffer)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[5] = v11;
  v20[6] = CFSTR("guestProvidedSpecialRequestText");
  guestProvidedSpecialRequestText = self->_guestProvidedSpecialRequestText;
  v13 = guestProvidedSpecialRequestText;
  if (!guestProvidedSpecialRequestText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (guestProvidedSpecialRequestText)
  {
    if (selectedOffer)
      goto LABEL_15;
  }
  else
  {

    if (selectedOffer)
    {
LABEL_15:
      if (guest)
        goto LABEL_16;
LABEL_24:

      if (bookingIdentifier)
        goto LABEL_17;
      goto LABEL_25;
    }
  }

  if (!guest)
    goto LABEL_24;
LABEL_16:
  if (bookingIdentifier)
    goto LABEL_17;
LABEL_25:

LABEL_17:
  if (!bookingDateComponents)

  if (!v19)
  return v14;
}

- (INRestaurant)restaurant
{
  return self->_restaurant;
}

- (void)setRestaurant:(INRestaurant *)restaurant
{
  objc_setProperty_nonatomic_copy(self, a2, restaurant, 136);
}

- (NSDateComponents)bookingDateComponents
{
  return self->_bookingDateComponents;
}

- (void)setBookingDateComponents:(NSDateComponents *)bookingDateComponents
{
  objc_setProperty_nonatomic_copy(self, a2, bookingDateComponents, 144);
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
  objc_setProperty_nonatomic_copy(self, a2, bookingIdentifier, 160);
}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (void)setGuest:(INRestaurantGuest *)guest
{
  objc_setProperty_nonatomic_copy(self, a2, guest, 168);
}

- (INRestaurantOffer)selectedOffer
{
  return self->_selectedOffer;
}

- (void)setSelectedOffer:(INRestaurantOffer *)selectedOffer
{
  objc_setProperty_nonatomic_copy(self, a2, selectedOffer, 176);
}

- (NSString)guestProvidedSpecialRequestText
{
  return self->_guestProvidedSpecialRequestText;
}

- (void)setGuestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText
{
  objc_setProperty_nonatomic_copy(self, a2, guestProvidedSpecialRequestText, 184);
}

- (NSDate)bookingDate
{
  return self->_bookingDate;
}

- (void)setBookingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookingDate, 0);
  objc_storeStrong((id *)&self->_guestProvidedSpecialRequestText, 0);
  objc_storeStrong((id *)&self->_selectedOffer, 0);
  objc_storeStrong((id *)&self->_guest, 0);
  objc_storeStrong((id *)&self->_bookingIdentifier, 0);
  objc_storeStrong((id *)&self->_bookingDateComponents, 0);
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
  block[2] = __54__INBookRestaurantReservationIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken_59022 != -1)
    dispatch_once(&intentDescription_onceToken_59022, block);
  return (id)intentDescription_intentDescription_59023;
}

void __54__INBookRestaurantReservationIntent_intentDescription__block_invoke()
{
  INIntentSlotDescription *v0;
  INIntentSlotDescription *v1;
  INIntentSlotDescription *v2;
  INIntentSlotDescription *v3;
  INIntentSlotDescription *v4;
  INIntentSlotDescription *v5;
  INIntentSlotDescription *v6;
  void *v7;
  INIntentDescription *v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[9];

  v11[7] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("restaurant");
  v0 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("restaurant"), 1, CFSTR("restaurant"), 0, 0, 0, 0, 2, &unk_1E23F9828, &unk_1E23F9840, objc_opt_class(), sel_resolveRestaurantForBookRestaurantReservation_withCompletion_, 0);
  v11[0] = v0;
  v10[1] = CFSTR("bookingDateComponents");
  v1 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("bookingDateComponents"), 2, CFSTR("bookingDateComponents"), 0, 0, 0, 14, 2, &unk_1E23F9858, &unk_1E23F9870, objc_opt_class(), sel_resolveBookingDateComponentsForBookRestaurantReservation_withCompletion_, 0);
  v11[1] = v1;
  v10[2] = CFSTR("partySize");
  v2 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("partySize"), 3, CFSTR("partySize"), 0, 0, 0, 8, 2, &unk_1E23F9888, &unk_1E23F98A0, objc_opt_class(), sel_resolvePartySizeForBookRestaurantReservation_withCompletion_, 0);
  v11[2] = v2;
  v10[3] = CFSTR("bookingIdentifier");
  v3 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("bookingIdentifier"), 4, CFSTR("bookingIdentifier"), 0, 0, 1, 30, 1, 0, 0, 0, 0);
  v11[3] = v3;
  v10[4] = CFSTR("guest");
  v4 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("guest"), 5, CFSTR("guest"), 0, 0, 0, 0, 2, &unk_1E23F98B8, &unk_1E23F98D0, objc_opt_class(), sel_resolveGuestForBookRestaurantReservation_withCompletion_, 0);
  v11[4] = v4;
  v10[5] = CFSTR("selectedOffer");
  v5 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("selectedOffer"), 6, CFSTR("selectedOffer"), 0, 0, 1, 0, 1, 0, 0, 0, 0);
  v11[5] = v5;
  v10[6] = CFSTR("guestProvidedSpecialRequestText");
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("guestProvidedSpecialRequestText"), 7, CFSTR("guestProvidedSpecialRequestText"), 0, 0, 0, 30, 1, &unk_1E23F98E8, &unk_1E23F9900, objc_opt_class(), sel_resolveGuestProvidedSpecialRequestTextForBookRestaurantReservation_withCompletion_, 0);
  v11[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:]([INIntentDescription alloc], "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("BookRestaurantReservationIntent"), CFSTR("BookRestaurantReservationIntentResponse"), objc_opt_class(), 0, 0, 0, sel_handleBookRestaurantReservation_completion_, sel_confirmBookRestaurantReservation_completion_, v7);
  v9 = (void *)intentDescription_intentDescription_59023;
  intentDescription_intentDescription_59023 = (uint64_t)v8;

}

@end

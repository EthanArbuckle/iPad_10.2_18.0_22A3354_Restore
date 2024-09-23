@implementation INRestaurantReservationUserBooking

- (INRestaurantReservationUserBooking)initWithRestaurant:(INRestaurant *)restaurant bookingDate:(NSDate *)bookingDate partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier guest:(INRestaurantGuest *)guest status:(INRestaurantReservationUserBookingStatus)status dateStatusModified:(NSDate *)dateStatusModified
{
  INRestaurantGuest *v15;
  NSDate *v16;
  INRestaurantReservationUserBooking *v17;
  uint64_t v18;
  INRestaurantGuest *v19;
  uint64_t v20;
  NSDate *v21;
  objc_super v23;

  v15 = guest;
  v16 = dateStatusModified;
  v23.receiver = self;
  v23.super_class = (Class)INRestaurantReservationUserBooking;
  v17 = -[INRestaurantReservationBooking initWithRestaurant:bookingDate:partySize:bookingIdentifier:](&v23, sel_initWithRestaurant_bookingDate_partySize_bookingIdentifier_, restaurant, bookingDate, partySize, bookingIdentifier);
  if (v17)
  {
    v18 = -[INRestaurantGuest copy](v15, "copy");
    v19 = v17->_guest;
    v17->_guest = (INRestaurantGuest *)v18;

    v17->_status = status;
    v20 = -[NSDate copy](v16, "copy");
    v21 = v17->_dateStatusModified;
    v17->_dateStatusModified = (NSDate *)v20;

  }
  return v17;
}

- (INRestaurantReservationUserBooking)initWithCoder:(id)a3
{
  id v4;
  INRestaurantReservationUserBooking *v5;
  void *v6;
  uint64_t v7;
  NSString *advisementText;
  uint64_t v9;
  INRestaurantOffer *selectedOffer;
  uint64_t v11;
  NSString *guestProvidedSpecialRequestText;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INRestaurantReservationUserBooking;
  v5 = -[INRestaurantReservationBooking initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&v5->_guest, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advisementText"));
    v7 = objc_claimAutoreleasedReturnValue();
    advisementText = v5->_advisementText;
    v5->_advisementText = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedOffer"));
    v9 = objc_claimAutoreleasedReturnValue();
    selectedOffer = v5->_selectedOffer;
    v5->_selectedOffer = (INRestaurantOffer *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guestProvidedSpecialRequestText"));
    v11 = objc_claimAutoreleasedReturnValue();
    guestProvidedSpecialRequestText = v5->_guestProvidedSpecialRequestText;
    v5->_guestProvidedSpecialRequestText = (NSString *)v11;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateStatusModified"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_storeStrong((id *)&v5->_dateStatusModified, v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INRestaurantReservationUserBooking;
  v4 = a3;
  -[INRestaurantReservationBooking encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_guest, CFSTR("guest"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_advisementText, CFSTR("advisementText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedOffer, CFSTR("selectedOffer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_guestProvidedSpecialRequestText, CFSTR("guestProvidedSpecialRequestText"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateStatusModified, CFSTR("dateStatusModified"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INRestaurantReservationUserBooking;
  v4 = -[INRestaurantReservationBooking copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[INRestaurantReservationUserBooking guest](self, "guest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuest:", v5);

  -[INRestaurantReservationUserBooking advisementText](self, "advisementText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdvisementText:", v6);

  -[INRestaurantReservationUserBooking selectedOffer](self, "selectedOffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedOffer:", v7);

  -[INRestaurantReservationUserBooking guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuestProvidedSpecialRequestText:", v8);

  objc_msgSend(v4, "setStatus:", -[INRestaurantReservationUserBooking status](self, "status"));
  -[INRestaurantReservationUserBooking dateStatusModified](self, "dateStatusModified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateStatusModified:", v9);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  INRestaurantReservationUserBooking *v6;
  INRestaurantReservationUserBooking *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  INRestaurantReservationUserBookingStatus v26;
  void *v27;
  void *v28;
  void *v30;
  objc_super v31;

  v6 = (INRestaurantReservationUserBooking *)a3;
  v31.receiver = self;
  v31.super_class = (Class)INRestaurantReservationUserBooking;
  if (!-[INRestaurantReservationBooking isEqual:](&v31, sel_isEqual_, v6))
    goto LABEL_9;
  if (v6 == self)
  {
    v12 = 1;
    goto LABEL_37;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_9:
    v12 = 0;
    goto LABEL_37;
  }
  v7 = v6;
  -[INRestaurantReservationUserBooking advisementText](self, "advisementText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[INRestaurantReservationUserBooking advisementText](v7, "advisementText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  -[INRestaurantReservationUserBooking advisementText](v7, "advisementText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantReservationUserBooking advisementText](self, "advisementText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[INRestaurantReservationUserBooking advisementText](self, "advisementText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqualToString:", v10);

  }
  else
  {
    v11 = objc_msgSend(v4, "isEqualToString:", &stru_1E2295770);
  }

  if (!v8)
    goto LABEL_15;
LABEL_16:

  -[INRestaurantReservationUserBooking selectedOffer](self, "selectedOffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[INRestaurantReservationUserBooking selectedOffer](v7, "selectedOffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v16 = 1;
LABEL_21:

      goto LABEL_22;
    }
  }
  -[INRestaurantReservationUserBooking selectedOffer](self, "selectedOffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantReservationUserBooking selectedOffer](v7, "selectedOffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (!v13)
    goto LABEL_21;
LABEL_22:

  -[INRestaurantReservationUserBooking guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    -[INRestaurantReservationUserBooking guestProvidedSpecialRequestText](v7, "guestProvidedSpecialRequestText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      v30 = 0;
      v23 = 1;
LABEL_30:

      goto LABEL_31;
    }
  }
  -[INRestaurantReservationUserBooking guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantReservationUserBooking guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[INRestaurantReservationUserBooking guestProvidedSpecialRequestText](self, "guestProvidedSpecialRequestText");
    v20 = v16;
    v21 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v18, "isEqualToString:", v22);

    v11 = v21;
    v16 = v20;
  }
  else
  {
    v23 = objc_msgSend(v18, "isEqualToString:", &stru_1E2295770);
  }

  if (!v17)
    goto LABEL_30;
LABEL_31:

  -[INRestaurantReservationUserBooking guest](v7, "guest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantReservationUserBooking guest](self, "guest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if ((objc_msgSend(v24, "isEqual:", v25) & v11 & v16) == 1 && v23)
  {
    v26 = -[INRestaurantReservationUserBooking status](self, "status");
    if (v26 == -[INRestaurantReservationUserBooking status](v7, "status"))
    {
      -[INRestaurantReservationUserBooking dateStatusModified](v7, "dateStatusModified");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[INRestaurantReservationUserBooking dateStatusModified](self, "dateStatusModified");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqualToDate:", v28);

    }
    else
    {
      v12 = 0;
    }
  }

LABEL_37:
  return v12;
}

- (id)_dictionaryRepresentation
{
  INRestaurantGuest *guest;
  uint64_t v4;
  NSString *advisementText;
  uint64_t v6;
  INRestaurantOffer *selectedOffer;
  uint64_t v8;
  NSString *guestProvidedSpecialRequestText;
  void *v10;
  INRestaurantReservationUserBookingStatus v11;
  unint64_t v12;
  __CFString *v13;
  NSDate *dateStatusModified;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v22 = CFSTR("guest");
  guest = self->_guest;
  v4 = (uint64_t)guest;
  if (!guest)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v4;
  v28[0] = v4;
  v23 = CFSTR("advisementText");
  advisementText = self->_advisementText;
  v6 = (uint64_t)advisementText;
  if (!advisementText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v6;
  v28[1] = v6;
  v24 = CFSTR("selectedOffer");
  selectedOffer = self->_selectedOffer;
  v8 = (uint64_t)selectedOffer;
  if (!selectedOffer)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v8;
  v28[2] = v8;
  v25 = CFSTR("guestProvidedSpecialRequestText");
  guestProvidedSpecialRequestText = self->_guestProvidedSpecialRequestText;
  v10 = guestProvidedSpecialRequestText;
  if (!guestProvidedSpecialRequestText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v20, v21, v22, v23, v24, v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[3] = v10;
  v26 = CFSTR("status");
  v11 = -[INRestaurantReservationUserBooking status](self, "status", v18);
  v12 = v11;
  if (v11 <= INRestaurantReservationUserBookingStatusDenied)
  {
    v13 = off_1E228C4D0[v11];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v13;
  v27 = CFSTR("dateStatusModified");
  dateStatusModified = self->_dateStatusModified;
  v15 = dateStatusModified;
  if (!dateStatusModified)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v22, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!dateStatusModified)

  if (v12 >= 3)
  {

    if (guestProvidedSpecialRequestText)
    {
LABEL_18:
      if (selectedOffer)
        goto LABEL_19;
      goto LABEL_24;
    }
  }
  else if (guestProvidedSpecialRequestText)
  {
    goto LABEL_18;
  }

  if (selectedOffer)
  {
LABEL_19:
    if (advisementText)
      goto LABEL_20;
LABEL_25:

    if (guest)
      return v16;
LABEL_26:

    return v16;
  }
LABEL_24:

  if (!advisementText)
    goto LABEL_25;
LABEL_20:
  if (!guest)
    goto LABEL_26;
  return v16;
}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (void)setGuest:(INRestaurantGuest *)guest
{
  objc_setProperty_nonatomic_copy(self, a2, guest, 64);
}

- (NSString)advisementText
{
  return self->_advisementText;
}

- (void)setAdvisementText:(NSString *)advisementText
{
  objc_setProperty_nonatomic_copy(self, a2, advisementText, 72);
}

- (INRestaurantOffer)selectedOffer
{
  return self->_selectedOffer;
}

- (void)setSelectedOffer:(INRestaurantOffer *)selectedOffer
{
  objc_setProperty_nonatomic_copy(self, a2, selectedOffer, 80);
}

- (NSString)guestProvidedSpecialRequestText
{
  return self->_guestProvidedSpecialRequestText;
}

- (void)setGuestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText
{
  objc_setProperty_nonatomic_copy(self, a2, guestProvidedSpecialRequestText, 88);
}

- (INRestaurantReservationUserBookingStatus)status
{
  return self->_status;
}

- (void)setStatus:(INRestaurantReservationUserBookingStatus)status
{
  self->_status = status;
}

- (NSDate)dateStatusModified
{
  return self->_dateStatusModified;
}

- (void)setDateStatusModified:(NSDate *)dateStatusModified
{
  objc_setProperty_nonatomic_copy(self, a2, dateStatusModified, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateStatusModified, 0);
  objc_storeStrong((id *)&self->_guestProvidedSpecialRequestText, 0);
  objc_storeStrong((id *)&self->_selectedOffer, 0);
  objc_storeStrong((id *)&self->_advisementText, 0);
  objc_storeStrong((id *)&self->_guest, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

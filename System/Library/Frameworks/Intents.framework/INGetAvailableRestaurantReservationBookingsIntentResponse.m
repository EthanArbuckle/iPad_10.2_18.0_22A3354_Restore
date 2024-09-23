@implementation INGetAvailableRestaurantReservationBookingsIntentResponse

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  return -[INGetAvailableRestaurantReservationBookingsIntentResponse initWithAvailableBookings:code:userActivity:](self, "initWithAvailableBookings:code:userActivity:", MEMORY[0x1E0C9AA60], a3, a4);
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithAvailableBookings:(NSArray *)availableBookings code:(INGetAvailableRestaurantReservationBookingsIntentCode)code userActivity:(NSUserActivity *)userActivity
{
  NSArray *v8;
  INGetAvailableRestaurantReservationBookingsIntentResponse *v9;
  uint64_t v10;
  NSArray *v11;
  objc_super v13;

  v8 = availableBookings;
  v13.receiver = self;
  v13.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  v9 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, code, userActivity);
  if (v9)
  {
    v10 = -[NSArray copy](v8, "copy");
    v11 = v9->_availableBookings;
    v9->_availableBookings = (NSArray *)v10;

  }
  return v9;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithCoder:(id)a3
{
  id v4;
  INGetAvailableRestaurantReservationBookingsIntentResponse *v5;
  uint64_t v6;
  NSString *localizedBookingAdvisementText;
  uint64_t v8;
  INTermsAndConditions *termsAndConditions;
  uint64_t v10;
  NSString *localizedRestaurantDescriptionText;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  v5 = -[INIntentResponse initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedBookingAdvisementText"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedBookingAdvisementText = v5->_localizedBookingAdvisementText;
    v5->_localizedBookingAdvisementText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsAndConditions"));
    v8 = objc_claimAutoreleasedReturnValue();
    termsAndConditions = v5->_termsAndConditions;
    v5->_termsAndConditions = (INTermsAndConditions *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedRestaurantDescriptionText"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedRestaurantDescriptionText = v5->_localizedRestaurantDescriptionText;
    v5->_localizedRestaurantDescriptionText = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("availableBookings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_storeStrong((id *)&v5->_availableBookings, v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  v4 = a3;
  -[INIntentResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_availableBookings, CFSTR("availableBookings"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedRestaurantDescriptionText, CFSTR("localizedRestaurantDescriptionText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedBookingAdvisementText, CFSTR("localizedBookingAdvisementText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_termsAndConditions, CFSTR("termsAndConditions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  v4 = -[INIntentResponse copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedRestaurantDescriptionText](self, "localizedRestaurantDescriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedRestaurantDescriptionText:", v5);

  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedBookingAdvisementText](self, "localizedBookingAdvisementText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedBookingAdvisementText:", v6);

  -[INGetAvailableRestaurantReservationBookingsIntentResponse termsAndConditions](self, "termsAndConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTermsAndConditions:", v7);

  -[INGetAvailableRestaurantReservationBookingsIntentResponse availableBookings](self, "availableBookings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[INGetAvailableRestaurantReservationBookingsIntentResponse availableBookings](self, "availableBookings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithArray:copyItems:", v10, 1);
    v12 = (void *)v4[11];
    v4[11] = v11;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  INGetAvailableRestaurantReservationBookingsIntentResponse *v6;
  INGetAvailableRestaurantReservationBookingsIntentResponse *v7;
  INGetAvailableRestaurantReservationBookingsIntentResponse *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v28;

  v6 = (INGetAvailableRestaurantReservationBookingsIntentResponse *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v13 = 1;
    goto LABEL_34;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = 0;
    goto LABEL_34;
  }
  v8 = v7;
  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedBookingAdvisementText](self, "localizedBookingAdvisementText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedBookingAdvisementText](v8, "localizedBookingAdvisementText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v12 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedBookingAdvisementText](self, "localizedBookingAdvisementText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedBookingAdvisementText](v8, "localizedBookingAdvisementText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedBookingAdvisementText](v8, "localizedBookingAdvisementText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqualToString:", v11);

  }
  else
  {
    v12 = objc_msgSend(v4, "isEqualToString:", &stru_1E2295770);
  }

  if (!v9)
    goto LABEL_14;
LABEL_15:

  -[INGetAvailableRestaurantReservationBookingsIntentResponse termsAndConditions](self, "termsAndConditions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[INGetAvailableRestaurantReservationBookingsIntentResponse termsAndConditions](v8, "termsAndConditions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v17 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  -[INGetAvailableRestaurantReservationBookingsIntentResponse termsAndConditions](self, "termsAndConditions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetAvailableRestaurantReservationBookingsIntentResponse termsAndConditions](v8, "termsAndConditions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (!v14)
    goto LABEL_20;
LABEL_21:

  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedRestaurantDescriptionText](self, "localizedRestaurantDescriptionText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedRestaurantDescriptionText](v8, "localizedRestaurantDescriptionText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v28 = 0;
      v24 = 1;
LABEL_29:

      goto LABEL_30;
    }
  }
  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedRestaurantDescriptionText](self, "localizedRestaurantDescriptionText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedRestaurantDescriptionText](v8, "localizedRestaurantDescriptionText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[INGetAvailableRestaurantReservationBookingsIntentResponse localizedRestaurantDescriptionText](v8, "localizedRestaurantDescriptionText");
    v21 = v17;
    v22 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v19, "isEqualToString:", v23);

    v12 = v22;
    v17 = v21;
  }
  else
  {
    v24 = objc_msgSend(v19, "isEqualToString:", &stru_1E2295770);
  }

  if (!v18)
    goto LABEL_29;
LABEL_30:

  v13 = 0;
  if ((v12 & v17) == 1 && v24)
  {
    -[INGetAvailableRestaurantReservationBookingsIntentResponse availableBookings](self, "availableBookings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[INGetAvailableRestaurantReservationBookingsIntentResponse availableBookings](v8, "availableBookings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v25, "isEqualToArray:", v26);

  }
LABEL_34:

  return v13;
}

- (INGetAvailableRestaurantReservationBookingsIntentCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *localizedRestaurantDescriptionText;
  void *v5;
  NSString *localizedBookingAdvisementText;
  void *v7;
  INTermsAndConditions *termsAndConditions;
  void *v9;
  NSArray *availableBookings;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INGetAvailableRestaurantReservationBookingsIntentResponse code](self, "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("localizedRestaurantDescriptionText");
  localizedRestaurantDescriptionText = self->_localizedRestaurantDescriptionText;
  v5 = localizedRestaurantDescriptionText;
  if (!localizedRestaurantDescriptionText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v5;
  v14[2] = CFSTR("localizedBookingAdvisementText");
  localizedBookingAdvisementText = self->_localizedBookingAdvisementText;
  v7 = localizedBookingAdvisementText;
  if (!localizedBookingAdvisementText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v7;
  v14[3] = CFSTR("termsAndConditions");
  termsAndConditions = self->_termsAndConditions;
  v9 = termsAndConditions;
  if (!termsAndConditions)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v9;
  v14[4] = CFSTR("availableBookings");
  availableBookings = self->_availableBookings;
  v11 = availableBookings;
  if (!availableBookings)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (availableBookings)
  {
    if (termsAndConditions)
      goto LABEL_11;
  }
  else
  {

    if (termsAndConditions)
    {
LABEL_11:
      if (localizedBookingAdvisementText)
        goto LABEL_12;
LABEL_16:

      if (localizedRestaurantDescriptionText)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!localizedBookingAdvisementText)
    goto LABEL_16;
LABEL_12:
  if (!localizedRestaurantDescriptionText)
    goto LABEL_17;
LABEL_13:

  return v12;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = -[INGetAvailableRestaurantReservationBookingsIntentResponse copyWithZone:](self, "copyWithZone:", 0);
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (NSString)localizedRestaurantDescriptionText
{
  return self->_localizedRestaurantDescriptionText;
}

- (void)setLocalizedRestaurantDescriptionText:(NSString *)localizedRestaurantDescriptionText
{
  objc_setProperty_nonatomic_copy(self, a2, localizedRestaurantDescriptionText, 64);
}

- (NSString)localizedBookingAdvisementText
{
  return self->_localizedBookingAdvisementText;
}

- (void)setLocalizedBookingAdvisementText:(NSString *)localizedBookingAdvisementText
{
  objc_setProperty_nonatomic_copy(self, a2, localizedBookingAdvisementText, 72);
}

- (INTermsAndConditions)termsAndConditions
{
  return self->_termsAndConditions;
}

- (void)setTermsAndConditions:(INTermsAndConditions *)termsAndConditions
{
  objc_setProperty_nonatomic_copy(self, a2, termsAndConditions, 80);
}

- (NSArray)availableBookings
{
  return self->_availableBookings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableBookings, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
  objc_storeStrong((id *)&self->_localizedBookingAdvisementText, 0);
  objc_storeStrong((id *)&self->_localizedRestaurantDescriptionText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

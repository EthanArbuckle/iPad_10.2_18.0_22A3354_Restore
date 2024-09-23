@implementation INGetAvailableRestaurantReservationBookingDefaultsIntentResponse

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse initWithDefaultPartySize:defaultBookingDate:code:userActivity:](self, "initWithDefaultPartySize:defaultBookingDate:code:userActivity:", 2, v8, a3, v7);

  return v9;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithDefaultPartySize:(NSUInteger)defaultPartySize defaultBookingDate:(NSDate *)defaultBookingDate code:(INGetAvailableRestaurantReservationBookingDefaultsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSDate *v11;
  INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *v12;
  INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *v13;
  objc_super v15;

  v11 = defaultBookingDate;
  v15.receiver = self;
  v15.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  v12 = -[INIntentResponse _initWithCode:userActivity:](&v15, sel__initWithCode_userActivity_, code, userActivity);
  v13 = v12;
  if (v12)
  {
    v12->_defaultPartySize = defaultPartySize;
    objc_storeStrong((id *)&v12->_defaultBookingDate, defaultBookingDate);
  }

  return v13;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithCoder:(id)a3
{
  id v4;
  INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *v5;
  uint64_t v6;
  NSNumber *minimumPartySize;
  uint64_t v8;
  NSNumber *maximumPartySize;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  v5 = -[INIntentResponse initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumPartySize"));
    v6 = objc_claimAutoreleasedReturnValue();
    minimumPartySize = v5->_minimumPartySize;
    v5->_minimumPartySize = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumPartySize"));
    v8 = objc_claimAutoreleasedReturnValue();
    maximumPartySize = v5->_maximumPartySize;
    v5->_maximumPartySize = (NSNumber *)v8;

    v5->_defaultPartySize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultPartySize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultBookingDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&v5->_defaultBookingDate, v10);
    if (v11)
      objc_storeStrong((id *)&v5->_providerImage, v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  v4 = a3;
  -[INIntentResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_defaultPartySize, CFSTR("defaultPartySize"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultBookingDate, CFSTR("defaultBookingDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumPartySize, CFSTR("minimumPartySize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumPartySize, CFSTR("maximumPartySize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_providerImage, CFSTR("providerImage"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  v4 = -[INIntentResponse copyWithZone:](&v11, sel_copyWithZone_, a3);
  v4[8] = -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse defaultPartySize](self, "defaultPartySize");
  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse defaultBookingDate](self, "defaultBookingDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[9];
  v4[9] = v5;

  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse maximumPartySize](self, "maximumPartySize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumPartySize:", v7);

  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse minimumPartySize](self, "minimumPartySize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumPartySize:", v8);

  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse providerImage](self, "providerImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderImage:", v9);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *v5;
  INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *v6;
  INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v26;

  v5 = (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)a3;
  v6 = v5;
  if (self == v5)
  {
    v12 = 1;
    goto LABEL_29;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = 0;
    goto LABEL_29;
  }
  v7 = v6;
  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse minimumPartySize](self, "minimumPartySize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse minimumPartySize](v7, "minimumPartySize");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v26 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse minimumPartySize](self, "minimumPartySize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse minimumPartySize](v7, "minimumPartySize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse minimumPartySize](v7, "minimumPartySize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v9, "isEqualToNumber:", v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse minimumPartySize](self, "minimumPartySize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v11, "integerValue") - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v9, "isEqualToNumber:", v14);

  }
  if (!v8)
    goto LABEL_14;
LABEL_15:

  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse maximumPartySize](self, "maximumPartySize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse maximumPartySize](v7, "maximumPartySize");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v19 = 1;
LABEL_23:

      goto LABEL_24;
    }
  }
  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse maximumPartySize](self, "maximumPartySize");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse maximumPartySize](v7, "maximumPartySize");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse maximumPartySize](v7, "maximumPartySize");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "isEqualToNumber:", v18);
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse maximumPartySize](self, "maximumPartySize");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v18, "integerValue") - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "isEqualToNumber:", v21);

  }
  if (!v15)
    goto LABEL_23;
LABEL_24:

  v22 = -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse defaultPartySize](v7, "defaultPartySize");
  v12 = 0;
  if (v22 == -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse defaultPartySize](self, "defaultPartySize")&& ((v26 ^ 1) & 1) == 0&& v19)
  {
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse defaultBookingDate](v7, "defaultBookingDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse defaultBookingDate](self, "defaultBookingDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v23, "isEqualToDate:", v24);

  }
LABEL_29:

  return v12;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (id)_dictionaryRepresentation
{
  NSDate *defaultBookingDate;
  void *v4;
  NSNumber *maximumPartySize;
  void *v6;
  NSNumber *minimumPartySize;
  void *v8;
  INImage *providerImage;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("defaultPartySize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_defaultPartySize);
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  v16[1] = CFSTR("defaultBookingDate");
  defaultBookingDate = self->_defaultBookingDate;
  v4 = defaultBookingDate;
  if (!defaultBookingDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v4;
  v16[2] = CFSTR("maximumPartySize");
  maximumPartySize = self->_maximumPartySize;
  v6 = maximumPartySize;
  if (!maximumPartySize)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v6;
  v16[3] = CFSTR("minimumPartySize");
  minimumPartySize = self->_minimumPartySize;
  v8 = minimumPartySize;
  if (!minimumPartySize)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v8;
  v16[4] = CFSTR("providerImage");
  providerImage = self->_providerImage;
  v10 = providerImage;
  if (!providerImage)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v10;
  v16[5] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse code](self, "code", v14));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (providerImage)
  {
    if (minimumPartySize)
      goto LABEL_11;
  }
  else
  {

    if (minimumPartySize)
    {
LABEL_11:
      if (maximumPartySize)
        goto LABEL_12;
LABEL_16:

      if (defaultBookingDate)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!maximumPartySize)
    goto LABEL_16;
LABEL_12:
  if (!defaultBookingDate)
    goto LABEL_17;
LABEL_13:

  return v12;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse copyWithZone:](self, "copyWithZone:", 0);
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (NSUInteger)defaultPartySize
{
  return self->_defaultPartySize;
}

- (NSDate)defaultBookingDate
{
  return self->_defaultBookingDate;
}

- (NSNumber)maximumPartySize
{
  return self->_maximumPartySize;
}

- (void)setMaximumPartySize:(NSNumber *)maximumPartySize
{
  objc_setProperty_nonatomic_copy(self, a2, maximumPartySize, 80);
}

- (NSNumber)minimumPartySize
{
  return self->_minimumPartySize;
}

- (void)setMinimumPartySize:(NSNumber *)minimumPartySize
{
  objc_setProperty_nonatomic_copy(self, a2, minimumPartySize, 88);
}

- (INImage)providerImage
{
  return self->_providerImage;
}

- (void)setProviderImage:(INImage *)providerImage
{
  objc_setProperty_nonatomic_copy(self, a2, providerImage, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_minimumPartySize, 0);
  objc_storeStrong((id *)&self->_maximumPartySize, 0);
  objc_storeStrong((id *)&self->_defaultBookingDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

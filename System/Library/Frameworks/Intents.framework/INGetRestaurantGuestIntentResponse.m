@implementation INGetRestaurantGuestIntentResponse

- (INGetRestaurantGuestIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INGetRestaurantGuestIntentResponse)initWithCode:(INGetRestaurantGuestIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return (INGetRestaurantGuestIntentResponse *)-[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, code, userActivity);
}

- (INGetRestaurantGuestIntentResponse)initWithCoder:(id)a3
{
  id v4;
  INGetRestaurantGuestIntentResponse *v5;
  uint64_t v6;
  INRestaurantGuest *guest;
  uint64_t v8;
  INRestaurantGuestDisplayPreferences *guestDisplayPreferences;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetRestaurantGuestIntentResponse;
  v5 = -[INIntentResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guest"));
    v6 = objc_claimAutoreleasedReturnValue();
    guest = v5->_guest;
    v5->_guest = (INRestaurantGuest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guestDisplayPreferences"));
    v8 = objc_claimAutoreleasedReturnValue();
    guestDisplayPreferences = v5->_guestDisplayPreferences;
    v5->_guestDisplayPreferences = (INRestaurantGuestDisplayPreferences *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetRestaurantGuestIntentResponse;
  v4 = a3;
  -[INIntentResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_guest, CFSTR("guest"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_guestDisplayPreferences, CFSTR("guestDisplayPreferences"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INGetRestaurantGuestIntentResponse;
  v4 = -[INIntentResponse copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[INGetRestaurantGuestIntentResponse guest](self, "guest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuest:", v5);

  -[INGetRestaurantGuestIntentResponse guestDisplayPreferences](self, "guestDisplayPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuestDisplayPreferences:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INGetRestaurantGuestIntentResponse *v5;
  INGetRestaurantGuestIntentResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = (INGetRestaurantGuestIntentResponse *)a3;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[INGetRestaurantGuestIntentResponse guest](v6, "guest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[INGetRestaurantGuestIntentResponse guest](self, "guest"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[INGetRestaurantGuestIntentResponse guest](self, "guest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[INGetRestaurantGuestIntentResponse guest](v6, "guest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v7)
        {
LABEL_11:

          -[INGetRestaurantGuestIntentResponse guestDisplayPreferences](v6, "guestDisplayPreferences");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            || (-[INGetRestaurantGuestIntentResponse guestDisplayPreferences](self, "guestDisplayPreferences"),
                (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[INGetRestaurantGuestIntentResponse guestDisplayPreferences](self, "guestDisplayPreferences");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[INGetRestaurantGuestIntentResponse guestDisplayPreferences](v6, "guestDisplayPreferences");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if (v12)
            {
LABEL_17:

              v11 = v10 & v15;
              goto LABEL_18;
            }
          }
          else
          {
            v15 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_11;
    }
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (INGetRestaurantGuestIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (id)_dictionaryRepresentation
{
  INRestaurantGuest *guest;
  void *v4;
  INRestaurantGuestDisplayPreferences *guestDisplayPreferences;
  void *v6;
  INGetRestaurantGuestIntentResponseCode v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("guest");
  guest = self->_guest;
  v4 = guest;
  if (!guest)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("guestDisplayPreferences");
  guestDisplayPreferences = self->_guestDisplayPreferences;
  v6 = guestDisplayPreferences;
  if (!guestDisplayPreferences)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("code");
  v7 = -[INGetRestaurantGuestIntentResponse code](self, "code");
  v8 = CFSTR("Failure");
  if (v7 != INGetRestaurantGuestIntentResponseCodeFailure)
    v8 = 0;
  if (v7 == INGetRestaurantGuestIntentResponseCodeSuccess)
    v8 = CFSTR("Success");
  v9 = v8;
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!guestDisplayPreferences)
  {

    if (guest)
      return v11;
LABEL_17:

    return v11;
  }
  if (!guest)
    goto LABEL_17;
  return v11;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = -[INGetRestaurantGuestIntentResponse copyWithZone:](self, "copyWithZone:", 0);
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (void)setGuest:(INRestaurantGuest *)guest
{
  objc_setProperty_nonatomic_copy(self, a2, guest, 64);
}

- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences
{
  return self->_guestDisplayPreferences;
}

- (void)setGuestDisplayPreferences:(INRestaurantGuestDisplayPreferences *)guestDisplayPreferences
{
  objc_setProperty_nonatomic_copy(self, a2, guestDisplayPreferences, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestDisplayPreferences, 0);
  objc_storeStrong((id *)&self->_guest, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

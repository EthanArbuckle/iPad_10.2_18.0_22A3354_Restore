@implementation INBookRestaurantReservationIntentResponse

- (INBookRestaurantReservationIntentResponse)initWithCode:(INBookRestaurantReservationIntentCode)code userActivity:(NSUserActivity *)userActivity
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INBookRestaurantReservationIntentResponse;
  return (INBookRestaurantReservationIntentResponse *)-[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, code, userActivity);
}

- (INBookRestaurantReservationIntentResponse)initWithCoder:(id)a3
{
  id v4;
  INBookRestaurantReservationIntentResponse *v5;
  uint64_t v6;
  INRestaurantReservationUserBooking *userBooking;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INBookRestaurantReservationIntentResponse;
  v5 = -[INIntentResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userBooking"));
    v6 = objc_claimAutoreleasedReturnValue();
    userBooking = v5->_userBooking;
    v5->_userBooking = (INRestaurantReservationUserBooking *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INBookRestaurantReservationIntentResponse;
  v4 = a3;
  -[INIntentResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userBooking, CFSTR("userBooking"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INBookRestaurantReservationIntentResponse;
  v4 = -[INIntentResponse copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[INBookRestaurantReservationIntentResponse userBooking](self, "userBooking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserBooking:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INBookRestaurantReservationIntentResponse *v5;
  INBookRestaurantReservationIntentResponse *v6;
  INBookRestaurantReservationIntentResponse *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (INBookRestaurantReservationIntentResponse *)a3;
  v6 = v5;
  if (self == v5)
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
        -[INBookRestaurantReservationIntentResponse userBooking](self, "userBooking");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[INBookRestaurantReservationIntentResponse userBooking](v7, "userBooking"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[INBookRestaurantReservationIntentResponse userBooking](self, "userBooking");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[INBookRestaurantReservationIntentResponse userBooking](v7, "userBooking");
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

- (INBookRestaurantReservationIntentCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INBookRestaurantReservationIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  INRestaurantReservationUserBooking *userBooking;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INBookRestaurantReservationIntentResponse code](self, "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("userBooking");
  v9[0] = v3;
  userBooking = self->_userBooking;
  v5 = userBooking;
  if (!userBooking)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!userBooking)

  return v6;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = -[INBookRestaurantReservationIntentResponse copyWithZone:](self, "copyWithZone:", 0);
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (INRestaurantReservationUserBooking)userBooking
{
  return self->_userBooking;
}

- (void)setUserBooking:(INRestaurantReservationUserBooking *)userBooking
{
  objc_setProperty_nonatomic_copy(self, a2, userBooking, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userBooking, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

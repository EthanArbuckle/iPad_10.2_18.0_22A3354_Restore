@implementation INGetUserCurrentRestaurantReservationBookingsIntentResponse

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)init
{
  return -[INGetUserCurrentRestaurantReservationBookingsIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 3, 0);
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithCoder:(id)a3
{
  id v4;
  INGetUserCurrentRestaurantReservationBookingsIntentResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  v5 = -[INIntentResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("userCurrentBookings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_storeStrong((id *)&v5->_userCurrentBookings, v9);

  }
  return v5;
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  return -[INGetUserCurrentRestaurantReservationBookingsIntentResponse initWithUserCurrentBookings:code:userActivity:](self, "initWithUserCurrentBookings:code:userActivity:", MEMORY[0x1E0C9AA60], a3, a4);
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithUserCurrentBookings:(NSArray *)userCurrentBookings code:(INGetUserCurrentRestaurantReservationBookingsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSArray *v8;
  INGetUserCurrentRestaurantReservationBookingsIntentResponse *v9;
  uint64_t v10;
  NSArray *v11;
  objc_super v13;

  v8 = userCurrentBookings;
  v13.receiver = self;
  v13.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  v9 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, code, userActivity);
  if (v9)
  {
    v10 = -[NSArray copy](v8, "copy");
    v11 = v9->_userCurrentBookings;
    v9->_userCurrentBookings = (NSArray *)v10;

  }
  return v9;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  v4 = a3;
  -[INIntentResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userCurrentBookings, CFSTR("userCurrentBookings"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  v4 = -[INIntentResponse copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[INGetUserCurrentRestaurantReservationBookingsIntentResponse userCurrentBookings](self, "userCurrentBookings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[INGetUserCurrentRestaurantReservationBookingsIntentResponse userCurrentBookings](self, "userCurrentBookings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    objc_msgSend(v4, "setUserCurrentBookings:", v8);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  INGetUserCurrentRestaurantReservationBookingsIntentResponse *v4;
  INGetUserCurrentRestaurantReservationBookingsIntentResponse *v5;
  INGetUserCurrentRestaurantReservationBookingsIntentResponse *v6;
  void *v7;
  void *v8;
  INGetUserCurrentRestaurantReservationBookingsIntentResponseCode v9;
  BOOL v10;

  v4 = (INGetUserCurrentRestaurantReservationBookingsIntentResponse *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[INGetUserCurrentRestaurantReservationBookingsIntentResponse userCurrentBookings](v6, "userCurrentBookings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INGetUserCurrentRestaurantReservationBookingsIntentResponse userCurrentBookings](self, "userCurrentBookings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToArray:", v8))
    {
      v9 = -[INGetUserCurrentRestaurantReservationBookingsIntentResponse code](self, "code");
      v10 = v9 == -[INGetUserCurrentRestaurantReservationBookingsIntentResponse code](v6, "code");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (id)_dictionaryRepresentation
{
  INGetUserCurrentRestaurantReservationBookingsIntentResponseCode v3;
  unint64_t v4;
  __CFString *v5;
  NSArray *userCurrentBookings;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("code");
  v3 = -[INGetUserCurrentRestaurantReservationBookingsIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 <= INGetUserCurrentRestaurantReservationBookingsIntentResponseCodeUnspecified)
  {
    v5 = off_1E228E208[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("userCurrentBookings");
  v11[0] = v5;
  userCurrentBookings = self->_userCurrentBookings;
  v7 = userCurrentBookings;
  if (!userCurrentBookings)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!userCurrentBookings)

  if (v4 >= 4)
  return v8;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = -[INGetUserCurrentRestaurantReservationBookingsIntentResponse copyWithZone:](self, "copyWithZone:", 0);
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (NSArray)userCurrentBookings
{
  return self->_userCurrentBookings;
}

- (void)setUserCurrentBookings:(NSArray *)userCurrentBookings
{
  objc_setProperty_nonatomic_copy(self, a2, userCurrentBookings, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCurrentBookings, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

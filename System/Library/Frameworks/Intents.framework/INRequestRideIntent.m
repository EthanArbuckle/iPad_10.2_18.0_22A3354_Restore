@implementation INRequestRideIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 15;
}

- (id)_categoryVerb
{
  return CFSTR("Request");
}

- (INRequestRideIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation rideOptionName:(INSpeakableString *)rideOptionName partySize:(NSNumber *)partySize paymentMethod:(INPaymentMethod *)paymentMethod scheduledPickupTime:(INDateComponentsRange *)scheduledPickupTime
{
  CLPlacemark *v14;
  CLPlacemark *v15;
  INSpeakableString *v16;
  NSNumber *v17;
  INPaymentMethod *v18;
  INDateComponentsRange *v19;
  INRequestRideIntent *v20;
  INRequestRideIntent *v21;
  objc_super v23;

  v14 = pickupLocation;
  v15 = dropOffLocation;
  v16 = rideOptionName;
  v17 = partySize;
  v18 = paymentMethod;
  v19 = scheduledPickupTime;
  v23.receiver = self;
  v23.super_class = (Class)INRequestRideIntent;
  v20 = -[INIntent init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[INRequestRideIntent setPickupLocation:](v20, "setPickupLocation:", v14);
    -[INRequestRideIntent setDropOffLocation:](v21, "setDropOffLocation:", v15);
    -[INRequestRideIntent setRideOptionName:](v21, "setRideOptionName:", v16);
    -[INRequestRideIntent setPartySize:](v21, "setPartySize:", v17);
    -[INRequestRideIntent setPaymentMethod:](v21, "setPaymentMethod:", v18);
    -[INRequestRideIntent setScheduledPickupTime:](v21, "setScheduledPickupTime:", v19);
  }

  return v21;
}

- (CLPlacemark)pickupLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickupLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (void)setPickupLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPickupLocation:", v5);
}

- (CLPlacemark)dropOffLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dropOffLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (void)setDropOffLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDropOffLocation:", v5);
}

- (INSpeakableString)rideOptionName
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rideOptionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setRideOptionName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRideOptionName:", v5);
}

- (NSNumber)partySize
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "partySize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromInteger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setPartySize:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToInteger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPartySize:", v5);
}

- (INPaymentMethod)paymentMethod
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentMethod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPaymentMethod(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentMethod *)v4;
}

- (void)setPaymentMethod:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPaymentMethod(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPaymentMethod:", v5);
}

- (INDateComponentsRange)scheduledPickupTime
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduledPickupTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setScheduledPickupTime:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setScheduledPickupTime:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("pickupLocation");
  -[INRequestRideIntent pickupLocation](self, "pickupLocation");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v3;
  v21[0] = v3;
  v20[1] = CFSTR("dropOffLocation");
  -[INRequestRideIntent dropOffLocation](self, "dropOffLocation");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v5;
  v21[1] = v5;
  v20[2] = CFSTR("rideOptionName");
  -[INRequestRideIntent rideOptionName](self, "rideOptionName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v21[2] = v7;
  v20[3] = CFSTR("partySize");
  -[INRequestRideIntent partySize](self, "partySize", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[3] = v10;
  v20[4] = CFSTR("paymentMethod");
  -[INRequestRideIntent paymentMethod](self, "paymentMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v12;
  v20[5] = CFSTR("scheduledPickupTime");
  -[INRequestRideIntent scheduledPickupTime](self, "scheduledPickupTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v11)
  if (!v9)

  if (!v8)
  if (!v6)

  if (!v4)
  return v15;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  -[INRequestRideIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "pickupLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v9, a3, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPickupLocation:", v10);

  objc_msgSend(v7, "dropOffLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v11, a3, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDropOffLocation:", v12);

  objc_msgSend(v7, "partySize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedIntegerFromInteger(v13, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPartySize:", v14);

  objc_msgSend(v7, "paymentMethod");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedPaymentMethodFromPaymentMethod(v15, a3, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPaymentMethod:", v16);

  objc_msgSend(v7, "scheduledPickupTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v17, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setScheduledPickupTime:", v18);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (BOOL)_isUserConfirmationRequired
{
  return 1;
}

- (id)domain
{
  return CFSTR("Ridesharing");
}

- (id)verb
{
  return CFSTR("RequestRide");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("partySize"), CFSTR("paymentMethod"), CFSTR("scheduledPickupTime"), 0);
}

- (INRequestRideIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation rideOptionName:(INSpeakableString *)rideOptionName partySize:(NSNumber *)partySize paymentMethod:(INPaymentMethod *)paymentMethod
{
  return -[INRequestRideIntent initWithPickupLocation:dropOffLocation:rideOptionName:partySize:paymentMethod:scheduledPickupTime:](self, "initWithPickupLocation:dropOffLocation:rideOptionName:partySize:paymentMethod:scheduledPickupTime:", pickupLocation, dropOffLocation, rideOptionName, partySize, paymentMethod, 0);
}

@end

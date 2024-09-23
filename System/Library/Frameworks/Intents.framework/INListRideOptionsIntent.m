@implementation INListRideOptionsIntent

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

  -[INListRideOptionsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INListRideOptionsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 1;
}

- (id)_categoryVerb
{
  return CFSTR("View");
}

- (INListRideOptionsIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation
{
  CLPlacemark *v6;
  CLPlacemark *v7;
  INListRideOptionsIntent *v8;
  INListRideOptionsIntent *v9;
  objc_super v11;

  v6 = pickupLocation;
  v7 = dropOffLocation;
  v11.receiver = self;
  v11.super_class = (Class)INListRideOptionsIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INListRideOptionsIntent setPickupLocation:](v8, "setPickupLocation:", v6);
    -[INListRideOptionsIntent setDropOffLocation:](v9, "setDropOffLocation:", v7);
  }

  return v9;
}

- (CLPlacemark)pickupLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[INListRideOptionsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INListRideOptionsIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INListRideOptionsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INListRideOptionsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDropOffLocation:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("pickupLocation");
  -[INListRideOptionsIntent pickupLocation](self, "pickupLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("dropOffLocation");
  v10[0] = v4;
  -[INListRideOptionsIntent dropOffLocation](self, "dropOffLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v7;
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
  id v13;

  v6 = a4;
  -[INListRideOptionsIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "pickupLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v9, a3, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPickupLocation:", v10);

  objc_msgSend(v7, "dropOffLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v11, a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDropOffLocation:", v12);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Ridesharing");
}

- (id)verb
{
  return CFSTR("ListRideOptions");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

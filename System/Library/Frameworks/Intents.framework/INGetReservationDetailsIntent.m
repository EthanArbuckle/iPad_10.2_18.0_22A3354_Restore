@implementation INGetReservationDetailsIntent

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

  -[INGetReservationDetailsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INGetReservationDetailsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INGetReservationDetailsIntent)initWithReservationContainerReference:(INSpeakableString *)reservationContainerReference reservationItemReferences:(NSArray *)reservationItemReferences
{
  INSpeakableString *v6;
  NSArray *v7;
  INGetReservationDetailsIntent *v8;
  INGetReservationDetailsIntent *v9;
  objc_super v11;

  v6 = reservationContainerReference;
  v7 = reservationItemReferences;
  v11.receiver = self;
  v11.super_class = (Class)INGetReservationDetailsIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INGetReservationDetailsIntent setReservationContainerReference:](v8, "setReservationContainerReference:", v6);
    -[INGetReservationDetailsIntent setReservationItemReferences:](v9, "setReservationItemReferences:", v7);
  }

  return v9;
}

- (INSpeakableString)reservationContainerReference
{
  void *v2;
  void *v3;
  void *v4;

  -[INGetReservationDetailsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reservationContainerReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setReservationContainerReference:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INGetReservationDetailsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setReservationContainerReference:", v5);
}

- (NSArray)reservationItemReferences
{
  void *v2;
  void *v3;
  void *v4;

  -[INGetReservationDetailsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reservationItemReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataStrings(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setReservationItemReferences:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INGetReservationDetailsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setReservationItemReferences:", v5);
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
  v9[0] = CFSTR("reservationContainerReference");
  -[INGetReservationDetailsIntent reservationContainerReference](self, "reservationContainerReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("reservationItemReferences");
  v10[0] = v4;
  -[INGetReservationDetailsIntent reservationItemReferences](self, "reservationItemReferences");
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
  void *v5;
  id v6;

  -[INGetReservationDetailsIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Reservations");
}

- (id)verb
{
  return CFSTR("GetReservationDetails");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation INCreateEventIntent

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

  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 8;
}

- (id)_categoryVerb
{
  return CFSTR("Create");
}

- (INCreateEventIntent)initWithTitle:(id)a3 dateTimeRange:(id)a4 participants:(id)a5 location:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INCreateEventIntent *v14;
  INCreateEventIntent *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)INCreateEventIntent;
  v14 = -[INIntent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[INCreateEventIntent setTitle:](v14, "setTitle:", v10);
    -[INCreateEventIntent setDateTimeRange:](v15, "setDateTimeRange:", v11);
    -[INCreateEventIntent setParticipants:](v15, "setParticipants:", v12);
    -[INCreateEventIntent setLocation:](v15, "setLocation:", v13);
  }

  return v15;
}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (INDateComponentsRange)dateTimeRange
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateTimeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRangeValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setDateTimeRange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRangeValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDateTimeRange:", v5);
}

- (NSArray)participants
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setParticipants:", v5);
}

- (CLPlacemark)location
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (void)setLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLocation:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("title");
  -[INCreateEventIntent title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("dateTimeRange");
  -[INCreateEventIntent dateTimeRange](self, "dateTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("participants");
  -[INCreateEventIntent participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("location");
  -[INCreateEventIntent location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!v7)
  if (!v5)

  if (!v3)
  return v11;
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
  -[INCreateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v9, a3, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setParticipants:", v10);
  objc_msgSend(v7, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v11, a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLocation:", v12);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("CalendarEvent");
}

- (id)verb
{
  return CFSTR("CreateEvent");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

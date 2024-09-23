@implementation INFindEventsIntent

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

  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 9;
}

- (id)_categoryVerb
{
  return CFSTR("Search");
}

- (INFindEventsIntent)initWithSearchQuery:(id)a3 dateTimeRange:(id)a4 participants:(id)a5 location:(id)a6 requestedEventAttribute:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  INFindEventsIntent *v16;
  INFindEventsIntent *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)INFindEventsIntent;
  v16 = -[INIntent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[INFindEventsIntent setSearchQuery:](v16, "setSearchQuery:", v12);
    -[INFindEventsIntent setDateTimeRange:](v17, "setDateTimeRange:", v13);
    -[INFindEventsIntent setParticipants:](v17, "setParticipants:", v14);
    -[INFindEventsIntent setLocation:](v17, "setLocation:", v15);
    -[INFindEventsIntent setRequestedEventAttribute:](v17, "setRequestedEventAttribute:", a7);
  }

  return v17;
}

- (NSString)searchQuery
{
  void *v2;
  void *v3;
  void *v4;

  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setSearchQuery:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchQuery:", v4);

}

- (INDateComponentsRange)dateTimeRange
{
  void *v2;
  void *v3;
  void *v4;

  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLocation:", v5);
}

- (int64_t)requestedEventAttribute
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRequestedEventAttribute");
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestedEventAttribute") - 1;
  if (v6 <= 2)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setRequestedEventAttribute:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasRequestedEventAttribute:", 0);
  else
    objc_msgSend(v4, "setRequestedEventAttribute:");

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
  int64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("searchQuery");
  -[INFindEventsIntent searchQuery](self, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v4;
  v16[1] = CFSTR("dateTimeRange");
  -[INFindEventsIntent dateTimeRange](self, "dateTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("participants");
  -[INFindEventsIntent participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("location");
  -[INFindEventsIntent location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v10;
  v16[4] = CFSTR("requestedEventAttribute");
  v11 = -[INFindEventsIntent requestedEventAttribute](self, "requestedEventAttribute");
  if ((unint64_t)(v11 - 1) > 2)
    v12 = CFSTR("unknown");
  else
    v12 = *(&off_1E2292A48 + v11 - 1);
  v13 = v12;
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  if (!v7)

  if (!v5)
  if (!v3)

  return v14;
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
  -[INFindEventsIntent _typedBackingStore](self, "_typedBackingStore");
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
  return CFSTR("FindEvents");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

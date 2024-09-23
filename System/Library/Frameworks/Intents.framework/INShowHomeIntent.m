@implementation INShowHomeIntent

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

  -[INShowHomeIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INShowHomeIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INShowHomeIntent)initWithFilters:(id)a3 time:(id)a4
{
  id v6;
  id v7;
  INShowHomeIntent *v8;
  INShowHomeIntent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INShowHomeIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INShowHomeIntent setFilters:](v8, "setFilters:", v6);
    -[INShowHomeIntent setTime:](v9, "setTime:", v7);
  }

  return v9;
}

- (NSArray)filters
{
  void *v2;
  void *v3;
  void *v4;

  -[INShowHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromHomeFilters(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setFilters:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INShowHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToHomeFilters(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFilters:", v5);
}

- (INDateComponentsRange)time
{
  void *v2;
  void *v3;
  void *v4;

  -[INShowHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setTime:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INShowHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTime:", v5);
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
  v9[0] = CFSTR("filters");
  -[INShowHomeIntent filters](self, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("time");
  v10[0] = v4;
  -[INShowHomeIntent time](self, "time");
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
  id v11;

  v6 = a4;
  -[INShowHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTime:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("HomeKit");
}

- (id)verb
{
  return CFSTR("ShowHome");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation INDeleteTimerIntent

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

  -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INDeleteTimerIntent)initWithTargetTimer:(id)a3 deleteMultiple:(id)a4
{
  id v6;
  id v7;
  INDeleteTimerIntent *v8;
  INDeleteTimerIntent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INDeleteTimerIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INDeleteTimerIntent setTargetTimer:](v8, "setTargetTimer:", v6);
    -[INDeleteTimerIntent setDeleteMultiple:](v9, "setDeleteMultiple:", v7);
  }

  return v9;
}

- (INTimer)targetTimer
{
  void *v2;
  void *v3;
  void *v4;

  -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTimer(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTimer *)v4;
}

- (void)setTargetTimer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTimer(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetTimer:", v5);
}

- (NSNumber)deleteMultiple
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasDeleteMultiple"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "deleteMultiple"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setDeleteMultiple:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setDeleteMultiple:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasDeleteMultiple:", 0);

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
  v9[0] = CFSTR("targetTimer");
  -[INDeleteTimerIntent targetTimer](self, "targetTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("deleteMultiple");
  v10[0] = v4;
  -[INDeleteTimerIntent deleteMultiple](self, "deleteMultiple");
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

  -[INDeleteTimerIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Timers");
}

- (id)verb
{
  return CFSTR("DeleteTimer");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

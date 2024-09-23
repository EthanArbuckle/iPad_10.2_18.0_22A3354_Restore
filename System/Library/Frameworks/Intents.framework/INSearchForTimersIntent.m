@implementation INSearchForTimersIntent

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

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INSearchForTimersIntent)initWithLabel:(id)a3 duration:(double)a4 state:(int64_t)a5 type:(int64_t)a6
{
  id v10;
  INSearchForTimersIntent *v11;
  INSearchForTimersIntent *v12;
  objc_super v14;

  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INSearchForTimersIntent;
  v11 = -[INIntent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INSearchForTimersIntent setLabel:](v11, "setLabel:", v10);
    -[INSearchForTimersIntent setDuration:](v12, "setDuration:", a4);
    -[INSearchForTimersIntent setState:](v12, "setState:", a5);
    -[INSearchForTimersIntent setType:](v12, "setType:", a6);
  }

  return v12;
}

- (INSpeakableString)label
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLabel:", v5);
}

- (double)duration
{
  void *v3;
  double v4;
  void *v5;
  double v6;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "hasDuration"))
  {
    -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duration");
    v4 = v6;

  }
  return v4;
}

- (void)setDuration:(double)a3
{
  void *v4;
  id v5;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 0.0)
    objc_msgSend(v4, "setHasDuration:", 0);
  else
    objc_msgSend(v4, "setDuration:", a3);

}

- (int64_t)state
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasState");
  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");
  v7 = v6 == 1;
  if (v6 == 2)
    v7 = 2;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setState:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 2)
    objc_msgSend(v4, "setHasState:", 0);
  else
    objc_msgSend(v4, "setState:", a3);

}

- (int64_t)type
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasType");
  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");
  v7 = v6 == 1;
  if (v6 == 2)
    v7 = 2;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 2)
    objc_msgSend(v4, "setHasType:", 0);
  else
    objc_msgSend(v4, "setType:", a3);

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  __CFString *v9;
  __CFString *v10;
  int64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("label");
  -[INSearchForTimersIntent label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v4;
  v16[1] = CFSTR("duration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[INSearchForTimersIntent duration](self, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v7;
  v16[2] = CFSTR("state");
  v8 = -[INSearchForTimersIntent state](self, "state");
  v9 = CFSTR("unknown");
  if (v8 == 2)
    v9 = CFSTR("timerPaused");
  if (v8 == 1)
    v9 = CFSTR("timerRunning");
  v10 = v9;
  v17[2] = v10;
  v16[3] = CFSTR("type");
  v11 = -[INSearchForTimersIntent type](self, "type");
  v12 = CFSTR("unknown");
  if (v11 == 2)
    v12 = CFSTR("sleepTimer");
  if (v11 == 1)
    v12 = CFSTR("defaultType");
  v13 = v12;
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  if (!v3)

  return v14;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSearchForTimersIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("SearchForTimers");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

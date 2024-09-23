@implementation INCreateTimerIntent

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

  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INCreateTimerIntent)initWithLabel:(id)a3 duration:(double)a4 type:(int64_t)a5
{
  id v8;
  INCreateTimerIntent *v9;
  INCreateTimerIntent *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCreateTimerIntent;
  v9 = -[INIntent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[INCreateTimerIntent setLabel:](v9, "setLabel:", v8);
    -[INCreateTimerIntent setDuration:](v10, "setDuration:", a4);
    -[INCreateTimerIntent setType:](v10, "setType:", a5);
  }

  return v10;
}

- (INSpeakableString)label
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "hasDuration"))
  {
    -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 0.0)
    objc_msgSend(v4, "setHasDuration:", 0);
  else
    objc_msgSend(v4, "setDuration:", a3);

}

- (int64_t)type
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasType");
  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore");
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
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("label");
  -[INCreateTimerIntent label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("duration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[INCreateTimerIntent duration](self, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v7;
  v13[2] = CFSTR("type");
  v8 = -[INCreateTimerIntent type](self, "type");
  v9 = CFSTR("unknown");
  if (v8 == 2)
    v9 = CFSTR("sleepTimer");
  if (v8 == 1)
    v9 = CFSTR("defaultType");
  v10 = v9;
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  if (!v3)

  return v11;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INCreateTimerIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("CreateTimer");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

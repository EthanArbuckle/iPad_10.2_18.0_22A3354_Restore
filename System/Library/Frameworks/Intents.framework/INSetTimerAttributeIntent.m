@implementation INSetTimerAttributeIntent

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

  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 16;
}

- (id)_categoryVerb
{
  return CFSTR("Set");
}

- (INSetTimerAttributeIntent)initWithTargetTimer:(id)a3 toDuration:(double)a4 toLabel:(id)a5
{
  id v8;
  id v9;
  INSetTimerAttributeIntent *v10;
  INSetTimerAttributeIntent *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)INSetTimerAttributeIntent;
  v10 = -[INIntent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[INSetTimerAttributeIntent setTargetTimer:](v10, "setTargetTimer:", v8);
    -[INSetTimerAttributeIntent setToDuration:](v11, "setToDuration:", a4);
    -[INSetTimerAttributeIntent setToLabel:](v11, "setToLabel:", v9);
  }

  return v11;
}

- (INTimer)targetTimer
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTimer(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetTimer:", v5);
}

- (double)toDuration
{
  void *v3;
  double v4;
  void *v5;
  double v6;

  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "hasToDuration"))
  {
    -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toDuration");
    v4 = v6;

  }
  return v4;
}

- (void)setToDuration:(double)a3
{
  void *v4;
  id v5;

  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 0.0)
    objc_msgSend(v4, "setHasToDuration:", 0);
  else
    objc_msgSend(v4, "setToDuration:", a3);

}

- (INSpeakableString)toLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setToLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setToLabel:", v5);
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
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("targetTimer");
  -[INSetTimerAttributeIntent targetTimer](self, "targetTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("toDuration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[INSetTimerAttributeIntent toDuration](self, "toDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v7;
  v12[2] = CFSTR("toLabel");
  -[INSetTimerAttributeIntent toLabel](self, "toLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!v6)
  if (!v3)

  return v10;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSetTimerAttributeIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("SetTimerAttribute");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation INResumeTimerIntent

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

  -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INResumeTimerIntent)initWithTargetTimer:(id)a3 resumeMultiple:(id)a4
{
  id v6;
  id v7;
  INResumeTimerIntent *v8;
  INResumeTimerIntent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INResumeTimerIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INResumeTimerIntent setTargetTimer:](v8, "setTargetTimer:", v6);
    -[INResumeTimerIntent setResumeMultiple:](v9, "setResumeMultiple:", v7);
  }

  return v9;
}

- (INTimer)targetTimer
{
  void *v2;
  void *v3;
  void *v4;

  -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTimer(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetTimer:", v5);
}

- (NSNumber)resumeMultiple
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasResumeMultiple"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "resumeMultiple"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setResumeMultiple:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setResumeMultiple:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasResumeMultiple:", 0);

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
  -[INResumeTimerIntent targetTimer](self, "targetTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("resumeMultiple");
  v10[0] = v4;
  -[INResumeTimerIntent resumeMultiple](self, "resumeMultiple");
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

  -[INResumeTimerIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("ResumeTimer");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

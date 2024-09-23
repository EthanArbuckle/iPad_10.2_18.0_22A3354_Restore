@implementation INShareFocusStatusIntent

- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

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

  -[INShareFocusStatusIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INShareFocusStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 7;
}

- (id)_categoryVerb
{
  return CFSTR("Share");
}

- (INShareFocusStatusIntent)initWithFocusStatus:(INFocusStatus *)focusStatus
{
  INFocusStatus *v4;
  INShareFocusStatusIntent *v5;
  INShareFocusStatusIntent *v6;
  objc_super v8;

  v4 = focusStatus;
  v8.receiver = self;
  v8.super_class = (Class)INShareFocusStatusIntent;
  v5 = -[INIntent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[INShareFocusStatusIntent setFocusStatus:](v5, "setFocusStatus:", v4);

  return v6;
}

- (INFocusStatus)focusStatus
{
  void *v2;
  void *v3;
  void *v4;

  -[INShareFocusStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromFocusStatus(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INFocusStatus *)v4;
}

- (void)setFocusStatus:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INShareFocusStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToFocusStatus(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFocusStatus:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("focusStatus");
  -[INShareFocusStatusIntent focusStatus](self, "focusStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)

  return v4;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INShareFocusStatusIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("FocusStatus");
}

- (id)verb
{
  return CFSTR("ShareFocusStatus");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

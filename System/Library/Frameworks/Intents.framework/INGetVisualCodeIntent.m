@implementation INGetVisualCodeIntent

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

  -[INGetVisualCodeIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INGetVisualCodeIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INGetVisualCodeIntent)initWithVisualCodeType:(INVisualCodeType)visualCodeType
{
  INGetVisualCodeIntent *v4;
  INGetVisualCodeIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INGetVisualCodeIntent;
  v4 = -[INIntent init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[INGetVisualCodeIntent setVisualCodeType:](v4, "setVisualCodeType:", visualCodeType);
  return v5;
}

- (INVisualCodeType)visualCodeType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INVisualCodeType v7;
  INVisualCodeType v8;

  -[INGetVisualCodeIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasVisualCodeType");
  -[INGetVisualCodeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visualCodeType") - 1;
  if (v6 <= 5)
    v7 = v6 + 1;
  else
    v7 = INVisualCodeTypeUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INVisualCodeTypeUnknown;

  return v8;
}

- (void)setVisualCodeType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INGetVisualCodeIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 6)
    objc_msgSend(v4, "setHasVisualCodeType:", 0);
  else
    objc_msgSend(v4, "setVisualCodeType:", a3);

}

- (id)_dictionaryRepresentation
{
  INVisualCodeType v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("visualCodeType");
  v2 = -[INGetVisualCodeIntent visualCodeType](self, "visualCodeType");
  if ((unint64_t)(v2 - 1) > 5)
    v3 = CFSTR("unknown");
  else
    v3 = off_1E228E730[v2 - 1];
  v4 = v3;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INGetVisualCodeIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("VisualCode");
}

- (id)verb
{
  return CFSTR("GetVisualCode");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
